using DAL;
using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class BUS_DonThuoc
    {
        private static BUS_DonThuoc instance;

        public static BUS_DonThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_DonThuoc();
                }
                return instance;
            }
        }

        //Tạo mã tự động
        public string TaoMaDonThuoc(string maPKB)
        {
            return DAL_DonThuoc.Instance.TaoMaTuDongDonThuoc(maPKB);
        }

        //thêm đơn thuốc
        public string ThemDonThuoc(ET_DonThuoc etDon)
        {
            try
            {
                if (DAL_DonThuoc.Instance.ThemDonThuoc(etDon))
                {
                    return "Thêm thành công";
                }
                else
                {
                    return "Thêm không thành công.";
                }
            }
            catch (Exception ex)
            {
                return "Lỗi khi thêm đơn thuốc: " + ex.Message;
            }
        }
    }
}
