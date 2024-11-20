using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ThongKeDSDuDungDV
    {
        public ET_ThongKeDSDuDungDV(string maPhieuKB, string tenBenhNhan, string diaChi, string sDT, DateTime ngSinh, string gioiTinh, string tenDV, float giaDichVu, DateTime ngayThucHien)
        {
            MaPhieuKB = maPhieuKB;
            TenBenhNhan = tenBenhNhan;
            DiaChi = diaChi;
            SDT = sDT;
            NgSinh = ngSinh;
            GioiTinh = gioiTinh;
            TenDV = tenDV;
            GiaDichVu = giaDichVu;
            NgayThucHien = ngayThucHien;
        }

        public string MaPhieuKB { get; set; }
        public string TenBenhNhan { get; set; }
        public string DiaChi { get; set; }
        public string SDT { get; set; }
        public DateTime NgSinh { get; set; }
        public string GioiTinh { get; set; }
        public string TenDV { get; set; }
        public float GiaDichVu { get; set; }
        public DateTime NgayThucHien { get; set; }
    }
}
