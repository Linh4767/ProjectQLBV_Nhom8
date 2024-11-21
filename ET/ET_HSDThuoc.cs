using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_HSDThuoc
    {
        public ET_HSDThuoc(string maThuoc, string tenThuoc, string xuatXu, string nhaCungCap, string loaiThuoc, string donViTinh, string quyCachDongGoi, int soLuongDVT, string hamLuong, float gia, DateTime ngaySanXuat, DateTime hSD, string maLo, int soLuongTrongKho)
        {
            MaThuoc = maThuoc;
            TenThuoc = tenThuoc;
            XuatXu = xuatXu;
            NhaCungCap = nhaCungCap;
            LoaiThuoc = loaiThuoc;
            DonViTinh = donViTinh;
            QuyCachDongGoi = quyCachDongGoi;
            SoLuongDVT = soLuongDVT;
            HamLuong = hamLuong;
            Gia = gia;
            NgaySanXuat = ngaySanXuat;
            HSD = hSD;
            MaLo = maLo;
            SoLuongTrongKho = soLuongTrongKho;
        }

        public string MaThuoc { get; set; }
        public string TenThuoc { get; set; }
        public string XuatXu { get; set; }
        public string NhaCungCap { get; set; }
        public string LoaiThuoc { get; set; }
        public string DonViTinh { get; set; }
        public string QuyCachDongGoi { get; set; }
        public int SoLuongDVT { get; set; }
        public string HamLuong { get; set; }
        public float Gia { get; set; }
        public DateTime NgaySanXuat { get; set; }
        public DateTime HSD { get; set; }
        public string MaLo { get; set; }
        public int SoLuongTrongKho { get; set; }
    }
}
