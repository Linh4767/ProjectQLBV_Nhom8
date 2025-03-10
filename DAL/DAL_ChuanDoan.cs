using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_ChuanDoan
    {
        private static DAL_ChuanDoan instance;
        public static DAL_ChuanDoan Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_ChuanDoan();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);
        //Xem danh sách chuẩn đoán theo ngày
        public IQueryable XemDSChuanDoanTheoNgay(DateTime dtpNgay)
        {
            IQueryable ds = from dl in db.ChuanDoans
                            where dl.NgayChuanDoan.Value.Date == dtpNgay.Date
                            select dl;
            return ds;
        }
        //Lấy bệnh nhân ra dựa trên mã phiếu khám bệnh
        public string LayBNDuaTrenPKB(string maPKB)
        {
            string benhNhan = (from dl in db.PhieuKhamBenhs
                               join bn in db.BenhNhans
                               on dl.MaBN equals bn.MSBN
                               where dl.MaPhieuKB == maPKB
                               select bn.TenBN).FirstOrDefault();
            return benhNhan;
        }
        //Thêm thông tin chẩn đoán
        public bool ThemThongTinCD(ET_ChuanDoan etCD)
        {
            if (db.ChuanDoans.Any(kb => kb.MaPhieuKB == etCD.MaPhieuKB))
            {
                return false;
            }
            else
            {
                try
                {
                    ChuanDoan cd = new ChuanDoan
                    {
                        MaPhieuKB = etCD.MaPhieuKB,
                        MaNV = etCD.MaNV,
                        ChuanDoan1 = etCD.ChuanDoan,
                        NgayChuanDoan = etCD.NgayCD
                    };
                    db.ChuanDoans.InsertOnSubmit(cd);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }
        //Cập nhật chuẩn đoán
        public bool SuaThongTinCD(ET_ChuanDoan etCD)
        {
            var capNhat = db.ChuanDoans.SingleOrDefault(p => p.MaPhieuKB == etCD.MaPhieuKB);
            if (capNhat != null)
            {
                try
                {
                    capNhat.MaNV = etCD.MaNV;
                    capNhat.ChuanDoan1 = etCD.ChuanDoan;
                    capNhat.NgayChuanDoan = etCD.NgayCD;
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
            return false;
        }
        //Tìm kiếm chuẩn đoán dựa vào tên bệnh nhân
        public IQueryable TimKiemDuaVaoTenBN(string tuKhoa, DateTime dtp)
        {
            IQueryable benhNhan = from dl in db.ChuanDoans
                                  join pk in db.PhieuKhamBenhs
                                  on dl.MaPhieuKB equals pk.MaPhieuKB
                                  join bn in db.BenhNhans
                                  on pk.MaBN equals bn.MSBN
                                  where bn.TenBN.Contains(tuKhoa) && dl.NgayChuanDoan.Value.Date == dtp.Date
                                  select dl;
            return benhNhan;
        }
    }
}
