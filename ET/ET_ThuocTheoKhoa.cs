using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ThuocTheoKhoa
    {
        private string maThuoc;
        private int soLuongThuoc;
        private string maKhoa;
        private double gia;
        private string maLo;

        public string MaThuoc { get => maThuoc; set => maThuoc = value; }
        public int SoLuongThuoc { get => soLuongThuoc; set => soLuongThuoc = value; }
        public string MaKhoa { get => maKhoa; set => maKhoa = value; }
        public double Gia { get => gia; set => gia = value; }
        public string MaLo { get => maLo; set => maLo = value; }

        public ET_ThuocTheoKhoa(string maThuoc, int soLuongThuoc, string maKhoa, double gia, string maLo)
        {
            this.maThuoc = maThuoc;
            this.soLuongThuoc = soLuongThuoc;
            this.maKhoa = maKhoa;
            this.gia = gia;
            this.maLo = maLo;
        }
    }
}
