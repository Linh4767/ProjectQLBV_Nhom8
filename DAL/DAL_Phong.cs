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
    public class DAL_Phong
    {
        //Khai báo biến tĩnh
        private static DAL_Phong instance;
        public static DAL_Phong Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_Phong();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);
        //Đổ dữ liệu lên combobox - danh sách khoa
        public IQueryable DoDuLieuLenCB()
        {
            IQueryable dsKhoa = from khoa in db.Khoas
                                where khoa.MaKhoa != "K18"
                                select new { khoa.MaKhoa, HienThi = khoa.MaKhoa + "-" + khoa.TenKhoa }; ;
            return dsKhoa;
        }
        //Hiển thị danh sách phòng
        public IQueryable HienThiDSPhong(string maKhoa, string loaiPhong)
        {
            IQueryable dsPhong = from phong in db.Phongs
                                 where phong.MaKhoa == maKhoa && phong.Loai == loaiPhong
                                 select phong;
            return dsPhong;
        }
        //Thêm phòng
        public bool ThemPhong(ET_Phong etPhong)
        {
            if (db.Phongs.Any(p => p.MSPhong == etPhong.MSPhong || p.TenPhong == etPhong.TenPhong && (p.Loai == "Phòng khám" || p.Loai == "Phòng chức năng")))
            {
                return false;
            }
            else
            {
                try
                {
                    Phong phong = new Phong
                    {
                        MSPhong = etPhong.MSPhong,
                        TenPhong = etPhong.TenPhong,
                        MaKhoa = etPhong.MaKhoa,
                        SoGiuong = etPhong.SoGiuong,
                        Loai = etPhong.Loai
                    };
                    db.Phongs.InsertOnSubmit(phong);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }
        //Tạo mã phòng tự động
        public string TaoMaPhongTuDong(string tenKhoa)
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
            var danhSachMaPhong = db.Phongs
                                    .Select(p => p.MSPhong)
                                    .ToList();
            // Tìm mã phòng có số lớn nhất sau khi chuyển đổi phần số
            int soPhongLonNhat = danhSachMaPhong
                         .Select(maPhong =>
                         {
                             // Sử dụng Regular Expressions để tìm phần số trong mã phòng
                             var match = Regex.Match(maPhong, @"\d+");
                             return match.Success ? int.Parse(match.Value) : 0; // Nếu không tìm thấy, trả về 0
                         })
                         .Max();
            string chuCaiDauKhoa = tenKhoa.Contains(" ")
                           ? string.Concat(tenKhoa.Split(' ').Select(word => char.ToUpper(word[0])))
                           : tenKhoa;
            // Tăng số phòng hiện tại lên 1
            int soPhongHienTai = soPhongLonNhat + 1;
            // Tạo mã phòng mới với phần số mới, đảm bảo 3 chữ số
            string maPhongMoi = "P" + chuCaiDauKhoa + soPhongHienTai.ToString("D3");

            return maPhongMoi; // Trả về mã phòng mới
        }

        //Xóa phòng
        public bool XoaPhong(string maPhong)
        {
            try
            {
                if (db.CaTrucs.Any(ct => ct.MaPhong == maPhong))
                {
                    return false; // Không thể xóa, vì có bản ghi tham chiếu
                }
                var xoa = from p in db.Phongs
                          where p.MSPhong == maPhong
                          select p;
                foreach (var i in xoa)
                {
                    db.Phongs.DeleteOnSubmit(i);
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
                else
                {
                    return false;
                }
            }
        }

        // Sửa phòng
        public bool SuaPhong(ET_Phong etPhong)
        {
            var capNhat = db.Phongs.SingleOrDefault(p => p.MSPhong == etPhong.MSPhong);
            if (capNhat != null)
            {
                if (db.Phongs.Any(p => p.MSPhong != etPhong.MSPhong && p.TenPhong == etPhong.TenPhong && (p.Loai == "Phòng khám" || p.Loai == "Phòng chức năng")))
                {
                    return false;
                }
                else
                {
                    try
                    {
                        capNhat.TenPhong = etPhong.TenPhong;
                        capNhat.MaKhoa = etPhong.MaKhoa;
                        capNhat.SoGiuong = etPhong.SoGiuong;
                        capNhat.Loai = etPhong.Loai;

                        db.SubmitChanges();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        return false;
                    }
                }               
            }
            return false;
        }
        public IQueryable TimKiemPhong(string searchTerm,string loaiPhong,string khoa)
        {
            IQueryable ds = from dl in db.Phongs
                            where dl.TenPhong.Contains(searchTerm) && dl.MaKhoa == khoa && dl.Loai == loaiPhong
                            select dl;
            return ds;
        }

        public string LayTenKhoaNhoMaKhoa(string maKhoa)
        {
            string tenKhoa = (from p in db.Khoas
                              where p.MaKhoa == maKhoa
                              select p.TenKhoa).FirstOrDefault();
            return tenKhoa;
        }
    }
}
