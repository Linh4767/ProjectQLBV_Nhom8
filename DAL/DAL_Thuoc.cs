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
                        select new {t.MaThuoc,t.TenThuoc,t.LoaiThuoc,t.HamLuong,t.XuatXu,t.NhaCungCap,t.DonViTinh,t.QuyCachDongGoi,t.SoLuongDVT,t.SoLuongQCDG,t.Gia,SoLuongTrongKho = k == null ? 0 : k.SoLuongTrongKho,t.TrangThai, k.SoLuongDonVi};
            return thuoc;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong(string tenThuoc, string xuatXu, string nhaCungCap, string loaiThuoc, string hamLuong)
        {
            // Loại bỏ tất cả khoảng trắng và lấy 3 ký tự đầu tiên
            string maThuoc = string.Join("", tenThuoc.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries));  // Loại bỏ khoảng trắng

            // Lấy tối đa 3 ký tự đầu tiên của chuỗi sau khi đã loại bỏ khoảng trắng
            maThuoc = maThuoc.Length >= 3 ? maThuoc.Substring(0, 3) : maThuoc;

            // Chuyển thành chữ hoa
            maThuoc = maThuoc.ToUpper();

            // Xử lý mã quốc gia
            string maXuatXu;
            string xuatXuKhongDau = RemoveDiacritics(xuatXu); // Loại bỏ dấu trước khi xử lý
            string[] tuXuatXu = xuatXuKhongDau.Split(' '); // Tách từ trong xuất xứ

            if (tuXuatXu.Length == 1)
            {
                // Nếu là một từ, lấy toàn bộ từ và viết hoa
                maXuatXu = tuXuatXu[0].ToUpper();
            }
            else
            {
                // Nếu nhiều từ, lấy ký tự đầu của mỗi từ
                maXuatXu = string.Join("", tuXuatXu
                        .Where(t => !string.IsNullOrWhiteSpace(t))  // Lọc các từ rỗng hoặc chỉ chứa khoảng trắng
                        .Select(t => t.Trim()[0]))  // Lấy ký tự đầu tiên của mỗi từ và loại bỏ khoảng trắng thừa
                        .ToUpper();  // Chuyển kết quả thành chữ in hoa

            }

            // Lấy ký tự đầu của mỗi từ trong tên nhà cung cấp và viết hoa
            string maNhaCungCap = string.Join("", nhaCungCap
                                  .Split(' ')  // Chia chuỗi theo dấu cách
                                  .Where(t => !string.IsNullOrWhiteSpace(t))  // Lọc bỏ các từ rỗng hoặc chỉ chứa khoảng trắng
                                  .Select(t => t[0])  // Lấy ký tự đầu tiên của mỗi từ hợp lệ
                                  ).ToUpper();  // Chuyển kết quả thành chữ in hoa


            //Lấy kí tự đầu của loại thuốc
            string maLoaiThuoc = loaiThuoc.Substring(0, 1).ToUpper();

            return $"{maThuoc}-{maXuatXu}-{maNhaCungCap}-{maLoaiThuoc}{hamLuong}";
        }

        //Tìm kiếm thuốc
        public IQueryable TimKiemThuoc(string searchTerm)
        {
            var ds = from t in db.Thuocs
                     join kt in db.KhoThuocs 
                     on t.MaThuoc equals kt.MaThuoc into kho
                     from k in kho.DefaultIfEmpty()  // Left join
                     where t.TenThuoc.Contains(searchTerm)
                     select new {t.MaThuoc,t.TenThuoc,t.LoaiThuoc,t.HamLuong,t.XuatXu,t.NhaCungCap,t.DonViTinh,t.QuyCachDongGoi,t.SoLuongDVT,t.SoLuongQCDG,t.Gia,SoLuongTrongKho = k == null ? 0 : k.SoLuongTrongKho, t.TrangThai};
            return ds;
        }


        //Thêm thuốc
        public bool ThemThuoc(ET_Thuoc et_thuoc)
        {
            // Kiểm tra xem MaThuoc có tồn tại trong bảng Thuoc không
            if (db.Thuocs.Any(thuoc => thuoc.MaThuoc == et_thuoc.MaThuoc))
            {
                return false;
            }

            try
            {
                // Thêm thuốc vào bảng Thuoc
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
                    Gia = et_thuoc.Gia
                };

                db.Thuocs.InsertOnSubmit(thuoc);
                db.SubmitChanges(); // Lưu vào bảng Thuoc

                // Thêm số lượng 0 vào bảng KhoThuoc
                KhoThuoc khoThuoc = new KhoThuoc
                {
                    MaThuoc = et_thuoc.MaThuoc,    // Liên kết với thuốc vừa thêm
                    SoLuongTrongKho = 0            // Đặt số lượng trong kho là 0
                };

                db.KhoThuocs.InsertOnSubmit(khoThuoc);
                db.SubmitChanges(); // Lưu vào bảng KhoThuoc

                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Lỗi khi thêm thuốc: {ex.Message}", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        //Sửa thuốc
        public bool SuaThuoc(string maThuoc, float gia, string trangThai, string donViTinh, string quyCachDongGoi, int soLuongDVT, int? soLuongQCDG)
        {
            using (var db = new QLBVDataContext())
            {
                Thuoc thuoc = db.Thuocs.SingleOrDefault(t => t.MaThuoc == maThuoc);
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

                    // Lưu thay đổi vào bảng Thuoc
                    db.SubmitChanges();

                    // Sau khi cập nhật thuốc, cập nhật lại SoLuongDonVi trong kho
                    var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc);
                    if (khoThuoc != null)
                    {
                        // Tính toán lại SoLuongDonVi
                        if (thuoc.LoaiThuoc == "Viên nén")
                        {
                            khoThuoc.SoLuongDonVi = khoThuoc.SoLuongTrongKho * thuoc.SoLuongDVT * thuoc.SoLuongQCDG.GetValueOrDefault(1);
                        }
                        else
                        {
                            khoThuoc.SoLuongDonVi = khoThuoc.SoLuongTrongKho * thuoc.SoLuongDVT;
                        }

                        // Lưu thay đổi vào bảng KhoThuoc
                        db.SubmitChanges();
                    }

                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi: " + ex.Message);
                }
            }
        }


    }
}
