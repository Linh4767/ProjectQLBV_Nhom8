﻿using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_BenhNhan
    {
        private static DAL_BenhNhan instance;
        QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_BenhNhan Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_BenhNhan();
                }
                return instance;
            }
        }

        public DAL_BenhNhan() { }

        //Tải dữ liệu lên dgv
        public IQueryable LayDSBenhNhan()
        {
            IQueryable benhNhan = db.BenhNhans.OrderByDescending(n => n.MSBN);

            return benhNhan;
        }

        //Lấy thẻ bão hiểm ý tế của bệnh nhân
        public BHYT LayTheBHYT(string maBN)
        {
            return db.BHYTs.FirstOrDefault(t => t.MSBN == maBN);
        }

        //Tạo mã tự động
        public string TaoMaTuDong()
        {
            // Lấy tất cả các mã bệnh nhân hiện tại
            var dsBenhNhan = db.BenhNhans.Select(n => n.MSBN).ToList();

            // Nếu danh sách trống, bắt đầu từ 1
            int maBNLonNhat = 0;
            if (dsBenhNhan.Count > 0)
            {
                // Tìm mã lớn nhất dựa trên phần số sau chữ "BN"
                maBNLonNhat = dsBenhNhan.Select(maBN => int.Parse(maBN.Substring(2))).Max();
            }

            // Tạo mã mới với số lớn hơn mã lớn nhất
            int maBNHientai = maBNLonNhat + 1;
            string maBNMoi = "BN" + maBNHientai.ToString("D3"); // đảm bảo ít nhất 3 chữ số
            return maBNMoi;
        }

        //thêm bệnh nhân
        public bool ThemBenhNhan(ET_BenhNhan eT_BenhNhan)
        {
            if (db.BenhNhans.Any(benhNhan => benhNhan.MSBN == eT_BenhNhan.MaBN))
            {
                return false;
            }
            try
            {
                BenhNhan bn = new BenhNhan
                {
                    MSBN = eT_BenhNhan.MaBN,
                    TenBN = eT_BenhNhan.TenBN,
                    GioiTinh = eT_BenhNhan.GioiTinh,
                    NgSinh = eT_BenhNhan.NgaySinh,
                    DiaChi = eT_BenhNhan.DiaChi,
                    NgheNghiep = eT_BenhNhan.NgheNghiep,
                    SDT = eT_BenhNhan.SDT,
                    DanToc = eT_BenhNhan.DanToc,
                    TTLienHe = eT_BenhNhan.TTLienHe
                };
                db.BenhNhans.InsertOnSubmit(bn);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Sửa thông tin bệnh nhân
        public bool SuaBenhNhan(ET_BenhNhan eT_BenhNhan)
        {
            BenhNhan benhNhan = db.BenhNhans.SingleOrDefault(e => e.MSBN == eT_BenhNhan.MaBN);
            if (benhNhan != null)
            {
                try
                {
                    benhNhan.TenBN = eT_BenhNhan.TenBN;
                    benhNhan.GioiTinh = eT_BenhNhan.GioiTinh;
                    benhNhan.NgSinh = eT_BenhNhan.NgaySinh;
                    benhNhan.DiaChi = eT_BenhNhan.DiaChi;
                    benhNhan.NgheNghiep = eT_BenhNhan.NgheNghiep;
                    benhNhan.SDT = eT_BenhNhan.SDT;
                    benhNhan.DanToc = eT_BenhNhan.DanToc;
                    benhNhan.TTLienHe = eT_BenhNhan.TTLienHe;

                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi " + ex.Message);
                }
            }
            return false;
        }

        //Kiểm tra có tồn tại bệnh nhân không
        public bool KiemTraTonTai(string key)
        {
            if (db.BenhNhans.Any(e => e.TenBN.Contains(key)))
            {
                return true;
            }
            return false;
        }

        //Tìm bệnh nhân
        public IQueryable TimKiemBenhNhan(string key)
        {
            IQueryable ds = from bn in db.BenhNhans
                            where bn.TenBN.Contains(key)
                            select bn;
            return ds;
        }
    }
}
