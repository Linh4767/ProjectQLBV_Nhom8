using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_CaTruc
    {
        private static DAL_CaTruc instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_CaTruc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_CaTruc();
                }
                return instance;
            }
        }

        public DAL_CaTruc() { }

        //lấy danh sách ca trực
        public IQueryable LayDanhSachCaTruc()
        {
            IQueryable caTruc = from ct in db.CaTrucs
                                join phong in db.Phongs
                                on ct.MaPhong equals phong.MSPhong
                                join nv in db.NhanViens
                                on ct.MaNV equals nv.MaNV
                                orderby ct.NgayTruc descending
                                select new { ct.MaCT, ct.MaPhong, phong.TenPhong, ct.MaNV, nv.TenNV, ct.Ca, ct.NgayTruc, phong.MaKhoa };
            return caTruc;
        }
        //Lấy khoa
        public Khoa LayKhoa(string maKhoa)
        {
            var khoa = db.Khoas.SingleOrDefault(kh => kh.MaKhoa == maKhoa);
            return khoa;
        }

        //Lấy danh sách khoa
        public IQueryable LayDanhSachKhoa()
        {
            IQueryable khoa = from kh in db.Khoas
                              select kh;
            return khoa;
        }

        //lấy danh sách phòng theo khoa
        public IQueryable LayDanhSachPhong(string maKhoa)
        {
            IQueryable dsPK = from phong in db.Phongs
                              where phong.MaKhoa == maKhoa
                              select phong;
            return dsPK;
        }

        //Lấy danh sách nhân viên theo khoa
        public IQueryable LayDanhSachNhanVien(string maKhoa)
        {
            IQueryable dsNV = from nv in db.NhanViens
                              join cn in db.ChuyenNganhs
                              on nv.MaChuyenNganh equals cn.MaChuyenNganh
                              where cn.MaKhoa == maKhoa && nv.MaCV != "CV5"
                              select new { nv.MaNV, HienThi = nv.MaNV +"-"+nv.TenNV };
            return dsNV;
        }

        //Tạo mã tự động
        public string TaoMaTuDong(string caTruc)
        {
            // Lấy tất cả mã ca trực hiện tại dựa trên ca làm việc
            var tienTo = "CA";
            string maCa;

            // Xác định mã ca dựa trên thời gian ca trực
            switch (caTruc)
            {
                case "6h-14h":
                    maCa = "01";
                    break;
                case "14h-22h":
                    maCa = "02";
                    break;
                case "22h-6h":
                    maCa = "03";
                    break;
                default:
                    throw new ArgumentException("Ca trực không hợp lệ.");
            }

            // Xác định mã bắt đầu cho ca trực hiện tại
            string tienToCa = tienTo + maCa;

            // Lọc các mã có tiền tố mong muốn
            var dscaTruc = db.CaTrucs.Where(n => n.MaCT.StartsWith(tienToCa)).Select(n => n.MaCT).ToList();

            // Tìm mã lớn nhất trong danh sách
            int maLonNhat = 0;
            if (dscaTruc.Count > 0)
            {
                maLonNhat = dscaTruc.Select(maCT => int.Parse(maCT.Substring(tienToCa.Length + 2))).Max();
            }

            // Tạo mã mới với số tăng dần
            int maHienTai = maLonNhat + 1;
            string maCTMoi = tienToCa + "CT" + maHienTai.ToString("D3"); // đảm bảo ít nhất 3 chữ số
            return maCTMoi;
        }

        //Thêm ca trực mới
        public bool ThemCaTruc(ET_CaTruc eT_CaTruc)
        {
            //Kiểm tra trùng
            if (db.CaTrucs.Any(e => e.MaPhong == eT_CaTruc.MaPhong && e.MaNV == eT_CaTruc.MaNV
            && e.Ca == eT_CaTruc.Ca && e.NgayTruc.Date == eT_CaTruc.NgayTruc.Date))
            {
                return false;
            }
            try
            {
                CaTruc caTruc = new CaTruc
                {
                    MaCT = eT_CaTruc.MaCT,
                    MaPhong = eT_CaTruc.MaPhong,
                    MaNV = eT_CaTruc.MaNV,
                    Ca = eT_CaTruc.Ca,
                    NgayTruc = eT_CaTruc.NgayTruc
                };
                db.CaTrucs.InsertOnSubmit(caTruc);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Sửa thông tin ca trực
        public bool CapNhatNhatCaTruc(ET_CaTruc eT_CaTruc)
        {
            CaTruc caTruc = db.CaTrucs.SingleOrDefault(e => e.MaCT == eT_CaTruc.MaCT);
            //ktra trung ma
            if (caTruc != null)
            {
                try
                {
                    // Kiểm tra trùng lịch
                    bool trungLap = db.CaTrucs.Any(c =>
                        c.MaNV == eT_CaTruc.MaNV &&  // Cùng nhân viên
                        c.NgayTruc == eT_CaTruc.NgayTruc &&  // Cùng ngày
                        c.Ca == eT_CaTruc.Ca && // Cùng ca
                        c.MaCT != eT_CaTruc.MaCT); // Bỏ qua chính ca trực hiện tại

                    if (trungLap)
                    {
                        MessageBox.Show("Lịch trực bị trùng với ca trực khác của nhân viên!");
                        return false;
                    }

                    // Nếu không trùng, cập nhật ca trực
                    caTruc.Ca = eT_CaTruc.Ca;
                    caTruc.NgayTruc = eT_CaTruc.NgayTruc;

                    // Lưu thay đổi vào database
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

        //Kiểm tra có tồn tại nhân viên không
        public bool KiemTraTonTai(string key)
        {
            if (db.NhanViens.Any(e => e.MaNV == key || e.TenNV.Contains(key)))
            {
                return true;
            }
            return false;
        }

        //Tìm nhân viên
        public IQueryable TimNhanVien(string key)
        {
            IQueryable nhanVien = from ca in db.CaTrucs
                                  join nv in db.NhanViens
                                  on ca.MaNV equals nv.MaNV
                                  join phong in db.Phongs
                                  on ca.MaPhong equals phong.MSPhong
                                  where nv.MaNV == key || nv.TenNV.Contains(key)
                                  orderby ca.NgayTruc descending
                                  select new { ca.MaCT, ca.MaPhong, phong.TenPhong, ca.MaNV, nv.TenNV, ca.Ca, ca.NgayTruc, phong.MaKhoa };
            return nhanVien;
        }
    }
}
