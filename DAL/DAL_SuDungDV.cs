﻿using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_SuDungDV
    {
        private static DAL_SuDungDV instance;

        public static DAL_SuDungDV Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_SuDungDV();
                }
                return instance;
            }
        }
        private QLBVDataContext db = new QLBVDataContext();

        //Tạo mã sử dụng dv
        public string TaoMaDVTuDong(string maPhieuKB)
        {
            // Định dạng tiền tố cho mã dịch vụ
            string prefix = $"DV-{maPhieuKB}.";

            // Lấy mã dịch vụ lớn nhất cho phiếu khám cụ thể
            var maxMaDV = db.SuDungDichVus
                .Where(dv => dv.MaSuDungDV.StartsWith(prefix))
                .OrderByDescending(dv => dv.MaSuDungDV)
                .Select(dv => dv.MaSuDungDV)
                .FirstOrDefault();
            // Tìm số thứ tự lớn nhất và tăng thêm 1
            int nextNumber = 1; // Mặc định bắt đầu từ 1
            if (!string.IsNullOrEmpty(maxMaDV))
            {
                string maxCountStr = maxMaDV.Substring(maxMaDV.LastIndexOf('.') + 1); // Lấy phần sau dấu "."
                if (int.TryParse(maxCountStr, out int maxCount))
                {
                    nextNumber = maxCount + 1; // Tăng số thứ tự lên 1
                }
                else
                {
                    MessageBox.Show("Failed to parse maxCountStr to int."); // Thông báo lỗi nếu không thể chuyển đổi
                }
            }

            // Tạo mã dịch vụ mới
            string newMaDV = $"{prefix}{nextNumber:D3}"; // Định dạng 3 chữ số
            return newMaDV;
        }
        //Lấy danh sách phiếu khám bệnh từ bảng khám bệnh qua
        public IQueryable LayDSPhieuKhamBenhDaKham(DateTime dtp)
        {
            var ds = from dl in db.KhamBenhs
                     join kb in db.PhieuKhamBenhs
                     on dl.MaPhieuKB equals kb.MaPhieuKB
                     join bn in db.BenhNhans
                     on kb.MaBN equals bn.MSBN
                     where kb.NgayKham.Value.Date == dtp.Date
                     select new { dl.MaPhieuKB, HienThi = dl.MaPhieuKB + "-" + bn.MSBN + "-" + bn.TenBN };
            return ds.Distinct();
        }
        //Lấy nhân viên đã thực hiện khám cho phiếu xác định dựa trên mã phiéu
        public IQueryable LayNhanVienThucHienKhamChoPhieuKhamBenh(string maPKB)
        {
            var ds = from dl in db.KhamBenhs
                     join kb in db.PhieuKhamBenhs
                     on dl.MaPhieuKB equals kb.MaPhieuKB
                     join nv in db.NhanViens
                     on dl.MaNV equals nv.MaNV
                     where kb.MaPhieuKB == maPKB
                     select new { dl.MaNV, HienThi = nv.MaNV + "-" + nv.TenNV };
            return ds.Distinct();
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
        //Lấy phòng theo phân công
        public IQueryable LayPhongTheoPhanCong(DateTime dtpTGYC, DateTime dtpngayYC, string maKhoa)
        {
            string caTruc = "";
            if (SoSanhThoiGianCa1(dtpTGYC.TimeOfDay)) caTruc = "6h-14h";
            if (SoSanhThoiGianCa2(dtpTGYC.TimeOfDay)) caTruc = "14h-22h";
            if (SoSanhThoiGianCa3(dtpTGYC.TimeOfDay)) caTruc = "22h-6h";

            if (string.IsNullOrEmpty(caTruc))
            {
                return null;
            }
            //MessageBox.Show(caTruc);
            var ds = from ca in db.CaTrucs
                     join p in db.Phongs
                     on ca.MaPhong equals p.MSPhong
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && p.MaKhoa == maKhoa && (p.Loai == "Phòng chức năng" || p.Loai == "Phòng bệnh") && ca.NgayTruc.Date == dtpngayYC.Date
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
        public IQueryable LayNhanVienTheoPhanCongVaPhong(DateTime dtpNgayTH, DateTime dtpThoiGianTH, string maPhong)
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
                     where ca.Ca.Trim().ToLower() == caTruc.Trim().ToLower() && p.MSPhong == maPhong && (p.Loai == "Phòng chức năng" || p.Loai == "Phòng bệnh") && ca.NgayTruc.Date == dtpNgayTH.Date
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

        //Lấy danh sách sử dụng dịch vụ theo ngày
        public IQueryable HienThiDSSuDungDVTheoNgay(DateTime ngayKham)
        {
            IQueryable ds = from sd in db.SuDungDichVus
                            join pkb in db.PhieuKhamBenhs
                            on sd.MaPhieuKB equals pkb.MaPhieuKB
                            join dv in db.DichVus
                            on sd.MaDV equals dv.MaDV
                            where sd.NgayYeuCau.Date == ngayKham.Date
                            orderby sd.MaSuDungDV descending
                            select new { sd.MaNV, sd.MaSuDungDV, sd.MaPhieuKB, sd.MaDV, sd.NgayThucHien, sd.NgayYeuCau, sd.MSPhong, sd.MaNVThucHien, sd.KetQua, dv.MaKhoa };
            return ds;
        }

        //Hiển thị danh sách dịch vụ theo khoa
        public IQueryable HienThiDSDVTheoKhoa(string maKhoa)
        {
            IQueryable ds = from dl in db.DichVus
                            join k in db.Khoas
                            on dl.MaKhoa equals k.MaKhoa
                            where k.MaKhoa == maKhoa
                            select new { dl.MaDV, HienThi = dl.MaDV + "-" + dl.TenDV };
            return ds;
        }

        //Kiểm tra xem lần sử dụng dịch đó có nhân viên thực hiện chưa
        public bool KiemTraXemThucHienDVChua(string maSuDungDV, string maNVThucHien)
        {
            return db.SuDungDichVus.Any(sddv => sddv.MaSuDungDV == maSuDungDV && sddv.MaNVThucHien == maNVThucHien);
        }
        //Kiểm tra ngày thực hiện có lớn hơn bằng ngày yêu cầu
        public bool KiemTraXemNgayThucHienCoLonHonBangNgayYeuCau(DateTime ngayYeuCau, DateTime ngayThucHien)
        {
            return ngayThucHien.Date >= ngayYeuCau.Date;
        }
        public bool KiemTraXemTGThucHienCoLonHonTGYeuCau(DateTime TGYeuCau, DateTime TGThucHien)
        {
            return TGThucHien.TimeOfDay > TGYeuCau.TimeOfDay;
        }
        //public bool KiemTraXemTGThucHienCoLonHonTGYeuCau(DateTime TGYeuCau, DateTime TGThucHien)
        //{
        //    return TGThucHien > TGYeuCau;
        //}

        //Thêm thông tin sử dụng dịch vụ
        public bool ThemThongTinSuDungDV(ET_SuDungDV etSuDungDV)
        {
            if (db.SuDungDichVus.Any(sddv => /*sddv.MaSuDungDV != etSuDungDV.MaSuDungDV &&*/ sddv.MaDV == etSuDungDV.MaDV && sddv.MaPhieuKB == etSuDungDV.MaPhieuKB))
            {
                return false;
            }
            else
            {
                try
                {
                    SuDungDichVu sddv = new SuDungDichVu
                    {
                        MaNV = etSuDungDV.MaNV,
                        MaSuDungDV = etSuDungDV.MaSuDungDV,
                        MaPhieuKB = etSuDungDV.MaPhieuKB,
                        MaDV = etSuDungDV.MaDV,
                        NgayThucHien = null,
                        NgayYeuCau = etSuDungDV.NgayYeuCau,
                        MSPhong = null,
                        MaNVThucHien = null,
                        KetQua = null
                    };
                    db.SuDungDichVus.InsertOnSubmit(sddv);
                }
                finally
                {
                    db.SubmitChanges();
                }
                return true;
            }
        }

        // Sửa thông tin sử dụng dịch vụ
        public bool SuaThongTinSuDungDV(ET_SuDungDV etSuDungDV)
        {
            var capNhat = db.SuDungDichVus.SingleOrDefault(p => p.MaSuDungDV == etSuDungDV.MaSuDungDV && p.MaPhieuKB == etSuDungDV.MaPhieuKB);
            if (capNhat != null)
            {
                if (db.SuDungDichVus.Any(sddv => sddv.MaSuDungDV != etSuDungDV.MaSuDungDV && sddv.MaDV == etSuDungDV.MaDV && sddv.MaPhieuKB == etSuDungDV.MaPhieuKB))
                {
                    return false;
                }

                else
                {
                    try
                    {
                        capNhat.MaNV = etSuDungDV.MaNV;
                        capNhat.MaDV = etSuDungDV.MaDV;
                        if (etSuDungDV.NgayThucHien.HasValue)
                        {
                            capNhat.NgayThucHien = etSuDungDV.NgayThucHien;
                        }
                        capNhat.NgayYeuCau = etSuDungDV.NgayYeuCau;
                        capNhat.MSPhong = etSuDungDV.MsPhong;
                        capNhat.MaNVThucHien = etSuDungDV.MaNVThucHien;
                        capNhat.KetQua = etSuDungDV.KetQua;
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
        //Xóa thông tin sử dụng dịch vụ
        public bool XoaTTSuDungDV(string maSuDungDV)
        {
            try
            {
                var xoa = from p in db.SuDungDichVus
                          where p.MaSuDungDV == maSuDungDV
                          select p;
                foreach (var i in xoa)
                {
                    db.SuDungDichVus.DeleteOnSubmit(i);
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

        //Tính tổng tiền sử dụng dịch vụ của từng PKB
        public float TinhTienSuDungDV(string maPKB)
        {
            var benhNhan = (from pk in db.PhieuKhamBenhs
                            join bn in db.BenhNhans
                            on pk.MaBN equals bn.MSBN
                            join bhyt in db.BHYTs
                            on bn.MSBN equals bhyt.MSBN
                            where pk.MaPhieuKB == maPKB
                            select bhyt.MaSoBHYT).FirstOrDefault();
            // Tính tổng tiền sử dụng dịch vụ cho phiếu khám bệnh với mã tương ứng
            var tongTien = (from sd in db.SuDungDichVus
                            join dv in db.DichVus on sd.MaDV equals dv.MaDV
                            where sd.MaPhieuKB == maPKB
                            select dv.Gia).ToList(); // Chuyển sang danh sách
            float tongTienDichVu = tongTien.Any() ? (float)tongTien.Sum(gia => gia ?? 0) : 0;
            if (benhNhan != null)
            {
                tongTienDichVu *= 0.8f; // Giảm 20%
            }
            return tongTienDichVu;
        }
        //Lấy danh sách khoa trừ K18 vào combobox
        public IQueryable LayDSKhoaLoadVaoCombobox()
        {
            IQueryable ds = from dl in db.Khoas
                            where dl.MaKhoa != "K18"
                            select new { dl.MaKhoa, HienThi = dl.MaKhoa + "-" + dl.TenKhoa };
            return ds;
        }

        //Lấy ngày yêu cầu sử dụng dịch vụ của PKB
        public DateTime LayNgayKhamCuaPKB(string maPKB)
        {
            DateTime ngayKham = (from dl in db.PhieuKhamBenhs
                                 where dl.MaPhieuKB == maPKB
                                 select dl.NgayKham.Value).FirstOrDefault();
            // Kiểm tra nếu giờ là 23:59:59
            if (ngayKham.TimeOfDay == new TimeSpan(23, 59, 59))
            {
                // Cộng thêm 1 ngày
                ngayKham = ngayKham.AddDays(1);
            }
            return ngayKham;
        }

        //Tìm kiếm danh sách sử dụng dịch vụ theo tên bệnh nhân, tên dịch vụ theo ngày
        public IQueryable TimKiemSDDVTheoTen(string tenBN, DateTime dtp)
        {
            IQueryable ds = from sd in db.SuDungDichVus
                            join kb in db.PhieuKhamBenhs
                            on sd.MaPhieuKB equals kb.MaPhieuKB
                            join bn in db.BenhNhans
                            on kb.MaBN equals bn.MSBN
                            join dv in db.DichVus
                            on sd.MaDV equals dv.MaDV
                            where (bn.TenBN.Contains(tenBN) || dv.TenDV.Contains(tenBN)) && sd.NgayYeuCau.Date == dtp.Date
                            select new { sd.MaNV, sd.MaSuDungDV, sd.MaPhieuKB, sd.MaDV, sd.NgayThucHien, sd.NgayYeuCau, sd.MSPhong, sd.MaNVThucHien, sd.KetQua, dv.MaKhoa };
            return ds;
        }
        //Kiểm tra xem có phải tên dịch vụ chứa chữ phẫu thuật
        public bool KiemTraXemPhaiDVPT(string maDV)
        {
            string loaiPT = (from dl in db.DichVus
                             where dl.MaDV == maDV
                             select dl.TenDV).FirstOrDefault();
            if (loaiPT.Contains("Phẫu thuật") || loaiPT.Contains("Phẫu Thuật"))
            {
                return true;
            }
            return false;
        }
    }
}
