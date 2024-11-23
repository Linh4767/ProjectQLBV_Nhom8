using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_SoBA
    {
        private static DAL_SoBA instance;

        public static DAL_SoBA Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_SoBA();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        // Xem danh sách hồ sơ bệnh án
        public IQueryable XemDSHoSoBA()
        {
            IQueryable dsHoSoBA = from ds in db.SoBenhAns
                                  orderby ds.NgayLap descending
                                  select ds;
            return dsHoSoBA;
        }

        // Thêm hồ sơ bệnh án
        public bool ThemHoSoBA(ET_SoBA etHoSoBA)
        {
            if (db.SoBenhAns.Any(hs => hs.MaSoBenhAn == etHoSoBA.MaSoBenhAn || hs.MaBN == etHoSoBA.MaBN))
            {
                return false;
            }
            else
            {
                try
                {
                    SoBenhAn hs = new SoBenhAn
                    {
                        MaSoBenhAn = etHoSoBA.MaSoBenhAn,
                        MaBN = etHoSoBA.MaBN,
                        BenhNen = etHoSoBA.BenhNen,
                        NgayLap = etHoSoBA.NgayLap
                    };
                    db.SoBenhAns.InsertOnSubmit(hs);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }

        public string TaoMaSoBATuDong(string maBN)
        {
            string ma = maBN.Split('-')[0];
            string maBNHienTai = (from dl in db.BenhNhans
                                  where dl.MSBN == ma
                                  select dl.MSBN).FirstOrDefault();
            string so = maBNHienTai.Substring(2);
            string maSoBAMoi = "SBA" + so;
            return maSoBAMoi;
        }
        //Xóa sổ bệnh án
        public bool XoaSoBA(string maSoBenhAn)
        {
            try
            {
                var xoa = from sba in db.SoBenhAns
                          where sba.MaSoBenhAn == maSoBenhAn
                          select sba;
                foreach (var i in xoa)
                {
                    db.SoBenhAns.DeleteOnSubmit(i);
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

        //Sửa sổ bệnh án
        public bool SuaSoBenhAn(ET_SoBA etSBA)
        {
            var capNhat = db.SoBenhAns.SingleOrDefault(p => p.MaSoBenhAn == etSBA.MaSoBenhAn);
            if (capNhat != null)
            {
                try
                {
                    capNhat.BenhNen = etSBA.BenhNen;
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

        //Kiểm tra bệnh nhân có hồ sơ bệnh án chưa
        public bool KiemTraHoSoBACuaBN(string maBN)
        {
            return db.SoBenhAns.Any(bn => bn.MaBN == maBN);
        }

        //Lấy tên bệnh nhân nhờ mã bệnh nhân
        public string LayTenBNNhoMaBN(string maBN)
        {
            var tenBN = (from bn in db.BenhNhans
                         where bn.MSBN == maBN
                         select bn.TenBN).FirstOrDefault();

            return tenBN;
        }

        //Lấy danh sách bệnh nhân trong sổ bệnh án
        public IQueryable DoDLBenhNhanVaoComboBox()
        {
            IQueryable ds = from dl in db.SoBenhAns
                            join bn in db.BenhNhans
                            on dl.MaBN equals bn.MSBN
                            select new { dl.MaBN, HienThi = dl.MaBN + "-" + bn.TenBN };
            return ds;
        }
    }
}
