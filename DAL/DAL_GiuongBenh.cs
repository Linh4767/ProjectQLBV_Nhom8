using ET;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_GiuongBenh
    {
        private static DAL_GiuongBenh instance;
        QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

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
        public IQueryable HienThiDanhSachGiuongBenhTheoKhoa(string maKhoa)
        {
            IQueryable giuongBenh = from gb in db.GiuongBenhs
                                    join pb in db.Phongs
                                    on gb.MSPhong equals pb.MSPhong
                                    join k in db.Khoas
                                    on pb.MaKhoa equals k.MaKhoa
                                    where k.MaKhoa == maKhoa
                                    select new {gb.MaGiuong, gb.SoGiuong, pb.MSPhong, pb.TenPhong, gb.TrangThai,k.MaKhoa};
            return giuongBenh;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong(int numberic, string maPhong, string tenKhoa)
        {
            // Bỏ từ "Khoa" ở đầu nếu có
            if (tenKhoa.StartsWith("Khoa "))
            {
                tenKhoa = tenKhoa.Substring(5);
            }
            // Loại bỏ dấu tiếng Việt
            var normalizedString = tenKhoa.Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();

            foreach (var c in normalizedString)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }

            tenKhoa = sb.ToString().Normalize(NormalizationForm.FormC); // Chuẩn hóa về dạng bình thường
                                                                      // Lấy tất cả mã phòng dưới dạng chuỗi từ database
            var danhSachMaNV = db.GiuongBenhs
                                    .Select(cn => cn.MaGiuong)
                                    .ToList();
            // Tìm mã phòng có số lớn nhất sau khi chuyển đổi phần số trong bộ nhớ
            int maNVMax = danhSachMaNV
                         .Select(maNV =>
                         {
                             // Sử dụng Regular Expressions để tìm phần số trong mã phòng
                             var match = Regex.Match(maNV, @"\d+");
                             return match.Success ? int.Parse(match.Value) : 0; // Nếu không tìm thấy, trả về 0
                         })
                         .Max();
            string chuCaiDauKhoa = tenKhoa.Contains(" ")
                    ? string.Concat(tenKhoa.Split(' ')
                   .Where(word => !string.IsNullOrEmpty(word))  // Lọc các chuỗi rỗng
                   .Select(word => char.ToUpper(word[0])))
                    : tenKhoa;
            // Tách mã phòng để lấy số
            string soPhong = maPhong.Split('P')[1]; // Lấy phần sau chữ 'P'

            // Tạo mã mới với "G" thay cho "P"
            string maMoi = "G" + chuCaiDauKhoa + soPhong + "." + numberic;

            return maMoi;
        }

        //Lấy tên khoa theo mã khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            var khoa = (from k in db.Khoas
                        where k.MaKhoa == maKhoa
                        select k.TenKhoa).FirstOrDefault();
            return khoa;
        }

        //Lấy phòng theo khoa
        public IQueryable HienThiPhongTheoKhoa(string maKhoa)
        {
            var phong = from pb in db.Phongs
                         join k in db.Khoas
                         on pb.MaKhoa equals k.MaKhoa
                         where k.MaKhoa == maKhoa && pb.Loai == "Phòng bệnh"
                         select new { pb.MSPhong, pb.TenPhong } ;
            return phong;
        }

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


        //Tìm phòng
        public IQueryable TimKiemPhong(string searchTerm)
        {
            IQueryable ds = from dl in db.Phongs
                            join gb in db.GiuongBenhs
                            on dl.MSPhong equals gb.MSPhong
                            join k in db.Khoas
                            on dl.MaKhoa equals k.MaKhoa
                            where dl.TenPhong.Contains(searchTerm)
                            select new { gb.MaGiuong, gb.SoGiuong, dl.MSPhong, dl.TenPhong, gb.TrangThai, k.MaKhoa };
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
                    TrangThai = et_giuongbenh.TrangThai,
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
                    giuongBenh.TrangThai = et_giuongbenh.TrangThai;
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
