using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class BUS_KhoThuoc
    {
        public static BUS_KhoThuoc instance;

        public static BUS_KhoThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_KhoThuoc();
                }
                return instance;
            }
        }

        //Thêm số lượng thuốc vào kho
        public int? ThemSoLuongThuoc(string maThuoc, string maLo, string tenThuoc, string hamLuong, string loaiThuoc, string xuatXu, int soLuongThem)
        {
            return DAL_KhoThuoc.Instance.ThemThuocVaoKho(maThuoc, maLo, tenThuoc, loaiThuoc, xuatXu,hamLuong, soLuongThem);
        }

        //Xóa số lượng thuốc trong kho
        public int XoaNhieuThuocTrongKho(List<Tuple<string, string>> danhSachThuoc)
        {
            // Gọi phương thức trong DAL mà không cần phải thêm tham chiếu đến DAL trong form
            return DAL_KhoThuoc.Instance.XoaNhieuThuocTrongKho(danhSachThuoc);
        }


    }
}
