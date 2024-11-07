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
            dgv.DataSource = DAL_DichVu.Instance.HienThiDanhSachDichVu();
        }

        //Hiển thị combobox Khoa
        public void HienThiComboboxKhoa(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = DAL_DichVu.Instance.HienThiComboboxKhoa();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "TenKhoa";
        }

        //Tìm kiếm dịch vụ
        public void TimKiemDichVu(string keyword, DataGridView dgv)
        {
            dgv.DataSource = DAL_DichVu.Instance.TimKiemDichVu(keyword);
        }

        //Tạo mã tự động
        public string TaoMaTuDong(string tenKhoa)
        {
            return DAL_DichVu.Instance.TaoMaTuDong(tenKhoa);
        }

        //Hiển thị tên khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            return DAL_DichVu.Instance.HienThiTenKhoa(maKhoa);
        }

        //Thêm Dịch Vụ
        public void ThemDichVu(ET_DichVu et_dichvu)
        {
            if (DAL_DichVu.Instance.ThemDichVu(et_dichvu) == true)
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
            if (DAL_DichVu.Instance.XoaDichVu(maDV) == true)
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
            if (DAL_DichVu.Instance.SuaDichVu(et_dichvu) == true)
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
