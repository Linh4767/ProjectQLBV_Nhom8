using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_PhanGiuong
    {
        private static DAL_PhanGiuong instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_PhanGiuong Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_PhanGiuong();
                }
                return instance;
            }
        }

        //Hiển thị danh sách giường bệnh
        public IQueryable HienThiDanhSachPhanGiuong(DateTime ngayNhan)
        {
            IQueryable phanGiuong = from pg in db.PhanGiuongs
                                    join pkb in db.PhieuKhamBenhs
                                    on pg.MaPhieuKB equals pkb.MaPhieuKB
                                    join p in db.Phongs
                                    on pg.MaPhong equals p.MSPhong
                                    join k in db.Khoas
                                    on p.MaKhoa equals k.MaKhoa
                                    join kb in db.KhamBenhs
                                    on pg.MaPhieuKB equals kb.MaPhieuKB
                                    join gb in db.GiuongBenhs
                                    on p.MSPhong equals gb.MSPhong
                                    join bn in db.BenhNhans
                                    on pkb.MaBN equals bn.MSBN
                                    where pg.NgayNhan == ngayNhan
                                    select new {bn.MSBN,bn.TenBN, pkb.MaPhieuKB, p.MSPhong, gb.MaGiuong, p.MaKhoa,  pg.NgayNhan, pg.NgayTra,  pg.GhiChu };
            return phanGiuong;
        }
    }
}
