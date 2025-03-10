using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_PhanGiuong
    {
        private static DAL_PhanGiuong instance;
        QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

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
            IQueryable phanGiuong = (from pg in db.PhanGiuongs
                                     join pkb in db.PhieuKhamBenhs
                                     on pg.MaPhieuKB equals pkb.MaPhieuKB
                                     join p in db.Phongs
                                     on pg.MaPhong equals p.MSPhong
                                     join k in db.Khoas
                                     on p.MaKhoa equals k.MaKhoa
                                     join bn in db.BenhNhans
                                     on pkb.MaBN equals bn.MSBN
                                     join cn in db.ChuyenNganhs
                                     on k.MaKhoa equals cn.MaKhoa
                                     join nv in db.NhanViens
                                     on cn.MaChuyenNganh equals nv.MaChuyenNganh
                                     where pg.NgayNhan.Date == ngayNhan.Date
                                     select new { bn.MSBN, pg.MaPhieuKB, pg.MaPhong, pg.MaGiuong, p.MaKhoa, pg.NgayNhan, pg.NgayTra, pg.GhiChu, MaNVTH = pg.MaNVYeuCau }).Distinct();
            return phanGiuong;
        }

        //Lấy tên khoa theo mã khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            var khoa = (from k in db.Khoas
                        where k.MaKhoa == maKhoa
                        select k.TenKhoa).FirstOrDefault();
            return khoa;
        }

        //Lấy tên phòng theo mã phòng
        public string HienThiTenPhong(string maPhong)
        {
            var phong = (from p in db.Phongs
                         where p.MSPhong == maPhong
                         select p.TenPhong).FirstOrDefault();
            return phong;
        }

        //Lấy tên nhân viên theo mã nhân viên
        public string HienThiTenNV(string maNV)
        {
            var nhanVien = (from nv in db.NhanViens
                            where nv.MaNV == maNV
                            select nv.TenNV).FirstOrDefault();
            return nhanVien;
        }

        //Lấy tên bênh nhân theo mã bệnh nhân
        public string HienThiTenBN(string maBN)
        {
            var benhNhan = (from bn in db.BenhNhans
                            where bn.MSBN == maBN
                            select bn.TenBN).FirstOrDefault();
            return benhNhan;
        }


        //Lấy mã giường theo mã phòng
        public IQueryable HienThiGiuong(string maPhong)
        {
            IQueryable giuongBenh = from gb in db.GiuongBenhs
                                    where gb.MSPhong == maPhong.Split('-')[0] && gb.TrangThai == "Bình Thường"
                                    select gb;
            return giuongBenh;
        }

        //Kiem tra giuong
        public bool KiemTraTrangThaiGiuong(string maGiuong, DateTime ngayNhanGiuong, DateTime? ngayTraGiuong, string maPhieuKB = null)
        {
            // Giới hạn ngày tối đa thay cho DateTime.MaxValue
            var ngayTraMacDinh = new DateTime(9999, 12, 31);

            // Lấy ngày trả giường mặc định nếu null
            var ngayTraMoi = ngayTraGiuong ?? ngayTraMacDinh;

            // Kiểm tra xung đột
            var conflicts = db.PhanGiuongs.Any(g =>
                g.MaGiuong == maGiuong &&  // Đúng giường
                (string.IsNullOrEmpty(maPhieuKB) || g.MaPhieuKB != maPhieuKB) &&  // Không phải bản ghi hiện tại
                (
                    // Điều kiện xung đột
                    (ngayNhanGiuong >= g.NgayNhan && ngayNhanGiuong < g.NgayTra.GetValueOrDefault(ngayTraMacDinh)) || // nhận giường nằm trong khoảng
                    (ngayTraMoi > g.NgayNhan && ngayTraMoi <= g.NgayTra.GetValueOrDefault(ngayTraMacDinh)) || // trả giường nằm trong khoảng
                    (ngayNhanGiuong <= g.NgayNhan && ngayTraMoi >= g.NgayTra.GetValueOrDefault(ngayTraMacDinh)) // khoảng mới bao phủ khoảng cũ
                )
            );

            return !conflicts; // Không có xung đột
        }


        //Kiểm tra phiếu khám bệnh phải có
        public bool KiemTraHoanThienTraGiuong(string maPhieuKB)
        {
            // Kiểm tra nếu có giường nào với mã phiếu khám bệnh này chưa được trả
            bool chuaTraGiuong = db.PhanGiuongs.Any(dl => dl.MaPhieuKB == maPhieuKB && dl.NgayTra == null);

            // Nếu có giường chưa trả, trả về false, ngược lại trả về true
            return !chuaTraGiuong;
        }
        //Đếm số lần phân giường
        public int DemSoLanPhanGiuong(string maPhieuKB)
        {
            int sl = (from dl in db.PhanGiuongs
                      where dl.MaPhieuKB == maPhieuKB
                      select dl).Count();
            return sl;
        }
        public DateTime NgayTraGiuongMoiNhat(string maPhieuKB)
        {
            var mostRecentBed = db.PhanGiuongs
                                .Where(pg => pg.MaPhieuKB == maPhieuKB) // Filter by MaPhieuKB
                                .OrderByDescending(pg => pg.NgayNhan)  // Order by the most recent NgayNhan
                                .ThenByDescending(pg => pg.NgayTra)   // Then order by the most recent NgayTra (discharge date)
                                .FirstOrDefault();  // Take the first (most recent) record
                                                    // If no record found, return a default value (e.g., DateTime.MinValue)
            if (mostRecentBed != null && mostRecentBed.NgayTra.HasValue)
            {
                return mostRecentBed.NgayTra.Value;  // Return the most recent discharge date
            }
            else
            {
                return DateTime.MinValue;  // Return a default value if no discharge date exists
            }
        }
        //Thêm phân giường 
        public bool ThemPhanGiuong(ET_PhanGiuong et_phangiuong)
        {
            try
            {
                // Step 1: Count the number of bed assignments for the given MaPhieuKB
                int bedCount = DemSoLanPhanGiuong(et_phangiuong.MaPhieuKB);

                // Step 2: If there's at least one bed assignment, retrieve the most recent discharge date (NgayTra)
                DateTime? recentDischargeDate = null;
                if (bedCount >= 1)
                {
                    recentDischargeDate = NgayTraGiuongMoiNhat(et_phangiuong.MaPhieuKB);
                }

                // Step 3: If a discharge date exists, use it to set the admission date of the new bed (add 1 minute to avoid conflict)
                DateTime ngayNhanGiuong = DateTime.Now; // Default to the current date/time

                if (recentDischargeDate.HasValue)
                {
                    // Use the discharge date as the admission date for the new bed (add 1 minute)
                    ngayNhanGiuong = recentDischargeDate.Value.AddMinutes(1);
                }

                // Step 4: Add the new bed record with the determined admission date (NgayNhan)
                PhanGiuong phanGiuongMoi = new PhanGiuong
                {
                    MaGiuong = et_phangiuong.MaGiuong,
                    MaPhieuKB = et_phangiuong.MaPhieuKB,
                    NgayNhan = ngayNhanGiuong,
                    MaPhong = et_phangiuong.MaPhong,
                    MaNVYeuCau = et_phangiuong.MaNVYC,
                    GhiChu = et_phangiuong.GhiChu
                };

                // Insert the new bed assignment into the database
                db.PhanGiuongs.InsertOnSubmit(phanGiuongMoi);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        //Sửa phân giường
        public bool SuaPhanGiuong(ET_PhanGiuong et_phangiuong)
        {
            // Tìm đối tượng PhanGiuong hiện tại dựa trên MaPhieuKB
            PhanGiuong capNhat = db.PhanGiuongs.SingleOrDefault(gb => gb.MaPhieuKB == et_phangiuong.MaPhieuKB && gb.MaPhong == et_phangiuong.MaPhong && gb.MaGiuong == et_phangiuong.MaGiuong && gb.NgayNhan.Date == et_phangiuong.NgayNhan.Date);

            if (capNhat != null)
            {

                try
                {
                    capNhat.NgayTra = et_phangiuong.NgayTra;
                    capNhat.GhiChu = et_phangiuong.GhiChu;
                    // Thêm đối tượng mới vào cơ sở dữ liệu
                    db.SubmitChanges();

                    return true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi" + ex.Message);
                    //return false;
                }
            }
            return false;
        }
        public bool KiemTraCoPhanGiuongMoiKhong(string maPhieuKB, string maGiuong, DateTime ngayNhan)
        {
            try
            {
                // Tìm phân giường hiện tại theo MaPhieuKB, MaGiuong và NgayNhan
                var phanGiuongCu = db.PhanGiuongs.SingleOrDefault(gb => gb.MaPhieuKB == maPhieuKB
                                                                      && gb.MaGiuong == maGiuong
                                                                      && gb.NgayNhan.Date == ngayNhan.Date);

                if (phanGiuongCu != null)
                {
                    // Kiểm tra có phân giường nào có ngày nhận sau ngày trả giường hiện tại ở bất kỳ phòng nào
                    var giuongMoi = db.PhanGiuongs
                                       .Any(gb => gb.MaPhieuKB == maPhieuKB
                                                 && gb.NgayNhan > phanGiuongCu.NgayTra); // Kiểm tra tất cả các giường sau ngày trả giường hiện tại ở bất kỳ phòng nào

                    // Nếu có phân giường mới thì trả về true, nếu không thì trả về false
                    return giuongMoi;
                }
                else
                {
                    // Không tìm thấy phân giường cũ, trả về false
                    return false;
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                MessageBox.Show("Lỗi: " + ex.Message);
                return false;
            }
        }


        //Tìm kiếm theo tên bệnh nhân, tên phòng theo ngày
        public IQueryable TimKiemTheoTen(string tenBN)
        {
            IQueryable ds = (from pg in db.PhanGiuongs
                            join pkb in db.PhieuKhamBenhs
                            on pg.MaPhieuKB equals pkb.MaPhieuKB
                            join p in db.Phongs
                            on pg.MaPhong equals p.MSPhong
                            join k in db.Khoas
                            on p.MaKhoa equals k.MaKhoa
                            join bn in db.BenhNhans
                            on pkb.MaBN equals bn.MSBN
                            join cn in db.ChuyenNganhs
                            on k.MaKhoa equals cn.MaKhoa
                            join nv in db.NhanViens
                            on cn.MaChuyenNganh equals nv.MaChuyenNganh
                            where (bn.TenBN.Contains(tenBN) || p.TenPhong.Contains(tenBN))
                            select new { bn.MSBN, pg.MaPhieuKB, pg.MaPhong, pg.MaGiuong, p.MaKhoa, pg.NgayNhan, pg.NgayTra, pg.GhiChu, MaNVTH = pg.MaNVYeuCau }).Distinct();
            return ds;
        }

    }

}

