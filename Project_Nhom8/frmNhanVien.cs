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
    public partial class frmNhanVien : Form
    {
        public frmNhanVien()
        {
            InitializeComponent();
        }

        private void frmNhanVien_Load(object sender, EventArgs e)
        {
            dgvNhanVien.ColumnHeadersHeight = 40;
            //Form nhân viên
            cboCV.Items.Clear();
            cboChuyenNganh.Items.Clear();
            BUS_NhanVien.Instance.HienThiNhanVien(dgvNhanVien);
            BUS_NhanVien.Instance.HienThiComboboxChucVu(cboCV);
            BUS_NhanVien.Instance.HienThiComboboxChuyenNganh(cboChuyenNganh);
            dgvNhanVien.Columns[7].Visible = false;
            dgvNhanVien.Columns[8].Visible = false;
            dgvNhanVien.Columns[9].Visible = false;
            txtMaNV.Text = BUS_NhanVien.Instance.TaoMaTuDong();
            btnThem.Enabled = false;
            btnXoa.Enabled = false;
            btnCapNhat.Enabled = false;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string gioiTinh = "";
                if (radNam.Checked)
                {
                    gioiTinh = "Nam";
                }
                else
                {
                    gioiTinh = "Nữ";
                }
                DateTime ngaySinh = dtpNgaySinh.Value;
                if (ngaySinh.Year >= 2002 || ngaySinh.Year <= 1964)
                {
                    MessageBox.Show("Ngày sinh của bạn không hợp lệ !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                txtHoTenNV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtHoTenNV.Text);
                BUS_NhanVien.Instance.ThemNhanVien(new ET_NhanVien(txtMaNV.Text, txtHoTenNV.Text, gioiTinh, Convert.ToDateTime(dtpNgaySinh.Text), cboCV.SelectedValue.ToString(), cboChuyenNganh.SelectedValue.ToString(), txtSDT.Text));
                BUS_NhanVien.Instance.HienThiNhanVien(dgvNhanVien);
            }

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //Kiểm tra đã chọn dòng trên datagridview chưa
            if (dgvNhanVien.SelectedRows.Count == 0)
            {
                MessageBox.Show("Bạn phải chọn dòng để xóa", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialog == DialogResult.Yes)
                {
                    BUS_NhanVien.Instance.XoaNhanVien(txtMaNV.Text);
                    BUS_NhanVien.Instance.HienThiNhanVien(dgvNhanVien);
                    btnThem.Enabled = true;
                    btnXoa.Enabled = false;
                    btnCapNhat.Enabled = false;
                }
            }

        }

        private void dgvNhanVien_Click(object sender, EventArgs e)
        {
            if (dgvNhanVien.CurrentRow != null && !dgvNhanVien.Rows[dgvNhanVien.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvNhanVien.CurrentCell.RowIndex;
                txtMaNV.Text = dgvNhanVien.Rows[dong].Cells[0].Value.ToString();
                txtHoTenNV.Text = dgvNhanVien.Rows[dong].Cells[1].Value.ToString();
                if (dgvNhanVien.Rows[dong].Cells[2].Value.ToString() == "Nam")
                {
                    radNam.Checked = true;
                }
                else
                {
                    radNu.Checked = true;
                }
                dtpNgaySinh.Text = dgvNhanVien.Rows[dong].Cells[3].Value.ToString();
                cboCV.SelectedValue = dgvNhanVien.Rows[dong].Cells[4].Value.ToString();
                cboChuyenNganh.SelectedValue = dgvNhanVien.Rows[dong].Cells[5].Value.ToString();
                txtSDT.Text = dgvNhanVien.Rows[dong].Cells[6].Value.ToString();
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                btnCapNhat.Enabled = true;
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string gioiTinh = "";
                if (radNam.Checked)
                {
                    gioiTinh = "Nam";
                }
                else
                {
                    gioiTinh = "Nữ";
                }
                DateTime ngaySinh = dtpNgaySinh.Value;
                if (ngaySinh.Year >= 2002)
                {
                    MessageBox.Show("Ngày sinh của bạn không hợp lệ !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                txtHoTenNV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtHoTenNV.Text);
                BUS_NhanVien.Instance.SuaNhanVien(new ET_NhanVien(txtMaNV.Text, txtHoTenNV.Text, gioiTinh, Convert.ToDateTime(dtpNgaySinh.Text), cboCV.SelectedValue.ToString(), cboChuyenNganh.SelectedValue.ToString(), txtSDT.Text));
                BUS_NhanVien.Instance.HienThiNhanVien(dgvNhanVien);
            }

        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaNV.Clear();
            txtMaNV.Text = BUS_NhanVien.Instance.TaoMaTuDong();
            txtHoTenNV.Clear();
            radNam.Checked = true;
            txtSDT.Clear();
            dtpNgaySinh.Value = DateTime.Now;
            cboCV.SelectedIndex = 0;
            cboChuyenNganh.SelectedIndex = 0;
            btnThem.Enabled = true;
            btnCapNhat.Enabled = false;
            btnXoa.Enabled = false;
            BUS_NhanVien.Instance.HienThiNhanVien(dgvNhanVien);
        }



        private void txtHoTenNV_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtHoTenNV.Text };
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
            if (txtHoTenNV.Text.Length > 50)
            {
                // Cắt chuỗi về 10 ký tự
                txtHoTenNV.Text = txtHoTenNV.Text.Substring(0, 50);

                // Đặt con trỏ chuột ở cuối văn bản
                txtHoTenNV.SelectionStart = txtHoTenNV.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 50 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtHoTenNV_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }        
        }

        private void txtSDT_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_NhanVien.Instance.TimKiemNhanVien(txtTimKiem.Text, dgvNhanVien);
        }

        private void txtSDT_TextChanged(object sender, EventArgs e)
        {
            // Kiểm tra nếu số điện thoại ít hơn 10 ký tự
            if (txtSDT.Text.Length < 10)
            {
                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Số điện thoại phải đủ 10 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else if (txtSDT.Text.Length > 10)
            {
                // Cắt chuỗi về 10 ký tự
                txtSDT.Text = txtSDT.Text.Substring(0, 10);

                // Đặt con trỏ chuột ở cuối văn bản
                txtSDT.SelectionStart = txtSDT.Text.Length;
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
    }
}
