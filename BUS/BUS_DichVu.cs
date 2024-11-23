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
    public class BUS_DichVu
    {
        public static BUS_DichVu instance;
        private DAL_DichVu dal_dichvu = new DAL_DichVu();
        public static BUS_DichVu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_DichVu();
                }
                return instance;
            }
        }

        //Hiển thị danh sách dịch vụ
        public void HienThiDichVu(DataGridView dgv)
        {
            dgv.DataSource = dal_dichvu.HienThiDanhSachDichVu();
        }

        //Hiển thị combobox Khoa
        public void HienThiComboboxKhoa(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = dal_dichvu.HienThiComboboxKhoa();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "TenKhoa";
        }

        //Tìm kiếm dịch vụ
        public void TimKiemDichVu(string keyword, DataGridView dgv)
        {
            dgv.DataSource = dal_dichvu.TimKiemDichVu(keyword);
        }

        //Tạo mã tự động
        public string TaoMaTuDong(string tenKhoa)
        {
            return dal_dichvu.TaoMaTuDong(tenKhoa);
        }

        //Hiển thị tên khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            return dal_dichvu.HienThiTenKhoa(maKhoa);
        }

        //Thêm Dịch Vụ
        public void ThemDichVu(ET_DichVu et_dichvu)
        {
            if (dal_dichvu.ThemDichVu(et_dichvu) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa Dịch Vụ
        public void XoaDichVu(string maDV)
        {
            if (dal_dichvu.XoaDichVu(maDV) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Sửa Dịch Vụ
        public void SuaDichVu(ET_DichVu et_dichvu)
        {
            if (dal_dichvu.SuaDichVu(et_dichvu) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
