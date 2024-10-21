using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_GiuongBenh
    {
        private string maGiuong;
        private int soGiuong;
        private string maPhong;

        public ET_GiuongBenh(string maGiuong, int soGiuong, string maPhong)
        {
            this.MaGiuong = maGiuong;
            this.SoGiuong = soGiuong;
            this.MaPhong = maPhong;
        }

        public string MaGiuong { get => maGiuong; set => maGiuong = value; }
        public int SoGiuong { get => soGiuong; set => soGiuong = value; }
        public string MaPhong { get => maPhong; set => maPhong = value; }
    }
}
