using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_DSBenhNhanNoiTru
    {
        private static DAL_DSBenhNhanNoiTru instance;
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_DSBenhNhanNoiTru Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_DSBenhNhanNoiTru();
                }
                return instance;
            }
        }

        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoNgay(DateTime tuNgay)
        {
            var results = db.LayDSBNNoiTruTheoNgay(tuNgay);
            return results.Select(r => new ET_DSBenhNhanNoiTru(
             r.MaSoBenhNhan,
             r.TenBenhNhan,
             r.GioiTinh,
             (DateTime?)r.NgaySinh,
             (DateTime)r.NgayNhanGiuong,
             (DateTime?)r.NgayTraGiuong,
             r.TenPhong,
             r.MaGiuong,
             r.BenhNen,
             r.MaKhoa,
             r.TrangThaiXuatVien,
             r.MaNhanVien,
             r.MaSoPhieuKhamBenh)).ToList();
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoThang(int thang, int nam)
        {
            var results = db.LayDSBNNoiTruTheoThang(thang, nam);
            return results.Select(r => new ET_DSBenhNhanNoiTru(
             r.MaSoBenhNhan,
             r.TenBenhNhan,
             r.GioiTinh,
             (DateTime?)r.NgaySinh,
             (DateTime)r.NgayNhanGiuong,
             (DateTime?)r.NgayTraGiuong,
             r.TenPhong,
             r.MaGiuong,
             r.BenhNen,
             r.MaKhoa,
             r.TrangThaiXuatVien,
             r.MaNhanVien,
             r.MaSoPhieuKhamBenh)).ToList();
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoNam(int nam)
        {
            var results = db.LayDSBNNoiTruTheoNam(nam);
            return results.Select(r => new ET_DSBenhNhanNoiTru(
             r.MaSoBenhNhan,
             r.TenBenhNhan,
             r.GioiTinh,
             (DateTime?)r.NgaySinh,
             (DateTime)r.NgayNhanGiuong,
             (DateTime?)r.NgayTraGiuong,
             r.TenPhong,
             r.MaGiuong,
             r.BenhNen,
             r.MaKhoa,
             r.TrangThaiXuatVien,
             r.MaNhanVien,
             r.MaSoPhieuKhamBenh)).ToList();
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.LayDSBNNoiTruTheoKhoangTG(tuNgay, denNgay);
            return results.Select(r => new ET_DSBenhNhanNoiTru(
             r.MaSoBenhNhan,
             r.TenBenhNhan,
             r.GioiTinh,
             (DateTime?)r.NgaySinh,
             (DateTime)r.NgayNhanGiuong,
             (DateTime?)r.NgayTraGiuong,
             r.TenPhong,
             r.MaGiuong,
             r.BenhNen,
             r.MaKhoa,
             r.TrangThaiXuatVien,
             r.MaNhanVien,
             r.MaSoPhieuKhamBenh)).ToList();
        }
    }
}
