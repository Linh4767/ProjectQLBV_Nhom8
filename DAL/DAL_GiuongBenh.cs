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
                                    join pb in db.Phongs
                                    on gb.MSPhong equals pb.MSPhong
                                    join k in db.Khoas
                                    on pb.MaKhoa equals k.MaKhoa
                                    select new {gb.MaGiuong, gb.SoGiuong, pb.MSPhong, pb.TenPhong};
            return giuongBenh;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong(int numberic, string maPhong)
        {

            // Tách mã phòng để lấy số
            string soPhong = maPhong.Split('P')[1]; // Lấy phần sau chữ 'P'

            // Tạo mã mới với "G" thay cho "P"
            string maMoi = "G" + soPhong + "." + numberic;

            return maMoi;
        }

        //Hiển thị combobox Mã Phòng
        //public string HienThiMaPhong(string tenPhong)
        //{
        //    string maPhong = (from p in db.Phongs
        //                      where p.TenPhong == tenPhong
        //                      select p.MSPhong).SingleOrDefault();
        //    return maPhong;
        //}

        //Hiển thị combobox Phòng
        public IQueryable HienThiComboboxPhong()
        {
            IQueryable phong = from p in db.Phongs
                               where p.Loai == "Phòng bệnh"
                               select p;
            return phong;
        }

        //Hiển thị combobox Khoa
        public IQueryable HienThiComboboxKhoa()
        {
            IQueryable khoa = from k in db.Khoas
                              select k;
            return khoa;
        }

        //Hiển thị combobox tên Khoa theo Phòng
        public string HienThiTenKhoa(string maPhong)
        {
            var khoa = (from k in db.Khoas
                        join p in db.Phongs
                        on k.MaKhoa equals p.MaKhoa
                        where p.MSPhong == maPhong
                        select k.TenKhoa).FirstOrDefault();
            return khoa;
        }

        //Tìm phòng
        public IQueryable TimKiemPhong(string searchTerm)
        {
            IQueryable ds = from dl in db.Phongs
                            join gb in db.GiuongBenhs
                            on dl.MSPhong equals gb.MSPhong
                            where dl.TenPhong.Contains(searchTerm)
                            select new { gb.MaGiuong, gb.SoGiuong, dl.MSPhong, dl.TenPhong};
            return ds;
        }

        //Kiểm tra số lượng giường trong phòng
        public bool KiemTraSoGiuong(string maPB)
        {
            int soLuongGioiHan = (from pb in db.Phongs
                                  where pb.MSPhong == maPB
                                  select Convert.ToInt32(pb.SoGiuong)).FirstOrDefault();
            int soGiuong = (from gb in db.GiuongBenhs
                            where gb.MSPhong == maPB
                            select Convert.ToInt32(gb.SoGiuong)).Count();
            if (soGiuong >= soLuongGioiHan)
            {
                return false;
            }
            return true;
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
