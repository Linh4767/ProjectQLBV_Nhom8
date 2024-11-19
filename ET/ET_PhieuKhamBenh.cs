using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_PhieuKhamBenh
    {
        private string maPhieuKB;
        private int soPhieu;
        private string maBN;
        private string trieuChung;
        private string thongTinLamSang;
        private DateTime ngayKham;

        public ET_PhieuKhamBenh(string maPhieuKB, int soPhieu, string maBN, string trieuChung, string thongTinLamSang, DateTime ngayKham)
        {
            this.maPhieuKB = maPhieuKB;
            this.soPhieu = soPhieu;
            this.maBN = maBN;
            this.trieuChung = trieuChung;
            this.thongTinLamSang = thongTinLamSang;
            this.ngayKham = ngayKham;
        }

        public ET_PhieuKhamBenh() { }

        public string MaPhieuKB { get => maPhieuKB; set => maPhieuKB = value; }
        public int SoPhieu { get => soPhieu; set => soPhieu = value; }
        public string MaBN { get => maBN; set => maBN = value; }
        public string TrieuChung { get => trieuChung; set => trieuChung = value; }
        public string ThongTinLamSang { get => thongTinLamSang; set => thongTinLamSang = value; }
        public DateTime NgayKham { get => ngayKham; set => ngayKham = value; }
    }
}
