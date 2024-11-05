using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ChuanDoan
    {
        private string maPhieuKB;
        private string maNV;
        private string chuanDoan;
        private DateTime ngayCD;

        public ET_ChuanDoan(string maPhieuKB, string maNV, string chuanDoan, DateTime ngayCD)
        {
            this.maPhieuKB = maPhieuKB;
            this.maNV = maNV;
            this.chuanDoan = chuanDoan;
            this.ngayCD = ngayCD;
        }

        public string MaPhieuKB { get => maPhieuKB; set => maPhieuKB = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string ChuanDoan { get => chuanDoan; set => chuanDoan = value; }
        public DateTime NgayCD { get => ngayCD; set => ngayCD = value; }
    }
}
