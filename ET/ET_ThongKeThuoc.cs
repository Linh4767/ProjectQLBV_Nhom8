using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ThongKeThuoc
    {
        public ET_ThongKeThuoc(double tongTienThuoc, double tienBHYTChiTra, double tienBenhNhanChiTra)
        {
            TongTienThuoc = tongTienThuoc;
            TienBHYTChiTra = tienBHYTChiTra;
            TienBenhNhanChiTra = tienBenhNhanChiTra;
        }

        public double TongTienThuoc { get; set; }
        public double TienBHYTChiTra { get; set; }
        public double TienBenhNhanChiTra { get; set; }
    }
}
