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
    public partial class frmPhieuKhamBenh : Form
    {
        public frmPhieuKhamBenh()
        {
            InitializeComponent();
        }
        private frmMain mainForm;
        public frmPhieuKhamBenh(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
        }
        private void frmPhieuKhamBenh_Load(object sender, EventArgs e)
        {
            cboBenhNhan.Items.Clear();
            BUS_SoBenhAn.Instance.DoDLBenhNhanVaoComboBox(cboBenhNhan);
            //BUS_PhieuKB.Instance.
            txtMaPhieuKB.Text = BUS_PhieuKB.Instance.TaoMaPhieuKBTuDong(cboBenhNhan.SelectedValue.ToString());
            txtSoPhieu.Text = BUS_PhieuKB.Instance.TaoTuDongSoPhieu();
            dtpNgayKham.Value = DateTime.Now;
            dtpNgayKham.Format = DateTimePickerFormat.Custom;
            dtpNgayKham.CustomFormat = "dd/MM/yyyy HH:mm:ss";
            btnThemPhieuKB.Enabled = false;
            btnXoa.Enabled = false;
            btnCapNhapPhieuKhamBenh.Enabled = false;
            dgvDSPhieuKB.ColumnHeadersHeight = 40;
            BUS_PhieuKB.Instance.HienThiDSPhieuKB(dgvDSPhieuKB, cboBenhNhan.SelectedValue.ToString());
            dgvDSPhieuKB.Columns[6].Visible = false;
            dgvDSPhieuKB.Columns[7].Visible = false;
        }

        private void txtTrieuChung_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && e.KeyChar != ' ' && e.KeyChar != ',' && e.KeyChar != '.')
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập ký tự đặc biệt trừ dấu , hoặc .", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            if (txtTrieuChung.Text.Length > 99 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Bạn đang nhập quá ký tự cho phép là 100", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void cboBenhNhan_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboBenhNhan.SelectedValue != null)
            {
                txtMaPhieuKB.Text = BUS_PhieuKB.Instance.TaoMaPhieuKBTuDong(cboBenhNhan.SelectedValue.ToString());
                BUS_PhieuKB.Instance.HienThiDSPhieuKB(dgvDSPhieuKB, cboBenhNhan.SelectedValue.ToString());
            }
        }

        private void txtThongTinLamSang_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && e.KeyChar != ' ' && e.KeyChar != ',' && e.KeyChar != '/' && e.KeyChar != '.')
            {
                e.Handled = true;
                MessageBox.Show("Không được nhập ký tự đặc biệt trừ dấu (, hoặc / hay .)", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            if (txtTrieuChung.Text.Length > 99 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Bạn đang nhập quá ký tự cho phép là 100", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtTrieuChung_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTrieuChung.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemPhieuKB.Enabled = true;
                btnCapNhapPhieuKhamBenh.Enabled = true;
            }
            else
            {
                btnThemPhieuKB.Enabled = false;
                btnCapNhapPhieuKhamBenh.Enabled = false;
            }
        }
        public void ClearInputPKB()
        {
            txtMaPhieuKB.Text = BUS_PhieuKB.Instance.TaoMaPhieuKBTuDong(cboBenhNhan.SelectedValue.ToString());
            txtSoPhieu.Text = BUS_PhieuKB.Instance.TaoTuDongSoPhieu();
            dtpNgayKham.Value = DateTime.Now;
            txtTrieuChung.Clear();
            txtThongTinLamSang.Clear();
            cboBenhNhan.Enabled = true;
        }

        private void btnThemPhieuKB_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string trieuChung = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTrieuChung.Text);
                string thongTinLamSang = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtThongTinLamSang.Text);
                BUS_PhieuKB.Instance.ThemPhieuKB(new ET_PhieuKhamBenh(txtMaPhieuKB.Text, int.Parse(txtSoPhieu.Text), cboBenhNhan.SelectedValue.ToString(), trieuChung, thongTinLamSang, dtpNgayKham.Value));
                BUS_PhieuKB.Instance.HienThiDSPhieuKB(dgvDSPhieuKB, cboBenhNhan.SelectedValue.ToString());
                ClearInputPKB();
            }
        }

        private void btnCapNhapPhieuKhamBenh_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn lưu thông tin thay đổi không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string trieuChung = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTrieuChung.Text);
                string thongTinLamSang = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtThongTinLamSang.Text);
                BUS_PhieuKB.Instance.SuaPhieuKB(new ET_PhieuKhamBenh(txtMaPhieuKB.Text, int.Parse(txtSoPhieu.Text), cboBenhNhan.SelectedValue.ToString(), trieuChung, thongTinLamSang, dtpNgayKham.Value));
                BUS_PhieuKB.Instance.HienThiDSPhieuKB(dgvDSPhieuKB, cboBenhNhan.SelectedValue.ToString());
                ClearInputPKB();
                btnXoa.Enabled = false;
            }
            cboBenhNhan.Enabled = true;
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            ClearInputPKB();
            btnCapNhapPhieuKhamBenh.Enabled = false;
            btnXoa.Enabled = false;
        }

        private void dgvDSPhieuKB_Click(object sender, EventArgs e)
        {
            if (dgvDSPhieuKB.CurrentRow != null && !dgvDSPhieuKB.Rows[dgvDSPhieuKB.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvDSPhieuKB.CurrentCell.RowIndex;
                txtMaPhieuKB.Text = dgvDSPhieuKB.Rows[dong].Cells[0].Value?.ToString() ?? "";
                txtSoPhieu.Text = dgvDSPhieuKB.Rows[dong].Cells[1].Value?.ToString() ?? "";
                cboBenhNhan.SelectedValue = dgvDSPhieuKB.Rows[dong].Cells[2].Value?.ToString() ?? "";
                txtTrieuChung.Text = dgvDSPhieuKB.Rows[dong].Cells[3].Value?.ToString() ?? "";
                txtThongTinLamSang.Text = dgvDSPhieuKB.Rows[dong].Cells[4].Value?.ToString() ?? "";
                var dateValue = dgvDSPhieuKB.Rows[dong].Cells[5].Value;
                if (dateValue != null && dateValue != DBNull.Value)
                {
                    dtpNgayKham.Value = Convert.ToDateTime(dateValue);
                }
                else
                {
                    dtpNgayKham.Value = DateTime.Now;
                }
                cboBenhNhan.Enabled = false;
                btnThemPhieuKB.Enabled = false;
                btnXoa.Enabled = true;
                btnCapNhapPhieuKhamBenh.Enabled = true;
            }
            btnThemPhieuKB.Enabled = false;
            var textbox = new List<string> { txtTrieuChung.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnCapNhapPhieuKhamBenh.Enabled = true;
            }
            else
            {
                btnCapNhapPhieuKhamBenh.Enabled = false;
            }

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát khỏi giao diện phiếu khám bệnh không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnKham_Click(object sender, EventArgs e)
        {
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmKhamBenh());
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(txtMaPhieuKB.Text) == true)
            {
                DialogResult ret = MessageBox.Show("Bạn muốn thực hiện xóa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    BUS_PhieuKB.Instance.XoaPhieuKham(dgvDSPhieuKB);
                    BUS_PhieuKB.Instance.HienThiDSPhieuKB(dgvDSPhieuKB, cboBenhNhan.SelectedValue.ToString());
                    ClearInputPKB();
                    btnXoa.Enabled = false;
                    btnCapNhapPhieuKhamBenh.Enabled = false;
                }
            }
            else
            {
                MessageBox.Show("Phiếu khám bệnh đã thực hiện khám nên không thể xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
