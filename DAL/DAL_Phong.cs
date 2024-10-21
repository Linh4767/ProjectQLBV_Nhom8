using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
        private QLBVDataContext db = new QLBVDataContext();
        //Đổ dữ liệu lên combobox - danh sách khoa
        public IQueryable DoDuLieuLenCB()
        {
            IQueryable dsKhoa = from khoa in db.Khoas
                                where khoa.MaKhoa != "K18"
                                select new { khoa.MaKhoa, HienThi = khoa.MaKhoa + "-" + khoa.TenKhoa }; ;
            return dsKhoa;
        }
        //Hiển thị danh sách phòng
        public IQueryable HienThiDSPhong(string maKhoa)
        {
            IQueryable dsPhong = from phong in db.Phongs
                                 where phong.MaKhoa == maKhoa
                                 select phong;
            return dsPhong;
        }
        //Thêm phòng
        public bool ThemPhong(ET_Phong etPhong)
        {
            if (db.Phongs.Any(p => p.MSPhong == etPhong.MSPhong || p.TenPhong == etPhong.TenPhong && p.Loai == "Phòng khám"))
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
        public string TaoMaPhongTuDong()
        {
            // Lấy tất cả mã phòng dưới dạng chuỗi từ database
            var danhSachMaPhong = db.Phongs
                                    .Select(p => p.MSPhong)
                                    .ToList();
            // Tìm mã phòng có số lớn nhất sau khi chuyển đổi phần số trong bộ nhớ
            int soPhongLonNhat = danhSachMaPhong
                                 .Select(maPhong => int.Parse(maPhong.Substring(1)))
                                 .Max();  // Lấy số lớn nhất

            // Tăng số phòng hiện tại lên 1
            int soPhongHienTai = soPhongLonNhat + 1;
            // Tạo mã phòng mới với phần số mới, đảm bảo 3 chữ số
            string maPhongMoi = "P" + soPhongHienTai.ToString("D3");

            return maPhongMoi; // Trả về mã phòng mới
        }

        //Xóa phòng
        public bool XoaPhong(string maPhong)
        {
            try
            {
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
                    throw new Exception("Lỗi: " + ex.Message);
                }
            }
            return false;
        }
        public IQueryable TimKiemPhong(string searchTerm)
        {
            IQueryable ds = from dl in db.Phongs
                            where dl.TenPhong.Contains(searchTerm)
                            select dl;
            return ds;
        }
    }
}
