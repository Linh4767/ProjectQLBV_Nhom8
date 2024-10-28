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
    public partial class frmSoBenhAn : Form
    {
        public frmSoBenhAn()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        private frmMain mainForm;
        public frmSoBenhAn(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
            if (this.mainForm == null)
            {
                MessageBox.Show("mainForm is null inside TTBN constructor.");
            }

        }
        public frmSoBenhAn(string data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
            txtBenhNhan.Text = Data;
        }
        private void frmSoBenhAn_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtBenhNhan.Text))
            {
                txtMaSoBA.Text = BUS_SoBenhAn.Instance.TaoMaSoBATuDong(txtBenhNhan.Text);
            }
            else
            {
                txtMaSoBA.Text = String.Empty;
                txtBenhNhan.Text = String.Empty;
            }
            BUS_SoBenhAn.Instance.XemDSHoSoBA(dgvDSSoBA);
            dtpNgayLapSo.Value = DateTime.Now;
            btnSuaSBA.Enabled = false;
            dgvDSSoBA.ColumnHeadersHeight = 40;
            dgvDSSoBA.Columns[4].Visible = false;
            var textBox = new List<string> { txtBenhNhan.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textBox))
            {
                btnThemSBA.Enabled = true;
            }
            else
            {
                btnThemSBA.Enabled = false;
            }
        }

        private void txtBenhNen_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && e.KeyChar != ' ')
            {
                e.Handled = true;
                MessageBox.Show("Chỉ được nhập chữ và số", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            if (txtBenhNen.Text.Length > 99 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Bạn đang nhập quá ký tự cho phép là 100", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        public void ClearInputSBA()
        {
            txtBenhNhan.Text = String.Empty;
            txtMaSoBA.Text = String.Empty;
            //txtMaSoBA.Text = BUS_SoBenhAn.Instance.TaoMaSoBATuDong(txtBenhNhan.Text);
            txtBenhNen.Text = String.Empty;
            dtpNgayLapSo.Value = DateTime.Now;
        }

        private void btnThemSBA_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thực hiện thêm không ?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string[] parts = (txtBenhNhan.Text).Split('-');
                string maBN = parts[0].Trim();
                txtBenhNen.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtBenhNen.Text);
                BUS_SoBenhAn.Instance.ThemSoBA(new ET_SoBA(txtMaSoBA.Text, txtBenhNen.Text, maBN, dtpNgayLapSo.Value));
                BUS_SoBenhAn.Instance.XemDSHoSoBA(dgvDSSoBA);
                ClearInputSBA();
                btnThemSBA.Enabled = false;
            }
        }

        private void dgvDSSoBA_Click(object sender, EventArgs e)
        {
            int dong = dgvDSSoBA.CurrentCell.RowIndex;
            txtMaSoBA.Text = dgvDSSoBA.Rows[dong].Cells[0].Value?.ToString() ?? "";
            txtBenhNen.Text = dgvDSSoBA.Rows[dong].Cells[1].Value?.ToString() ?? "";
            var dateValue = dgvDSSoBA.Rows[dong].Cells[3].Value;
            if (dateValue != null && dateValue != DBNull.Value)
            {
                dtpNgayLapSo.Value = Convert.ToDateTime(dateValue);
            }
            else
            {
                dtpNgayLapSo.Value = DateTime.Now;
            }
            string benhNhan = dgvDSSoBA.Rows[dong].Cells[2].Value?.ToString() ?? "";
            if (benhNhan != null)
            {
                txtBenhNhan.Text = benhNhan + "-" + BUS_SoBenhAn.Instance.LayTenBNNhoMaBN(benhNhan);
            }
            else
            {
                txtBenhNhan.Text = String.Empty;
            }
            btnThemSBA.Enabled = false;
            btnSuaSBA.Enabled = true;
        }

        private void btnSuaSBA_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn lưu thông tin thay đổi không ?", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string[] parts = (txtBenhNhan.Text).Split('-');
                string maBN = parts[0].Trim();
                txtBenhNen.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtBenhNen.Text);
                BUS_SoBenhAn.Instance.SuaSoBA(new ET_SoBA(txtMaSoBA.Text, txtBenhNen.Text, maBN, dtpNgayLapSo.Value));
                BUS_SoBenhAn.Instance.XemDSHoSoBA(dgvDSSoBA);
                ClearInputSBA();
                btnSuaSBA.Enabled = false;
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát khỏi giao diện quản lý sổ bệnh án không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnPhieuKB_Click(object sender, EventArgs e)
        {
            mainForm.openChildForm(new frmPhieuKhamBenh());
        }
    }
}
