using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_NhanVien
    {
        private string maNV;
        private string tenNV;
        private string gioiTinh;
        private DateTime ngaySinh;
        private string maCV;
        private string maChuyenNganh;
        private string sDT;

        public ET_NhanVien(string maNV, string tenNV, string gioiTinh, DateTime ngaySinh, string maCV, string maChuyenNganh, string sDT)
        {
            this.MaNV = maNV;
            this.TenNV = tenNV;
            this.GioiTinh = gioiTinh;
            this.NgaySinh = ngaySinh;
            this.MaCV = maCV;
            this.MaChuyenNganh = maChuyenNganh;
            this.SDT = sDT;
        }

        public string MaNV { get => maNV; set => maNV = value; }
        public string TenNV { get => tenNV; set => tenNV = value; }
        public string GioiTinh { get => gioiTinh; set => gioiTinh = value; }
        public DateTime NgaySinh { get => ngaySinh; set => ngaySinh = value; }
        public string MaCV { get => maCV; set => maCV = value; }
        public string MaChuyenNganh { get => maChuyenNganh; set => maChuyenNganh = value; }
        public string SDT { get => sDT; set => sDT = value; }

    }
}
