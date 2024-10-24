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
            if (DAL_TaiKhoan.Instance.KiemTraNhanVienCoThongTinKhong(tenTK) == false)
            {
                return false;
            }
            return true;
        }

        public bool KiemTraPhanQuyen(string tenTK)
        {
            if (DAL_TaiKhoan.Instance.KiemTraPhanQuyen(tenTK) == true)
            {
                return true;
            }
            return false;
        }

        public bool KiemTraNhapMKDungSai(string tenTK, string matKhau)
        {
            if (DAL_TaiKhoan.Instance.KiemTraNhapMKDungSai(tenTK, matKhau) == false)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}
