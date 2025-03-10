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
    public class BUS_NhanVien
    {
        public static BUS_NhanVien instance;
        private DAL_NhanVien dal_nhanvien = new DAL_NhanVien();

        public static BUS_NhanVien Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_NhanVien();
                }
                return instance;
            }
        }

        //Hiển thị danh sách nhân viên
        public void HienThiNhanVien(DataGridView dgv)
        {
            dgv.DataSource = dal_nhanvien.HienThiDanhSachNhanVien();
        }

        //Hiển thị combobox Chức Vụ
        public void HienThiComboboxChucVu(ComboBox cbo)
        {
            cbo.DataSource = dal_nhanvien.DoDuLieuLenCBCV();
            cbo.ValueMember = "MaCV";
            cbo.DisplayMember = "TenCV";
        }

        //Hiển thị combobox Chuyên Ngành
        public void HienThiComboboxChuyenNganh(ComboBox cboCN)
        {
            cboCN.DataSource = dal_nhanvien.DoDuLieuLenCBCN();
            cboCN.ValueMember = "MaChuyenNganh";
            cboCN.DisplayMember = "TenChuyenNganh";
        }

        //Hiển thị chuyên ngành dựa vào khoa
        public void HienThiChuyenNganh(string maKhoa, ComboBox cboCN)
        {
            cboCN.DataSource = dal_nhanvien.LayChuyenNganhDuaVaoKhoa(maKhoa);
            cboCN.ValueMember = "MaChuyenNganh";
            cboCN.DisplayMember = "TenChuyenNganh";
        }

        //Tìm kiếm nhân viên
        public void TimKiemNhanVien(string keyword, DataGridView dgv)
        {
            dgv.DataSource = dal_nhanvien.TimKiemNhanVien(keyword);
        }

        //Thêm Nhân Viên
        public void ThemNhanVien(ET_NhanVien eT_NhanVien)
        {
            if (dal_nhanvien.ThemNhanVien(eT_NhanVien) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa nhân viên
        public void XoaNhanVien(string maNV)
        {
            if (dal_nhanvien.XoaNhanVien(maNV) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Sửa nhân viên
        public void SuaNhanVien(ET_NhanVien eT_NhanVien)
        {
            if (dal_nhanvien.SuaNhanVien(eT_NhanVien) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Tạo mã tự động
        public string TaoMaTuDong(string tenCN)
        {
            return dal_nhanvien.TaoMaTuDong(tenCN);
        }

        //Hiển thị tên khoa
        public string HienThiTenCN(string maCN)
        {
            return dal_nhanvien.HienThiTenChuyenNganh(maCN);
        }
    }
}
