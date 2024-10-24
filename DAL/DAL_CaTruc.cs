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
                                orderby ct.NgayTruc descending
                                select new { ct.MaCT, ct.MaPhong, ct.MaNV, ct.Ca, ct.NgayTruc, phong.MaKhoa };
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
        public string TaoMaTuDong()
        {
            // Lấy tất cả các mã bệnh nhân hiện tại
            var dscaTruc = db.CaTrucs.Select(n => n.MaCT).ToList();

            // Nếu danh sách trống, bắt đầu từ 1
            int maCTLonNhat = 0;
            if (dscaTruc.Count > 0)
            {
                // Tìm mã lớn nhất dựa trên phần số sau chữ "BN"
                maCTLonNhat = dscaTruc.Select(maCT => int.Parse(maCT.Substring(2))).Max();
            }

            // Tạo mã mới với số lớn hơn mã lớn nhất
            int maCTHientai = maCTLonNhat + 1;
            string maCTMoi = "CT" + maCTHientai.ToString("D3"); // đảm bảo ít nhất 3 chữ số
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
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message);
                return false;
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
                    bool isDuplicate = db.CaTrucs.Any(c =>
                        c.MaNV == eT_CaTruc.MaNV &&  // Cùng nhân viên
                        c.NgayTruc == eT_CaTruc.NgayTruc &&  // Cùng ngày
                        c.Ca == eT_CaTruc.Ca && // Cùng ca
                        c.MaCT != eT_CaTruc.MaCT); // Bỏ qua chính ca trực hiện tại

                    if (isDuplicate)
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
                    MessageBox.Show("Lỗi " + ex.Message);
                    return false;
                }
            }
            return false;
        }

        //Kiểm tra có tồn tại nhân viên không
        public bool KiemTraTonTai(string maNV)
        {
            //ktra trung ma
            if (db.NhanViens.Any(e => e.MaNV == maNV))
            {
                return true;
            }
            return false;
        }

        //Tìm ca trực của nhân viên
        public IQueryable TimNhanVien(string key)
        {
            IQueryable nhanVien = from nv in db.CaTrucs
                                  where nv.MaNV == key
                                  select nv;
            return nhanVien;
        }
    }
}
