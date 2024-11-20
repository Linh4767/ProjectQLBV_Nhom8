using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_TinhChiTietTienThuoc
    {
        public string TenThuoc { get; set; }
        public int SoLuong { get; set; }
        public float? DonGia { get; set; }
        public float ThanhTien { get; set; }

        public ET_TinhChiTietTienThuoc(string tenThuoc, int soLuong, float? donGia, float thanhTien)
        {
            TenThuoc = tenThuoc;
            SoLuong = soLuong;
            DonGia = donGia;
            ThanhTien = thanhTien;
        }
    }
}
