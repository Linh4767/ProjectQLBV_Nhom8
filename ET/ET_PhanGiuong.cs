using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_PhanGiuong
    {
        private string maGiuong;
        private string maPhieuKB;
        private DateTime? ngayTra;
        private DateTime ngayNhan;
        private string maPhong;
        private string maNVYC;
        private string ghiChu;

        public ET_PhanGiuong(string maGiuong, string maPhieuKB, DateTime? ngayTra, DateTime ngayNhan, string maPhong, string maNVYC, string ghiChu)
        {
            this.MaGiuong = maGiuong;
            this.MaPhieuKB = maPhieuKB;
            this.NgayTra = ngayTra;
            this.NgayNhan = ngayNhan;
            this.MaPhong = maPhong;
            this.MaNVYC = maNVYC;
            this.GhiChu = ghiChu;
        }

        public string MaGiuong { get => maGiuong; set => maGiuong = value; }
        public string MaPhieuKB { get => maPhieuKB; set => maPhieuKB = value; }
        public DateTime? NgayTra { get => ngayTra; set => ngayTra = value; }
        public DateTime NgayNhan { get => ngayNhan; set => ngayNhan = value; }
        public string MaPhong { get => maPhong; set => maPhong = value; }
        public string MaNVYC { get => maNVYC; set => maNVYC = value; }
        public string GhiChu { get => ghiChu; set => ghiChu = value; }
    }
}
