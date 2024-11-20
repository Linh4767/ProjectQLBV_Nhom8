using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_ThuocTheoKhoa
    {
        private static DAL_ThuocTheoKhoa instance;
        private QLBVDataContext db = new QLBVDataContext();

        public static DAL_ThuocTheoKhoa Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_ThuocTheoKhoa();
                }
                return instance;
            }
        }

        public IQueryable XemDSThuocTheoKhoa(string maKhoa)
        {
            IQueryable ds = from dl in db.ThuocTheoKhoas
                            where dl.MaKhoa == maKhoa
                            select dl;
            return ds;
        }
        public IQueryable LayLoDuaVaoMaThuoc(string maThuoc)
        {
            IQueryable ds = from dl in db.Thuocs
                            where dl.MaThuoc == maThuoc
                            select new { dl.MaLo };
            return ds;
        }
        public int LaySoLuongHopCuaLo(string maLo)
        {
            int ds = (int)(from dl in db.KhoThuocs
                           join t in db.Thuocs
                           on dl.MaThuoc equals t.MaThuoc
                           where t.MaLo == maLo
                           select dl.SoLuongTrongKho).FirstOrDefault();
            return ds;
        }
        public bool KiemTraGiaTriNhap(string maLo, int soLuong)
        {
            return soLuong > LaySoLuongHopCuaLo(maLo);
        }
        public string LayTenDuaVaoMaThuoc(string maThuoc)
        {
            string ds = (from dl in db.Thuocs
                         where dl.MaThuoc == maThuoc
                         select dl.TenThuoc).FirstOrDefault();

            return ds;
        }
        public double TinhTienMotHop(string maLo)
        {
            int soLuongHop = (int)(from dl in db.Thuocs
                                   where dl.MaLo == maLo
                                   select dl.SoLuongHop).FirstOrDefault();
            int soLuongDVT = (int)(from dl in db.Thuocs
                                   where dl.MaLo == maLo
                                   select dl.SoLuongDVT).FirstOrDefault();
            int giaNhap = (int)(from dl in db.Thuocs
                                where dl.MaLo == maLo
                                select dl.Gia).FirstOrDefault();
            double gia = giaNhap / soLuongHop / soLuongDVT;
            return gia;
        }
        public int LaySoLuongThuoc(string maLo, string maThuoc)
        {
            int soLuong = (int)(from dl in db.ThuocTheoKhoas
                                where dl.MaLo == maLo && dl.MaThuoc == maThuoc
                                select dl.SoLuongThuocCuaKhoa).FirstOrDefault();
            return soLuong;
        }
        public int LaySoLuongTrongKhoa(int soLuongNhap, string maLo, string maThuoc)
        {
            int soLuongHop = (int)(from dl in db.Thuocs
                                   where dl.MaLo == maLo && dl.MaThuoc == maThuoc
                                   select dl.SoLuongHop).FirstOrDefault();
            int soLuong = soLuongNhap * soLuongHop;
            return soLuong;
        }
        public bool ThemThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            // Kiểm tra xem thuốc và lô đã có chưa
            if (db.ThuocTheoKhoas.Any(t => t.MaThuoc == etThuocTheoKhoa.MaThuoc && t.MaLo == etThuocTheoKhoa.MaLo && t.MaKhoa == etThuocTheoKhoa.MaKhoa))
            {
                MessageBox.Show("Thuốc đã tồn tại trong khoa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return false;
            }
            else
            {
                try
                {
                    // Lấy thông tin thuốc từ bảng Thuoc và KhoThuoc với điều kiện mã lô
                    var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == etThuocTheoKhoa.MaThuoc && t.MaLo == etThuocTheoKhoa.MaLo);
                    var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == etThuocTheoKhoa.MaThuoc);

                    if (thuoc == null || khoThuoc == null)
                    {
                        MessageBox.Show("Thuốc hoặc lô thuốc không tồn tại trong kho.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return false;
                    }

                    // Kiểm tra số lượng hộp hợp lệ trong lô thuốc cụ thể
                    int soHopCanPhat = soLuong;
                    int soHopTrongThung = thuoc.SoLuongHop.Value;

                    if (khoThuoc.SoLuongTrongKho < soHopCanPhat)
                    {
                        MessageBox.Show("Không đủ số lượng hộp trong lô thuốc này.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return false;
                    }

                    // Trừ số lượng trong kho đúng với lô thuốc hiện tại
                    khoThuoc.SoLuongTrongKho -= soHopCanPhat;

                    int soThungCanGiam = soHopCanPhat / soHopTrongThung;

                    thuoc.SoLuongNhap -= soThungCanGiam;
                    if (khoThuoc.SoLuongTrongKho < 0)
                    {
                        MessageBox.Show("Không đủ hộp hoặc thùng trong kho.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return false; // Ngừng thực hiện nếu không đủ hộp hoặc thùng
                    }

                    // Cập nhật số lượng thuốc trong khoa
                    ThuocTheoKhoa thuocTheoKhoa = new ThuocTheoKhoa
                    {
                        MaThuoc = etThuocTheoKhoa.MaThuoc,
                        MaKhoa = etThuocTheoKhoa.MaKhoa,
                        Gia = TinhTienMotHop(etThuocTheoKhoa.MaLo),
                        MaLo = etThuocTheoKhoa.MaLo,
                        SoLuongThuocCuaKhoa = etThuocTheoKhoa.SoLuongThuoc + soLuong
                    };

                    db.ThuocTheoKhoas.InsertOnSubmit(thuocTheoKhoa);
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi: " + ex.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
            }
        }
        public int TinhVienThuoc(string maThuoc)
        {
            int soLuongDVT = (int)(from dl in db.Thuocs
                                   where dl.MaThuoc == maThuoc
                                   select dl.SoLuongDVT).FirstOrDefault();

            int soLuongTrongDVT = (from dl in db.Thuocs
                                   where dl.MaThuoc == maThuoc
                                   select dl.SoLuongQCDG).FirstOrDefault() ?? 0;

            int soLuongHopKhoa = (from dl in db.ThuocTheoKhoas
                                  where dl.MaThuoc == maThuoc
                                  select (int?)dl.SoLuongThuocCuaKhoa).Sum() ?? 0;

            int tongSoVien;
            if (soLuongTrongDVT > 0)
            {
                tongSoVien = soLuongHopKhoa * soLuongDVT * soLuongTrongDVT;
            }
            else
            {
                tongSoVien = soLuongHopKhoa * soLuongDVT;
            }

            return tongSoVien;
        }
        public bool ThemSLThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            try
            {
                // Lấy thông tin thuốc từ bảng Thuoc và KhoThuoc với điều kiện mã lô
                var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == etThuocTheoKhoa.MaThuoc && t.MaLo == etThuocTheoKhoa.MaLo);
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == etThuocTheoKhoa.MaThuoc);

                if (thuoc == null || khoThuoc == null)
                {
                    MessageBox.Show("Thuốc hoặc lô thuốc không tồn tại trong kho.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }

                // Kiểm tra số lượng hộp yêu cầu có hợp lệ trong kho
                int soHopTrongThung = thuoc.SoLuongHop.Value;

                // Kiểm tra nếu số lượng hộp cần phát lớn hơn số hộp trong kho
                if (khoThuoc.SoLuongTrongKho < soLuong)
                {
                    MessageBox.Show("Không đủ số lượng hộp trong lô thuốc này.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }

                // Trừ số lượng hộp trong kho theo đúng số lượng yêu cầu
                khoThuoc.SoLuongTrongKho -= soLuong;
                int soThungCanGiam = soLuong / soHopTrongThung;
                int phanDuHop = soLuong % soHopTrongThung;

                // Nếu có phần dư hộp, cần thêm 1 thùng
                if (phanDuHop > 0)
                {
                    soThungCanGiam += 1;
                }

                // Nếu số lượng nhập hiện tại nhỏ hơn số thùng cần giảm, gán thẳng về 0
                if (thuoc.SoLuongNhap <= soThungCanGiam)
                {
                    soThungCanGiam = (int)thuoc.SoLuongNhap; // Không trừ vượt quá số lượng hiện tại
                    thuoc.SoLuongNhap = 0;              // Đặt số lượng nhập về 0
                }
                else
                {
                    thuoc.SoLuongNhap -= soThungCanGiam;
                }
                // Tính số thùng cần giảm dựa trên số hộp trong mỗi thùng
                //int soThungCanGiam = soLuong / soHopTrongThung;

                //// Kiểm tra số lượng thùng còn trong kho
                //if (thuoc.SoLuongNhap < soThungCanGiam)
                //{
                //    MessageBox.Show("Không đủ thùng trong kho. Chỉ cập nhật số hộp còn lại.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                //    soThungCanGiam = 0; // Không trừ thùng nếu không đủ
                //}

                //// Trừ số lượng thùng (nếu đủ thùng) và cập nhật số lượng khoa
                //thuoc.SoLuongNhap -= soThungCanGiam;
                var thuocTheoKhoa = db.ThuocTheoKhoas.FirstOrDefault(t => t.MaThuoc == etThuocTheoKhoa.MaThuoc && t.MaLo == etThuocTheoKhoa.MaLo && t.MaKhoa == etThuocTheoKhoa.MaKhoa);

                if (thuocTheoKhoa != null)
                {
                    thuocTheoKhoa.SoLuongThuocCuaKhoa += soLuong;
                    db.SubmitChanges();
                    return true;
                }
                else
                {
                    MessageBox.Show("Thuốc chưa được thêm vào khoa trước đó.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    return false;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }


        public bool XoaSLThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            try
            {
                // Lấy thông tin thuốc từ bảng Thuoc và KhoThuoc với điều kiện mã lô
                var thuoc = db.Thuocs.FirstOrDefault(t => t.MaThuoc == etThuocTheoKhoa.MaThuoc && t.MaLo == etThuocTheoKhoa.MaLo);
                var khoThuoc = db.KhoThuocs.FirstOrDefault(k => k.MaThuoc == etThuocTheoKhoa.MaThuoc);

                if (thuoc == null || khoThuoc == null)
                {
                    MessageBox.Show("Thuốc hoặc lô thuốc không tồn tại trong kho.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }

                // Kiểm tra số lượng hộp hợp lệ trong lô thuốc cụ thể
                int soHopCanTra = soLuong;
                int soHopTrongThung = thuoc.SoLuongHop.Value;

                // Kiểm tra nếu số lượng cần trả lại lớn hơn số lượng đã có trong khoa
                var thuocTheoKhoa = db.ThuocTheoKhoas.FirstOrDefault(t => t.MaThuoc == etThuocTheoKhoa.MaThuoc && t.MaLo == etThuocTheoKhoa.MaLo && t.MaKhoa == etThuocTheoKhoa.MaKhoa);
                if (thuocTheoKhoa == null || thuocTheoKhoa.SoLuongThuocCuaKhoa < soHopCanTra)
                {
                    MessageBox.Show("Số lượng thuốc trong khoa không đủ để trả lại.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }

                // Trả lại số lượng thuốc cho khoa (giảm số lượng trong khoa)
                thuocTheoKhoa.SoLuongThuocCuaKhoa -= soHopCanTra;

                // Cập nhật lại số lượng trong kho (tăng số lượng trong kho)
                khoThuoc.SoLuongTrongKho += soHopCanTra;

                // Tính lại số thùng cần thêm vào kho
                int soThungCanThem = soHopCanTra / soHopTrongThung;

                //// Nếu có dư hộp, cộng thêm một thùng nữa
                //if (soHopCanTra % soHopTrongThung != 0)
                //{
                //    soThungCanThem += 1;
                //}

                // Cập nhật lại số thùng trong thuốc
                thuoc.SoLuongNhap += soThungCanThem;

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SubmitChanges();
                MessageBox.Show("Số thuốc đã được trả lại khoa và cập nhật vào kho thành công.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi: " + ex.Message, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }

        public IQueryable TimKiemThuocTheoKhoa(string tenThuoc, string maKhoa)
        {
            IQueryable ds = from dl in db.ThuocTheoKhoas
                            join t in db.Thuocs
                            on dl.MaLo equals t.MaLo
                            where t.TenThuoc.Contains(tenThuoc) && dl.MaKhoa == maKhoa
                            select dl;
            return ds;
        }
    }
}
