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
    public partial class frmChuanDoan : Form
    {
        public frmChuanDoan()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        private frmMain mainForm;
        public frmChuanDoan(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
            if (this.mainForm == null)
            {
                MessageBox.Show("mainForm is null inside TTBN constructor.");
            }

        }
        public frmChuanDoan(string data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
            txtPhieuKhamBenh.Text = Data;
        }
        private void frmChuanDoan_Load(object sender, EventArgs e)
        {
            btnThemChuanDoan.Enabled = false;
            btnCapNhapChuanDoan.Enabled = false;
            btnLamMoi.Enabled = false;
            if (!string.IsNullOrEmpty(txtPhieuKhamBenh.Text))
            {
                BUS_SuDungDV.Instance.LayNhanVienThucHienKhamChoPhieuKhamBenh(cboNVCD, txtPhieuKhamBenh.Text);
                txtTC.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(txtPhieuKhamBenh.Text);
                txtBN.Text = BUS_ChuanDoan.Instance.LayTTBN(txtPhieuKhamBenh.Text);
                btnThemChuanDoan.Enabled = true;
            }
            dtpTGCD.Format = DateTimePickerFormat.Custom;
            dtpTGCD.CustomFormat = "HH:mm";
            dtpTGCD.ShowUpDown = true;
            dgvDSChuanDoan.ColumnHeadersHeight = 40;
            BUS_ChuanDoan.Instance.XemDSChuanDoanTheoNgay(dgvDSChuanDoan, dtpNgay.Value);
            bool isEmpty = dgvDSChuanDoan.Rows.Count == 0;
            dgvDSChuanDoan.Enabled = !isEmpty;
            dgvDSChuanDoan.Columns[4].Visible = false;
            dgvDSChuanDoan.Columns[5].Visible = false;
            dtpNgay.Value = DateTime.Now;
            dtpNgayChuanDoan.Value = DateTime.Now;
        }

        private void btnThemChuanDoan_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtChuanDoan.Text))
            {
                DialogResult ret = MessageBox.Show("Bạn muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    DateTime ngayThucHien = dtpNgayChuanDoan.Value.Date;
                    TimeSpan thoiGianThucHien = dtpTGCD.Value.TimeOfDay;
                    DateTime ngayGioThucHien = ngayThucHien.Add(thoiGianThucHien);
                    string formattedDate = ngayGioThucHien.ToString("MM/dd/yyyy");
                    DateTime tgKham = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text);
                    TimeSpan thoiGianKhamKhongGiay = new TimeSpan(tgKham.Hour, tgKham.Minute, 0);
                    DateTime thoiGianCD = dtpTGCD.Value;
                    TimeSpan tgCDKhongGiay = new TimeSpan(thoiGianCD.Hour, thoiGianCD.Minute, 0);
                    bool isTimeGreater = tgCDKhongGiay > thoiGianKhamKhongGiay;
                    if (DateTime.Parse(formattedDate).Date >= BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text).Date)
                    {
                        if (isTimeGreater)
                        {
                            string chuanDoan = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtChuanDoan.Text);
                            BUS_ChuanDoan.Instance.ThemTTChuanDoan(new ET_ChuanDoan(txtPhieuKhamBenh.Text, cboNVCD.SelectedValue.ToString(), chuanDoan, ngayGioThucHien));
                            BUS_ChuanDoan.Instance.XemDSChuanDoanTheoNgay(dgvDSChuanDoan, dtpNgay.Value);
                            bool isEmpty = dgvDSChuanDoan.Rows.Count == 0;
                            dgvDSChuanDoan.Enabled = !isEmpty;
                        }
                        else
                        {
                            DateTime ngayKham = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text);
                            string time = ngayKham.ToString("HH:mm tt");
                            MessageBox.Show("Thời gian chuẩn đoán phải lớn hơn thời gian của phiếu khám là " +
                            time, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ngày chuẩn đoán phải lớn hơn hoặc bằng ngày của phiếu khám là " +
                            BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text).ToString("dd/MM/yyyy"), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                }
            }
            else
            {
                MessageBox.Show("Bạn phải nhập chuẩn đoán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void btnCapNhapChuanDoan_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtChuanDoan.Text))
            {
                DialogResult ret = MessageBox.Show("Bạn muốn lưu thông tin đã thay đổi không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    DateTime ngayThucHien = dtpNgayChuanDoan.Value.Date;
                    TimeSpan thoiGianThucHien = dtpTGCD.Value.TimeOfDay;
                    DateTime ngayGioThucHien = ngayThucHien.Add(thoiGianThucHien);
                    string formattedDate = ngayGioThucHien.ToString("MM/dd/yyyy");
                    DateTime tgKham = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text);
                    TimeSpan thoiGianKhamKhongGiay = new TimeSpan(tgKham.Hour, tgKham.Minute, 0);
                    DateTime thoiGianCD = dtpTGCD.Value;
                    TimeSpan tgCDKhongGiay = new TimeSpan(thoiGianCD.Hour, thoiGianCD.Minute, 0);
                    bool isTimeGreater = tgCDKhongGiay > thoiGianKhamKhongGiay;
                    //MessageBox.Show(formattedDate);
                    //MessageBox.Show(Convert.ToString(BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text)));
                    if (DateTime.Parse(formattedDate).Date >= BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text).Date)
                    {
                        if (isTimeGreater)
                        {
                            string chuanDoan = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtChuanDoan.Text);
                            BUS_ChuanDoan.Instance.CapNhatTTChuanDoan(new ET_ChuanDoan(txtPhieuKhamBenh.Text, cboNVCD.SelectedValue.ToString(), chuanDoan, ngayGioThucHien));
                            BUS_ChuanDoan.Instance.XemDSChuanDoanTheoNgay(dgvDSChuanDoan, dtpNgay.Value);
                            bool isEmpty = dgvDSChuanDoan.Rows.Count == 0;
                            dgvDSChuanDoan.Enabled = !isEmpty;
                        }
                        else
                        {
                            DateTime ngayKham = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text);
                            string time = ngayKham.ToString("HH:mm tt");
                            MessageBox.Show("Thời gian chuẩn đoán phải lớn hơn thời gian của phiếu khám là " +
                            time, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ngày chuẩn đoán phải lớn hơn hoặc bằng ngày của phiếu khám là " +
                            BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(txtPhieuKhamBenh.Text).ToString("dd/MM/yyyy"), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                }
            }
        }

        private void txtPhieuKhamBenh_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtPhieuKhamBenh.Text))
            {
                BUS_SuDungDV.Instance.LayNhanVienThucHienKhamChoPhieuKhamBenh(cboNVCD, txtPhieuKhamBenh.Text);
                txtTC.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(txtPhieuKhamBenh.Text);
                txtBN.Text = BUS_ChuanDoan.Instance.LayTTBN(txtPhieuKhamBenh.Text);
                if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(txtPhieuKhamBenh.Text) == false)
                {
                    btnThemChuanDoan.Enabled = false;
                }
                else
                {
                    btnThemChuanDoan.Enabled = true;
                }
            }
        }

        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            BUS_ChuanDoan.Instance.XemDSChuanDoanTheoNgay(dgvDSChuanDoan, dtpNgay.Value);
        }

        private void dgvDSChuanDoan_Click(object sender, EventArgs e)
        {
            btnThemChuanDoan.Enabled = false;
            btnCapNhapChuanDoan.Enabled = true;
            btnLamMoi.Enabled = true;
            if (dgvDSChuanDoan.CurrentRow != null && dgvDSChuanDoan.CurrentCell != null && dgvDSChuanDoan.Rows.Count > 0 && !dgvDSChuanDoan.Rows[dgvDSChuanDoan.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvDSChuanDoan.CurrentCell.RowIndex;
                txtPhieuKhamBenh.Text = dgvDSChuanDoan.Rows[dong].Cells[0].Value.ToString();
                cboNVCD.SelectedValue = dgvDSChuanDoan.Rows[dong].Cells[1].Value.ToString();
                txtChuanDoan.Text = dgvDSChuanDoan.Rows[dong].Cells[2].Value.ToString();
                if (dgvDSChuanDoan.Rows[dong].Cells[3].Value != null && DateTime.TryParse(dgvDSChuanDoan.Rows[dong].Cells[3].Value.ToString(), out DateTime dateValue))
                {
                    // Gán phần ngày cho DateTimePicker
                    dtpNgayChuanDoan.Value = dateValue.Date;
                }
                if (dgvDSChuanDoan.Rows[dong].Cells[3].Value != null && DateTime.TryParse(dgvDSChuanDoan.Rows[dong].Cells[3].Value.ToString(), out DateTime dateTimeValue))
                {
                    // Gán giá trị vào biến hoặc sử dụng biến dateTimeValue
                    DateTime tg = DateTime.Parse(dgvDSChuanDoan.Rows[dong].Cells[3].Value.ToString());
                    dtpTGCD.Value = new DateTime(dtpTGCD.Value.Year, dtpTGCD.Value.Month, dtpTGCD.Value.Day, dateTimeValue.Hour, dateTimeValue.Minute, dateTimeValue.Second);
                }
                else
                {
                    dateTimeValue = DateTime.MinValue;
                }
            }
            else
            {
                MessageBox.Show("Bạn phải nhập chuẩn đoán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtPhieuKhamBenh.Clear();
            txtBN.Clear();
            txtTC.Clear();
            txtTK.Clear();
            btnThemChuanDoan.Enabled = false;
            btnCapNhapChuanDoan.Enabled = false;
            btnLamMoi.Enabled = false;
            BUS_ChuanDoan.Instance.XemDSChuanDoanTheoNgay(dgvDSChuanDoan, dtpNgay.Value);
            bool isEmpty = dgvDSChuanDoan.Rows.Count == 0;
            dgvDSChuanDoan.Enabled = !isEmpty;
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_ChuanDoan.Instance.TimKiemDuaVaoTenBN(dgvDSChuanDoan, txtTK.Text, dtpNgay.Value);
            bool isEmpty = dgvDSChuanDoan.Rows.Count == 0;
            dgvDSChuanDoan.Enabled = !isEmpty;
        }

        private void txtChuanDoan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != ' ' && e.KeyChar != '-' &&
                !char.IsControl(e.KeyChar) && e.KeyChar != ',' && e.KeyChar != '/' && e.KeyChar != '.')
            {
                e.Handled = true;
                MessageBox.Show("Nhập được chữ và số và các dấu -,/,. hoặc dấu ,", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            if (txtChuanDoan.Text.Length > 999 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Nhập quá ký tự tự cho phép là 1000", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thoát khỏi giao diện quản lý chuẩn đoán không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void txtTK_TextChanged(object sender, EventArgs e)
        {
            if (txtTK.Text != null)
            {
                btnLamMoi.Enabled = true;
            }
            else
            {
                btnLamMoi.Enabled = false;
            }
        }

        private void btnSuDungDV_Click(object sender, EventArgs e)
        {
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmSuDungDichVu());
        }
    }
}
