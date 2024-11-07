using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TaiKham
    {
        private static DAL_TaiKham instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_TaiKham Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TaiKham();
                }
                return instance;
            }
        }

        public DAL_TaiKham() { }

        //Danh sách tái khám
        public IQueryable LayDSTaiKham()
        {
            IQueryable taiKham = from tk in db.TaiKhams
                                 join bn in db.BenhNhans
                                 on tk.MSBN equals bn.MSBN
                                 orderby tk.NgayTaiKham descending
                                 select new { tk.MSCuocHen, tk.MSBN, bn.TenBN, tk.MaNVPhuTrach, tk.NgayTaiKham, tk.TrangThai, tk.KetQua };
            return taiKham;
        }
        //Tạo mã tự động
        public string TaoMaTuDong(string maPKB)
        {
            // Lấy tất cả các mã bệnh nhân hiện tại
            var dsTaiKham = db.TaiKhams.Select(n => n.MSCuocHen).ToList();

            // Nếu danh sách trống, bắt đầu từ 1
            int maCHLonNhat = 0;
            //if (dsTaiKham.Count > 0)
            //{
            //    // Tìm mã lớn nhất dựa trên phần số sau chữ "BN"
            //    maCHLonNhat = dsTaiKham.Select(maCH => int.Parse(maCH.Substring(2))).Max();
            //}
            var danhSachCH = db.TaiKhams
                                    .Select(p => p.MSCuocHen)
                                    .ToList();
            // Tìm mã phòng có số lớn nhất sau khi chuyển đổi phần số
            maCHLonNhat = danhSachCH
                         .Select(maCH =>
                         {
                             // Sử dụng Regular Expressions để tìm phần số trong mã phòng
                             var match = Regex.Match(maCH, @"\d+");
                             return match.Success ? int.Parse(match.Value) : 0; // Nếu không tìm thấy, trả về 0
                         })
                         .Max();

            // Tạo mã mới với số lớn hơn mã lớn nhất
            int maCHHientai = maCHLonNhat + 1;
            string maCHMoi = "CH" + maCHHientai.ToString("D3") +"-"+ maPKB; // đảm bảo ít nhất 3 chữ số
            return maCHMoi;
        }

        public bool KiemTraKoDatLichTaiKhamNhieuLan(string maPKB)
        {
            var ds = db.TaiKhams
               .AsEnumerable()  // Chuyển sang LINQ to Objects để sử dụng các phương thức .NET như Split
               .Where(dl => dl.MSCuocHen.Contains("-") && dl.MSCuocHen.Split('-')[1] == maPKB)
               .ToList();  // Lọc trong bộ nhớ

            return ds.Any();
        }

        //thêm cuộc hẹn tái khám
        public bool ThemTaiKham(ET_TaiKham eT_TaiKham)
        {
            if (db.TaiKhams.Any(e => e.MSCuocHen == eT_TaiKham.MaCH && e.NgayTaiKham == eT_TaiKham.NgayTaiKham))
            {
                return false;
            }
            try
            {
                TaiKham taiKham = new TaiKham
                {
                    MSCuocHen = eT_TaiKham.MaCH,
                    MSBN = eT_TaiKham.MaBN,
                    MaNVPhuTrach = string.IsNullOrEmpty(eT_TaiKham.MaNV) ? null : eT_TaiKham.MaNV,
                    NgayTaiKham = eT_TaiKham.NgayTaiKham,
                    TrangThai = eT_TaiKham.TrangThai,
                    KetQua = string.IsNullOrEmpty(eT_TaiKham.KetQua) ? null : eT_TaiKham.KetQua
                };
                db.TaiKhams.InsertOnSubmit(taiKham);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Sửa cuộc hẹn
        public bool CapNhatCuocHen(ET_TaiKham eT_TaiKham)
        {
            TaiKham taiKham = db.TaiKhams.SingleOrDefault(e => e.MSCuocHen == eT_TaiKham.MaCH);
            if (taiKham != null)
            {
                try
                {
                    taiKham.MaNVPhuTrach = string.IsNullOrEmpty(eT_TaiKham.MaNV) ? null : eT_TaiKham.MaNV;
                    taiKham.NgayTaiKham = eT_TaiKham.NgayTaiKham;
                    taiKham.TrangThai = eT_TaiKham.TrangThai;
                    taiKham.KetQua = string.IsNullOrEmpty(eT_TaiKham.KetQua) ? null : eT_TaiKham.KetQua;

                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi" + ex.Message);
                }
            }
            return false;
        }

        //tìm kiếm cuộc hẹn của bệnh nhân
        public IQueryable TimKiemBenhNhan(string key)
        {
            IQueryable taiKham = from tk in db.TaiKhams
                                 join bn in db.BenhNhans
                                 on tk.MSBN equals bn.MSBN
                                 where bn.MSBN.Contains(key) || bn.TenBN.Contains(key)
                                 select new { tk.MSCuocHen, tk.MSBN, bn.TenBN, tk.MaNVPhuTrach, tk.NgayTaiKham, tk.TrangThai, tk.KetQua };
            return taiKham;
        }

        //Lấy mã bệnh nhân theo phiếu khám bệnh
        public string LayMaBN(string pkb)
        {
            string maBN = (from pk in db.PhieuKhamBenhs
                           where pk.MaPhieuKB == pkb
                           select pk.MaBN).FirstOrDefault();
            return maBN;
        }
    }
}
