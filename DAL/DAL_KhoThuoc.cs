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
                // Tìm thuốc trong kho
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == maThuoc);

                if (khoThuoc != null)
                {
                    // Nếu thuốc đã có trong kho, cộng số lượng
                    khoThuoc.SoLuongTrongKho += soLuongThem;
                }
                else
                {
                    // Nếu chưa có thuốc trong kho, tạo mới
                    var khoThuocMoi = new KhoThuoc
                    {
                        MaThuoc = maThuoc,
                        SoLuongTrongKho = soLuongThem
                    };

                    // Thêm bản ghi mới vào kho
                    db.KhoThuocs.InsertOnSubmit(khoThuocMoi); // Sử dụng InsertOnSubmit để thêm
                }

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges(); // Lưu thay đổi vào cơ sở dữ liệu
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

                if (khoThuoc != null)
                {
                    if (khoThuoc.SoLuongTrongKho > soLuongXoa)
                    {
                        // Giảm số lượng thuốc trong kho
                        khoThuoc.SoLuongTrongKho -= soLuongXoa;
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
                    // Không tìm thấy thuốc trong kho
                    return false;
                }
            }
        }


    }
}
