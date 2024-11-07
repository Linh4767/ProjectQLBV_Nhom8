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
    public class BUS_ChuyenNganh
    {
        public static BUS_ChuyenNganh instance;

        public static BUS_ChuyenNganh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_ChuyenNganh();
                }
                return instance;
            }
        }

        //Hiển thị danh sách chuyên ngành
        public void HienThiChuyenNganh(DataGridView dgv)
        {
            dgv.DataSource = DAL_ChuyenNganh.Instance.HienThiDanhSachChuyenNganh();
        }

        //Hiển thị combobox Khoa
        public void HienThiComboboxKhoa(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = DAL_ChuyenNganh.Instance.HienThiComboboxKhoa();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "TenKhoa";
        }

        //Tìm kiếm chuyên ngành
        public void TimKiemChuyenNganh(string keyword, DataGridView dgv)
        {
            dgv.DataSource = DAL_ChuyenNganh.Instance.TimKiemChuyenNganh(keyword);
        }

        //Thêm Chuyên Ngành
        public void ThemChuyenNganh(ET_ChuyenNganh eT_ChuyenNganh)
        {
            if (DAL_ChuyenNganh.Instance.ThemChuyenNganh(eT_ChuyenNganh) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa Chuyên Ngành
        public void XoaChuyenNganh(string maCN)
        {
            if (DAL_ChuyenNganh.Instance.XoaChuyenNganh(maCN) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Sửa Chuyên Ngành
        public void SuaChuyeNganh(ET_ChuyenNganh eT_ChuyenNganh)
        {
            if (DAL_ChuyenNganh.Instance.SuaChuyenNganh(eT_ChuyenNganh) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Tạo mã tự động
        public string TaoMaTuDong(string tenKhoa)
        {
            return DAL_ChuyenNganh.Instance.TaoMaTuDong(tenKhoa);
        }

        //Hiển thị tên khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            return DAL_ChuyenNganh.Instance.HienThiTenKhoa(maKhoa);
        }
    }
}
