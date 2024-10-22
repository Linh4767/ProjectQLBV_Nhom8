using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_CaTruc
    {
        private string maPhong;
        private string maNV;
        private string caTruc;
        private DateTime ngayTruc;

        public ET_CaTruc(string maPhong, string maNV, string caTruc, DateTime ngayTruc)
        {
            this.maPhong = maPhong;
            this.maNV = maNV;
            this.caTruc = caTruc;
            this.ngayTruc = ngayTruc;
        }

        public string MaPhong { get => maPhong; set => maPhong = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string CaTruc { get => caTruc; set => caTruc = value; }
        public DateTime NgayTruc { get => ngayTruc; set => ngayTruc = value; }
    }
}
