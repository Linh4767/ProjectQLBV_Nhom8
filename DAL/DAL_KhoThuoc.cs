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
        public int XoaNhieuThuocTrongKho(List<Tuple<string, string>> danhSachThuoc)
        {
            using (var db = new QLBVDataContext()) // Gọi QLBVDataContext ở DAL
            {
                int soLuongThuocXoa = 0;

                foreach (var item in danhSachThuoc)
                {
                    string maThuoc = item.Item1;
                    string maLo = item.Item2;

                    var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);
                    if (thuoc == null) continue; // Nếu không tìm thấy thuốc, bỏ qua

                    var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc && k.MaLo == maLo);
                    if (khoThuoc == null) continue; // Nếu không tìm thấy kho, bỏ qua

                    int? soLuongXoa = thuoc.SoLuongNhap;
                    int? soLuongHop = thuoc.SoLuongHop;

                    if (khoThuoc.SoLuongTrongKho >= soLuongXoa)
                    {
                        khoThuoc.SoLuongTrongKho -= soLuongXoa * soLuongHop;
                    }
                    else
                    {
                        khoThuoc.SoLuongTrongKho = 0;
                    }

                    thuoc.SoLuongNhap = 0;

                    if (khoThuoc.SoLuongTrongKho == 0)
                    {
                        db.KhoThuocs.DeleteOnSubmit(khoThuoc);
                    }

                    soLuongThuocXoa++;
                }

                db.SubmitChanges();
                return soLuongThuocXoa;
            }
        }

        public List<Tuple<string, string>> LayDanhSachMaLo(string maThuoc, QLBVDataContext db)
        {
            // Trả về danh sách các cặp (MaThuoc, MaLo) của thuốc từ kho
            return db.KhoThuocs
                     .Where(k => k.MaThuoc == maThuoc && k.SoLuongTrongKho > 0) // Kiểm tra số lượng trong kho > 0
                     .Select(k => new Tuple<string, string>(k.MaThuoc, k.MaLo)) // Chọn MaThuoc và MaLo
                     .ToList();
        }


    }
}
