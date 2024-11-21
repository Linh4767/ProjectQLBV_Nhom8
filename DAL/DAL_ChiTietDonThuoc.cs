using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_ChiTietDonThuoc
    {
        private static DAL_ChiTietDonThuoc instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_ChiTietDonThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_ChiTietDonThuoc();
                }
                return instance;
            }
        }

        public DAL_ChiTietDonThuoc() { }

        //Lấy lô thuốc cho cbo
        public IQueryable LayLoDuaVaoMaThuoc(string maThuoc, string maKhoa)
        {
            IQueryable ds = from dl in db.ThuocTheoKhoas
                            where dl.MaThuoc == maThuoc && dl.MaKhoa == maKhoa
                            select new { dl.MaLo };
            return ds;
        }

        public double TinhTienTheoVien(string maLo)
        {
            var thuoc = (from dl in db.Thuocs
                         where dl.MaLo == maLo
                         select new
                         {
                             dl.SoLuongHop,
                             dl.SoLuongDVT,
                             dl.SoLuongQCDG,
                             dl.SoLuongNhap,
                             dl.Gia
                         }).FirstOrDefault();

            if (thuoc == null || thuoc.SoLuongHop <= 0 || thuoc.SoLuongDVT <= 0 || thuoc.Gia <= 0 || thuoc.SoLuongNhap <= 0)
            {
                throw new Exception("Dữ liệu thuốc không hợp lệ.");
            }

            int soLuongVien = (int)(thuoc.SoLuongHop * thuoc.SoLuongDVT * (thuoc.SoLuongQCDG ?? 1));
            double giaNhapVien = (double)(thuoc.Gia / (thuoc.SoLuongNhap * soLuongVien));

            double giaBanLe = giaNhapVien + (giaNhapVien * 0.05); // Phụ phí 5%
            return Math.Round(giaBanLe, 2); // Làm tròn 2 chữ số thập phân
        }

        //Tính tổng tiền đơn thuốc
        public double TongTienThuoc(string maDT)
        {
            //lấy danh sách thuốc của đơn thuốc
            var dsThuoc = from ct in db.ChiTietDonThuocs
                          join th in db.Thuocs
                          on ct.MaThuoc equals th.MaThuoc
                          where ct.MaDonThuoc == maDT
                          select new { ct.MaLo, ct.SoLuong };

            double tong = 0;
            foreach (var thuoc in dsThuoc)
            {
                tong += (double)(TinhTienTheoVien(thuoc.MaLo) * thuoc.SoLuong);
            }

            return Math.Round(tong, 2); //làm tròn 2 chữ số thập phân
        }

        //Số lượng viên thuốc 
        public int SoLuongThuoc(string maThuoc, string maLo, string maKhoa)
        {
            int soVien = (from th in db.ThuocTheoKhoas
                          join t in db.Thuocs
                          on th.MaThuoc equals t.MaThuoc
                          where th.MaThuoc == maThuoc && th.MaLo == maLo && th.MaKhoa == maKhoa
                          select th.SoLuongThuocCuaKhoa * t.SoLuongDVT * (t.SoLuongQCDG ?? 1)).FirstOrDefault() ?? 0;
            return soVien;
        }

        //Kiểm tra số lượng khi kê đơn
        public bool KtraSoLuong(string maThuoc, string maKhoa, string maLo, int soLuongKe)
        {
            var thuocKhoa = db.ThuocTheoKhoas.FirstOrDefault(e => e.MaThuoc == maThuoc && e.MaLo == maLo && e.MaKhoa == maKhoa);
            int soVienKe = soLuongKe;
            int soVienTrongKhoKhoa = SoLuongThuoc(thuocKhoa.MaThuoc, thuocKhoa.MaLo, thuocKhoa.MaKhoa);
            if (soVienKe > soVienTrongKhoKhoa) return false;
            return true;
        }

        //Thêm chi tiết đơn thuốc
        public bool ThemChiTietDonThuoc(ET_ChiTietDonThuoc eT_ChiTietDonThuoc, string maKhoa, int soLuong)
        {
            // Lấy thông tin thuốc từ khoa            
            var thuocKhoa = db.ThuocTheoKhoas.FirstOrDefault(e => e.MaThuoc == eT_ChiTietDonThuoc.MaThuoc && e.MaLo == eT_ChiTietDonThuoc.MaLo && e.MaKhoa == maKhoa);
            var thuoc = db.Thuocs.FirstOrDefault(e => e.MaThuoc == eT_ChiTietDonThuoc.MaThuoc && e.MaLo == eT_ChiTietDonThuoc.MaLo);

            if (thuocKhoa == null)
            {
                MessageBox.Show("Thuốc hoặc lô thuốc không tồn tại trong kho của khoa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            //Kiểm tra trùng
            if (db.ChiTietDonThuocs.Any(e => e.MaThuoc == eT_ChiTietDonThuoc.MaThuoc && e.MaDonThuoc == eT_ChiTietDonThuoc.MaDT && e.MaLo == eT_ChiTietDonThuoc.MaLo))
            {
                return false;
            }
            try
            {
                int soVienKe = soLuong;
                int soVienTrongHop = (int)(thuoc.SoLuongDVT * (thuoc.SoLuongQCDG ?? 1)); //số viên trong hộp

                // Tính số hộp cần trừ, làm tròn lên
                // int soHopTru = (int)Math.Ceiling((double)soVienKe / soVienTrongHop);

                int soHopTru = soVienKe / soVienTrongHop;
                thuocKhoa.SoLuongThuocCuaKhoa -= soHopTru;

                ChiTietDonThuoc chiTietDon = new ChiTietDonThuoc
                {
                    MaDonThuoc = eT_ChiTietDonThuoc.MaDT,
                    MaThuoc = eT_ChiTietDonThuoc.MaThuoc,
                    MaLo = eT_ChiTietDonThuoc.MaLo,
                    SoLuong = soVienKe,
                    CachDung = eT_ChiTietDonThuoc.CachDung
                };
                db.ChiTietDonThuocs.InsertOnSubmit(chiTietDon);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi thêm thuốc vào đơn: " + ex.Message, ex);
            }
        }

        //Xóa thuốc khỏi đơn
        public bool XoaThuoc(string maDT, string maThuoc, string maLo, string maKhoa)
        {
            try
            {
                var xoaThuoc = db.ChiTietDonThuocs.FirstOrDefault(ct => ct.MaDonThuoc == maDT && ct.MaThuoc == maThuoc && ct.MaLo == maLo);
                var thuocKhoa = db.ThuocTheoKhoas.FirstOrDefault(e => e.MaThuoc == maThuoc && e.MaLo == maLo && e.MaKhoa == maKhoa);
                var thuoc = db.Thuocs.FirstOrDefault(e => e.MaThuoc == maThuoc && e.MaLo == maLo);

                int soLuong = xoaThuoc.SoLuong.Value;
                int soVienTrongHop = (int)(thuoc.SoLuongDVT * (thuoc.SoLuongQCDG ?? 1)); //số viên trong hộp

                // Tính số hộp 
                int soHopTra = soLuong / soVienTrongHop;
                thuocKhoa.SoLuongThuocCuaKhoa += soHopTra;


                db.ChiTietDonThuocs.DeleteOnSubmit(xoaThuoc);
                db.SubmitChanges();

                return true;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                if (ex.Number == 547)
                {
                    return false;
                }
            }
            return false;
        }

        //Cập nhật đơn thuốc
        public bool CapNhatDonThuoc(ET_ChiTietDonThuoc eT_ChiTietDon, int soLuongMoi, string maKhoa)
        {
            var chiTietDon = db.ChiTietDonThuocs.SingleOrDefault(e => e.MaDonThuoc == eT_ChiTietDon.MaDT && e.MaThuoc == eT_ChiTietDon.MaThuoc && e.MaLo == eT_ChiTietDon.MaLo);
            if (chiTietDon != null)
            {
                try
                {
                    var thuocKhoa = db.ThuocTheoKhoas.FirstOrDefault(e => e.MaThuoc == eT_ChiTietDon.MaThuoc && e.MaLo == eT_ChiTietDon.MaLo && e.MaKhoa == maKhoa);
                    var thuoc = db.Thuocs.FirstOrDefault(e => e.MaThuoc == eT_ChiTietDon.MaThuoc && e.MaLo == eT_ChiTietDon.MaLo);

                    // Lấy số lượng thuốc cũ và số viên trong một hộp
                    int soLuongCu = (int)chiTietDon.SoLuong;
                    int soVienTrongHop = (int)(thuoc.SoLuongDVT * (thuoc.SoLuongQCDG ?? 1)); // Số viên trong một hộp

                    // Tính số lượng hộp cần điều chỉnh
                    int soHopCu = soLuongCu / soVienTrongHop;
                    int soHopMoi = soLuongMoi / soVienTrongHop;
                    int chenhLechHop = soHopMoi - soHopCu;

                    // Cập nhật kho
                    thuocKhoa.SoLuongThuocCuaKhoa -= chenhLechHop;

                    chiTietDon.SoLuong = soLuongMoi;
                    chiTietDon.CachDung = eT_ChiTietDon.CachDung;

                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi cập nhật thuốc trong đơn: " + ex.Message, ex);
                }
            }
            return false;
        }

        //Lấy thông tin thuốc của đơn thuốc
        public IQueryable LayDSThuocCuaDonThuoc(string maDT)
        {
            IQueryable dsThuoc = from ct in db.ChiTietDonThuocs
                                 join th in db.Thuocs
                                 on ct.MaThuoc equals th.MaThuoc
                                 where ct.MaDonThuoc == maDT
                                 select new { ct.MaThuoc, th.TenThuoc, ct.MaLo, ct.SoLuong, th.LoaiThuoc, ct.CachDung, th.HamLuong };
            return dsThuoc;
        }


        //Lấy dữ liệu gợi ý thông tin thuốc
        public IQueryable LayDSThuocGoiY(string tenThuoc, string maKhoa)
        {
            IQueryable thongTin = from tk in db.ThuocTheoKhoas
                                  join th in db.Thuocs
                                  on tk.MaThuoc equals th.MaThuoc
                                  where tk.MaKhoa == maKhoa && th.TenThuoc.Contains(tenThuoc) && th.LoaiThuoc != "Tiêm"
                                  select new { th.MaThuoc, th.TenThuoc, th.LoaiThuoc, th.HamLuong, th.NhaCungCap };
            return thongTin;
        }

        //Lấy tên bệnh nhân theo phiếu khám bệnh
        public string LayTenBN(string maPKB)
        {
            string tenBN = (from pkb in db.PhieuKhamBenhs
                            join bn in db.BenhNhans
                            on pkb.MaBN equals bn.MSBN
                            where pkb.MaPhieuKB == maPKB
                            select bn.TenBN).FirstOrDefault();
            return tenBN;
        }

        //Lấy khoa theo từ nhân viên
        public string LayKhoaTuNV(string maNV)
        {
            var khoa = (from nv in db.NhanViens
                        join cn in db.ChuyenNganhs
                        on nv.MaChuyenNganh equals cn.MaChuyenNganh
                        join kh in db.Khoas
                        on cn.MaKhoa equals kh.MaKhoa
                        where nv.MaNV == maNV
                        select kh.MaKhoa).FirstOrDefault();
            return khoa;
        }

        //lấy tên nhân viên
        public string LayTenNhanVien(string maNV)
        {
            var nhanVien = (from nv in db.NhanViens
                            where nv.MaNV == maNV
                            select nv.TenNV).FirstOrDefault();
            return nhanVien;
        }
    }
}
