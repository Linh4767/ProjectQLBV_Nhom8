using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_Khoa
    {
        private static DAL_Khoa instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_Khoa Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_Khoa();
                }
                return instance;
            }
        }
        //Hiển thị danh sách khoa
        public IQueryable HienThiDanhSachKhoa()
        {
            IQueryable khoa = from k in db.Khoas
                              select k;
            return khoa;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong()
        {
            //Lấy tất cả mã dưới dạng chuỗi
            var dsKhoa = db.Khoas.Select(k => k.MaKhoa).ToList();
            //Tìm mã lớn nhất và lấy phần số
            int maLonNhat = dsKhoa.Select(maKhoa => int.Parse(maKhoa.Substring(1))).Max();
            //Lấy mã hiện tại
            int maHienTai = maLonNhat + 1;
            //Tạo mã mới
            string maMoi = "K" + maHienTai.ToString("D2");//Lấy 3 số phía sau 
            return maMoi;
        }

        //Thêm khoa
        public bool ThemKhoa(ET_Khoa et_khoa)
        {
            if (db.Khoas.Any(khoa => khoa.TenKhoa == et_khoa.TenKhoa || khoa.MaKhoa == et_khoa.MaKhoa))
            {
                return false;
            }
            try
            {
                Khoa khoa = new Khoa
                {
                    MaKhoa = et_khoa.MaKhoa,
                    TenKhoa = et_khoa.TenKhoa
                };
                db.Khoas.InsertOnSubmit(khoa);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa khoa
        public bool XoaKhoa(string maKhoa)
        {
            try
            {
                var delete = from k in db.Khoas
                             where k.MaKhoa == maKhoa
                             select k;
                foreach (var i in delete)
                {
                    db.Khoas.DeleteOnSubmit(i);
                    db.SubmitChanges();
                }
                return true;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                if (ex.Number == 547)
                {
                    return false;
                }
            }
            return false;
        }

        //Sửa khoa
        public bool SuaKhoa(ET_Khoa et_khoa)
        {
            Khoa khoa = db.Khoas.SingleOrDefault(k => k.MaKhoa == et_khoa.MaKhoa);
            if (khoa != null)
            {
                try
                {
                    khoa.TenKhoa = et_khoa.TenKhoa;
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi " + ex.Message);
                }
            }
            return false;
        }
    }
}
