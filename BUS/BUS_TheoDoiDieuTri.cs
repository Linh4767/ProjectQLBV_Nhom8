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
            dgv.DataSource = DAL_TheoDoiDieuTri.Instance.HienThiDanhSachTheoDoi(ngay);
        }

        //Tạo mã tự động
        public string TaoMaTheoDoi(string maPKB, string maGiuong)
        {
            return DAL_TheoDoiDieuTri.Instance.TaoMaTheoDoi(maPKB, maGiuong);
        }

        //Hiển thị tên bệnh nhân
        public string HienThiTenBN(string maBN)
        {
            return DAL_TheoDoiDieuTri.Instance.HienThiTenBN(maBN);
        }

        //Hiển thị mã bệnh nhân
        public string HienThiMaBN(string maPKB)
        {
            return DAL_TheoDoiDieuTri.Instance.HienThiMaBN(maPKB);
        }

        //Hiển thị combobox Phiếu Khám Bệnh
        public void HienThiComboboxPKB(ComboBox cboPKB)
        {
            var danhSachPKB = DAL_TheoDoiDieuTri.Instance.HienThiComboboxPhieuKB();
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
            cboGiuong.DataSource = DAL_TheoDoiDieuTri.Instance.HienThiGiuongTheoPhieuKB(maPKB);
            cboGiuong.ValueMember = "MaGiuong";
            cboGiuong.DisplayMember = "MaGiuong";
        }

        //Hiển thị chuẩn đoán theo mã PKB
        public string HienThiChuanDoan(string maPKB)
        {
            return DAL_TheoDoiDieuTri.Instance.HienThiChuanDoan(maPKB);
        }

        //Hiển thị phòng theo mã giường
        public string HienThiPhong(string maGiuong)
        {
            return DAL_TheoDoiDieuTri.Instance.LayPhongTheoGiuong(maGiuong);
        }

        //Hiển thị phòng theo mã giường
        public string HienThiTenNV(string maNV)
        {
            return DAL_TheoDoiDieuTri.Instance.HienThiTenNV(maNV);
        }

        //Lấy nhân viên và giường theo phân công
        public void LayNhanVienTheoPhanCongVaPhong(ComboBox cboNVTH, DateTime dtpNgayTH, DateTime dtpThoiGianTH, string maGiuong)
        {
            cboNVTH.DataSource = DAL_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(dtpNgayTH, dtpThoiGianTH, maGiuong);
            cboNVTH.ValueMember = "MaNV";
            cboNVTH.DisplayMember = "HienThi";
        }

        //Thêm theo dõi
        public void ThemTheoDoi(ET_TheoDoiDieuTri et_theodoi)
        {
            if (DAL_TheoDoiDieuTri.Instance.KiemTraNgayTheoDoi(et_theodoi.MaPKB, et_theodoi.MaGiuong, et_theodoi.NgayTheoDoi))
            {
                if (DAL_TheoDoiDieuTri.Instance.ThemTheoDoi(et_theodoi) == true)
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
            if (DAL_TheoDoiDieuTri.Instance.SuaTheoDoi(et_theodoi) == true)
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
            return DAL_TheoDoiDieuTri.Instance.KiemTraNgayTheoDoi(maPKB, maGiuong, ngayTheoDoi);
        }

        //Kiểm tra khi sửa ngày theo dõi
        public bool KiemTraKhiSuaNgayTheoDoi(string maPKB, string maGiuong, DateTime ngayTheoDoi)
        {
            // Gọi phương thức KiemTraHoanThienTraGiuong từ lớp DAL
            return DAL_TheoDoiDieuTri.Instance.KiemTraKhiSuaNgayTheoDoi(maPKB, maGiuong, ngayTheoDoi);
        }
    }
}
