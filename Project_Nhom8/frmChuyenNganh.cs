using BUS;
using ET;
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
    public partial class frmChuyenNganh : Form
    {
        public frmChuyenNganh()
        {
            InitializeComponent();
        }

        private void frmChuyenNganh_Load(object sender, EventArgs e)
        {
            dgvChuyenNganh.ColumnHeadersHeight = 40;
            BUS_ChuyenNganh.Instance.HienThiChuyenNganh(dgvChuyenNganh);
            BUS_ChuyenNganh.Instance.HienThiComboboxKhoa(cboKhoa);
            txtMaCN.Text = BUS_ChuyenNganh.Instance.TaoMaTuDong();
            btnThem.Enabled = false;
            btnXoa.Enabled = false;
            btnCapNhat.Enabled = false;
            dgvChuyenNganh.Columns[3].Visible = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenChuyenNganh.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenChuyenNganh.Text);
                BUS_ChuyenNganh.Instance.ThemChuyenNganh(new ET_ChuyenNganh(txtMaCN.Text, txtTenChuyenNganh.Text, cboKhoa.SelectedValue.ToString()));
                BUS_ChuyenNganh.Instance.HienThiChuyenNganh(dgvChuyenNganh);
            }

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //Kiểm tra đã chọn dòng trên datagridview chưa
            if (dgvChuyenNganh.SelectedRows.Count == 0)
            {
                MessageBox.Show("Bạn phải chọn dòng để xóa", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialog == DialogResult.Yes)
                {
                    BUS_ChuyenNganh.Instance.XoaChuyenNganh(txtMaCN.Text);
                    BUS_ChuyenNganh.Instance.HienThiChuyenNganh(dgvChuyenNganh);
                    btnThem.Enabled = true;
                    btnXoa.Enabled = false;
                    btnCapNhat.Enabled = false;
                }
            }

        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn cập nhật không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                var textbox = new List<string> { txtTenChuyenNganh.Text };
                BUS_BatLoi.Instance.KiemTraTrong(textbox);
                txtTenChuyenNganh.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenChuyenNganh.Text);
                BUS_ChuyenNganh.Instance.SuaChuyeNganh(new ET_ChuyenNganh(txtMaCN.Text, txtTenChuyenNganh.Text, cboKhoa.SelectedValue.ToString()));
                BUS_ChuyenNganh.Instance.HienThiChuyenNganh(dgvChuyenNganh);
            }

        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaCN.Clear();
            txtMaCN.Text = BUS_ChuyenNganh.Instance.TaoMaTuDong();
            txtTenChuyenNganh.Clear();
            txtTimKiem.Clear();
            cboKhoa.SelectedIndex = 0;
            btnThem.Enabled = false;
            btnXoa.Enabled = false;
            btnCapNhat.Enabled = false;
            BUS_ChuyenNganh.Instance.HienThiChuyenNganh(dgvChuyenNganh);
        }

        private void dgvChuyenNganh_Click(object sender, EventArgs e)
        {
            if (dgvChuyenNganh.CurrentRow != null && !dgvChuyenNganh.Rows[dgvChuyenNganh.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvChuyenNganh.CurrentCell.RowIndex;
                txtMaCN.Text = dgvChuyenNganh.Rows[dong].Cells[0].Value.ToString();
                txtTenChuyenNganh.Text = dgvChuyenNganh.Rows[dong].Cells[1].Value.ToString();
                cboKhoa.SelectedValue = dgvChuyenNganh.Rows[dong].Cells[2].Value.ToString();
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnCapNhat.Enabled = true;
            }

        }

        private void txtTenChuyenNganh_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc chắn muốn thoát?", "Thông báo!", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }

        }

        private void txtTenChuyenNganh_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenChuyenNganh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThem.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThem.Enabled = false;
                btnCapNhat.Enabled = false;
            }
            if (txtTenChuyenNganh.Text.Length > 120)
            {
                // Cắt chuỗi về 10 ký tự
                txtTenChuyenNganh.Text = txtTenChuyenNganh.Text.Substring(0, 120);

                // Đặt con trỏ chuột ở cuối văn bản
                txtTenChuyenNganh.SelectionStart = txtTenChuyenNganh.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 120 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_ChuyenNganh.Instance.TimKiemChuyenNganh(txtTimKiem.Text, dgvChuyenNganh);
        }
    }
}
