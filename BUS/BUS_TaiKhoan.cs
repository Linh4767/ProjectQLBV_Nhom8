using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class BUS_TaiKhoan
    {
        private static BUS_TaiKhoan instance;
        private DAL_TaiKhoan dal_taikhoan = new DAL_TaiKhoan();
        public static BUS_TaiKhoan Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TaiKhoan();
                }
                return instance;
            }
        }

        public bool KiemTraNhanVienCoThongTinKhong(string tenTK)
        {
            if (dal_taikhoan.KiemTraNhanVienCoThongTinKhong(tenTK) == false)
            {
                return false;
            }
            return true;
        }

        public bool KiemTraPhanQuyen(string tenTK)
        {
            if (dal_taikhoan.KiemTraPhanQuyen(tenTK) == true)
            {
                return true;
            }
            return false;
        }

        public bool KiemTraNhapMKDungSai(string tenTK, string matKhau)
        {
            if (dal_taikhoan.KiemTraNhapMKDungSai(tenTK, matKhau) == false)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public string LayTenNVNhoTK(string tenTK)
        {
            return dal_taikhoan.LayTenNVNhoTenTK(tenTK);
        }
    }
}
