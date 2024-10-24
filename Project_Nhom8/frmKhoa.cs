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
    public partial class frmKhoa : Form
    {
        public frmKhoa()
        {
            InitializeComponent();
        }

        private void frmKhoa_Load(object sender, EventArgs e)
        {
            dgvKhoa.ColumnHeadersHeight = 40;
            BUS_Khoa.Instance.HienThiKhoa(dgvKhoa);
            txtMaKhoa.Text = BUS_Khoa.Instance.TaoMaTuDong();
            btnThem.Enabled = false;
            btnXoa.Enabled = false;
            btnCapNhat.Enabled = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenKhoa.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenKhoa.Text);
                BUS_Khoa.Instance.ThemKhoa(new ET_Khoa(txtMaKhoa.Text, txtTenKhoa.Text));
                BUS_Khoa.Instance.HienThiKhoa(dgvKhoa);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //Kiểm tra đã chọn dòng trên datagridview chưa
            if (dgvKhoa.SelectedRows.Count == 0)
            {
                MessageBox.Show("Bạn phải chọn dòng để xóa", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialog == DialogResult.Yes)
                {
                    BUS_Khoa.Instance.XoaKhoa(txtMaKhoa.Text);
                    BUS_Khoa.Instance.HienThiKhoa(dgvKhoa);
                    btnThem.Enabled = true;
                    btnXoa.Enabled = false;
                    btnCapNhat.Enabled = false;
                }
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenKhoa.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenKhoa.Text);
                BUS_Khoa.Instance.SuaKhoa(new ET_Khoa(txtMaKhoa.Text, txtTenKhoa.Text));
                BUS_Khoa.Instance.HienThiKhoa(dgvKhoa);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaKhoa.Clear();
            txtMaKhoa.Text = BUS_Khoa.Instance.TaoMaTuDong();
            txtTenKhoa.Clear();
            btnThem.Enabled = false;
            btnCapNhat.Enabled = false;
            btnXoa.Enabled = false;
            BUS_Khoa.Instance.HienThiKhoa(dgvKhoa);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc chắn muốn thoát?", "Thông báo!", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void dgvKhoa_Click(object sender, EventArgs e)
        {
            if (dgvKhoa.CurrentRow != null && !dgvKhoa.Rows[dgvKhoa.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvKhoa.CurrentCell.RowIndex;
                txtMaKhoa.Text = dgvKhoa.Rows[dong].Cells[0].Value.ToString();
                txtTenKhoa.Text = dgvKhoa.Rows[dong].Cells[1].Value.ToString();
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnCapNhat.Enabled = true;
            }
        }

        private void txtTenKhoa_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenKhoa.Text };
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
            if (txtTenKhoa.Text.Length > 90)
            {
                // Cắt chuỗi về 90 ký tự
                txtTenKhoa.Text = txtTenKhoa.Text.Substring(0, 90);

                // Đặt con trỏ chuột ở cuối văn bản
                txtTenKhoa.SelectionStart = txtTenKhoa.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 90 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtTenKhoa_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }
    }
}
