using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_InDonThuoc
    {
        public ET_InDonThuoc(string tenBN, string gioiTinh, DateTime ngSinh, string maSoBHYT, string chuanDoan, string tenNV, string maDonThuoc, DateTime ngayGioKeDon, string cachDung, string tenThuoc, int soLuong, float tongTienDonThuoc)
        {
            TenBN = tenBN;
            GioiTinh = gioiTinh;
            NgSinh = ngSinh;
            MaSoBHYT = maSoBHYT;
            ChuanDoan = chuanDoan;
            TenNV = tenNV;
            MaDonThuoc = maDonThuoc;
            NgayGioKeDon = ngayGioKeDon;
            CachDung = cachDung;
            TenThuoc = tenThuoc;
            SoLuong = soLuong;
            TongTienDonThuoc = tongTienDonThuoc;
        }

        public string TenBN { get; set; }
        public string GioiTinh { get; set; }
        public DateTime NgSinh { get; set; }
        public string MaSoBHYT { get; set; }
        public string ChuanDoan { get; set; }
        public string TenNV { get; set; }
        public string MaDonThuoc { get; set; }
        public DateTime NgayGioKeDon { get; set; }
        public string CachDung { get; set; }
        public string TenThuoc { get; set; }
        public int SoLuong {  get; set; }
        public float TongTienDonThuoc { get; set; }
    }
}
