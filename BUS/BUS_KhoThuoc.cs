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
        public int? ThemSoLuongThuoc(string maThuoc, int soLuongThem)
        {
            return DAL_KhoThuoc.Instance.ThemThuocVaoKho(maThuoc, soLuongThem);
        }

        //Xóa số lượng thuốc trong kho
        public int? XoaSoLuongThuoc(string maThuoc, int soLuongXoa)
        {
            return DAL_KhoThuoc.Instance.XoaThuocTrongKho(maThuoc, soLuongXoa);
        }
    }
}
