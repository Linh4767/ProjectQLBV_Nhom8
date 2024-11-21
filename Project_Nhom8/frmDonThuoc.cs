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
    public partial class frmDonThuoc : Form
    {
        public frmDonThuoc()
        {
            InitializeComponent();
        }
        private string maNhanVien { get; set; }
        private string maPhieuKham { get; set; }
        private string maKhoa { get; set; }
        private int soLuongKe { get; set; }
        public frmDonThuoc(string maNV, string maPKB)
        {
            InitializeComponent();
            maNhanVien = maNV;
            maPhieuKham = maPKB;
        }
        //Tải dữ liệu
        private void TaiDuLieu()
        {
            BUS_ChiTietDonThuoc.Instance.LayDSThuocCuaDonThuoc(txtMaDT.Text, dgvChiTietDonThuoc);
        }

        //Làm mới dữ liệu
        private void LamMoi()
        {
            txtMaThuoc.Text = string.Empty;
            txtTenThuoc.Text = string.Empty;
            txtSoLuong.Text = string.Empty;
            txtLoaiThuoc.Text = string.Empty;
            txtCachDung.Text = string.Empty;
            txtHamLuong.Text = string.Empty;
            cboMaLo.DataSource = null;
            btnSuaThuoc.Enabled = false;
            btnXoaThuoc.Enabled = false;
            btnThemThuoc.Enabled = true;
        }
        private void frmDonThuoc_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(maNhanVien) && !string.IsNullOrEmpty(maPhieuKham))
            {
                txtMaDT.Text = BUS_DonThuoc.Instance.TaoMaDonThuoc(maPhieuKham);
                txtMaNV.Text = BUS_ChiTietDonThuoc.Instance.LayTenNV(maNhanVien);
                txtPKB.Text = maPhieuKham;
                txtBN.Text = BUS_ChiTietDonThuoc.Instance.LayTenBN(maPhieuKham);
                maKhoa = BUS_ChiTietDonThuoc.Instance.LayKhoaTuNV(maNhanVien);
                txtThanhTien.Text = BUS_ChiTietDonThuoc.Instance.TongTienThuoc(txtMaDT.Text).ToString();

                TaiDuLieu();
                dgvChiTietDonThuoc.Columns[4].Visible = false;
            }

            dtpNgayKe.Value = DateTime.Now;
            dtpNgayKe.Format = DateTimePickerFormat.Custom;
            dtpNgayKe.CustomFormat = "dd/MM/yyyy HH:mm:ss";
            //độ rộng cột
            dgvChiTietDonThuoc.ColumnHeadersHeight = 40;
            dgvGoiYThuoc.ColumnHeadersHeight = 40;
            btnSuaThuoc.Enabled = false;
            btnThemThuoc.Enabled = false;
            btnXoaThuoc.Enabled = false;
            btnInDT.Enabled = false;
        }

        private void btnThemDonThuoc_Click(object sender, EventArgs e)
        {
            string kQua = BUS_DonThuoc.Instance.ThemDonThuoc(new ET_DonThuoc(txtMaDT.Text, dtpNgayKe.Value, maNhanVien, maPhieuKham));
            MessageBox.Show(kQua, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            if (kQua == "Thêm thành công")
            {
                //maPhieuKham = "";
                btnThemDonThuoc.Enabled = false;
                btnThemThuoc.Enabled = true;
                btnInDT.Enabled = true;
                TaiDuLieu();
            }
            else
            {
                MessageBox.Show(kQua, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnThemThuoc_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCachDung.Text))
            {
                MessageBox.Show("Vui lòng nhập hướng dẫn cách dùng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (string.IsNullOrEmpty(txtSoLuong.Text) || txtSoLuong.Text == "0")
            {
                MessageBox.Show("Vui lòng nhập số lượng thuốc cần kê đơn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            soLuongKe = int.Parse(txtSoLuong.Text);
            string kQua = BUS_ChiTietDonThuoc.Instance.ThemThuoc(new ET_ChiTietDonThuoc(txtMaDT.Text, txtMaThuoc.Text, cboMaLo.SelectedValue.ToString(), soLuongKe, txtCachDung.Text), maKhoa, soLuongKe);
            MessageBox.Show(kQua, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            if (kQua == "Thêm thành công")
            {
                txtThanhTien.Text = BUS_ChiTietDonThuoc.Instance.TongTienThuoc(txtMaDT.Text).ToString();
                TaiDuLieu();
                LamMoi();
            }
            else
            {
                MessageBox.Show(kQua, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnXoaThuoc_Click(object sender, EventArgs e)
        {
            DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dialog == DialogResult.Yes)
            {
                //XoaThuoc(maDT, maThuoc, maLo, maKhoa)
                if (!string.IsNullOrEmpty(txtMaDT.Text) && !string.IsNullOrEmpty(txtMaThuoc.Text) && !string.IsNullOrEmpty(cboMaLo.SelectedValue.ToString()) && !string.IsNullOrEmpty(maKhoa))
                {
                    string kq = BUS_ChiTietDonThuoc.Instance.XoaThuoc(txtMaDT.Text, txtMaThuoc.Text, cboMaLo.SelectedValue.ToString(), maKhoa);
                    MessageBox.Show(kq, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    if (kq == "Loại bỏ thành công")
                    {
                        //Cập nhật lại dữ liệu
                        txtThanhTien.Text = BUS_ChiTietDonThuoc.Instance.TongTienThuoc(txtMaDT.Text).ToString();
                        TaiDuLieu();
                        LamMoi();
                    }
                }
            }
        }

        private void btnSuaThuoc_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtCachDung.Text))
            {
                MessageBox.Show("Vui lòng nhập hướng dẫn cách dùng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            if (string.IsNullOrEmpty(txtSoLuong.Text) || txtSoLuong.Text == "0")
            {
                MessageBox.Show("Vui lòng nhập số lượng thuốc cần kê đơn", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            soLuongKe = int.Parse(txtSoLuong.Text);
            string kQua = BUS_ChiTietDonThuoc.Instance.CapNhatThuoc(new ET_ChiTietDonThuoc(txtMaDT.Text, txtMaThuoc.Text, cboMaLo.SelectedValue.ToString(), soLuongKe, txtCachDung.Text), soLuongKe, maKhoa);
            MessageBox.Show(kQua, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            if (kQua == "Cập nhật thành công")
            {
                txtThanhTien.Text = BUS_ChiTietDonThuoc.Instance.TongTienThuoc(txtMaDT.Text).ToString();
                TaiDuLieu();
                LamMoi();
            }
            else
            {
                MessageBox.Show(kQua, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtTimThuoc_TextChanged(object sender, EventArgs e)
        {
            string key = txtTimThuoc.Text.Trim();

            dgvGoiYThuoc.DataSource = null;
            if (!string.IsNullOrEmpty(key))
            {
                BUS_ChiTietDonThuoc.Instance.LayDSThuocGoiY(key, maKhoa, dgvGoiYThuoc);
            }
        }

        private void dgvGoiYThuoc_Click(object sender, EventArgs e)
        {
            if (dgvGoiYThuoc.CurrentRow != null && !dgvGoiYThuoc.Rows[dgvGoiYThuoc.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvGoiYThuoc.CurrentCell.RowIndex;

                txtMaThuoc.Text = dgvGoiYThuoc.Rows[dong].Cells[0].Value?.ToString();
                txtTenThuoc.Text = dgvGoiYThuoc.Rows[dong].Cells[1].Value.ToString();
                txtLoaiThuoc.Text = dgvGoiYThuoc.Rows[dong].Cells[2].Value.ToString();
                txtHamLuong.Text = dgvGoiYThuoc.Rows[dong].Cells[3].Value.ToString();
            }
        }

        private void dgvChiTietDonThuoc_Click(object sender, EventArgs e)
        {
            if (dgvChiTietDonThuoc.CurrentRow != null && !dgvChiTietDonThuoc.Rows[dgvChiTietDonThuoc.CurrentRow.Index].IsNewRow)
            {
                btnSuaThuoc.Enabled = true;
                btnXoaThuoc.Enabled = true;
                btnThemThuoc.Enabled = false;

                int dong = dgvChiTietDonThuoc.CurrentCell.RowIndex;

                txtMaThuoc.Text = dgvChiTietDonThuoc.Rows[dong].Cells[0].Value?.ToString();
                txtTenThuoc.Text = dgvChiTietDonThuoc.Rows[dong].Cells[1].Value.ToString();
                cboMaLo.SelectedValue = dgvChiTietDonThuoc.Rows[dong].Cells[2].Value.ToString();

                txtSoLuong.Text = dgvChiTietDonThuoc.Rows[dong].Cells[3].Value.ToString();
                txtLoaiThuoc.Text = dgvChiTietDonThuoc.Rows[dong].Cells[4].Value.ToString();
                txtHamLuong.Text = dgvChiTietDonThuoc.Rows[dong].Cells[6].Value.ToString();
                txtCachDung.Text = dgvChiTietDonThuoc.Rows[dong].Cells[5].Value.ToString();
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

        private void txtMaThuoc_TextChanged(object sender, EventArgs e)
        {
            string maThuoc = txtMaThuoc.Text.Trim();
            cboMaLo.DataSource = null;
            if (!string.IsNullOrEmpty(maThuoc))
            {
                BUS_ChiTietDonThuoc.Instance.LayLoDuaVaoMaThuoc(maThuoc, maKhoa, cboMaLo);
            }
        }

        private void txtSoLuong_TextChanged(object sender, EventArgs e)
        {
            // Kiểm tra nếu giá trị nhập vào lớn 540(do tối đa chỉ cho kê trong thời gian 3 tháng, ngày 3 lần sử dụng, 1 lần 2 đơn vị
            if (int.TryParse(txtSoLuong.Text, out int value))
            {
                if (value > 540)
                {
                    MessageBox.Show("Giá trị không được lớn hơn 540.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtSoLuong.Text = ""; // Xóa giá trị không hợp lệ
                }
            }
        }

        private void txtSoLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ được nhập số và phím điều khiển (Backspace, Delete)
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void btnInDT_Click(object sender, EventArgs e)
        {
            string dataToSend = txtMaDT.Text;
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmInDonThuoc(dataToSend));
        }

        private void txtCachDung_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Nhập được chữ và số", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            if (txtCachDung.Text.Length > 499 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Nhập quá ký tự tự cho phép là 500", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
