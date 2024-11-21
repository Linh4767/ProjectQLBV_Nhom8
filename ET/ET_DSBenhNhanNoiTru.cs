using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_DSBenhNhanNoiTru
    {
        public ET_DSBenhNhanNoiTru(string maSoBenhNhan, string tenBenhNhan, string gioiTinh, DateTime? ngaySinh, DateTime? ngayNhanGiuong, DateTime? ngayTraGiuong, string tenPhong, string maGiuong, string benhNen, string trangThaiXuatVien, string maNhanVien, string maSoPhieuKhamBenh)
        {
            MaSoBenhNhan = maSoBenhNhan;
            TenBenhNhan = tenBenhNhan;
            GioiTinh = gioiTinh;
            NgaySinh = ngaySinh;
            NgayNhanGiuong = ngayNhanGiuong;
            NgayTraGiuong = ngayTraGiuong;
            TenPhong = tenPhong;
            MaGiuong = maGiuong;
            BenhNen = benhNen;
            TrangThaiXuatVien = trangThaiXuatVien;
            MaNhanVien = maNhanVien;
            MaSoPhieuKhamBenh = maSoPhieuKhamBenh;
        }

        public string MaSoBenhNhan { get; set; }
        public string TenBenhNhan { get; set; }
        public string GioiTinh { get; set; }
        public DateTime? NgaySinh { get; set; }
        public DateTime? NgayNhanGiuong { get; set; }
        public DateTime? NgayTraGiuong { get; set; }
        public string TenPhong { get; set; }
        public string MaGiuong { get; set; }
        public string BenhNen { get; set; }
        public string TrangThaiXuatVien { get; set; }
        public string MaNhanVien { get; set; }
        public string MaSoPhieuKhamBenh { get; set; }
    }
}
