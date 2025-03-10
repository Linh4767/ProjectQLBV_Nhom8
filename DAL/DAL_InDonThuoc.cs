using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_InDonThuoc
    {
        private static DAL_InDonThuoc instance;
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_InDonThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_InDonThuoc();
                }
                return instance;
            }
        }

        public List<ET_InDonThuoc> InDonThuoc(string maDT)
        {
            var results = db.InDonThuoc(maDT);
            return results.Select(r => new ET_InDonThuoc(
             r.TenBN,
             r.GioiTinh,
             (DateTime)r.NgSinh,
             r.MaSoBHYT,
             r.ChuanDoan,
             r.TenNV,
             r.MaDonThuoc,
             (DateTime)r.NgayGioKeDon,
             r.CachDung,
             r.TenThuoc,
             (int)(r.SoLuong ?? 0),
             (float)(r.TongTienDonThuoc ?? 0))).ToList();
        }

        //public List<dynamic> ChiTietDTCuaPKB(string maPhieuKB)
        //{
        //    try
        //    {
        //        var query = from dt in db.DonThuocs
        //                    join ctdt in db.ChiTietDonThuocs
                            
        //                    on dt.MaDonThuoc equals ctdt.MaDonThuoc 
        //                    join pkb in db.PhieuKhamBenhs on dt.MaPhieuKB equals pkb.MaPhieuKB
        //                    join bn in db.BenhNhans on pkb.MaBN equals bn.MSBN
        //                    where string.IsNullOrEmpty(maPhieuKB) || pkb.MaPhieuKB == maPhieuKB
        //                    select new
        //                    {
        //                        TenThuoc = dv.TenDV,
        //                        GiaDichVu = dv.Gia,
        //                        NgayThucHien = sd.NgayThucHien
        //                    };

        //        return query.ToList<dynamic>();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception("Lỗi khi truy vấn dữ liệu: " + ex.Message);
        //    }
        //}
        public IQueryable LayDanhSachDonThuocTheoTenBN(string tenBN)
        {
            if (tenBN == null)
            {
                return null;
            }
            IQueryable ds = from dl in db.PhieuKhamBenhs
                            join dt in db.DonThuocs
                            on dl.MaPhieuKB equals dt.MaPhieuKB
                            join bn in db.BenhNhans
                            on dl.MaBN equals bn.MSBN
                            where bn.TenBN.Contains(tenBN)
                            select dt;
            return ds;
        }
    }
}
