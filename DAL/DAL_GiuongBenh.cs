using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_GiuongBenh
    {
        private static DAL_GiuongBenh instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_GiuongBenh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_GiuongBenh();
                }
                return instance;
            }
        }


        //Hiển thị danh sách giường bệnh
        public IQueryable HienThiDanhSachGiuongBenh()
        {
            IQueryable giuongBenh = from gb in db.GiuongBenhs
                                    select gb;
            return giuongBenh;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong()
        {
            //Lấy tất cả mã dưới dạng chuỗi
            var dsGiuongBenh = db.GiuongBenhs.Select(gb => gb.MaGiuong).ToList();
            //Tìm mã lớn nhất và lấy phần số
            int maLonNhat = dsGiuongBenh.Select(maGB => int.Parse(maGB.Substring(2))).Max();
            //Lấy mã hiện tại
            int maHienTai = maLonNhat + 1;
            //Tạo mã mới
            string maMoi = "DV" + maHienTai.ToString("D3");//Lấy 3 số phía sau 
            return maMoi;
        }

        //Hiển thị combobox Phòng
        public IQueryable HienThiComboboxPhong()
        {
            IQueryable phong = from p in db.Phongs
                               select new { p.MSPhong, p.TenPhong };
            return phong;
        }

        //Tìm phòng
        public IQueryable TimKiemPhong(string searchTerm)
        {
            IQueryable ds = from dl in db.Phongs
                            where dl.TenPhong.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm giường bệnh
        public bool ThemGiuongBenh(ET_GiuongBenh et_giuongbenh)
        {
            if (db.GiuongBenhs.Any(giuongBenh => giuongBenh.MaGiuong == et_giuongbenh.MaGiuong))
            {
                return false;
            }
            try
            {
                GiuongBenh giuongBenh = new GiuongBenh
                {
                    MaGiuong = et_giuongbenh.MaGiuong,
                    SoGiuong = et_giuongbenh.SoGiuong,
                    MSPhong = et_giuongbenh.MaPhong
                };
                db.GiuongBenhs.InsertOnSubmit(giuongBenh);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa giường bệnh
        public bool XoaGiuongBenh(string maGiuong)
        {
            try
            {
                var delete = from gb in db.GiuongBenhs
                             where gb.MaGiuong == maGiuong
                             select gb;
                foreach (var i in delete)
                {
                    db.GiuongBenhs.DeleteOnSubmit(i);
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

        //Sửa giường bệnh
        public bool SuaGiuongBenh(ET_GiuongBenh et_giuongbenh)
        {
            GiuongBenh giuongBenh = db.GiuongBenhs.SingleOrDefault(gb => gb.MaGiuong == et_giuongbenh.MaGiuong);
            if (giuongBenh != null)
            {
                try
                {
                    giuongBenh.SoGiuong = et_giuongbenh.SoGiuong;
                    giuongBenh.MSPhong = et_giuongbenh.MaPhong;
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
