using System;
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

        // Phương thức thêm thuốc vào kho
        public int? ThemThuocVaoKho(string maThuoc, int soLuongThem)
        {
            // Khởi tạo context LINQ to SQL
            using (var db = new QLBVDataContext()) // QLBVDataContext là lớp tự động sinh ra từ .dbml
            {
                // Lấy thông tin thuốc từ bảng Thuoc
                var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);
                if (thuoc == null) return -1; // Nếu không tìm thấy thuốc, trả về -1 để báo lỗi

                // Tìm thuốc trong kho
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc);

                // Tính số lượng đơn vị cần thêm vào kho
                int soLuongTang = 0;
                if (thuoc.LoaiThuoc == "Viên nén" || thuoc.LoaiThuoc == "Viên Nén")
                {
                    soLuongTang = (int)(soLuongThem * thuoc.SoLuongDVT * thuoc.SoLuongQCDG);
                }
                else
                {
                    soLuongTang = (int)(soLuongThem * thuoc.SoLuongDVT);
                }

                int? soLuongTrongKhoMoi;
                if (khoThuoc != null)
                {
                    // Nếu thuốc đã có trong kho, cập nhật số lượng
                    khoThuoc.SoLuongTrongKho += soLuongTang;
                    soLuongTrongKhoMoi = khoThuoc.SoLuongTrongKho;
                }
                else
                {
                    // Nếu chưa có thuốc trong kho, tạo mới
                    var khoThuocMoi = new KhoThuoc
                    {
                        MaThuoc = maThuoc,
                        SoLuongTrongKho = soLuongTang,
                    };

                    // Thêm bản ghi mới vào kho
                    db.KhoThuocs.InsertOnSubmit(khoThuocMoi);
                    soLuongTrongKhoMoi = soLuongTang;
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges();

                // Trả về số lượng thuốc mới trong kho
                return soLuongTrongKhoMoi;
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
