using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TaiKhoan
    {
        private static DAL_TaiKhoan instance;
        public static DAL_TaiKhoan Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TaiKhoan();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext();
        //Check thông tin đăng nhập
        public bool KiemTraNhanVienCoThongTinKhong(string tenTK)
        {
            var taiKhoan = from tk in db.TaiKhoans
                           join nv in db.NhanViens on tk.MaNV equals nv.MaNV
                           where tk.TenTaiKhoan == tenTK
                           select tk;

            // Kiểm tra xem có tài khoản nào không
            return taiKhoan.Any(); // Trả về true nếu có tài khoản, false nếu không
        }
        //Kiểm tra phân quyền
        public bool KiemTraPhanQuyen(string tenTK)
        {
            var taiKhoan = (from tk in db.TaiKhoans
                            join nv in db.NhanViens on tk.MaNV equals nv.MaNV
                            join cv in db.ChucVus on nv.MaCV equals cv.MaCV
                            where tk.TenTaiKhoan == tenTK
                            select cv.MaCV).FirstOrDefault();
            return taiKhoan == "CV5";
        }

        public bool KiemTraNhapMKDungSai(string tenTK, string matKhau)
        {
            var matKhauDaLuu = (from ds in db.TaiKhoans
                                where ds.TenTaiKhoan == tenTK
                                select ds.MatKhau).FirstOrDefault();
            return matKhauDaLuu == matKhau;
        }
        public string LayTenNVNhoTenTK(string tenTK)
        {
            string tenNV = (from dl in db.NhanViens
                            where dl.MaNV == tenTK
                            select dl.TenNV).FirstOrDefault();
            return tenNV;
        }
    }
}
