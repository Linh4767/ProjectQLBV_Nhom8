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
        public bool ThemThuocVaoKho(string maThuoc, int soLuongThem)
        {
            // Khởi tạo context LINQ to SQL
            using (var db = new QLBVDataContext()) // QLBVDataContext là lớp tự động sinh ra từ .dbml
            {
                // Lấy thông tin thuốc từ bảng Thuoc
                var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);
                if (thuoc == null) return false; // Nếu không tìm thấy thuốc, thoát ra

                // Tìm thuốc trong kho
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc);

                // Tính số lượng đơn vị
                int soLuongDonVi = 0;
                if (thuoc.LoaiThuoc == "Viên nén")
                {
                    soLuongDonVi = (int)((soLuongThem + (khoThuoc?.SoLuongTrongKho ?? 0)) * thuoc.SoLuongDVT * thuoc.SoLuongQCDG);
                }
                else
                {
                    soLuongDonVi = (int)((soLuongThem + (khoThuoc?.SoLuongTrongKho ?? 0)) * thuoc.SoLuongDVT);
                }

                if (khoThuoc != null)
                {
                    // Nếu thuốc đã có trong kho, cập nhật số lượng
                    khoThuoc.SoLuongTrongKho += soLuongThem;
                    khoThuoc.SoLuongDonVi = soLuongDonVi;
                }
                else
                {
                    // Nếu chưa có thuốc trong kho, tạo mới
                    var khoThuocMoi = new KhoThuoc
                    {
                        MaThuoc = maThuoc,
                        SoLuongTrongKho = soLuongThem,
                        SoLuongDonVi = soLuongDonVi
                    };

                    // Thêm bản ghi mới vào kho
                    db.KhoThuocs.InsertOnSubmit(khoThuocMoi);
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges();
                return true;
            }
        }



        //Xóa thuốc trong kho 
        public bool XoaThuocTrongKho(string maThuoc, int soLuongXoa)
        {
            // Khởi tạo context LINQ to SQL
            using (var db = new QLBVDataContext()) // QLBVDataContext là lớp tự động sinh ra từ .dbml
            {
                // Tìm thuốc trong kho
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc);
                // Lấy thông tin thuốc từ bảng Thuoc để kiểm tra LoaiThuoc, SoLuongDVT, SoLuongQCDG
                var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == maThuoc);

                if (khoThuoc != null && thuoc != null)
                {
                    if (khoThuoc.SoLuongTrongKho > soLuongXoa)
                    {
                        // Giảm số lượng thuốc trong kho
                        khoThuoc.SoLuongTrongKho -= soLuongXoa;

                        // Cập nhật lại SoLuongDonVi sau khi giảm
                        if (thuoc.LoaiThuoc == "Viên nén")
                        {
                            khoThuoc.SoLuongDonVi = khoThuoc.SoLuongTrongKho * thuoc.SoLuongDVT * thuoc.SoLuongQCDG.GetValueOrDefault(1);
                        }
                        else
                        {
                            khoThuoc.SoLuongDonVi = khoThuoc.SoLuongTrongKho * thuoc.SoLuongDVT;
                        }
                    }
                    else
                    {
                        // Nếu số lượng cần xóa lớn hơn hoặc bằng số lượng hiện có, xóa bản ghi
                        db.KhoThuocs.DeleteOnSubmit(khoThuoc);
                    }

                    // Lưu thay đổi vào cơ sở dữ liệu
                    db.SubmitChanges();
                    return true;
                }
                else
                {
                    // Không tìm thấy thuốc trong kho hoặc thông tin thuốc
                    return false;
                }
            }
        }



    }
}
