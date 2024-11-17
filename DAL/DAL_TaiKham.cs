using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TaiKham
    {
        private static DAL_TaiKham instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_TaiKham Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TaiKham();
                }
                return instance;
            }
        }

        public DAL_TaiKham() { }

        //Danh sách tái khám
        public IQueryable LayDSTaiKham(DateTime ngayTK)
        {
            IQueryable taiKham = from tk in db.TaiKhams
                                 join sba in db.SoBenhAns
                                 on tk.MaSoBenhAn equals sba.MaSoBenhAn
                                 join bn in db.BenhNhans
                                 on sba.MaBN equals bn.MSBN
                                 join phong in db.Phongs
                                 on tk.MSPhong equals phong.MSPhong
                                 where tk.NgayTaiKham.Value.Date == ngayTK.Date
                                 select new { tk.MSCuocHen, tk.MSPhong, phong.TenPhong, sba.MaSoBenhAn, sba.MaBN, bn.TenBN, tk.MaNVPhuTrach, tk.NgayTaiKham, tk.TrangThai, tk.KetQua, phong.MaKhoa };

            return taiKham;
        }

        //Tạo mã tự động
        public string TaoMaTuDong()
        {
            // Lấy tất cả các mã bệnh nhân hiện tại
            var danhSachCH = db.TaiKhams.Select(n => n.MSCuocHen).ToList();

            // Nếu danh sách trống, bắt đầu từ 1
            int maCHLonNhat = 0;

            if (danhSachCH.Count > 0)
            {
                // Tìm mã lớn nhất dựa trên phần số sau chữ "BN"
                maCHLonNhat = danhSachCH.Select(maCH => int.Parse(maCH.Substring(4))).Max();
            }

            // Tạo mã mới với số lớn hơn mã lớn nhất
            int maCHHientai = maCHLonNhat + 1;
            string maCHMoi = "CHTK" + maCHHientai.ToString("D3"); // đảm bảo ít nhất 3 chữ số
            return maCHMoi;
        }

        public bool KiemTraKoDatLichTaiKhamNhieuLan(string maPKB)
        {
            var ds = db.TaiKhams
               .AsEnumerable()  // Chuyển sang LINQ to Objects để sử dụng các phương thức .NET như Split
               .Where(dl => dl.MSCuocHen.Contains("-") && dl.MSCuocHen.Split('-')[1] == maPKB)
               .ToList();  // Lọc trong bộ nhớ

            return ds.Any();
        }

        //thêm cuộc hẹn tái khám
        public bool ThemTaiKham(ET_TaiKham eT_TaiKham)
        {
            if (db.TaiKhams.Any(e => e.MSCuocHen == eT_TaiKham.MaCH || (e.NgayTaiKham.Value.Date == eT_TaiKham.NgayTaiKham.Date && e.MaSoBenhAn == eT_TaiKham.MaSoBA)))
            {
                return false;
            }
            try
            {
                TaiKham taiKham = new TaiKham
                {
                    MSCuocHen = eT_TaiKham.MaCH,
                    MaSoBenhAn = eT_TaiKham.MaSoBA,
                    MSPhong = eT_TaiKham.MaPhong,
                    MaNVPhuTrach = string.IsNullOrEmpty(eT_TaiKham.MaNV) ? null : eT_TaiKham.MaNV,
                    NgayTaiKham = eT_TaiKham.NgayTaiKham,
                    TrangThai = eT_TaiKham.TrangThai,
                    KetQua = string.IsNullOrEmpty(eT_TaiKham.KetQua) ? null : eT_TaiKham.KetQua
                };
                db.TaiKhams.InsertOnSubmit(taiKham);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi khi thêm tái khám: " + ex.Message, ex);
            }
        }

        //Sửa cuộc hẹn
        public bool CapNhatCuocHen(ET_TaiKham eT_TaiKham)
        {
            TaiKham taiKham = db.TaiKhams.SingleOrDefault(e => e.MSCuocHen == eT_TaiKham.MaCH);
            if (taiKham != null)
            {
                try
                {
                    taiKham.MSPhong = eT_TaiKham.MaPhong;
                    taiKham.MaNVPhuTrach = string.IsNullOrEmpty(eT_TaiKham.MaNV) ? null : eT_TaiKham.MaNV;
                    taiKham.NgayTaiKham = eT_TaiKham.NgayTaiKham;
                    taiKham.TrangThai = eT_TaiKham.TrangThai;
                    taiKham.KetQua = string.IsNullOrEmpty(eT_TaiKham.KetQua) ? null : eT_TaiKham.KetQua;

                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi khi cập nhật cuộc hẹn: " + ex.Message, ex);
                }
            }
            return false;
        }

        //Lịch sử tái khám của bệnh nhân
        public IQueryable TimKiemDSTaiKhamBenhNhan(string key)
        {
            IQueryable taiKham = from tk in db.TaiKhams
                                 join sba in db.SoBenhAns
                                 on tk.MaSoBenhAn equals sba.MaSoBenhAn
                                 join bn in db.BenhNhans
                                 on sba.MaBN equals bn.MSBN
                                 join phong in db.Phongs
                                 on tk.MSPhong equals phong.MSPhong
                                 where bn.MSBN.Contains(key) || bn.TenBN.Contains(key)
                                 select new { tk.MSCuocHen, tk.MSPhong, phong.TenPhong, sba.MaSoBenhAn, sba.MaBN, bn.TenBN, tk.MaNVPhuTrach, tk.NgayTaiKham, tk.TrangThai, tk.KetQua, phong.MaKhoa };
            return taiKham;
        }

        //tìm kiếm cuộc hẹn của bệnh nhân
        public IQueryable TimKiemCuocHenBenhNhan(string key, DateTime ngayTK)
        {
            IQueryable taiKham = from tk in db.TaiKhams
                                 join sba in db.SoBenhAns
                                 on tk.MaSoBenhAn equals sba.MaSoBenhAn
                                 join bn in db.BenhNhans
                                 on sba.MaBN equals bn.MSBN
                                 join phong in db.Phongs
                                 on tk.MSPhong equals phong.MSPhong
                                 where (bn.MSBN.Contains(key) || bn.TenBN.Contains(key)) && tk.NgayTaiKham.Value.Date == ngayTK.Date
                                 select new { tk.MSCuocHen, tk.MSPhong, phong.TenPhong, sba.MaSoBenhAn, sba.MaBN, bn.TenBN, tk.MaNVPhuTrach, tk.NgayTaiKham, tk.TrangThai, tk.KetQua, phong.MaKhoa };
            return taiKham;
        }

        //Lấy tên bệnh nhân theo sổ bệnh án
        public string LayTenBN(string maPKB)
        {
            string tenBN = (from pkb in db.PhieuKhamBenhs
                            join bn in db.BenhNhans
                            on pkb.MaBN equals bn.MSBN
                            where pkb.MaPhieuKB == maPKB
                            select bn.TenBN).FirstOrDefault();
            return tenBN;
        }

        //Lấy sổ bệnh án theo phiếu khám bệnh
        public IQueryable LaySoBATheoPKB(string pKB)
        {
            var soBA = from pkb in db.PhieuKhamBenhs
                       join sba in db.SoBenhAns
                       on pkb.MaBN equals sba.MaBN
                       join bn in db.BenhNhans
                       on sba.MaBN equals bn.MSBN
                       where pkb.MaPhieuKB == pKB
                       select new { sba.MaSoBenhAn, HienThi = sba.MaSoBenhAn + "-" + bn.TenBN };
            return soBA;
        }

        //Lấy sổ bệnh án
        public IQueryable LaySoBA(string maSoBA)
        {
            var soBA = from sba in db.SoBenhAns
                       join bn in db.BenhNhans
                       on sba.MaBN equals bn.MSBN
                       where sba.MaSoBenhAn == maSoBA
                       select new { sba.MaSoBenhAn, HienThi = sba.MaSoBenhAn + "-" + bn.TenBN };
            return soBA;
        }

        //Lấy nhân viên theo mã
        public IQueryable LayNhanVienTheoMa(string maNV)
        {
            var nhanVien = from nv in db.NhanViens
                           where nv.MaNV == maNV
                           select new
                           {
                               nv.MaNV,
                               HienThi = nv.MaNV + "-" + nv.TenNV
                           };
            return nhanVien;
        }

        //lấy danh sách phòng theo khoa
        public IQueryable LayDSPhongTheoKhoa(string maKhoa)
        {
            IQueryable dsPK = from phong in db.Phongs
                              where phong.MaKhoa == maKhoa
                              select new { phong.MSPhong, HienThi = phong.MSPhong + "-" + phong.TenPhong };
            return dsPK;
        }

        //Lấy phòng theo phiếu khám bệnh
        public IQueryable LayPhongTheoPKB(string maPKB)
        {
            IQueryable phong = from kham in db.KhamBenhs
                               join p in db.Phongs
                               on kham.MaPhong equals p.MSPhong
                               where kham.MaPhieuKB == maPKB
                               select new { p.MSPhong, HienThi = p.MSPhong + "-" + p.TenPhong };
            return phong;
        }

        //Lấy khoa theo phiếu khám bệnh
        public string LayKhoaTheoPhong(string maP)
        {
            return (from p in db.Phongs
                    join k in db.Khoas
                    on p.MaKhoa equals k.MaKhoa
                    where p.MSPhong == maP
                    select k.TenKhoa).FirstOrDefault();
        }

        //Lấy khoa
        public Khoa LayKhoa(string maKhoa)
        {
            var khoa = db.Khoas.SingleOrDefault(kh => kh.MaKhoa == maKhoa);
            return khoa;
        }

        //lấy danh sách khoa
        public IQueryable LayDSKhoa()
        {
            IQueryable dsKhoa = from k in db.Khoas
                                select k;
            return dsKhoa;
        }

        //Lấy danh sách phòng có nhân viên trực theo khoa
        public IQueryable LayPhongTheoPhanCong(DateTime dtpTGTK, DateTime dtpngayTK, string maKhoa)
        {
            string caTruc = "";
            if (DAL_SuDungDV.Instance.SoSanhThoiGianCa1(dtpTGTK.TimeOfDay)) caTruc = "6h-14h";
            if (DAL_SuDungDV.Instance.SoSanhThoiGianCa2(dtpTGTK.TimeOfDay)) caTruc = "14h-22h";
            if (DAL_SuDungDV.Instance.SoSanhThoiGianCa3(dtpTGTK.TimeOfDay)) caTruc = "22h-6h";

            if (string.IsNullOrEmpty(caTruc))
            {
                return null;
            }

            var ds = from ca in db.CaTrucs
                     join p in db.Phongs
                     on ca.MaPhong equals p.MSPhong
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && p.MaKhoa == maKhoa && p.Loai == "Phòng khám" && ca.NgayTruc.Date == dtpngayTK.Date
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

        //Lấy danh sách sổ bệnh án
        public IQueryable LayDSSoBA(DateTime ngayTK)
        {
            IQueryable dsSBA = from sba in db.SoBenhAns
                               join tk in db.TaiKhams
                               on sba.MaSoBenhAn equals tk.MaSoBenhAn
                               join bn in db.BenhNhans
                               on sba.MaBN equals bn.MSBN
                               where tk.NgayTaiKham.Value.Date == ngayTK.Date
                               select new { sba.MaSoBenhAn, HienThi = sba.MaSoBenhAn + "-" + bn.TenBN };
            return dsSBA;
        }

        //Lấy nhân viên theo phân công
        public IQueryable LayNhanVienTheoPhanCongVaPhong(DateTime dtpNgayTK, DateTime dtpThoiGianTK, string maPhong)
        {
            string caTruc = "";
            if (DAL_SuDungDV.Instance.SoSanhThoiGianCa1(dtpThoiGianTK.TimeOfDay)) caTruc = "6h-14h";
            if (DAL_SuDungDV.Instance.SoSanhThoiGianCa2(dtpThoiGianTK.TimeOfDay)) caTruc = "14h-22h";
            if (DAL_SuDungDV.Instance.SoSanhThoiGianCa3(dtpThoiGianTK.TimeOfDay)) caTruc = "22h-6h";

            if (string.IsNullOrEmpty(caTruc))
            {
                return null;
            }

            var ds = from ca in db.CaTrucs
                     join p in db.Phongs
                     on ca.MaPhong equals p.MSPhong
                     join nv in db.NhanViens
                     on ca.MaNV equals nv.MaNV
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && p.MSPhong == maPhong && p.Loai == "Phòng khám" && ca.NgayTruc.Date == dtpNgayTK.Date
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

    }
}
