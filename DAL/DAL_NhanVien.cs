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
    public class DAL_NhanVien
    {
        private static DAL_NhanVien instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_NhanVien Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_NhanVien();
                }
                return instance;
            }
        }

        //Hiển thị danh sách chuyên ngành
        public IQueryable HienThiDanhSachNhanVien()
        {
            IQueryable nhanVien = from nv in db.NhanViens
                                  orderby nv.MaNV descending
                                  select nv;
            return nhanVien;
        }

        public string TaoMaTuDong(string tenCN)
        {
            // Bỏ từ "Khoa" ở đầu nếu có
            if (tenCN.StartsWith("Khoa "))
            {
                tenCN = tenCN.Substring(5);
            }
            // Loại bỏ dấu tiếng Việt
            var normalizedString = tenCN.Normalize(NormalizationForm.FormD);
            var sb = new StringBuilder();

            foreach (var c in normalizedString)
            {
                if (CharUnicodeInfo.GetUnicodeCategory(c) != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(c);
                }
            }

            tenCN = sb.ToString().Normalize(NormalizationForm.FormC); // Chuẩn hóa về dạng bình thường
                                                                        // Lấy tất cả mã phòng dưới dạng chuỗi từ database
            var danhSachMaNV = db.NhanViens
                                    .Select(cn => cn.MaNV)
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
            string chuCaiDauKhoa = tenCN.Contains(" ")
                    ? string.Concat(tenCN.Split(' ')
                   .Where(word => !string.IsNullOrEmpty(word))  // Lọc các chuỗi rỗng
                   .Select(word => char.ToUpper(word[0])))
                    : tenCN;
            // Tăng số phòng hiện tại lên 1
            int maCNHienTai = maNVMax + 1;
            // Tạo mã phòng mới với phần số mới, đảm bảo 3 chữ số
            string maNVHienTai = "NV" + chuCaiDauKhoa + maCNHienTai.ToString("D3");

            return maNVHienTai; // Trả về mã phòng mới
        }

        //Lấy tên khoa theo mã khoa
        public string HienThiTenChuyenNganh(string maCN)
        {
            var chuyenNganh = (from k in db.Khoas
                               join cn in db.ChuyenNganhs
                               on k.MaKhoa equals cn.MaKhoa
                                where cn.MaChuyenNganh == maCN
                               select k.TenKhoa).FirstOrDefault();
            return chuyenNganh;
        }

        //Hiển thị combobox Chức Vụ
        public IQueryable DoDuLieuLenCBCV()
        {
            IQueryable dsCV = from cv in db.ChucVus
                              select new { cv.MaCV, cv.TenCV };
            return dsCV;
        }


        //Hiển thị combobox Chuyên Ngành
        public IQueryable DoDuLieuLenCBCN()
        {
            IQueryable chuyenNganh = from cn in db.ChuyenNganhs
                                     select new { cn.MaChuyenNganh, cn.TenChuyenNganh };
            return chuyenNganh;
        }

        //Lấy chuyên ngành dựa vào khoa
        public IQueryable LayChuyenNganhDuaVaoKhoa(string maKhoa)
        {
            IQueryable dsCN = from cn in db.ChuyenNganhs
                              join k in db.Khoas
                              on cn.MaKhoa equals k.MaKhoa
                              where cn.MaKhoa == maKhoa
                              select new { cn.MaChuyenNganh, cn.TenChuyenNganh };
            return dsCN;
        }



        //Lấy chuyên ngành dựa vào khoa
        public IQueryable LayKhoaDuaVaoChuyenNganh(string maCN)
        {
            IQueryable dsKhoa = from k in db.Khoas
                                join cn in db.ChuyenNganhs
                                on k.MaKhoa equals cn.MaKhoa
                                where cn.MaChuyenNganh == maCN
                                select new { k.MaKhoa, k.TenKhoa };
            return dsKhoa;
        }

        //Tìm nhân viên
        public IQueryable TimKiemNhanVien(string searchTerm)
        {
            IQueryable ds = from dl in db.NhanViens
                            where dl.TenNV.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm nhân viên
        public bool ThemNhanVien(ET_NhanVien eT_NhanVien)
        {
            if (db.NhanViens.Any(nhanVien => nhanVien.MaNV == eT_NhanVien.MaNV))
            {
                return false;
            }
            try
            {
                NhanVien nhanVien = new NhanVien
                {
                    MaNV = eT_NhanVien.MaNV,
                    TenNV = eT_NhanVien.TenNV,
                    GioiTinh = eT_NhanVien.GioiTinh,
                    NgSinh = eT_NhanVien.NgaySinh,
                    MaCV = eT_NhanVien.MaCV,
                    MaChuyenNganh = eT_NhanVien.MaChuyenNganh,
                    SDT = eT_NhanVien.SDT
                };
                db.NhanViens.InsertOnSubmit(nhanVien);

                TaiKhoan tk = new TaiKhoan { 
                    TenTaiKhoan = eT_NhanVien.MaNV,
                    MatKhau = eT_NhanVien.MaNV,
                    MaNV = eT_NhanVien.MaNV
                };
                db.TaiKhoans.InsertOnSubmit(tk);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa nhân viên
        public bool XoaNhanVien(string maNV)
        {
            try
            {
                var delete = from nv in db.NhanViens
                             where nv.MaNV == maNV
                             select nv;
                var deleteTaiKhoan = from tk in db.TaiKhoans
                                     where tk.MaNV == maNV
                                     select tk;
                foreach (var j in deleteTaiKhoan)
                {
                    db.TaiKhoans.DeleteOnSubmit(j);
                    db.SubmitChanges();
                }
                foreach (var i in delete)
                {
                    db.NhanViens.DeleteOnSubmit(i);
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

        //Sửa nhân viên
        public bool SuaNhanVien(ET_NhanVien eT_NhanVien)
        {
            NhanVien nhanVien = db.NhanViens.SingleOrDefault(nv => nv.MaNV == eT_NhanVien.MaNV);
            if (nhanVien != null)
            {
                try
                {
                    nhanVien.TenNV = eT_NhanVien.TenNV;
                    nhanVien.GioiTinh = eT_NhanVien.GioiTinh;
                    nhanVien.NgSinh = eT_NhanVien.NgaySinh;
                    nhanVien.MaCV = eT_NhanVien.MaCV;
                    nhanVien.MaChuyenNganh = eT_NhanVien.MaChuyenNganh;
                    nhanVien.SDT = eT_NhanVien.SDT;
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
