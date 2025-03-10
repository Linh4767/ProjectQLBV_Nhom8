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
            using (var db = new QLBVDataContext(Connection_DAL.ConnectionString))
            {
                // Lấy danh sách các thuốc khớp với thông tin (Tên thuốc, Loại thuốc, Xuất xứ, Hàm lượng)
                var thuocList = db.Thuocs.Where(t =>
                    t.XuatXu == xuatXu &&
                    t.LoaiThuoc == loaiThuoc &&
                    t.TenThuoc == tenThuoc &&
                    t.HamLuong.StartsWith(hamLuong)) // Tìm những hàm lượng bắt đầu với `hamLuong`
                .ToList();
                var thuocList_2 = db.Thuocs.Where(t =>
                    t.XuatXu == xuatXu &&
                    t.LoaiThuoc == loaiThuoc &&
                    t.TenThuoc == tenThuoc &&
                    t.HamLuong.StartsWith(hamLuong) &&
                    t.MaThuoc == maThuoc && 
                    t.MaLo == maLo) // Tìm những hàm lượng bắt đầu với `hamLuong`
                .ToList();

                MessageBox.Show($"Số lượng bản ghi tìm thấy: {thuocList.Count}");

                // Kiểm tra không tìm thấy thuốc
                if (!thuocList.Any()) return -1; // Không tìm thấy thuốc

                // Kiểm tra SoLuongHop trước khi tính toán
                foreach (var thuoc in thuocList)
                {
                    if (thuoc.SoLuongHop == null || thuoc.SoLuongHop == 0)
                    {
                        MessageBox.Show($"Hàm lượng thuốc không hợp lệ hoặc số lượng đóng gói không xác định cho thuốc: {thuoc.TenThuoc}.");
                        return -1; // Trả về lỗi nếu SoLuongHop không hợp lệ
                    }
                }

                // Tính số lượng đơn vị cần thêm vào kho (sử dụng số lượng đóng gói)
                int soLuongTang = soLuongThem * (int)thuocList.First().SoLuongHop; // Dùng quy cách đóng gói để tính số lượng cần thêm

                // Tìm tất cả các bản ghi kho thuốc có cùng mã thuốc
                var khoThuocList = db.KhoThuocs.Where(k => thuocList.Select(t => t.MaLo).Contains(k.MaLo)).ToList();

                // Kiểm tra xem có bản ghi kho thuốc nào không, nếu có thì cập nhật số lượng trong kho
                bool isUpdated = false; // Biến kiểm tra xem có bản ghi nào được cập nhật không
                foreach (var khoThuoc in khoThuocList)
                {
                    // Cập nhật số lượng thuốc trong kho cho tất cả các mã lô trùng
                    khoThuoc.SoLuongTrongKho += soLuongTang;
                    isUpdated = true;
                }

                // Nếu không có bản ghi kho thuốc nào được cập nhật, thêm mới một bản ghi kho thuốc
                if (!isUpdated)
                {
                    foreach (var thuoc in thuocList)
                    {
                        var khoThuocMoi = new KhoThuoc
                        {
                            MaThuoc = thuoc.MaThuoc,
                            MaLo = thuoc.MaLo, // Dùng mã lô của thuốc
                            SoLuongTrongKho = soLuongTang
                        };
                        db.KhoThuocs.InsertOnSubmit(khoThuocMoi);
                    }
                }

                // Cập nhật số lượng nhập trong bảng Thuoc cho từng thuốc riêng biệt
                foreach (var thuoc in thuocList_2)
                {
                    thuoc.SoLuongNhap += soLuongThem;
                }

                // Lưu thay đổi vào database (cập nhật kho thuốc và thuốc)
                db.SubmitChanges();

                // Kiểm tra lại sau khi lưu
                return khoThuocList.Sum(k => k.SoLuongTrongKho); // Trả về tổng số lượng trong kho của tất cả các bản ghi kho thuốc
            }
        }









        // Phương thức xóa lượng thuốc trong kho
        public int XoaNhieuThuocTrongKho(List<Tuple<string, string>> danhSachThuoc)
        {
            using (var db = new QLBVDataContext(Connection_DAL.ConnectionString)) // Gọi QLBVDataContext ở DAL
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
