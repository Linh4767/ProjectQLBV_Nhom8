using BUS;
using ET;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project_Nhom8
{
    public partial class frmSuDungDichVu : Form
    {
        public frmSuDungDichVu()
        {
            InitializeComponent();
        }
        private frmMain mainForm;
        public frmSuDungDichVu(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
        }
        private void frmSuDungDichVu_Load(object sender, EventArgs e)
        {
            txtKetQuaDichVu.Enabled = false;
            dtpDSNgaySuDungDV.Value = DateTime.Now;
            dtpNgayThucHienDV.Value = DateTime.Now;
            BUS_SuDungDV.Instance.LayDSKhoaLoadVaoCombobox(cboKhoa);
            BUS_SuDungDV.Instance.LayDSPhieuKhamBenhDaKham(cboPhieuKhamBenhSuDungDV, dtpDSNgaySuDungDV.Value);
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                string formattedDate = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).ToString("dd/MM/yyyy");
                txtMaSuDungDV.Text = BUS_SuDungDV.Instance.TaoMaDVTuDong(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                BUS_SuDungDV.Instance.LayNhanVienThucHienKhamChoPhieuKhamBenh(cboNVYeuCauDV, cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                txtNgayYC.Text = formattedDate;
                if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString())){
                    btnThemSuDung.Enabled = true;
                }
                else
                {
                    btnThemSuDung.Enabled = false;
                }
            }
            dtpNgayThucHienDV.Enabled = false;
            cboPhongDichVu.Enabled = false;
            cboNhanVienThucHienDichVu.Enabled = false;
            txtKetQuaDichVu.Enabled = false;
            cboPhongDichVu.DropDownHeight = 300;
            cboPhieuKhamBenhSuDungDV.DropDownHeight = 300;
            cboNhanVienThucHienDichVu.DropDownHeight = 300;
            cboKhoa.DropDownHeight = 300;
            cboDV.DropDownHeight = 300;
            cboNVYeuCauDV.DropDownHeight = 300;
            if (cboKhoa.SelectedValue != null)
            {
                BUS_SuDungDV.Instance.HienThiDSDVTheoKhoa(cboDV, cboKhoa.SelectedValue.ToString());
            }
            BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
            bool isEmpty = dgvSuDungDV.Rows.Count == 0;
            dgvSuDungDV.Enabled = !isEmpty;
            mtbNgayYC.Mask = "00:00"; // Định dạng HH:mm:ss
            mtbNgayYC.Text = DateTime.Now.ToString("HH:mm");
            dtpTGThucHienDV.Format = DateTimePickerFormat.Custom;
            dtpTGThucHienDV.CustomFormat = "HH:mm";
            dtpTGThucHienDV.ShowUpDown = true;
            dtpTGThucHienDV.Enabled = false;
            dgvSuDungDV.ColumnHeadersHeight = 40;
            btnXoa.Enabled = false;
            btnSuaSD.Enabled = false;
            btnLamMoi.Enabled = false;
        }


        private void dtpDSNgaySuDungDV_ValueChanged(object sender, EventArgs e)
        {
            BUS_SuDungDV.Instance.LayDSPhieuKhamBenhDaKham(cboPhieuKhamBenhSuDungDV, dtpDSNgaySuDungDV.Value);
            BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
            bool isEmpty = dgvSuDungDV.Rows.Count == 0;
            dgvSuDungDV.Enabled = !isEmpty;
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()))
                {
                    btnThemSuDung.Enabled = true;
                }
                else
                {
                    btnThemSuDung.Enabled = false;
                }
            }
        }

        private void cboPhieuKhamBenhSuDungDV_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                string formattedDate = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).ToString("dd/MM/yyyy");
                txtMaSuDungDV.Text = BUS_SuDungDV.Instance.TaoMaDVTuDong(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                BUS_SuDungDV.Instance.LayNhanVienThucHienKhamChoPhieuKhamBenh(cboNVYeuCauDV, cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                txtTien.Text = tienSuDung.ToString("F0");
                txtNgayYC.Text = formattedDate;
                if (cboKhoa.SelectedValue != null)
                {
                    BUS_SuDungDV.Instance.LayPhongTheoPhanCong(cboPhongDichVu, dtpNgayThucHienDV.Value.Date, dtpTGThucHienDV.Value, cboKhoa.SelectedValue.ToString());
                    if (cboPhongDichVu.SelectedValue != null)
                    {
                        BUS_SuDungDV.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVienThucHienDichVu, dtpNgayThucHienDV.Value, dtpTGThucHienDV.Value, cboPhongDichVu.SelectedValue.ToString());
                    }
                }
                if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()))
                {
                    btnThemSuDung.Enabled = true;
                }
                else
                {
                    btnThemSuDung.Enabled = false;
                }
            }
        }

        private void cboKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboKhoa.SelectedValue != null)
            {
                BUS_SuDungDV.Instance.HienThiDSDVTheoKhoa(cboDV, cboKhoa.SelectedValue.ToString());
                BUS_SuDungDV.Instance.LayPhongTheoPhanCong(cboPhongDichVu, dtpNgayThucHienDV.Value.Date, dtpTGThucHienDV.Value, cboKhoa.SelectedValue.ToString());
                if (cboPhongDichVu.SelectedValue != null)
                {
                    BUS_SuDungDV.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVienThucHienDichVu, dtpNgayThucHienDV.Value, dtpTGThucHienDV.Value, cboPhongDichVu.SelectedValue.ToString());
                }
            }
        }

        private void mtbNgayYC_Leave(object sender, EventArgs e)
        {
            // Tách giờ, phút, giây từ giá trị trong MaskedTextBox
            string input = mtbNgayYC.Text;
            string[] timeParts = input.Split(':');

            if (timeParts.Length == 2)
            {
                int hours = int.Parse(timeParts[0]);
                int minutes = int.Parse(timeParts[1]);

                // Kiểm tra giờ
                if (hours < 0 || hours > 23)
                {
                    MessageBox.Show("Giờ phải từ 00 đến 23.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning); ;
                    mtbNgayYC.Focus();
                    return;
                }

                // Kiểm tra phút
                if (minutes < 0 || minutes > 59)
                {
                    MessageBox.Show("Phút phải từ 00 đến 59.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    mtbNgayYC.Focus();
                    return;
                }
            }
            else
            {
                MessageBox.Show("Định dạng không hợp lệ. Vui lòng nhập theo định dạng HH:mm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                mtbNgayYC.Focus();
            }
        }

        private void dtpNgayThucHienDV_ValueChanged(object sender, EventArgs e)
        {
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                if (cboKhoa.SelectedValue != null)
                {
                    BUS_SuDungDV.Instance.LayPhongTheoPhanCong(cboPhongDichVu, dtpNgayThucHienDV.Value.Date, dtpTGThucHienDV.Value, cboKhoa.SelectedValue.ToString());
                    if (cboPhongDichVu.SelectedValue != null)
                    {
                        BUS_SuDungDV.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVienThucHienDichVu, dtpNgayThucHienDV.Value, dtpTGThucHienDV.Value, cboPhongDichVu.SelectedValue.ToString());
                    }
                }
                if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()))
                {
                    btnThemSuDung.Enabled = true;
                }
                else
                {
                    btnThemSuDung.Enabled = false;
                }
                //if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
                //{
                //    if (BUS_SuDungDV.Instance.KiemTraPKBMoiNhat(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()) == false)
                //    {
                //        btnThemSuDung.Enabled = false;
                //    }
                //}
            }
        }

        private void txtKetQuaDichVu_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != ' ' && e.KeyChar != '-' &&
                !char.IsControl(e.KeyChar) && e.KeyChar != ',' && e.KeyChar != '/' && e.KeyChar != '.')
            {
                e.Handled = true;
                MessageBox.Show("Nhập được chữ và số và các dấu -,/,. hoặc dấu ,", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            if (txtKetQuaDichVu.Text.Length > 499 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Nhập quá ký tự tự cho phép là 500", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dtpTGThucHienDV_ValueChanged(object sender, EventArgs e)
        {
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                if (cboKhoa.SelectedValue != null)
                {
                    BUS_SuDungDV.Instance.LayPhongTheoPhanCong(cboPhongDichVu, dtpNgayThucHienDV.Value.Date, dtpTGThucHienDV.Value, cboKhoa.SelectedValue.ToString());
                    if (cboPhongDichVu.SelectedValue != null)
                    {
                        BUS_SuDungDV.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVienThucHienDichVu, dtpNgayThucHienDV.Value, dtpTGThucHienDV.Value, cboPhongDichVu.SelectedValue.ToString());
                    }
                }
                if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()))
                {
                    btnThemSuDung.Enabled = true;
                }
                else
                {
                    btnThemSuDung.Enabled = false;
                }
            }
        }

        private void cboPhongDichVu_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboPhongDichVu.SelectedValue != null)
            {
                BUS_SuDungDV.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVienThucHienDichVu, dtpNgayThucHienDV.Value, dtpTGThucHienDV.Value, cboPhongDichVu.SelectedValue.ToString());
            }
            else
            {
                cboNhanVienThucHienDichVu.DataSource = null;
            }
        }

        private void btnThemSuDung_Click(object sender, EventArgs e)
        {
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                if ((DateTime.Parse(mtbNgayYC.Text).TimeOfDay > BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).TimeOfDay))
                {
                    DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ret == DialogResult.Yes)
                    {
                        DateTime ngayThucHien = dtpNgayThucHienDV.Value.Date;
                        TimeSpan thoiGianThucHien = dtpTGThucHienDV.Value.TimeOfDay;
                        DateTime ngayGioThucHien = ngayThucHien.Add(thoiGianThucHien);
                        string ngayYC = txtNgayYC.Text;
                        string thoiGianYC = mtbNgayYC.Text;
                        string ngayThoiGianYC = $"{ngayYC} {thoiGianYC}"; // "2024-11-01 14:30"                        
                        DateTime ngayGioYC = DateTime.ParseExact(ngayThoiGianYC, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                        string maNVYC = cboNVYeuCauDV.SelectedValue.ToString();
                        string maPKB = cboPhieuKhamBenhSuDungDV.SelectedValue.ToString();
                        string maDV = cboDV.SelectedValue.ToString();
                        if (!string.IsNullOrEmpty(maNVYC) && !string.IsNullOrEmpty(maPKB) && !string.IsNullOrEmpty(maDV))
                        {
                            string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKetQuaDichVu.Text);
                            BUS_SuDungDV.Instance.ThemThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayGioThucHien, ngayGioYC, null,
                                null, ketQua, txtMaSuDungDV.Text));
                            BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                            bool isEmpty = dgvSuDungDV.Rows.Count == 0;
                            dgvSuDungDV.Enabled = !isEmpty;
                            decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                            txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                            txtMaSuDungDV.Text = BUS_SuDungDV.Instance.TaoMaDVTuDong(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                        }
                        else
                        {
                            MessageBox.Show("Vui lòng điền đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }

                    }
                }
                else
                {
                    DateTime ngayKham = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                    string time = ngayKham.ToString("HH:mm tt");
                    MessageBox.Show("Thời gian yêu cầu phải lớn hơn thời gian đi khám của phiếu khám bệnh: " + time, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Không đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSuaSD_Click(object sender, EventArgs e)
        {
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                if ((DateTime.Parse(mtbNgayYC.Text).TimeOfDay > BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).TimeOfDay))
                {
                    string ngayYC = txtNgayYC.Text;
                    DateTime ngayGioYC = DateTime.ParseExact(ngayYC, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                    DateTime thoiGianTH = dtpTGThucHienDV.Value;
                    TimeSpan thoiGianKhongGiay = new TimeSpan(thoiGianTH.Hour, thoiGianTH.Minute, 0);
                    TimeSpan thoiGianYeuCau = DateTime.Parse(mtbNgayYC.Text).TimeOfDay;
                    bool isSameDate = dtpNgayThucHienDV.Value.Date == ngayGioYC.Date;
                    bool isTimeGreater = thoiGianKhongGiay > thoiGianYeuCau;
                    if (isSameDate && !isTimeGreater)
                    {
                        MessageBox.Show("Cùng ngày yêu cầu nên thời gian thực hiện dịch vụ phải lớn hơn" + thoiGianYeuCau, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    //else if (BUS_SuDungDV.Instance.KiemTraXemPhaiDVPT(cboDV.SelectedValue.ToString()) == true && BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()) == true)
                    //{
                    //    MessageBox.Show("Thực hiện phẫu thuật thì phải có chẩn đoán", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    //}
                    else if (BUS_SuDungDV.Instance.KiemTraXemPhaiDVPT(cboDV.SelectedValue.ToString()) == true && BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()) == false)
                    {

                        DateTime tgcd = BUS_SuDungDV.Instance.LayTGCD(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                        // So sánh thời gian trong ngày
                        bool isSameTGCD = dtpTGThucHienDV.Value.TimeOfDay >= tgcd.TimeOfDay;
                        if (dtpNgayThucHienDV.Value.Date == BUS_SuDungDV.Instance.LayTGCD(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).Date && isSameTGCD)
                        {
                            DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện lưu thay đổi không !?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (ret == DialogResult.Yes)
                            {
                                DateTime ngayThucHien = dtpNgayThucHienDV.Value.Date;
                                TimeSpan thoiGianThucHien = dtpTGThucHienDV.Value.TimeOfDay;
                                DateTime ngayGioThucHien = ngayThucHien.Add(thoiGianThucHien);
                                string thoiGianYC = mtbNgayYC.Text;
                                string ngayThoiGianYC = $"{ngayYC} {thoiGianYC}";
                                DateTime ngayYeuCau = DateTime.ParseExact(ngayThoiGianYC, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                                string maNVYC = cboNVYeuCauDV.SelectedValue.ToString();
                                string maPKB = cboPhieuKhamBenhSuDungDV.SelectedValue.ToString();
                                string maDV = cboDV.SelectedValue.ToString();
                                //string maPhong = cboPhongDichVu.SelectedValue.ToString();
                                //string maNVTH = cboNhanVienThucHienDichVu.SelectedValue.ToString();
                                if (!string.IsNullOrEmpty(maNVYC) && !string.IsNullOrEmpty(maPKB) &&
                                    !string.IsNullOrEmpty(maDV) && cboPhongDichVu.SelectedValue != null &&
                                    cboNhanVienThucHienDichVu.SelectedValue != null)
                                {
                                    string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKetQuaDichVu.Text);
                                    string maPhong = cboPhongDichVu.SelectedValue.ToString();
                                    string maNVTH = cboNhanVienThucHienDichVu.SelectedValue.ToString();
                                    BUS_SuDungDV.Instance.SuaThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayGioThucHien, ngayYeuCau, maPhong,
                                        maNVTH, ketQua, txtMaSuDungDV.Text));
                                    BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                                    decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                                    txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                                    btnXoa.Enabled = false;
                                    btnSuaSD.Enabled = false;

                                }
                                else if (!string.IsNullOrEmpty(maPKB) &&
                                    !string.IsNullOrEmpty(maDV) && cboPhongDichVu.SelectedValue == null ||
                                    cboNhanVienThucHienDichVu.SelectedValue == null)
                                {
                                    BUS_SuDungDV.Instance.SuaThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayYeuCau, null,
                                        null, txtKetQuaDichVu.Text, txtMaSuDungDV.Text));
                                    BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                                    bool isEmpty = dgvSuDungDV.Rows.Count == 0;
                                    dgvSuDungDV.Enabled = !isEmpty;
                                    decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                                    txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                                    btnXoa.Enabled = false;
                                    btnSuaSD.Enabled = false;

                                }
                                else
                                {
                                    MessageBox.Show("Vui lòng điền đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }


                        else if (dtpNgayThucHienDV.Value.Date > BUS_SuDungDV.Instance.LayTGCD(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).Date)
                        {
                            DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện lưu thay đổi không !!?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (ret == DialogResult.Yes)
                            {
                                DateTime ngayThucHien = dtpNgayThucHienDV.Value.Date;
                                TimeSpan thoiGianThucHien = dtpTGThucHienDV.Value.TimeOfDay;
                                DateTime ngayGioThucHien = ngayThucHien.Add(thoiGianThucHien);
                                string thoiGianYC = mtbNgayYC.Text;
                                string ngayThoiGianYC = $"{ngayYC} {thoiGianYC}";
                                DateTime ngayYeuCau = DateTime.ParseExact(ngayThoiGianYC, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                                string maNVYC = cboNVYeuCauDV.SelectedValue.ToString();
                                string maPKB = cboPhieuKhamBenhSuDungDV.SelectedValue.ToString();
                                string maDV = cboDV.SelectedValue.ToString();
                                //string maPhong = cboPhongDichVu.SelectedValue.ToString();
                                //string maNVTH = cboNhanVienThucHienDichVu.SelectedValue.ToString();
                                if (!string.IsNullOrEmpty(maNVYC) && !string.IsNullOrEmpty(maPKB) &&
                                    !string.IsNullOrEmpty(maDV) && cboPhongDichVu.SelectedValue != null &&
                                    cboNhanVienThucHienDichVu.SelectedValue != null)
                                {
                                    string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKetQuaDichVu.Text);
                                    string maPhong = cboPhongDichVu.SelectedValue.ToString();
                                    string maNVTH = cboNhanVienThucHienDichVu.SelectedValue.ToString();
                                    BUS_SuDungDV.Instance.SuaThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayGioThucHien, ngayYeuCau, maPhong,
                                        maNVTH, ketQua, txtMaSuDungDV.Text));
                                    BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                                    decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                                    txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                                    btnXoa.Enabled = false;
                                    btnSuaSD.Enabled = false;

                                }
                                else if (!string.IsNullOrEmpty(maPKB) &&
                                    !string.IsNullOrEmpty(maDV) && cboPhongDichVu.SelectedValue == null ||
                                    cboNhanVienThucHienDichVu.SelectedValue == null)
                                {
                                    BUS_SuDungDV.Instance.SuaThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayYeuCau, null,
                                        null, txtKetQuaDichVu.Text, txtMaSuDungDV.Text));
                                    BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                                    bool isEmpty = dgvSuDungDV.Rows.Count == 0;
                                    dgvSuDungDV.Enabled = !isEmpty;
                                    decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                                    txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                                    btnXoa.Enabled = false;
                                    btnSuaSD.Enabled = false;

                                }
                                else
                                {
                                    MessageBox.Show("Vui lòng điền đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }
                        else if (dtpNgayThucHienDV.Value.Date < BUS_SuDungDV.Instance.LayTGCD(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).Date)
                        {
                            string time = BUS_SuDungDV.Instance.LayTGCD(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).ToString("dd/MM/yyyy");
                            MessageBox.Show("Ngày thực hiện dịch vụ phải lớn hơn ngày yêu cầu " + time, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                        else
                        {
                            string time = BUS_SuDungDV.Instance.LayTGCD(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()).ToString("HH:mm tt");
                            MessageBox.Show("Cùng ngày chuẩn đoán nên thời gian thực hiện dịch vụ phải lớn hơn " + time, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else if (BUS_SuDungDV.Instance.KiemTraXemNgayThucHienCoLonHonBangNgayYeuCau(ngayGioYC.Date, dtpNgayThucHienDV.Value.Date) == true)
                    {
                        DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện lưu thay đổi không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (ret == DialogResult.Yes)
                        {
                            DateTime ngayThucHien = dtpNgayThucHienDV.Value.Date;
                            TimeSpan thoiGianThucHien = dtpTGThucHienDV.Value.TimeOfDay;
                            DateTime ngayGioThucHien = ngayThucHien.Add(thoiGianThucHien);
                            string thoiGianYC = mtbNgayYC.Text;
                            string ngayThoiGianYC = $"{ngayYC} {thoiGianYC}";
                            DateTime ngayYeuCau = DateTime.ParseExact(ngayThoiGianYC, "dd/MM/yyyy HH:mm", CultureInfo.InvariantCulture);
                            string maNVYC = cboNVYeuCauDV.SelectedValue.ToString();
                            string maPKB = cboPhieuKhamBenhSuDungDV.SelectedValue.ToString();
                            string maDV = cboDV.SelectedValue.ToString();
                            //string maPhong = cboPhongDichVu.SelectedValue.ToString();
                            //string maNVTH = cboNhanVienThucHienDichVu.SelectedValue.ToString();
                            if (!string.IsNullOrEmpty(maNVYC) && !string.IsNullOrEmpty(maPKB) &&
                                !string.IsNullOrEmpty(maDV) && cboPhongDichVu.SelectedValue != null &&
                                cboNhanVienThucHienDichVu.SelectedValue != null)
                            {
                                string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKetQuaDichVu.Text);
                                string maPhong = cboPhongDichVu.SelectedValue.ToString();
                                string maNVTH = cboNhanVienThucHienDichVu.SelectedValue.ToString();
                                BUS_SuDungDV.Instance.SuaThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayGioThucHien, ngayYeuCau, maPhong,
                                    maNVTH, ketQua, txtMaSuDungDV.Text));
                                BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                                decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                                txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                                btnXoa.Enabled = false;
                                btnSuaSD.Enabled = false;

                            }
                            else if (!string.IsNullOrEmpty(maPKB) &&
                                !string.IsNullOrEmpty(maDV) && cboPhongDichVu.SelectedValue == null ||
                                cboNhanVienThucHienDichVu.SelectedValue == null)
                            {
                                BUS_SuDungDV.Instance.SuaThongTinSuDungDV(new ET_SuDungDV(maNVYC, maPKB, maDV, ngayYeuCau, null,
                                    null, txtKetQuaDichVu.Text, txtMaSuDungDV.Text));
                                BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                                bool isEmpty = dgvSuDungDV.Rows.Count == 0;
                                dgvSuDungDV.Enabled = !isEmpty;
                                decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                                txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                                btnXoa.Enabled = false;
                                btnSuaSD.Enabled = false;

                            }
                            else
                            {
                                MessageBox.Show("Vui lòng điền đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                        }
                    }
                    else
                    {
                        MessageBox.Show("Ngày thực hiện phải lớn hơn bằng ngày yêu cầu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    DateTime ngayKham = BUS_SuDungDV.Instance.LayNgayKhamCuaPKB(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                    string time = ngayKham.ToString("HH:mm tt");
                    MessageBox.Show("Thời gian yêu cầu phải lớn hơn thời gian đi khám của phiếu khám bệnh: " + time, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Không đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvSuDungDV_Click(object sender, EventArgs e)
        {
            //dgvSuDungDV.SelectionChanged += dgvSuDungDV_SelectionChanged;
            dtpNgayThucHienDV.Enabled = true;
            dtpTGThucHienDV.Enabled = true;
            cboPhongDichVu.Enabled = true;
            cboPhieuKhamBenhSuDungDV.Enabled = false;
            cboNhanVienThucHienDichVu.Enabled = true;
            txtKetQuaDichVu.Enabled = true;
            btnThemSuDung.Enabled = false;
            btnSuaSD.Enabled = true;
            btnXoa.Enabled = true;
            btnLamMoi.Enabled = true;
            if (dgvSuDungDV.CurrentRow != null && dgvSuDungDV.CurrentCell != null && dgvSuDungDV.Rows.Count > 0 && !dgvSuDungDV.Rows[dgvSuDungDV.CurrentRow.Index].IsNewRow)
            {


                // Đặt CurrentCell về ô đầu tiên trong dòng đang chọn để chắc chắn dòng đúng được chọn
                int dong = dgvSuDungDV.CurrentCell.RowIndex;
                cboNVYeuCauDV.SelectedValue = dgvSuDungDV.Rows[dong].Cells[0].Value?.ToString() ?? "";

                cboPhieuKhamBenhSuDungDV.SelectedValue = dgvSuDungDV.Rows[dong].Cells[2].Value?.ToString() ?? "";
                txtMaSuDungDV.Text = string.Empty;
                txtMaSuDungDV.Text = dgvSuDungDV.Rows[dong].Cells[1].Value?.ToString() ?? "";
                cboKhoa.SelectedValue = dgvSuDungDV.Rows[dong].Cells[9].Value?.ToString() ?? "";
                cboDV.SelectedValue = dgvSuDungDV.Rows[dong].Cells[3].Value?.ToString() ?? "";
                txtNgayYC.Text = DateTime.Parse(dgvSuDungDV.Rows[dong].Cells[5].Value.ToString()).ToString("dd/MM/yyyy");
                mtbNgayYC.Text = Convert.ToString(DateTime.Parse(dgvSuDungDV.Rows[dong].Cells[5].Value.ToString()).TimeOfDay);
                if (dgvSuDungDV.Rows[dong].Cells[4].Value != null && DateTime.TryParse(dgvSuDungDV.Rows[dong].Cells[4].Value.ToString(), out DateTime dateValue))
                {
                    // Gán phần ngày cho DateTimePicker
                    dtpNgayThucHienDV.Value = dateValue.Date;
                    cboPhongDichVu.SelectedValue = dgvSuDungDV.Rows[dong].Cells[6].Value?.ToString() ?? "";
                    cboNhanVienThucHienDichVu.SelectedValue = dgvSuDungDV.Rows[dong].Cells[7].Value?.ToString() ?? "";
                }
                if (dgvSuDungDV.Rows[dong].Cells[4].Value != null && DateTime.TryParse(dgvSuDungDV.Rows[dong].Cells[4].Value.ToString(), out DateTime dateTimeValue))
                {
                    // Gán giá trị vào biến hoặc sử dụng biến dateTimeValue
                    DateTime tg = DateTime.Parse(dgvSuDungDV.Rows[dong].Cells[4].Value.ToString());
                    dtpTGThucHienDV.Value = new DateTime(dtpTGThucHienDV.Value.Year, dtpTGThucHienDV.Value.Month, dtpTGThucHienDV.Value.Day, dateTimeValue.Hour, dateTimeValue.Minute, dateTimeValue.Second);
                    cboPhongDichVu.SelectedValue = dgvSuDungDV.Rows[dong].Cells[6].Value?.ToString() ?? "";
                    cboNhanVienThucHienDichVu.SelectedValue = dgvSuDungDV.Rows[dong].Cells[7].Value?.ToString() ?? "";
                }
                else
                {
                    dateTimeValue = DateTime.MinValue;
                }
                //cboPhongDichVu.SelectedValue = dgvSuDungDV.Rows[dong].Cells[6].Value?.ToString() ?? "";
                //cboNhanVienThucHienDichVu.SelectedValue = dgvSuDungDV.Rows[dong].Cells[7].Value?.ToString() ?? "";
                txtKetQuaDichVu.Text = dgvSuDungDV.Rows[dong].Cells[8].Value?.ToString() ?? "";
                if(cboPhieuKhamBenhSuDungDV.SelectedValue != null)
                {
                    if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()))
                    {
                        btnThemSuDung.Enabled = true;
                    }
                    else
                    {
                        btnThemSuDung.Enabled = false;
                    }
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện xóa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    if (dgvSuDungDV.CurrentRow.Cells[7].Value == null
    && BUS_SuDungDV.Instance.KiemTraXemThucHienDVChua(txtMaSuDungDV.Text, dgvSuDungDV.CurrentRow.Cells[7].Value?.ToString()) == true)
                    {
                        string maNVYC = cboNVYeuCauDV.SelectedValue.ToString();
                        string maPKB = cboPhieuKhamBenhSuDungDV.SelectedValue.ToString();
                        string maDV = cboDV.SelectedValue.ToString();
                        if (!string.IsNullOrEmpty(maNVYC) && !string.IsNullOrEmpty(maPKB) && !string.IsNullOrEmpty(maDV)
                            && dgvSuDungDV.CurrentRow != null && string.IsNullOrEmpty(dgvSuDungDV.CurrentRow.Cells[6].Value?.ToString())
                            && string.IsNullOrEmpty(dgvSuDungDV.CurrentRow.Cells[7].Value?.ToString()))
                        {
                            BUS_SuDungDV.Instance.XoaTTSuDungDV(txtMaSuDungDV.Text);
                            BUS_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dgvSuDungDV, dtpDSNgaySuDungDV.Value);
                            decimal tienSuDung = (decimal)BUS_SuDungDV.Instance.TinhTienSuDungDV(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());
                            txtTien.Text = tienSuDung.ToString("F0"); // Định dạng và hiển thị
                            btnXoa.Enabled = false;
                            btnSuaSD.Enabled = false;

                        }
                    }
                    else
                    {
                        MessageBox.Show("Bệnh nhân đã sử dụng dịch vụ không thể xóa", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
                {
                    if (BUS_SuDungDV.Instance.KiemTraPKBMoiNhat(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()) == false)
                    {
                        btnThemSuDung.Enabled = false;
                    }
                }
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            btnSuaSD.Enabled = false;
            btnXoa.Enabled = false;
            btnThemSuDung.Enabled = true;
            btnLamMoi.Enabled = false;
            cboPhieuKhamBenhSuDungDV.Enabled = true;
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                txtMaSuDungDV.Text = BUS_SuDungDV.Instance.TaoMaDVTuDong(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString());

            }
            txtTenBN.Clear();
            dtpNgayThucHienDV.Enabled = false;
            cboPhongDichVu.Enabled = false;
            dtpTGThucHienDV.Enabled = false;
            txtKetQuaDichVu.Enabled = false;
            cboNhanVienThucHienDichVu.Enabled = false;
            if (cboPhieuKhamBenhSuDungDV.SelectedValue != null)
            {
                if (BUS_SuDungDV.Instance.KiemTraPKBMoi(cboPhieuKhamBenhSuDungDV.SelectedValue.ToString()))
                {
                    btnThemSuDung.Enabled = true;
                }
                else
                {
                    btnThemSuDung.Enabled = false;
                }
            }
            dgvSuDungDV.SelectionChanged -= dgvSuDungDV_SelectionChanged;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thoát khỏi giao diện quản lý sử dụng dịch vụ không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_SuDungDV.Instance.TimKiemSDDVTheoTen(dgvSuDungDV, txtTenBN.Text, dtpDSNgaySuDungDV.Value);
        }

        private void dgvSuDungDV_CellClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void dgvSuDungDV_SelectionChanged(object sender, EventArgs e)
        {
        }
    }
}
