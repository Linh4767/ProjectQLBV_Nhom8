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
            dgv.DataSource = DAL_NhanVien.Instance.HienThiDanhSachNhanVien();
        }

        //Hiển thị combobox Chức Vụ
        public void HienThiComboboxChucVu(ComboBox cbo)
        {
            cbo.DataSource = DAL_NhanVien.Instance.DoDuLieuLenCBCV();
            cbo.ValueMember = "MaCV";
            cbo.DisplayMember = "TenCV";
        }

        //Hiển thị combobox Chuyên Ngành
        public void HienThiComboboxChuyenNganh(ComboBox cboCN)
        {
            cboCN.DataSource = DAL_NhanVien.Instance.DoDuLieuLenCBCN();
            cboCN.ValueMember = "MaChuyenNganh";
            cboCN.DisplayMember = "TenChuyenNganh";
        }

        //Hiển thị chuyên ngành dựa vào khoa
        public void HienThiChuyenNganh(string maKhoa, ComboBox cboCN)
        {
            cboCN.DataSource = DAL_NhanVien.Instance.LayChuyenNganhDuaVaoKhoa(maKhoa);
            cboCN.ValueMember = "MaChuyenNganh";
            cboCN.DisplayMember = "TenChuyenNganh";
        }

        //Tìm kiếm nhân viên
        public void TimKiemNhanVien(string keyword, DataGridView dgv)
        {
            dgv.DataSource = DAL_NhanVien.Instance.TimKiemNhanVien(keyword);
        }

        //Thêm Nhân Viên
        public void ThemNhanVien(ET_NhanVien eT_NhanVien)
        {
            if (DAL_NhanVien.Instance.ThemNhanVien(eT_NhanVien) == true)
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
            if (DAL_NhanVien.Instance.XoaNhanVien(maNV) == true)
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
            if (DAL_NhanVien.Instance.SuaNhanVien(eT_NhanVien) == true)
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
            return DAL_NhanVien.Instance.TaoMaTuDong(tenCN);
        }

        //Hiển thị tên khoa
        public string HienThiTenCN(string maCN)
        {
            return DAL_NhanVien.Instance.HienThiTenChuyenNganh(maCN);
        }
    }
}
