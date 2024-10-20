using BUS;
using ET;
using Guna.UI2.WinForms;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project_Nhom8
{
    public partial class frmChucVu : Form
    {
        public frmChucVu()
        {
            InitializeComponent();
        }

        private void frmChucVu_Load(object sender, EventArgs e)
        {
            BUS_ChucVu.Instance.HienThiDSChucVu(dgvChucVu);
            dgvChucVu.ColumnHeadersHeight = 40;
            txtMaChucVu.Text = BUS_ChucVu.Instance.TaoMaChucVuTuDong();
            btnThemChucVu.Enabled = false;
            btnCapNhatChucVu.Enabled = false;
            btnXoaChucVu.Enabled = false;
        }

        private void ClearInputFields_ChucVu()
        {
            txtMaChucVu.Text = BUS_ChucVu.Instance.TaoMaChucVuTuDong();
            txtTenChucVu.Text = string.Empty;
        }

        private void btnThemChucVu_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenChucVu.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenChucVu.Text);
                BUS_ChucVu.Instance.ThemChucVu(new ET_ChucVu(txtMaChucVu.Text, txtTenChucVu.Text));
                BUS_ChucVu.Instance.HienThiDSChucVu(dgvChucVu);
                ClearInputFields_ChucVu();
            }
        }

        private void btnXoaChucVu_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thực hiện xóa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                BUS_ChucVu.Instance.XoaChucVu(dgvChucVu);
                BUS_ChucVu.Instance.HienThiDSChucVu(dgvChucVu);
                ClearInputFields_ChucVu();
                btnXoaChucVu.Enabled = false;
            }
        }

        private void btnCapNhatChucVu_Click(object sender, EventArgs e)
        {
            txtTenChucVu.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenChucVu.Text);
            DialogResult ret = MessageBox.Show("Bạn có muốn lưu thông tin đã thay đổi không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                BUS_ChucVu.Instance.SuaChucVu(new ET_ChucVu(txtMaChucVu.Text, txtTenChucVu.Text));
                BUS_ChucVu.Instance.HienThiDSChucVu(dgvChucVu);
                ClearInputFields_ChucVu();
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            ClearInputFields_ChucVu();
            btnXoaChucVu.Enabled = false;
            btnCapNhatChucVu.Enabled = false;
        }

        private void dgvChucVu_Click(object sender, EventArgs e)
        {
            int dong = dgvChucVu.CurrentCell.RowIndex;
            txtMaChucVu.Text = dgvChucVu.Rows[dong].Cells[0].Value?.ToString() ?? "";
            txtTenChucVu.Text = dgvChucVu.Rows[dong].Cells[1].Value?.ToString() ?? "";
            btnThemChucVu.Enabled = false;
            btnXoaChucVu.Enabled = true;
            btnCapNhatChucVu.Enabled = true;
        }

        private void txtTenChucVu_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenChucVu.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemChucVu.Enabled = true;
                btnCapNhatChucVu.Enabled = true;
            }
            else
            {
                btnThemChucVu.Enabled = false;
                btnCapNhatChucVu.Enabled = false;
            }
        }

        private void txtTenChucVu_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetter(e.KeyChar) && !char.IsControl(e.KeyChar) && e.KeyChar != ' ')
            {
                e.Handled = true;
                MessageBox.Show("Không thể nhập kí tự đặc hay số", "THÔNG BÁO", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (BUS_BatLoi.Instance.KiemTraGioiHanKyTu(txtTenChucVu.Text, 150))
            {
                e.Handled = true;
                MessageBox.Show("Bạn đang nhập quá ký tự cho phép là 150", "THÔNG BÁO", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thoát khỏi màn hình quản lý chức vụ không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
