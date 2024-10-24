using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_CaTruc
    {
        private string maCT;
        private string maPhong;
        private string maNV;
        private string ca;
        private DateTime ngayTruc;

        public ET_CaTruc(string maCT, string maPhong, string maNV, string ca, DateTime ngayTruc)
        {
            this.maCT = maCT;
            this.maPhong = maPhong;
            this.maNV = maNV;
            this.ca = ca;
            this.ngayTruc = ngayTruc;
        }

        public string MaCT { get => maCT; set => maCT = value; }
        public string MaPhong { get => maPhong; set => maPhong = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string Ca { get => ca; set => ca = value; }
        public DateTime NgayTruc { get => ngayTruc; set => ngayTruc = value; }
    }
}
