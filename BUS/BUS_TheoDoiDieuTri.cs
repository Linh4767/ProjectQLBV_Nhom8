using DAL;
using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BUS
{
    public class BUS_TheoDoiDieuTri
    {
        public static BUS_TheoDoiDieuTri instance;
        private DAL_TheoDoiDieuTri dal_theodoidieutri = new DAL_TheoDoiDieuTri();
        public static BUS_TheoDoiDieuTri Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TheoDoiDieuTri();
                }
                return instance;
            }
        }

        //Hiển thị danh sách theo dõi
        public void HienThiTheoDoi(DataGridView dgv, DateTime ngay)
        {
            dgv.DataSource = dal_theodoidieutri.HienThiDanhSachTheoDoi(ngay);
        }

        //Tạo mã tự động
        public string TaoMaTheoDoi(string maPKB, string maGiuong)
        {
            return dal_theodoidieutri.TaoMaTheoDoi(maPKB, maGiuong);
        }

        //Hiển thị tên bệnh nhân
        public string HienThiTenBN(string maBN)
        {
            return dal_theodoidieutri.HienThiTenBN(maBN);
        }

        //Hiển thị mã bệnh nhân
        public string HienThiMaBN(string maPKB)
        {
            return dal_theodoidieutri.HienThiMaBN(maPKB);
        }

        //Hiển thị combobox Phiếu Khám Bệnh
        public void HienThiComboboxPKB(ComboBox cboPKB)
        {
            var danhSachPKB = dal_theodoidieutri.HienThiComboboxPhieuKB();
            cboPKB.DataSource = danhSachPKB;
            cboPKB.ValueMember = "MaPhieuKB";
            cboPKB.DisplayMember = "HienThi";

            // Tạo AutoCompleteCustomSource
            AutoCompleteStringCollection autoCompleteData = new AutoCompleteStringCollection();
            autoCompleteData.AddRange(danhSachPKB.Select(x => x.HienThi).ToArray());

            // Gán AutoCompleteCustomSource
            cboPKB.AutoCompleteMode = AutoCompleteMode.Suggest;  // Thử Suggest thay vì SuggestAppend
            cboPKB.AutoCompleteSource = AutoCompleteSource.CustomSource;
            cboPKB.AutoCompleteCustomSource = autoCompleteData;

            // Đặt DropDownStyle
            cboPKB.DropDownStyle = ComboBoxStyle.DropDown;
        }





        //Hiển thị combobox giường theo pkb
        public void HienThiComboboxGiuong(ComboBox cboGiuong, string maPKB)
        {
            cboGiuong.DataSource = dal_theodoidieutri.HienThiGiuongTheoPhieuKB(maPKB);
            cboGiuong.ValueMember = "MaGiuong";
            cboGiuong.DisplayMember = "MaGiuong";
        }

        //Hiển thị chuẩn đoán theo mã PKB
        public string HienThiChuanDoan(string maPKB)
        {
            return dal_theodoidieutri.HienThiChuanDoan(maPKB);
        }

        //Hiển thị phòng theo mã giường
        public string HienThiPhong(string maGiuong)
        {
            return dal_theodoidieutri.LayPhongTheoGiuong(maGiuong);
        }

        //Hiển thị phòng theo mã giường
        public string HienThiTenNV(string maNV)
        {
            return dal_theodoidieutri.HienThiTenNV(maNV);
        }

        //Lấy nhân viên và giường theo phân công
        public void LayNhanVienTheoPhanCongVaPhong(ComboBox cboNVTH, DateTime dtpNgayTH, DateTime dtpThoiGianTH, string maGiuong)
        {
            cboNVTH.DataSource = dal_theodoidieutri.LayNhanVienTheoPhanCongVaPhong(dtpNgayTH, dtpThoiGianTH, maGiuong);
            cboNVTH.ValueMember = "MaNV";
            cboNVTH.DisplayMember = "HienThi";
        }

        //Thêm theo dõi
        public void ThemTheoDoi(ET_TheoDoiDieuTri et_theodoi)
        {
            if (dal_theodoidieutri.KiemTraNgayTheoDoi(et_theodoi.MaPKB, et_theodoi.MaGiuong, et_theodoi.NgayTheoDoi))
            {
                if (dal_theodoidieutri.ThemTheoDoi(et_theodoi) == true)
                {
                    MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
                else
                {
                    MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Ngày theo dõi không thể nhỏ hơn ngày nhận giường", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        //Cập nhật
        public void SuaTheoDoi(ET_TheoDoiDieuTri et_theodoi)
        {
            if (dal_theodoidieutri.SuaTheoDoi(et_theodoi) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Kiểm tra ngày theo dõi
        public bool KiemTraNgayTheoDoi(string maPKB, string maGiuong, DateTime ngayTheoDoi)
        {
            // Gọi phương thức KiemTraHoanThienTraGiuong từ lớp DAL
            return dal_theodoidieutri.KiemTraNgayTheoDoi(maPKB, maGiuong, ngayTheoDoi);
        }

        //Kiểm tra khi sửa ngày theo dõi
        public bool KiemTraKhiSuaNgayTheoDoi(string maPKB, string maGiuong, DateTime ngayTheoDoi)
        {
            // Gọi phương thức KiemTraHoanThienTraGiuong từ lớp DAL
            return dal_theodoidieutri.KiemTraKhiSuaNgayTheoDoi(maPKB, maGiuong, ngayTheoDoi);
        }

        //Tìm kiếm
        public void TimKiemTheoTen(DataGridView dgv, string ten)
        {
            dgv.DataSource = dal_theodoidieutri.TimKiemTheoTen(ten);
        }
    }
}
