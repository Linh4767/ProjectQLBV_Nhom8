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
        private string maBN;
        private string maNV;
        private DateTime ngayTaiKham;
        private string trangThai;
        private string ketQua;

        public ET_TaiKham(string maCH, string maBN, string maNV, DateTime ngayTaiKham, string trangThai, string ketQua)
        {
            this.maCH = maCH;
            this.maBN = maBN;
            this.maNV = maNV;
            this.ngayTaiKham = ngayTaiKham;
            this.trangThai = trangThai;
            this.ketQua = ketQua;
        }

        public string MaCH { get => maCH; set => maCH = value; }
        public string MaBN { get => maBN; set => maBN = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public DateTime NgayTaiKham { get => ngayTaiKham; set => ngayTaiKham = value; }
        public string TrangThai { get => trangThai; set => trangThai = value; }
        public string KetQua { get => ketQua; set => ketQua = value; }
    }
}
