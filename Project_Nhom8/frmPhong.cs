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
    public partial class frmPhong : Form
    {
        public frmPhong()
        {
            InitializeComponent();
        }

        private void frmPhong_Load(object sender, EventArgs e)
        {
            cboKhoa.Items.Clear();
            BUS_Phong.Instance.DoDLKhoaLenComboBox(cboKhoa);
            cboKhoa.SelectedIndex = 0;
            BUS_Phong.Instance.HienThiDSPhong(dgvDSPhong, cboKhoa.SelectedValue.ToString());
            dgvDSPhong.Columns[5].Visible = false;
            dgvDSPhong.ColumnHeadersHeight = 40;
            dgvDSPhong.Columns[0].Width = 70;
            dgvDSPhong.Columns[1].Width = 200;
            nudSoGiuong.DecimalPlaces = 0;
            txtMaPhong.Text = BUS_Phong.Instance.TaoMaPhongTuDong();
            btnThemPhong.Enabled = false;
            btnXoaPhong.Enabled = false;
            btnCapNhapPhong.Enabled = false;
        }

        private void cboKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboKhoa.SelectedIndex != -1)
            {
                BUS_Phong.Instance.HienThiDSPhong(dgvDSPhong, cboKhoa.SelectedValue.ToString());
            }
        }
        public string layLoaiPhong()
        {
            string loaiPhong = string.Empty;
            if (radPhongKham.Checked == true)
            {
                loaiPhong = radPhongKham.Text;
            }
            if (radPhongChucNang.Checked == true)
            {
                loaiPhong = radPhongChucNang.Text;
            }
            if (radPhongBenh.Checked == true)
            {
                loaiPhong = radPhongBenh.Text;
            }
            return loaiPhong;
        }

        private void btnThemPhong_Click(object sender, EventArgs e)
        {
            string loaiPhong = layLoaiPhong();
            DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenPhong.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenPhong.Text);
                BUS_Phong.Instance.ThemPhong(new ET_Phong(txtMaPhong.Text, txtTenPhong.Text, cboKhoa.SelectedValue.ToString(), Convert.ToInt32(nudSoGiuong.Value), loaiPhong));
                BUS_Phong.Instance.HienThiDSPhong(dgvDSPhong, cboKhoa.SelectedValue.ToString());
                ClearInputFields_Phong();
            }
        }

        private void btnXoaPhong_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thực hiện xóa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                BUS_Phong.Instance.XoaPhong(dgvDSPhong);
                BUS_Phong.Instance.HienThiDSPhong(dgvDSPhong, cboKhoa.SelectedValue.ToString());
                ClearInputFields_Phong();
                btnXoaPhong.Enabled = false;
                btnCapNhapPhong.Enabled = false;
            }
        }

        private void dgvDSPhong_Click(object sender, EventArgs e)
        {
            int dong = dgvDSPhong.CurrentCell.RowIndex;
            txtMaPhong.Text = dgvDSPhong.Rows[dong].Cells[0].Value?.ToString() ?? "";
            txtTenPhong.Text = dgvDSPhong.Rows[dong].Cells[1].Value?.ToString() ?? "";
            cboKhoa.SelectedValue = dgvDSPhong.Rows[dong].Cells[2].Value?.ToString() ?? "";
            nudSoGiuong.Value = Convert.ToInt32(dgvDSPhong.Rows[dong].Cells[3].Value ?? 0);
            string cellValue = Convert.ToString(dgvDSPhong.Rows[dong].Cells[4].Value);

            if (cellValue == radPhongKham.Text)
            {
                radPhongKham.Checked = true;
            }
            if (cellValue == radPhongChucNang.Text)
            {
                radPhongChucNang.Checked = true;
            }
            if (cellValue == radPhongBenh.Text)
            {
                radPhongBenh.Checked = true;
            }
            btnThemPhong.Enabled = false;
            btnCapNhapPhong.Enabled = true;
            btnXoaPhong.Enabled = true;
        }

        private void btnCapNhapPhong_Click(object sender, EventArgs e)
        {
            string loaiPhong = layLoaiPhong();
            DialogResult ret = MessageBox.Show("Bạn có lưu thông tin đã sửa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenPhong.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenPhong.Text);
                BUS_Phong.Instance.SuaPhong(new ET_Phong(txtMaPhong.Text, txtTenPhong.Text, cboKhoa.SelectedValue.ToString(), Convert.ToInt32(nudSoGiuong.Value), loaiPhong));
                BUS_Phong.Instance.HienThiDSPhong(dgvDSPhong, cboKhoa.SelectedValue.ToString());
                ClearInputFields_Phong();
                btnXoaPhong.Enabled = false;
                btnCapNhapPhong.Enabled = false;
            }
        }
        private void ClearInputFields_Phong()
        {
            txtMaPhong.Text = BUS_Phong.Instance.TaoMaPhongTuDong();
            txtTenPhong.Text = string.Empty;
            cboKhoa.SelectedIndex = 0;
            nudSoGiuong.Value = 0;
            radPhongKham.Checked = true;
            radPhongChucNang.Checked = false;
            radPhongBenh.Checked = false;
        }
        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            ClearInputFields_Phong();
            btnXoaPhong.Enabled = false;
            btnCapNhapPhong.Enabled = false;
            txtTK.Clear();
        }

        private void txtTenPhong_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenPhong.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemPhong.Enabled = true;
                btnCapNhapPhong.Enabled = true;
            }
            else
            {
                btnThemPhong.Enabled = false;
                btnCapNhapPhong.Enabled = false;
            }
        }

        private void txtTenPhong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && e.KeyChar != ' ' && e.KeyChar != '-')
            {
                e.Handled = true;
                MessageBox.Show("Không thể nhập kí tự đặc biệt(trừ dấu -)", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else if (BUS_BatLoi.Instance.KiemTraGioiHanKyTu(txtTenPhong.Text, 90))
            {
                e.Handled = true;
                MessageBox.Show("Bạn đang nhập quá ký tự cho phép là 90", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            string keyword = txtTK.Text; // Lấy từ khóa từ TextBox
            BUS_Phong.Instance.TimKiemPhong(keyword, dgvDSPhong);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát khỏi giao diện quản lý phòng không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }
    }
}
