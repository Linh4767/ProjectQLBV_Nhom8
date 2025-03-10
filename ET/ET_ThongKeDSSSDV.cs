using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ThongKeDSSSDV
    {
        public ET_ThongKeDSSSDV(string tenDV, double tongGia, int soLanSuDung, double gia)
        {
            TenDV = tenDV;
            TongGia = tongGia;
            SoLanSuDung = soLanSuDung;
            Gia = gia;
        }

        public string TenDV { get; set; }
        public double TongGia { get; set; }
        public int SoLanSuDung { get; set; }
        public double Gia { get; set; }
    }
}
