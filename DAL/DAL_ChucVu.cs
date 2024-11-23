using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_ChucVu
    {
        //Khai báo biến tĩnh
        private static DAL_ChucVu instance;
        public static DAL_ChucVu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_ChucVu();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        //Hiển thị danh sách phòng
        public IQueryable HienThiDSChucVu()
        {
            IQueryable dsCV = from chucVu in db.ChucVus
                              select chucVu;
            return dsCV;
        }
        //Thêm chức vụ
        public bool ThemChucVu(ET_ChucVu etChucVu)
        {
            if (db.ChucVus.Any(p => p.MaCV == etChucVu.MaCV || p.TenCV == etChucVu.TenCV))
            {
                return false;
            }
            else
            {
                try
                {
                    ChucVu chucVu = new ChucVu
                    {
                        MaCV = etChucVu.MaCV,
                        TenCV = etChucVu.TenCV
                    };
                    db.ChucVus.InsertOnSubmit(chucVu);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }
        //Tạo mã chức vụ
        public string TaoMaChucVuTuDong()
        {
            // Lấy tất cả mã chức vụ dưới dạng chuỗi từ database
            var danhSachMaCV = db.ChucVus
                                    .Select(p => p.MaCV)
                                    .ToList();
            // Tìm mã chức vụ có số lớn nhất sau khi chuyển đổi phần số trong bộ nhớ
            int maCVLonNhat = danhSachMaCV
                                 .Select(maCV => int.Parse(maCV.Substring(2)))
                                 .Max();  // Lấy số lớn nhất

            // Tăng số chức vụ hiện tại lên 1
            int maCVHT = maCVLonNhat + 1;
            // Tạo mã chức vụ mới với phần số mới, đảm bảo 3 chữ số
            string maCVMoi = "CV" + maCVHT.ToString("D3");

            return maCVMoi; // Trả về mã chức vụ mới
        }

        //Xóa chức vụ
        public bool XoaChucVu(string maCV)
        {
            try
            {
                var xoa = from cv in db.ChucVus
                          where cv.MaCV == maCV
                          select cv;
                foreach (var i in xoa)
                {
                    db.ChucVus.DeleteOnSubmit(i);
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

        // Sửa chức vụ
        public bool SuaChucVu(ET_ChucVu etChucVu)
        {
            var capNhat = db.ChucVus.SingleOrDefault(p => p.MaCV == etChucVu.MaCV);
            if (capNhat != null)
            {
                if (db.ChucVus.Any(p => p.MaCV == etChucVu.MaCV || p.TenCV == etChucVu.TenCV))
                {
                    return false;
                }
                else
                {
                    try
                    {
                        capNhat.TenCV = etChucVu.TenCV;
                        db.SubmitChanges();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Lỗi: " + ex.Message);
                    }
                }             
            }
            return false;
        }
    }
}
