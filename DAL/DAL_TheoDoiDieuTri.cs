using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TheoDoiDieuTri
    {
        private static DAL_TheoDoiDieuTri instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_TheoDoiDieuTri Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TheoDoiDieuTri();
                }
                return instance;
            }
        }

        //Hiển thị danh sách theo dõi theo ngày theo dõi 
        public IQueryable HienThiDanhSachTheoDoi(DateTime ngay)
        {
            IQueryable phanGiuong = from td in db.TheoDoiDieuTris
                                     where td.NgayTheoDoi.Date == ngay.Date
                                     select new {td.MaPhieuKB, td.MaGiuong, td.NgayTheoDoi, td.ChiSoCanNang, td.NhietDo, td.ChiSoNhipTho, td.ChiSoHuyetAp, td.MachDap, td.DuongHuyet, td.YLenh, td.MaNV, td.MaTheoDoi};
            return phanGiuong;
        }

        //So sánh thời gian các ca
        public bool SoSanhThoiGianCa1(TimeSpan thoigian)
        {
            TimeSpan startCa1 = new TimeSpan(6, 0, 0);
            TimeSpan endCa1 = new TimeSpan(14, 00, 00);
            if (thoigian >= startCa1 && thoigian < endCa1)
            {
                return true;
            }
            return false;
        }
        public bool SoSanhThoiGianCa2(TimeSpan thoigian)
        {
            TimeSpan startCa2 = new TimeSpan(14, 0, 0);
            TimeSpan endCa2 = new TimeSpan(22, 00, 00);
            if (thoigian >= startCa2 && thoigian < endCa2)
            {
                return true;
            }
            return false;
        }
        public bool SoSanhThoiGianCa3(TimeSpan thoigian)
        {
            TimeSpan startCa3 = new TimeSpan(22, 0, 0);
            TimeSpan endCa3 = new TimeSpan(6, 00, 00);
            if (thoigian >= startCa3 || thoigian < endCa3)
            {
                return true;
            }
            return false;
        }

        //Lấy nhân viên theo phân công
        public IQueryable LayNhanVienTheoPhanCongVaPhong(DateTime dtpNgayTH, DateTime dtpThoiGianTH, string maGiuong)
        {
            string caTruc = "";
            if (SoSanhThoiGianCa1(dtpThoiGianTH.TimeOfDay)) caTruc = "6h-14h";
            if (SoSanhThoiGianCa2(dtpThoiGianTH.TimeOfDay)) caTruc = "14h-22h";
            if (SoSanhThoiGianCa3(dtpThoiGianTH.TimeOfDay)) caTruc = "22h-6h";

            if (string.IsNullOrEmpty(caTruc))
            {
                return null;
            }

            var ds = from ca in db.CaTrucs
                     join p in db.Phongs
                     on ca.MaPhong equals p.MSPhong
                     join nv in db.NhanViens
                     on ca.MaNV equals nv.MaNV
                     join gb in db.GiuongBenhs
                     on p.MSPhong equals gb.MSPhong
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && gb.MaGiuong == maGiuong && (p.Loai == "Phòng bệnh") && ca.NgayTruc.Date == dtpNgayTH.Date && p.MSPhong == LayMaPhongTheoGiuong(maGiuong)
                     select new
                     {
                         nv.MaNV,
                         HienThi = nv.MaNV + "-" + nv.TenNV
                     };

            if (!ds.Any())
            {
                return null;
            }

            return ds.Distinct();
        }

        //Lấy phòng theo mã giường 
        public string LayPhongTheoGiuong(string maGiuong)
        {
            var phong = (from p in db.Phongs
                        join g in db.GiuongBenhs
                        on p.MSPhong equals g.MSPhong
                        where g.MaGiuong == maGiuong
                        select p.MSPhong + "-" + p.TenPhong).FirstOrDefault();
            return phong;           
        }

        public string LayMaPhongTheoGiuong(string maGiuong)
        {
            var phong = (from p in db.Phongs
                         join g in db.GiuongBenhs
                         on p.MSPhong equals g.MSPhong
                         where g.MaGiuong == maGiuong
                         select p.MSPhong).FirstOrDefault();
            return phong;
        }
        //Lấy các bệnh nhân của phân giường
        public List<ET_Combobox> HienThiComboboxPhieuKB()
        {
            var phieuKB = (from pkb in db.PhieuKhamBenhs
                           join bn in db.BenhNhans on pkb.MaBN equals bn.MSBN
                           join pg in db.PhanGiuongs on pkb.MaPhieuKB equals pg.MaPhieuKB
                           select new ET_Combobox(pkb.MaPhieuKB, bn.TenBN + "-" + pkb.MaPhieuKB )).ToList();
            return phieuKB;
        }

        //Tạo mã theo dõi
        public string TaoMaTheoDoi(string maPKB, string maGiuong )
        {
            // Tạo chuỗi query để lấy số lượng hồ sơ với mã phiếu khám bệnh hôm nay
            string query = $"{maPKB}-{maGiuong}";

            // Đếm số lượng mã khám trong ngày hôm nay với mã phiếu khám cụ thể
            int countToday = db.TheoDoiDieuTris.Count(h => h.MaPhieuKB.StartsWith(query));

            // Tạo mã mới
            string newCode = $"{maPKB}-{maGiuong}.{(countToday + 1)}";

            return newCode;
        }

        //Lấy giường theo pkb
        public IQueryable HienThiGiuongTheoPhieuKB(string maPKB)
        {
            var giuong = (from g in db.GiuongBenhs
                         join pg in db.PhanGiuongs
                         on g.MaGiuong equals pg.MaGiuong
                         join pkb in db.PhieuKhamBenhs
                         on pg.MaPhieuKB equals pkb.MaPhieuKB
                         where pg.MaPhieuKB == maPKB
                        select new { g.MaGiuong}).Distinct();
            return giuong;
        }

        //Lấy các bệnh nhân của phân giường
        public string HienThiChuanDoan(string maPKB)
        {
            var chuanDoan = (from cd in db.ChuanDoans
                                    join pkb in db.PhieuKhamBenhs
                                    on cd.MaPhieuKB equals pkb.MaPhieuKB
                                    where pkb.MaPhieuKB == maPKB
                                    select cd.ChuanDoan1).FirstOrDefault();
            return chuanDoan;
        }

        //Lấy tên bênh nhân theo mã bệnh nhân
        public string HienThiTenBN(string maBN)
        {
            var benhNhan = (from bn in db.BenhNhans
                            where bn.MSBN == maBN
                            select bn.TenBN).FirstOrDefault();
            return benhNhan;
        }

        //Lấy tên bênh nhân theo mã bệnh nhân
        public string HienThiTenNV(string maNV)
        {
            var nhanVien = (from nv in db.NhanViens
                            where nv.MaNV == maNV
                            select nv.TenNV).FirstOrDefault();
            return nhanVien;
        }

        //Lấy mã bênh nhân theo pkb
        public string HienThiMaBN(string maPKB)
        {
            var benhNhan = (from bn in db.BenhNhans
                            join pkb in db.PhieuKhamBenhs
                            on bn.MSBN equals pkb.MaBN
                            where pkb.MaPhieuKB == maPKB
                            select bn.MSBN).FirstOrDefault();
            return benhNhan;
        }

        //Thêm theo dõi
        public bool ThemTheoDoi(ET_TheoDoiDieuTri et_theodoi)
        {
            if (db.TheoDoiDieuTris.Any(theoDoi => theoDoi.MaPhieuKB == et_theodoi.MaPhieuKB && theoDoi.NgayTheoDoi == et_theodoi.NgayTheoDoi && theoDoi.MaTheoDoi == et_theodoi.MaTheoDoi))
            {
                return false;
            }
            try
            {
                TheoDoiDieuTri theodoi = new TheoDoiDieuTri
                {
                    MaPhieuKB = et_theodoi.MaPhieuKB,
                    NgayTheoDoi = et_theodoi.NgayTheoDoi,
                    ChiSoCanNang = et_theodoi.ChiSoCanNang,
                    ChiSoHuyetAp = et_theodoi.ChiSoHuyetAp,
                    ChiSoNhipTho = et_theodoi .ChiSoNhipTho,
                    NhietDo = et_theodoi.NhietDo,
                    MachDap = et_theodoi.MachDap,
                    DuongHuyet = et_theodoi.DuongHuyet,
                    YLenh = et_theodoi.YLenh,
                    MaNV = et_theodoi.MaNV,
                    MaGiuong = et_theodoi.MaGiuong,
                    MaTheoDoi = et_theodoi.MaTheoDoi
                };
                db.TheoDoiDieuTris.InsertOnSubmit(theodoi);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Sửa theo doi
        public bool SuaTheoDoi(ET_TheoDoiDieuTri et_theodoi)
        {
            TheoDoiDieuTri theoDoi = db.TheoDoiDieuTris.SingleOrDefault(theoDoiDT => theoDoiDT.MaTheoDoi == et_theodoi.MaTheoDoi);
            if (theoDoi != null)
            {
                try
                {
                    theoDoi.MaNV = et_theodoi.MaNV;          
                    theoDoi.ChiSoCanNang = et_theodoi.ChiSoCanNang;
                    theoDoi.ChiSoHuyetAp = et_theodoi.ChiSoHuyetAp;
                    theoDoi.ChiSoNhipTho = et_theodoi.ChiSoNhipTho;
                    theoDoi.NhietDo = et_theodoi.NhietDo;
                    theoDoi.MachDap = et_theodoi.MachDap;
                    theoDoi.DuongHuyet = et_theodoi.DuongHuyet;
                    theoDoi.YLenh = et_theodoi.YLenh;
                    theoDoi.NgayTheoDoi = et_theodoi.NgayTheoDoi;
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi " + ex.Message);
                }
            }
            return false;
        }
        //Kiểm tra ngày theo dõi
        public bool KiemTraNgayTheoDoi(string maPKB,string maGiuong, DateTime ngayTheoDoi)
        {
            // Lấy Ngày Nhận Giường và Ngày Trả Giường từ bảng PhanGiuong
            var phanGiuong = db.PhanGiuongs
                               .Where(pg => pg.MaGiuong == maGiuong && pg.MaPhieuKB == maPKB)
                               .Select(pg => new { pg.NgayNhan, pg.NgayTra })
                               .FirstOrDefault();

            // Kiểm tra xem Ngày Nhận Giường có tồn tại hay không
            if (phanGiuong == null || phanGiuong.NgayNhan == default(DateTime))
            {
                return false; // Không có ngày nhận giường
            }

            // Kiểm tra ngày theo dõi không được nhỏ hơn ngày nhận giường
            if (ngayTheoDoi < phanGiuong.NgayNhan)
            {
                return false; // Ngày theo dõi không được nhỏ hơn ngày nhận giường
            }

            // Kiểm tra nếu Ngày Trả Giường tồn tại và ngày theo dõi không được lớn hơn hoặc bằng ngày trả giường
            if (phanGiuong.NgayTra.HasValue && ngayTheoDoi >= phanGiuong.NgayTra.Value)
            {
                return false; // Ngày theo dõi không được lớn hơn hoặc bằng ngày trả giường
            }
            return true;
        }

        public bool KiemTraKhiSuaNgayTheoDoi(string maPKB, string maGiuong, DateTime ngayTheoDoi)
        {
            // Kiểm tra xem ngày trả giường có tồn tại trong cơ sở dữ liệu không
            bool exists = db.TheoDoiDieuTris.Any(tddt => tddt.MaGiuong == maGiuong && tddt.NgayTheoDoi == ngayTheoDoi && tddt.MaPhieuKB == maPKB);
            if (exists)
            {
                return false; // Ngày theo dõi này đã tồn tại
            }
            return true;
        }

        //Tìm kiếm theo tên bệnh nhân, tên phòng theo ngày
        public IQueryable TimKiemTheoTen(string ten)
        {
            IQueryable ds = (from td in db.TheoDoiDieuTris
                             join pkb in db.PhieuKhamBenhs
                             on td.MaPhieuKB equals pkb.MaPhieuKB
                             join bn in db.BenhNhans
                             on pkb.MaBN equals bn.MSBN
                             join pg in db.PhanGiuongs
                             on td.MaGiuong equals pg.MaGiuong
                             join p in db.Phongs
                             on pg.MaPhong equals p.MSPhong
                             where (bn.TenBN.Contains(ten) || p.TenPhong.Contains(ten))
                             select new { td.MaPhieuKB, td.MaGiuong, td.NgayTheoDoi, td.ChiSoCanNang, td.NhietDo, td.ChiSoNhipTho, td.ChiSoHuyetAp, td.MachDap, td.DuongHuyet, td.YLenh, td.MaNV, td.MaTheoDoi }).Distinct();
            return ds;
        }

    }
}
