using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_DichVu
    {
        private string maDV;
        private string tenDV;
        private float gia;
        private string maKhoa;

        public ET_DichVu(string maDV, string tenDV, float gia, string maKhoa)
        {
            this.MaDV = maDV;
            this.TenDV = tenDV;
            this.Gia = gia;
            this.MaKhoa = maKhoa;
        }

        public string MaDV { get => maDV; set => maDV = value; }
        public string TenDV { get => tenDV; set => tenDV = value; }
        public float Gia { get => gia; set => gia = value; }
        public string MaKhoa { get => maKhoa; set => maKhoa = value; }
    }
}
