using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_DonThuoc
    {
        private static DAL_DonThuoc instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_DonThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_DonThuoc();
                }
                return instance;
            }
        }

        public DAL_DonThuoc() { }

        //Tạo mã tự động
        public string TaoMaTuDongDonThuoc(string maPKB)
        {
            // Lấy ngày hiện tại với định dạng yyyMMdd
            string thoiGian = DateTime.Now.ToString("yyMMddHHmmss");
            //tạo mã mới
            string maDTMoi = $"DT{thoiGian}-{maPKB}";
            return maDTMoi;
        }

        //Thêm đơn thuốc
        public bool ThemDonThuoc(ET_DonThuoc eT_DonThuoc)
        {
            //ktra trung ma
            if (db.DonThuocs.Any(e => e.MaDonThuoc == eT_DonThuoc.MaDT))
            {
                return false;
            }
            try
            {
                DonThuoc donThuoc = new DonThuoc
                {
                    MaDonThuoc = eT_DonThuoc.MaDT,
                    NgayGioKeDon = eT_DonThuoc.NgayKeDon,
                    MaNV = eT_DonThuoc.MaNV,
                    MaPhieuKB = eT_DonThuoc.MaPKB
                };
                db.DonThuocs.InsertOnSubmit(donThuoc);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi thêm đơn thuốc: " + ex.Message, ex);
            }
        }
    }
}
