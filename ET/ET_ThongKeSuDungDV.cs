using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ThongKeSuDungDV
    {
        public ET_ThongKeSuDungDV(string maPhieuKB, string tenBenhNhan, float tongTienNiemYet, float tongTienSauGiamBHYT)
        {
            MaPhieuKB = maPhieuKB;
            TenBenhNhan = tenBenhNhan;
            TongTienNiemYet = tongTienNiemYet;
            TongTienSauGiamBHYT = tongTienSauGiamBHYT;
        }

        public string MaPhieuKB { get; set; }
        public string TenBenhNhan { get; set; }
        public float TongTienNiemYet { get; set; }
        public float TongTienSauGiamBHYT { get; set; }
    }
}
