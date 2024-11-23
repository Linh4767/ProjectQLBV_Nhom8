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
    public class DAL_ChuyenNganh
    {
        private static DAL_ChuyenNganh instance;
        QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_ChuyenNganh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_ChuyenNganh();
                }
                return instance;
            }
        }

        //Hiển thị danh sách chuyên ngành
        public IQueryable HienThiDanhSachChuyenNganh()
        {
            IQueryable chuyenNganh = from cn in db.ChuyenNganhs
                                     select cn;
            return chuyenNganh;
        }

        public string TaoMaTuDong(string tenKhoa)
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
            var danhSachMaCN = db.ChuyenNganhs
                                    .Select(cn => cn.MaChuyenNganh)
                                    .ToList();
            // Tìm mã phòng có số lớn nhất sau khi chuyển đổi phần số trong bộ nhớ
            int maCNMax = danhSachMaCN
                         .Select(maCN =>
                         {
                             // Sử dụng Regular Expressions để tìm phần số trong mã phòng
                             var match = Regex.Match(maCN, @"\d+");
                             return match.Success ? int.Parse(match.Value) : 0; // Nếu không tìm thấy, trả về 0
                         })
                         .Max();
            string chuCaiDauKhoa = tenKhoa.Contains(" ")
                           ? string.Concat(tenKhoa.Split(' ').Select(word => char.ToUpper(word[0])))
                           : tenKhoa;
            // Tăng số phòng hiện tại lên 1
            int maCNHienTai = maCNMax + 1;
            // Tạo mã phòng mới với phần số mới, đảm bảo 3 chữ số
            string maPhongMoi = "CN" + chuCaiDauKhoa + maCNHienTai.ToString("D3");

            return maPhongMoi; // Trả về mã phòng mới
        }

        //Lấy tên khoa theo mã khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            var khoa = (from k in db.Khoas
                        where k.MaKhoa == maKhoa
                        select k.TenKhoa).FirstOrDefault();
            return khoa;
        }


        //Hiển thị combobox Khoa
        public IQueryable HienThiComboboxKhoa()
        {
            IQueryable khoa = from k in db.Khoas
                              select new { k.MaKhoa, k.TenKhoa }; ;
            return khoa;
        }

        //Tìm chuyên ngành
        public IQueryable TimKiemChuyenNganh(string searchTerm)
        {
            IQueryable ds = from dl in db.ChuyenNganhs
                            where dl.TenChuyenNganh.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm chuyên ngành
        public bool ThemChuyenNganh(ET_ChuyenNganh eT_ChuyenNganh)
        {
            if (db.ChuyenNganhs.Any(chuyenNganh => chuyenNganh.TenChuyenNganh == eT_ChuyenNganh.TenChuyenNganh || chuyenNganh.MaChuyenNganh == eT_ChuyenNganh.MaChuyenNganh))
            {
                return false;
            }
            try
            {
                ChuyenNganh chuyenNganh = new ChuyenNganh
                {
                    MaChuyenNganh = eT_ChuyenNganh.MaChuyenNganh,
                    TenChuyenNganh = eT_ChuyenNganh.TenChuyenNganh,
                    MaKhoa = eT_ChuyenNganh.MaKhoa
                };
                db.ChuyenNganhs.InsertOnSubmit(chuyenNganh);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa chuyên ngành
        public bool XoaChuyenNganh(string maCN)
        {
            try
            {
                var delete = from cn in db.ChuyenNganhs
                             where cn.MaChuyenNganh == maCN
                             select cn;
                foreach (var i in delete)
                {
                    db.ChuyenNganhs.DeleteOnSubmit(i);
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

        //Sửa chuyên ngành 
        public bool SuaChuyenNganh(ET_ChuyenNganh et_ChuyenNganh)
        {
            ChuyenNganh chuyenNganh = db.ChuyenNganhs.SingleOrDefault(cn => cn.MaChuyenNganh == et_ChuyenNganh.MaChuyenNganh);
            if (chuyenNganh != null)
            {
                try
                {
                    chuyenNganh.TenChuyenNganh = et_ChuyenNganh.TenChuyenNganh;
                    chuyenNganh.MaKhoa = et_ChuyenNganh.MaKhoa;
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
