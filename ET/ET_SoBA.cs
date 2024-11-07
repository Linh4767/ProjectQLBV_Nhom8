using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_SoBA
    {
        private string maSoBenhAn;
        private string benhNen;
        private string maBN;
        private DateTime ngayLap;

        public ET_SoBA(string maSoBenhAn, string benhNen, string maBN, DateTime ngayLap)
        {
            this.maSoBenhAn = maSoBenhAn;
            this.benhNen = benhNen;
            this.maBN = maBN;
            this.ngayLap = ngayLap;
        }
        public string MaSoBenhAn { get => maSoBenhAn; set => maSoBenhAn = value; }
        public string BenhNen { get => benhNen; set => benhNen = value; }
        public string MaBN { get => maBN; set => maBN = value; }
        public DateTime NgayLap { get => ngayLap; set => ngayLap = value; }
    }
}
