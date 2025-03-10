using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_KhamBenh
    {
        private static DAL_KhamBenh instance;

        public static DAL_KhamBenh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_KhamBenh();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        //Xem danh sách phiếu khám bệnh
        public IQueryable XemDSKhamBenhTheoNgay(DateTime ngayKham, string maPhong)
        {
            IQueryable ds = from kb in db.KhamBenhs
                            join pkb in db.PhieuKhamBenhs
                            on kb.MaPhieuKB equals pkb.MaPhieuKB
                            join p in db.Phongs
                            on kb.MaPhong equals p.MSPhong
                            join k in db.Khoas
                            on p.MaKhoa equals k.MaKhoa
                            where pkb.NgayKham.Value.Date == ngayKham.Date && kb.MaPhong == maPhong
                            orderby pkb.NgayKham descending
                            select new { kb.MaPhong, kb.MaKham, kb.MaNV, kb.MaPhieuKB, p.MaKhoa };
            return ds;
        }

        //Thêm thông tin khám bệnh
        public bool ThemThongTinKB(ET_KhamBenh etKB)
        {
            if (db.KhamBenhs.Any(kb => kb.MaPhieuKB == etKB.MaPhieuKB && kb.MaPhong == etKB.MaPhong || kb.MaKham == etKB.MaKham))
            {
                return false;
            }
            else
            {
                try
                {
                    KhamBenh kb = new KhamBenh
                    {
                        MaNV = etKB.MaNV,
                        MaPhong = etKB.MaPhong,
                        MaPhieuKB = etKB.MaPhieuKB,
                        MaKham = etKB.MaKham
                    };
                    db.KhamBenhs.InsertOnSubmit(kb);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }

        // Sửa thông tin khám bệnh
        public bool SuaThongTinKB(ET_KhamBenh etKB)
        {
            var capNhat = db.KhamBenhs.SingleOrDefault(p => p.MaKham == etKB.MaKham);
            if (capNhat != null)
            {
                if (db.KhamBenhs.Any(kb => kb.MaPhieuKB == etKB.MaPhieuKB && kb.MaPhong == etKB.MaPhong && kb.MaKham != etKB.MaKham))
                {
                    return false;
                }
                else
                {
                    try
                    {
                        capNhat.MaPhieuKB = etKB.MaPhieuKB;
                        capNhat.MaPhong = etKB.MaPhong;
                        capNhat.MaNV = etKB.MaNV;

                        db.SubmitChanges();
                        return true;
                    }
                    catch (Exception ex)
                    {
                        return false;
                    }
                }
            }
            return false;
        }

        //Tạo mã khám
        public string TaoMaKBTuDong(string maPKB)
        {
            // Tạo chuỗi query để lấy số lượng hồ sơ với mã phiếu khám bệnh hôm nay
            string query = $"MK-{maPKB}";

            // Đếm số lượng mã khám trong ngày hôm nay với mã phiếu khám cụ thể
            int countToday = db.KhamBenhs.Count(h => h.MaKham.StartsWith(query));

            // Tạo mã mới
            string newCode = $"MK-{maPKB}.{(countToday + 1).ToString("D3")}";

            return newCode;
        }
        //Lấy danh sách phiếu khám bệnh theo ngày
        public IQueryable LayPKBTheoNgayKham(DateTime dtp)
        {
            IQueryable ds = from dl in db.PhieuKhamBenhs
                            join bn in db.BenhNhans
                            on dl.MaBN equals bn.MSBN
                            where dl.NgayKham.Value.Date == dtp.Date
                            select new { dl.MaPhieuKB, HienThi = dl.MaPhieuKB + "-" + dl.SoPhieu };
            return ds;
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
        //Lấy thời gian khám dựa trên mã phiếu khám bệnh
        public TimeSpan LayThoiGianKhamCuaPKB(string maPKB)
        {
            var thoiGian = (from dl in db.PhieuKhamBenhs
                            where dl.MaPhieuKB == maPKB
                            select dl.NgayKham.Value.TimeOfDay).FirstOrDefault();
            return thoiGian;
        }
        //Vận dụng các hàm so sánh và lấy phòng theo phân công
        public IQueryable LayPhongTheoPhanCong(DateTime dtp, string maKhoa, string maPKB)
        {
            TimeSpan thoiGianKham = LayThoiGianKhamCuaPKB(maPKB);
            string caTruc = "";
            if (SoSanhThoiGianCa1(thoiGianKham)) caTruc = "6h-14h";
            if (SoSanhThoiGianCa2(thoiGianKham)) caTruc = "14h-22h";
            if (SoSanhThoiGianCa3(thoiGianKham)) caTruc = "22h-6h";

            if (string.IsNullOrEmpty(caTruc))
            {
                return null;
            }

            var ds = from ca in db.CaTrucs
                     join p in db.Phongs
                     on ca.MaPhong equals p.MSPhong
                     join pkb in db.PhieuKhamBenhs
                     on ca.NgayTruc.Date equals pkb.NgayKham.Value.Date
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && p.MaKhoa == maKhoa && p.Loai == "Phòng khám" && ca.NgayTruc.Date == dtp.Date
                     select new
                     {
                         p.MSPhong,
                         HienThi = p.MSPhong + "-" + p.TenPhong
                     };

            if (!ds.Any())
            {
                return null;
            }

            return ds.Distinct();
        }
        //Lấy nhân viên theo phân công
        public IQueryable LayNhanVienTheoPhanCongVaPhong(DateTime dtp, string maPhong, string maPKB)
        {
            TimeSpan thoiGianKham = LayThoiGianKhamCuaPKB(maPKB);
            string caTruc = "";
            if (SoSanhThoiGianCa1(thoiGianKham)) caTruc = "6h-14h";
            if (SoSanhThoiGianCa2(thoiGianKham)) caTruc = "14h-22h";
            if (SoSanhThoiGianCa3(thoiGianKham)) caTruc = "22h-6h";

            if (string.IsNullOrEmpty(caTruc))
            {
                return null;
            }

            var ds = from ca in db.CaTrucs
                     join p in db.Phongs
                     on ca.MaPhong equals p.MSPhong
                     join pkb in db.PhieuKhamBenhs
                     on ca.NgayTruc.Date equals pkb.NgayKham.Value.Date
                     join nv in db.NhanViens
                     on ca.MaNV equals nv.MaNV
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && p.MSPhong == maPhong && p.Loai == "Phòng khám" && ca.NgayTruc.Date == dtp.Date
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


        //Kiểm tra phiếu khám bệnh có chuẩn đoán không
        public bool KiemTraCoChuanDoanChua(string maPKB)
        {
            return db.ChuanDoans.Any(cd => cd.MaPhieuKB == maPKB);
        }

        //Kiểm tra xem bệnh nhân đi khám chưa
        public bool KiemTraDiKhamChua(string maPKB)
        {
            var soLuong = (from pk in db.KhamBenhs
                           where pk.MaPhieuKB == maPKB
                           select new { pk.MaKham }).Count();
            if (soLuong > 0)
            {
                return true;
            }
            return false;
        }

        //Lấy danh sách khoa
        public IQueryable LayDSKhoaLoadVaoCombobox()
        {
            IQueryable ds = from dl in db.Khoas
                            where dl.MaKhoa != "K15" && dl.MaKhoa != "K18"
                            select new { dl.MaKhoa, HienThi = dl.MaKhoa + "-" + dl.TenKhoa };
            return ds;
        }

        public IQueryable layDSPhong()
        {
            DateTime ngayTruc = new DateTime(2024, 04, 13); // Tạo đối tượng DateTime cho ngày 2024-04-13

            IQueryable ds = from dl in db.CaTrucs
                            join p in db.Phongs on dl.MaPhong equals p.MSPhong
                            join k in db.Khoas on p.MaKhoa equals k.MaKhoa
                            where k.MaKhoa == "K10" && dl.Ca == "6h-14h" && dl.NgayTruc.Date == ngayTruc
                            select dl;

            return ds;
        }
        //Lấy triệu chứng của phiếu khám bệnh
        public string LayTrieuChungCuaPhieuKB(string maPKB)
        {
            string ds = (from dl in db.PhieuKhamBenhs
                         where dl.MaPhieuKB == maPKB
                         select dl.TrieuChung).FirstOrDefault();
            return ds;
        }
    }
}
