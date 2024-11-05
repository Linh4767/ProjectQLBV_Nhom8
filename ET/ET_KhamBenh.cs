using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_KhamBenh
    {
        private string maPhong;
        private string maNV;
        private string maPhieuKB;
        private string maKham;

        public ET_KhamBenh(string maPhong, string maNV, string maPhieuKB, string maKham)
        {
            this.maPhong = maPhong;
            this.maNV = maNV;
            this.maPhieuKB = maPhieuKB;
            this.maKham = maKham;
        }

        public string MaPhong { get => maPhong; set => maPhong = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string MaPhieuKB { get => maPhieuKB; set => maPhieuKB = value; }
        public string MaKham { get => maKham; set => maKham = value; }
    }
}
