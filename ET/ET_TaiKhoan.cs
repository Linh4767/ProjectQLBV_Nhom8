using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_TaiKhoan
    {
        public ET_TaiKhoan(string tenTaiKhoan, string matKhau)
        {
            TenTaiKhoan = tenTaiKhoan;
            MatKhau = matKhau;
        }

        public ET_TaiKhoan(string tenTaiKhoan, string matKhau, string maNV)
        {
            TenTaiKhoan = tenTaiKhoan;
            MatKhau = matKhau;
            MaNV = maNV;
        }
        public string TenTaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string MaNV { get; set; }
    }
}
