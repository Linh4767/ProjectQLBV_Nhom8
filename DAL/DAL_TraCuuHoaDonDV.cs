using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TraCuuHoaDonDV
    {
        private static DAL_TraCuuHoaDonDV instance;
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_TraCuuHoaDonDV Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TraCuuHoaDonDV();
                }
                return instance;
            }
        }

        
        public List<ET_ThongKeDSDuDungDV> ChiTietDSSDVTheoTenHoacPhieu(string maPhieuKB)
        {
            var results = db.ChiTietDSSDVTheoTenHoacPhieu(maPhieuKB);
            return results.Select(r => new ET_ThongKeDSDuDungDV(
             r.MaPhieuKB,
             r.TenBenhNhan,
             r.DiaChi,
             r.SDT,
             (DateTime)r.NgSinh,
             r.GioiTinh,
             r.TenDV,
             (float)(r.GiaDichVu ?? 0),
             (DateTime)r.NgayThucHien)).ToList();
        }
        public List<ET_ThongKeSuDungDV> ThongKeHoaDonSuDungDV(string maPhieuKB)
        {
            var results = db.TinhTienSuDungDVTheoPhieuVaBenhNhan(maPhieuKB);
            return results.Select(r => new ET_ThongKeSuDungDV(
             r.MaPhieuKB,
             r.TenBenhNhan,
             (float)(r.TongTienNiemYet ?? 0),
             (float)(r.TongTienSauGiamBHYT ?? 0))).ToList();
        }
        public List<dynamic> ChiTietDSSDVTheoTen(string maPhieuKB)
        {
            try
            {
                var query = from sd in db.SuDungDichVus
                            join dv in db.DichVus on sd.MaDV equals dv.MaDV
                            join pkb in db.PhieuKhamBenhs on sd.MaPhieuKB equals pkb.MaPhieuKB
                            join bn in db.BenhNhans on pkb.MaBN equals bn.MSBN
                            where string.IsNullOrEmpty(maPhieuKB) || pkb.MaPhieuKB == maPhieuKB
                            orderby pkb.MaPhieuKB, sd.NgayThucHien
                            select new
                            {
                                TenDichVu = dv.TenDV,
                                GiaDichVu = dv.Gia,
                                NgayThucHien = sd.NgayThucHien
                            };

                return query.ToList<dynamic>();
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi truy vấn dữ liệu: " + ex.Message);
            }
        }
        public IQueryable LayDanhSachPhieuKhamBenhTheoTenBN(string tenBN)
        {
            if (tenBN == null)
            {
                return null;
            }
            IQueryable ds = from dl in db.PhieuKhamBenhs
                            join bn in db.BenhNhans
                            on dl.MaBN equals bn.MSBN
                            where bn.TenBN.Contains(tenBN)
                            select new { dl.MaPhieuKB, dl.SoPhieu, dl.MaBN, bn.TenBN, dl.TrieuChung, dl.ThongTinLamSang, dl.NgayKham };
            return ds;
        }
    }
}
