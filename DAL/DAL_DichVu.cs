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
    public class DAL_DichVu
    {
        private static DAL_DichVu instance;
        QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_DichVu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_DichVu();
                }
                return instance;
            }
        }


        //Hiển thị danh sách dịch vụ
        public IQueryable HienThiDanhSachDichVu()
        {
            IQueryable dichVu = from dv in db.DichVus
                                select dv;
            return dichVu;
        }

        //Tạo mã tự động 
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
            var danhSachMadv = db.DichVus
                                    .Select(dv => dv.MaDV)
                                    .ToList();
            // Tìm mã phòng có số lớn nhất sau khi chuyển đổi phần số trong bộ nhớ
            int maDVMax = danhSachMadv
                         .Select(maDV =>
                         {
                             // Sử dụng Regular Expressions để tìm phần số trong mã phòng
                             var match = Regex.Match(maDV, @"\d+");
                             return match.Success ? int.Parse(match.Value) : 0; // Nếu không tìm thấy, trả về 0
                         })
                         .Max();
            string chuCaiDauKhoa = tenKhoa.Contains(" ")
                           ? string.Concat(tenKhoa.Split(' ').Select(word => char.ToUpper(word[0])))
                           : tenKhoa;
            // Tăng số phòng hiện tại lên 1
            int maCNHienTai = maDVMax + 1;
            // Tạo mã phòng mới với phần số mới, đảm bảo 3 chữ số
            string maDVMoi = "DV" + chuCaiDauKhoa + maCNHienTai.ToString("D3");

            return maDVMoi; // Trả về mã phòng mới
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

        //Tìm dịch vụ
        public IQueryable TimKiemDichVu(string searchTerm)
        {
            IQueryable ds = from dl in db.DichVus
                            where dl.TenDV.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm dịch vụ
        public bool ThemDichVu(ET_DichVu et_dichvu)
        {
            if (db.DichVus.Any(dichVu => dichVu.TenDV == et_dichvu.TenDV || dichVu.MaDV == et_dichvu.MaDV))
            {
                return false;
            }
            try
            {
                DichVu dichVu = new DichVu
                {
                    MaDV = et_dichvu.MaDV,
                    TenDV = et_dichvu.TenDV,
                    Gia = et_dichvu.Gia,
                    MaKhoa = et_dichvu.MaKhoa
                };
                db.DichVus.InsertOnSubmit(dichVu);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa dịch vụ
        public bool XoaDichVu(string maDV)
        {
            try
            {
                var delete = from dv in db.DichVus
                             where dv.MaDV == maDV
                             select dv;
                foreach (var i in delete)
                {
                    db.DichVus.DeleteOnSubmit(i);
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

        //Sửa dịch vụ
        public bool SuaDichVu(ET_DichVu et_dichvu)
        {
            DichVu dichVu = db.DichVus.SingleOrDefault(dv => dv.MaDV == et_dichvu.MaDV);
            if (dichVu != null)
            {
                try
                {
                    dichVu.TenDV = et_dichvu.TenDV;
                    dichVu.Gia = et_dichvu.Gia;
                    dichVu.MaKhoa = et_dichvu.MaKhoa;
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
