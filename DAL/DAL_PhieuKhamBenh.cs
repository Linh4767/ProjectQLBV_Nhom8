using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_PhieuKhamBenh
    {
        private static DAL_PhieuKhamBenh instance;

        public static DAL_PhieuKhamBenh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_PhieuKhamBenh();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        //Xem danh sách phiếu khám bệnh
        public IQueryable XemDSPhieuKhamBenhTheoMaBN(string maBN)
        {
            IQueryable ds = from pkb in db.PhieuKhamBenhs
                            orderby pkb.NgayKham descending
                            where pkb.MaBN == maBN
                            select pkb;
            return ds;
        }
        //Kiểm tra bệnh nhân đi khám chưa(chưa thì cho xóa)
        public bool KiemTraPhieuKBTHKhamChua(string maPKB)
        {
            var kiemTra = (from kham in db.KhamBenhs
                           where kham.MaPhieuKB == maPKB
                           select kham).Any();
            return kiemTra;
        }

        //Thêm phiếu khám bệnh
        public bool ThemPhieuKB(ET_PhieuKhamBenh etPhieuKB)
        {
            if (db.PhieuKhamBenhs.Any(p => p.MaPhieuKB == etPhieuKB.MaPhieuKB && p.SoPhieu == etPhieuKB.SoPhieu))
            {
                return false;
            }
            else
            {
                try
                {
                    PhieuKhamBenh pkb = new PhieuKhamBenh
                    {
                        MaPhieuKB = etPhieuKB.MaPhieuKB,
                        SoPhieu = etPhieuKB.SoPhieu,
                        MaBN = etPhieuKB.MaBN,
                        TrieuChung = etPhieuKB.TrieuChung,
                        ThongTinLamSang = etPhieuKB.ThongTinLamSang,
                        NgayKham = etPhieuKB.NgayKham
                    };
                    db.PhieuKhamBenhs.InsertOnSubmit(pkb);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }

        //Xóa phiếu khám bệnh
        //Tạo mã phiếu khám bệnh tự động
        public string TaoTuDongMaPhieuKB(string maBN)
        {
            // Lấy ngày hiện tại với định dạng yyyMMdd
            string datePrefix = DateTime.Now.ToString("yyMMddHHmmss");

            // Tạo chuỗi query để lấy số lượng phiếu khám bệnh trong ngày hôm nay
            string query = $"PKB{datePrefix}-{maBN}";

            // Tạo mã mới, thêm số thứ tự cho mỗi phiếu khám trong ngày
            string newCode = $"PKB{datePrefix}-{maBN}";

            return newCode;
        }



        //Xóa phiếu khám bệnh
        public bool XoaPhieuKB(string maPhieuKB)
        {
            try
            {
                var xoa = from p in db.PhieuKhamBenhs
                          where p.MaPhieuKB == maPhieuKB
                          select p;
                foreach (var i in xoa)
                {
                    db.PhieuKhamBenhs.DeleteOnSubmit(i);
                    db.SubmitChanges();
                }
                return true;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                if (ex.Number == 547)
                {
                    return false;
                }
                else
                {
                    return false;
                }
            }
        }

        // Sửa phiếu khám bệnh
        public bool SuaPhieuKB(ET_PhieuKhamBenh etPhieuKB)
        {
            var capNhat = db.PhieuKhamBenhs.SingleOrDefault(p => p.MaPhieuKB == etPhieuKB.MaPhieuKB);
            if (capNhat != null)
            {
                try
                {
                    capNhat.MaBN = etPhieuKB.MaBN;
                    capNhat.TrieuChung = etPhieuKB.TrieuChung;
                    capNhat.ThongTinLamSang = etPhieuKB.ThongTinLamSang;
                    capNhat.NgayKham = etPhieuKB.NgayKham;

                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi: " + ex.Message);
                }
            }
            return false;
        }

        //Tạo tự động số phiếu và reset lại từ đầu khi qua ngày mới
        public string TaoTuDongSoPhieu()
        {
            // Lấy ngày hiện tại với định dạng yyMMdd
            string datePrefix = DateTime.Now.ToString("yyMMdd");
            string query = $"PKB{datePrefix}";

            // Tìm số thứ tự lớn nhất trong cột SoPhieu cho ngày hiện tại
            var maxSoPhieu = (from h in db.PhieuKhamBenhs
                              where h.MaPhieuKB.StartsWith(query)
                              select h.SoPhieu).ToList();

            // Lấy số lớn nhất, nếu không có phiếu thì dùng 0
            int largestSoPhieu = maxSoPhieu.Count > 0 ? maxSoPhieu.Max() : 0;

            // Tạo mã mới bằng cách tăng số lớn nhất lên 1, định dạng 3 chữ số
            string newCode = $"{(largestSoPhieu + 1).ToString("D3")}";

            return newCode;
        }
    }
}
