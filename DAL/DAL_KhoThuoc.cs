using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_KhoThuoc
    {
        private static DAL_KhoThuoc instance;

        // Lấy đối tượng DAL_KhoThuoc duy nhất
        public static DAL_KhoThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_KhoThuoc();
                }
                return instance;
            }
        }

        public int? ThemThuocVaoKho(string maThuoc, string maLo, string tenThuoc, string loaiThuoc, string xuatXu, string hamLuong, int soLuongThem)
        {
            using (var db = new QLBVDataContext())
            {
                // Lấy danh sách các thuốc khớp với thông tin (Tên thuốc, Loại thuốc, Xuất xứ, Hàm lượng)
                var thuocList = db.Thuocs.Where(t =>
                    t.XuatXu == xuatXu &&
                    t.LoaiThuoc == loaiThuoc &&
                    t.TenThuoc == tenThuoc &&
                    t.HamLuong.StartsWith(hamLuong)) // Tìm những hàm lượng bắt đầu với `hamLuong`
                .ToList();

                MessageBox.Show($"Số lượng bản ghi tìm thấy: {thuocList.Count}");

                // Kiểm tra không tìm thấy thuốc
                if (!thuocList.Any()) return -1; // Không tìm thấy thuốc

                // Xử lý nếu có nhiều thuốc trùng thông tin
                if (thuocList.Count > 1)
                {
                    // Nếu có nhiều thuốc trùng, bạn có thể chọn thuốc đầu tiên hoặc xử lý thêm tùy vào yêu cầu
                    Console.WriteLine("Có nhiều thuốc trùng thông tin, chọn thuốc đầu tiên.");
                }

                // Xác định thuốc duy nhất (hoặc thuốc đầu tiên trong danh sách nếu có nhiều)
                var thuoc = thuocList.First();

                // Kiểm tra SoLuongHop trước khi tính toán
                if (thuoc.SoLuongHop == null || thuoc.SoLuongHop == 0)
                {
                    MessageBox.Show("Hàm lượng thuốc không hợp lệ hoặc số lượng đóng gói không xác định.");
                    return -1; // Trả về lỗi nếu SoLuongHop không hợp lệ
                }

                // Tìm thuốc trong kho theo mã thuốc và mã lô
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc && k.MaLo == maLo);

                // Tính số lượng đơn vị cần thêm vào kho
                int soLuongTang = (int)(soLuongThem * thuoc.SoLuongHop); // Dùng quy cách đóng gói để tính số lượng cần thêm

                if (khoThuoc != null)
                {
                    // Nếu thuốc đã có trong kho, cộng dồn số lượng
                    khoThuoc.SoLuongTrongKho += soLuongTang;
                }
                else
                {
                    // Nếu chưa có thuốc trong kho, tạo mới bản ghi kho thuốc
                    var khoThuocMoi = new KhoThuoc
                    {
                        MaThuoc = thuoc.MaThuoc,
                        MaLo = maLo,
                        SoLuongTrongKho = soLuongTang
                    };
                    db.KhoThuocs.InsertOnSubmit(khoThuocMoi);
                }

                // Cập nhật tổng số lượng nhập trong bảng Thuoc
                thuoc.SoLuongNhap += soLuongThem;

                // Lưu thay đổi vào database
                db.SubmitChanges();

                // Trả về số lượng thuốc mới trong kho
                return khoThuoc?.SoLuongTrongKho ?? soLuongTang;
            }
        }











        //Xóa thuốc trong kho 
        // Phương thức xóa lượng thuốc trong kho
        public int? XoaThuocTrongKho(string maThuoc, int soLuongXoa)
        {
            // Khởi tạo context LINQ to SQL
            using (var db = new QLBVDataContext()) // QLBVDataContext là lớp tự động sinh ra từ .dbml
            {
                // Lấy thông tin thuốc từ bảng Thuoc
                var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);
                if (thuoc == null) return -1; // Nếu không tìm thấy thuốc, trả về -1 để báo lỗi

                // Tìm thuốc trong kho
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc);
                if (khoThuoc == null) return -1; // Nếu thuốc không có trong kho, trả về -1 để báo lỗi

                // Tính số lượng đơn vị cần xóa khỏi kho
                int soLuongGiam = 0;
                if (thuoc.LoaiThuoc == "Viên nén" || thuoc.LoaiThuoc == "Viên Nén")
                {
                    soLuongGiam = (int)(soLuongXoa * thuoc.SoLuongDVT * thuoc.SoLuongQCDG);
                }
                else
                {
                    soLuongGiam = (int)(soLuongXoa * thuoc.SoLuongDVT);
                }

                int? soLuongTrongKhoMoi;
                if (khoThuoc.SoLuongTrongKho >= soLuongGiam)
                {
                    // Nếu lượng thuốc trong kho lớn hơn hoặc bằng lượng cần xóa, cập nhật số lượng
                    khoThuoc.SoLuongTrongKho -= soLuongGiam;
                    soLuongTrongKhoMoi = khoThuoc.SoLuongTrongKho;
                }
                else
                {
                    // Nếu số lượng xóa lớn hơn số lượng hiện có, xóa bản ghi thuốc khỏi kho
                    db.KhoThuocs.DeleteOnSubmit(khoThuoc);
                    soLuongTrongKhoMoi = 0;
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges();

                // Trả về số lượng thuốc mới trong kho hoặc 0 nếu đã xóa thuốc
                return soLuongTrongKhoMoi;
            }
        }


    }
}
