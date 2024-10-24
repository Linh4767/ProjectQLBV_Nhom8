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
    public partial class frmDichVu : Form
    {
        public frmDichVu()
        {
            InitializeComponent();
        }

        private void frmDichVu_Load(object sender, EventArgs e)
        {
            dgvDichVu.ColumnHeadersHeight = 40;
            cboKhoa.Items.Clear();
            BUS_DichVu.Instance.HienThiDichVu(dgvDichVu);
            BUS_DichVu.Instance.HienThiComboboxKhoa(cboKhoa);
            txtMaDV.Text = BUS_DichVu.Instance.TaoMaTuDong();
            btnThem.Enabled = false;
            btnXoa.Enabled = false;
            btnCapNhat.Enabled = false;
            dgvDichVu.Columns[4].Visible = false;
            cboKhoa.DropDownWidth = 150;
            cboKhoa.DropDownHeight = 300;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenDV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenDV.Text);
                BUS_DichVu.Instance.ThemDichVu(new ET_DichVu(txtMaDV.Text, txtTenDV.Text, float.Parse(txtGiaDV.Text), cboKhoa.SelectedValue.ToString()));
                BUS_DichVu.Instance.HienThiDichVu(dgvDichVu);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //Kiểm tra đã chọn dòng trên datagridview chưa
            if (dgvDichVu.SelectedRows.Count == 0)
            {
                MessageBox.Show("Bạn phải chọn dòng để xóa", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialog == DialogResult.Yes)
                {
                    BUS_DichVu.Instance.XoaDichVu(txtMaDV.Text);
                    BUS_DichVu.Instance.HienThiDichVu(dgvDichVu);
                    btnThem.Enabled = true;
                    btnXoa.Enabled = false;
                    btnCapNhat.Enabled = false;
                }
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                txtTenDV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenDV.Text);
                BUS_DichVu.Instance.SuaDichVu(new ET_DichVu(txtMaDV.Text, txtTenDV.Text, float.Parse(txtGiaDV.Text), cboKhoa.SelectedValue.ToString()));
                BUS_DichVu.Instance.HienThiDichVu(dgvDichVu);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaDV.Clear();
            txtMaDV.Text = BUS_DichVu.Instance.TaoMaTuDong();
            txtTenDV.Clear();
            txtGiaDV.Clear();
            txtTimKiem.Clear();
            cboKhoa.SelectedIndex = 0;
            btnThem.Enabled = false;
            btnCapNhat.Enabled = false;
            btnXoa.Enabled = false;
            BUS_DichVu.Instance.HienThiDichVu(dgvDichVu);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc chắn muốn thoát?", "Thông báo!", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_DichVu.Instance.TimKiemDichVu(txtTimKiem.Text, dgvDichVu);
        }

        private void dgvDichVu_Click(object sender, EventArgs e)
        {
            if (dgvDichVu.CurrentRow != null && !dgvDichVu.Rows[dgvDichVu.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvDichVu.CurrentCell.RowIndex;
                txtMaDV.Text = dgvDichVu.Rows[dong].Cells[0].Value.ToString();
                txtTenDV.Text = dgvDichVu.Rows[dong].Cells[1].Value.ToString();
                txtGiaDV.Text = dgvDichVu.Rows[dong].Cells[2].Value.ToString();
                cboKhoa.SelectedValue = dgvDichVu.Rows[dong].Cells[3].Value.ToString();
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnCapNhat.Enabled = true;
            }
        }

        private void txtTenDV_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenDV.Text, txtGiaDV.Text };
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
            if (txtTenDV.Text.Length > 100)
            {
                // Cắt chuỗi về 100 ký tự
                txtTenDV.Text = txtTenDV.Text.Substring(0, 100);

                // Đặt con trỏ chuột ở cuối văn bản
                txtTenDV.SelectionStart = txtTenDV.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 100 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtTenDV_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtGiaDV_TextChanged(object sender, EventArgs e)
        {
            if (long.TryParse(txtGiaDV.Text, out long giaDV))
            {
                // Nếu giá trị vượt quá 500.000.000, tự động gán lại giá trị tối đa
                if (giaDV > 500000000)
                {
                    txtGiaDV.Text = "500000000";  // Giới hạn không cho phép nhập hơn 500.000.000
                    txtGiaDV.SelectionStart = txtGiaDV.Text.Length;  // Đặt con trỏ ở cuối chuỗi
                }
            }
            else if (txtGiaDV.Text != "")  // Nếu không phải số, xóa nội dung
            {
                txtGiaDV.Text = "0";  // Đặt giá trị mặc định là 0
            }
        }

        private void txtGiaDV_Leave(object sender, EventArgs e)
        {
            // Khi người dùng rời khỏi ô nhập, kiểm tra giá trị tối thiểu
            if (long.TryParse(txtGiaDV.Text, out long giaDV))
            {
                if (giaDV < 50000)  // Kiểm tra giá trị có nhỏ hơn 50.000 hay không
                {
                    MessageBox.Show("Giá trị phải lớn hơn hoặc bằng 50.000", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtGiaDV.Text = "50000";  // Gán lại giá trị tối thiểu nếu nhỏ hơn 50.000
                }
            }
        }

        private void txtGiaDV_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }
    }
}
