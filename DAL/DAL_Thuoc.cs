using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_Thuoc
    {
        private static DAL_Thuoc instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_Thuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_Thuoc();
                }
                return instance;
            }
        }

        // Hàm loại bỏ dấu đơn giản
        string RemoveDiacritics(string text)
        {
            string pattern = @"\p{IsCombiningDiacriticalMarks}+";
            var temp = text.Normalize(NormalizationForm.FormD);
            return Regex.Replace(temp, pattern, string.Empty)
                        .Replace("đ", "d")
                        .Replace("Đ", "D");
        }


        //Hiển thị danh sách thuốc
        public IQueryable HienThiDanhSachThuoc()
        {
            var thuoc = from t in db.Thuocs
                        join kt in db.KhoThuocs
                        on t.MaThuoc equals kt.MaThuoc into kho
                        from k in kho.DefaultIfEmpty()  // Left join
                        select new { t.MaThuoc, t.TenThuoc, t.LoaiThuoc, t.HamLuong, t.XuatXu, t.NhaCungCap, t.DonViTinh, t.QuyCachDongGoi, t.SoLuongDVT, t.SoLuongQCDG, t.Gia, SoLuongTrongKho = k == null ? 0 : k.SoLuongTrongKho, t.TrangThai, t.SoLuongHop, t.SoLuongNhap, t.NgaySanXuat, t.HSD, t.MaLo };
            return thuoc;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong(string tenThuoc, string xuatXu, string nhaCungCap, string loaiThuoc, string hamLuong)
        {
            // Loại bỏ dấu trong tên thuốc và lấy 3 ký tự đầu tiên
            string tenThuocKhongDau = RemoveDiacritics(tenThuoc);
            string maThuoc = string.Join("", tenThuocKhongDau.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries));
            maThuoc = maThuoc.Length >= 3 ? maThuoc.Substring(0, 3) : maThuoc;
            maThuoc = maThuoc.ToUpper();

            // Xử lý mã quốc gia
            string xuatXuKhongDau = RemoveDiacritics(xuatXu); // Loại bỏ dấu trước khi xử lý
            string[] tuXuatXu = xuatXuKhongDau.Split(' ');
            string maXuatXu;

            if (tuXuatXu.Length == 1)
            {
                maXuatXu = tuXuatXu[0].ToUpper();
            }
            else
            {
                maXuatXu = string.Join("", tuXuatXu
                        .Where(t => !string.IsNullOrWhiteSpace(t))
                        .Select(t => t.Trim()[0]))
                        .ToUpper();
            }

            // Lấy ký tự đầu của mỗi từ trong tên nhà cung cấp (đã loại bỏ dấu)
            string nhaCungCapKhongDau = RemoveDiacritics(nhaCungCap);
            string maNhaCungCap = string.Join("", nhaCungCapKhongDau
                                  .Split(' ')
                                  .Where(t => !string.IsNullOrWhiteSpace(t))
                                  .Select(t => t[0])
                                  ).ToUpper();

            // Lấy kí tự đầu của loại thuốc
            string maLoaiThuoc = loaiThuoc.Substring(0, 1).ToUpper();

            return $"{maThuoc}-{maXuatXu}-{maNhaCungCap}-{maLoaiThuoc}{hamLuong}";
        }

        //Mã lô tự động 
        public string TaoMaLoTuDong(string tenThuoc, string xuatXu, string nhaCungCap, string loaiThuoc, string hamLuong, DateTime ngaySanXuat)
        {
            // Gọi hàm TaoMaTuDong để lấy mã thuốc cơ bản
            string maThuoc = TaoMaTuDong(tenThuoc, xuatXu, nhaCungCap, loaiThuoc, hamLuong);

            // Định dạng ngày sản xuất (YYYYMMDD)
            string ngaySanXuatFormatted = ngaySanXuat.ToString("yyyyMMdd");

            // Kết hợp mã thuốc và ngày sản xuất để tạo mã lô
            return $"LO-{ngaySanXuatFormatted}-{maThuoc}";
        }


        //Tìm kiếm thuốc
        public IQueryable TimKiemThuoc(string searchTerm)
        {
            var ds = from t in db.Thuocs
                     join kt in db.KhoThuocs
                     on t.MaThuoc equals kt.MaThuoc into kho
                     from k in kho.DefaultIfEmpty()  // Left join
                     where t.TenThuoc.Contains(searchTerm)
                     select new { t.MaThuoc, t.TenThuoc, t.LoaiThuoc, t.HamLuong, t.XuatXu, t.NhaCungCap, t.DonViTinh, t.QuyCachDongGoi, t.SoLuongDVT, t.SoLuongQCDG, t.Gia, SoLuongTrongKho = k == null ? 0 : k.SoLuongTrongKho, t.TrangThai, t.SoLuongHop, t.SoLuongNhap, t.NgaySanXuat, t.HSD, t.MaLo };
            return ds;
        }

        //Lấy mã thuốc
        public ET_Thuoc LayThuocByMa(string maThuoc)
        {
            var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);
            if (thuoc == null) return null;

            return new ET_Thuoc
            {
                MaThuoc = thuoc.MaThuoc,
                LoaiThuoc = thuoc.LoaiThuoc,
                SoLuongDVT = thuoc.SoLuongDVT,
                SoLuongQCDG = thuoc.SoLuongQCDG,
                // Thêm các thuộc tính cần thiết
            };
        }


        //Thêm thuốc
        public bool ThemThuoc(ET_Thuoc et_thuoc)
        {
            // Kiểm tra trùng lặp dựa trên MaThuoc và MaLo
            if (db.Thuocs.Any(thuoc => thuoc.MaThuoc == et_thuoc.MaThuoc || thuoc.MaLo == et_thuoc.MaLo))
            {
                MessageBox.Show("Thuốc hoặc mã lô đã tồn tại trong hệ thống!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            try
            {
                // Thêm thuốc mới vào bảng Thuoc
                Thuoc thuoc = new Thuoc
                {
                    MaThuoc = et_thuoc.MaThuoc,
                    TenThuoc = et_thuoc.TenThuoc,
                    XuatXu = et_thuoc.XuatXu,
                    NhaCungCap = et_thuoc.NhaCungCap,
                    TrangThai = et_thuoc.TrangThai,
                    LoaiThuoc = et_thuoc.LoaiThuoc,
                    DonViTinh = et_thuoc.DonViTinh,
                    QuyCachDongGoi = et_thuoc.QuyCachDongGoi,
                    SoLuongDVT = et_thuoc.SoLuongDVT,
                    SoLuongQCDG = et_thuoc.SoLuongQCDG,
                    HamLuong = et_thuoc.HamLuong,
                    Gia = et_thuoc.Gia,
                    NgaySanXuat = et_thuoc.NgaySanXuat,
                    HSD = et_thuoc.HanSD,
                    MaLo = et_thuoc.MaLo,
                    SoLuongNhap = 0,
                    SoLuongHop = et_thuoc.SoLuongHop
                };

                db.Thuocs.InsertOnSubmit(thuoc);
                db.SubmitChanges(); // Lưu thay đổi vào bảng Thuoc

                // Thêm số lượng 0 vào bảng KhoThuoc
                KhoThuoc khoThuoc = new KhoThuoc
                {
                    MaThuoc = et_thuoc.MaThuoc,
                    MaLo = et_thuoc.MaLo,
                    SoLuongTrongKho = 0 // Đặt số lượng ban đầu là 0
                };

                db.KhoThuocs.InsertOnSubmit(khoThuoc);
                db.SubmitChanges(); // Lưu thay đổi vào bảng KhoThuoc

                return true; // Thêm thành công
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi khi thêm thuốc: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        // Xóa thuốc
        public bool XoaThuoc(string maThuoc, string maLo)
        {
            try
            {
                // Kiểm tra xem thuốc có tồn tại trong kho và số lượng trong kho có bằng 0
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaLo == maLo);
                if (khoThuoc == null)
                {
                    // Nếu không tìm thấy thuốc trong kho
                    return false;
                }

                // Kiểm tra nếu số lượng thuốc trong kho bằng 0
                if (khoThuoc.SoLuongTrongKho == 0)
                {
                    // Xóa bản ghi trong bảng KhoThuoc
                    db.KhoThuocs.DeleteOnSubmit(khoThuoc);

                    // Kiểm tra nếu thuốc có tồn tại trong bảng Thuoc
                    var thuoc = db.Thuocs.FirstOrDefault(t => t.MaLo == maLo);
                    if (thuoc != null)
                    {
                        // Xóa bản ghi trong bảng Thuoc
                        db.Thuocs.DeleteOnSubmit(thuoc);
                    }
                    else
                    {
                        // Nếu không tìm thấy thuốc trong bảng Thuoc
                        return false;
                    }

                    // Gửi các thay đổi đến database
                    db.SubmitChanges();
                    return true;
                }
                else
                {
                    // Nếu số lượng thuốc trong kho lớn hơn 0, không thể xóa
                    return false;
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                if (ex.Number == 547)
                {
                    // Lỗi ràng buộc khóa ngoại (foreign key)
                    MessageBox.Show("Không thể xóa thuốc do có dữ liệu tham chiếu.", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                // Xử lý các lỗi khác
                MessageBox.Show($"Lỗi khi xóa thuốc: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }



        //Sửa thuốc
        public bool SuaThuoc(string maThuoc, float gia, string trangThai, string donViTinh, string quyCachDongGoi, int soLuongDVT, int? soLuongQCDG, string maLo, DateTime hSD, int soLuongHop, DateTime ngaySX)
        {
            using (var db = new QLBVDataContext())
            {
                // Tìm thuốc dựa trên mã thuốc và mã lô
                Thuoc thuoc = db.Thuocs.SingleOrDefault(t => t.MaThuoc == maThuoc && t.MaLo == maLo);
                if (thuoc == null) return false;

                try
                {
                    // Cập nhật các thuộc tính của thuốc
                    thuoc.Gia = gia;
                    thuoc.TrangThai = trangThai;
                    thuoc.DonViTinh = donViTinh;
                    thuoc.QuyCachDongGoi = quyCachDongGoi;
                    thuoc.SoLuongDVT = soLuongDVT;
                    thuoc.SoLuongQCDG = soLuongQCDG;
                    thuoc.HSD = hSD;
                    thuoc.SoLuongHop = soLuongHop;
                    thuoc.NgaySanXuat = ngaySX;  // Sửa ngày sản xuất
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi: " + ex.Message);
                }
            }
        }

        public IQueryable HienThiDanhSachThuocSapHetHan(int soNgayCanhBao = 60)
        {
            DateTime ngayHienTai = DateTime.Now; // Lấy ngày hiện tại
            DateTime ngayCanhBao = ngayHienTai.AddDays(soNgayCanhBao); // Xác định ngưỡng cảnh báo

            // Lấy danh sách thuốc sắp hết hạn
            var thuocSapHetHan = from t in db.Thuocs
                                 join kt in db.KhoThuocs
                                 on t.MaThuoc equals kt.MaThuoc into kho
                                 from k in kho.DefaultIfEmpty() // Left join
                                 where t.HSD <= ngayCanhBao && t.HSD > ngayHienTai && t.SoLuongNhap != 0 // Logic kiểm tra
                                 select new
                                 {
                                     t.MaLo,
                                     t.MaThuoc,
                                     t.TenThuoc,
                                     t.DonViTinh,
                                     t.QuyCachDongGoi,
                                     t.SoLuongDVT,
                                     t.SoLuongQCDG,
                                     t.Gia,
                                     SoLuongTrongKho = k == null ? 0 : k.SoLuongTrongKho,
                                     t.TrangThai,
                                     t.SoLuongHop,
                                     t.SoLuongNhap,
                                     t.NgaySanXuat,
                                     t.HSD

                                 };
            return thuocSapHetHan;
        }

        public IQueryable HienThiDanhSachThuocDaHetHan()
        {
            DateTime ngayHienTai = DateTime.Now; // Lấy ngày hiện tại

            // Lấy danh sách thuốc đã hết hạn
            var thuocDaHetHan = from t in db.Thuocs
                                join kt in db.KhoThuocs
                                on t.MaThuoc equals kt.MaThuoc into kho
                                from k in kho.DefaultIfEmpty() // Left join
                                where t.HSD <= ngayHienTai && t.SoLuongNhap != 0// Kiểm tra thuốc đã hết hạn
                                select new
                                {
                                    t.MaLo,
                                    t.MaThuoc,
                                    t.TenThuoc,
                                    t.DonViTinh,
                                    t.QuyCachDongGoi,
                                    t.SoLuongDVT,
                                    t.SoLuongQCDG,
                                    t.Gia,
                                    SoLuongTrongKho = k == null ? 0 : k.SoLuongTrongKho,
                                    t.TrangThai,
                                    t.SoLuongHop,
                                    t.SoLuongNhap,
                                    t.NgaySanXuat,
                                    t.HSD
                                };

            return thuocDaHetHan;
        }
    }
}
