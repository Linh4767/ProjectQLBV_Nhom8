using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_TaiKham
    {
        private string maCH;
        private string maSoBA;
        private string maPhong;
        private string maNV;
        private DateTime ngayTaiKham;
        private string trangThai;
        private string ketQua;

        public ET_TaiKham(string maCH, string maSoBA, string maPhong, string maNV, DateTime ngayTaiKham, string trangThai, string ketQua)
        {
            this.maCH = maCH;
            this.maSoBA = maSoBA;
            this.maPhong = maPhong;
            this.maNV = maNV;
            this.ngayTaiKham = ngayTaiKham;
            this.trangThai = trangThai;
            this.ketQua = ketQua;
        }

        public string MaCH { get => maCH; set => maCH = value; }
        public string MaSoBA { get => maSoBA; set => maSoBA = value; }
        public string MaPhong { get => maPhong; set => maPhong = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public DateTime NgayTaiKham { get => ngayTaiKham; set => ngayTaiKham = value; }
        public string TrangThai { get => trangThai; set => trangThai = value; }
        public string KetQua { get => ketQua; set => ketQua = value; }
    }
}
