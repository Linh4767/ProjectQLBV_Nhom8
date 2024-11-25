using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using ET;

namespace Project_Nhom8
{
    public partial class frmTheoDoiDieuTri : Form
    {
        public frmTheoDoiDieuTri()
        {
            InitializeComponent();
        }

        private void btnSuaTD_Click(object sender, EventArgs e)
        {
            string pkb = cboBN.SelectedValue.ToString();
            DateTime ngayTheoDoi = dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay;
            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                if (cboNhanVien.SelectedValue != null)
                {
                    //Lấy tên mã nhân viên
                    string input = cboNhanVien.SelectedValue.ToString();
                    if (float.TryParse(txtCanNang.Text, out float chiSoCanNang))
                    {
                        // Định dạng giá trị float để chỉ hiển thị 2 chữ số sau dấu phẩy
                        string formattedValue = chiSoCanNang.ToString("0.00");

                        // Đặt lại giá trị đã định dạng vào TextBox
                        txtCanNang.Text = formattedValue;
                    }
                    if (float.TryParse(txtNhietDo.Text, out float nhietDo))
                    {
                        // Định dạng giá trị float để chỉ hiển thị 2 chữ số sau dấu phẩy
                        string formattedValue = nhietDo.ToString("0.00");

                        // Đặt lại giá trị đã định dạng vào TextBox
                        txtNhietDo.Text = formattedValue;
                    }
                    if (float.TryParse(txtDuongHuyet.Text, out float duongHuyet))
                    {
                        // Định dạng giá trị float để chỉ hiển thị 2 chữ số sau dấu phẩy
                        string formattedValue = duongHuyet.ToString("0.00");

                        // Đặt lại giá trị đã định dạng vào TextBox
                        txtDuongHuyet.Text = formattedValue;
                    }
                    BUS_TheoDoiDieuTri.Instance.SuaTheoDoi(new ET_TheoDoiDieuTri(pkb, dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay, txtCanNang.Text, txtHuyetAp.Text, txtNhipTho.Text, txtNhietDo.Text, txtMachDap.Text, txtDuongHuyet.Text, txtYLenh.Text, input, cboGiuong.SelectedValue.ToString(), txtMaTheoDoi.Text));
                    BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
                }
                else
                {
                    MessageBox.Show("Phải có mã nhân viên mới cập nhật được !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                }

            }
        }




        private void frmTheoDoiDieuTri_Load(object sender, EventArgs e)
        {
            dgvTheoDoiDT.ColumnHeadersHeight = 40;
            BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);

            dtpThoiGianTheoDoi.Value = DateTime.Now;
            cboBN.TextChanged += cboBN_TextChanged;
            cboBN.DropDownWidth = 150;
            cboBN.DropDownHeight = 300;
            dtpThoiGianTheoDoi.ShowUpDown = true;

            cboBN.DropDownStyle = ComboBoxStyle.DropDown;  // Cho phép vừa nhập vừa chọn từ danh sách
            cboBN.AutoCompleteMode = AutoCompleteMode.SuggestAppend;  // Đề xuất và tự động hoàn tất
            cboBN.AutoCompleteSource = AutoCompleteSource.CustomSource;  // Nguồn tự động hoàn tất từ dữ liệu tùy chỉnh

            // Đảm bảo AutoCompleteCustomSource được cập nhật trong HienThiComboboxPKB
            BUS_TheoDoiDieuTri.Instance.HienThiComboboxPKB(cboBN);
            if (cboBN.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.HienThiComboboxGiuong(cboGiuong, cboBN.SelectedValue.ToString());
            }
            if (cboBN.SelectedValue != null && cboGiuong.SelectedValue != null)
            {

                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
                txtChuanDoan.Text = BUS_TheoDoiDieuTri.Instance.HienThiChuanDoan(cboBN.SelectedValue.ToString());
                txtPhongBenh.Text = BUS_TheoDoiDieuTri.Instance.HienThiPhong(cboGiuong.SelectedValue.ToString());
                txtMaTheoDoi.Text = BUS_TheoDoiDieuTri.Instance.TaoMaTheoDoi(cboBN.SelectedValue.ToString(), cboGiuong.SelectedValue.ToString());
            }

        }

        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
        }


        private void cboGiuong_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboGiuong.SelectedValue != null)
            {
                txtPhongBenh.Text = BUS_TheoDoiDieuTri.Instance.HienThiPhong(cboGiuong.SelectedValue.ToString());
                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
                txtMaTheoDoi.Text = BUS_TheoDoiDieuTri.Instance.TaoMaTheoDoi(cboBN.SelectedValue.ToString(), cboGiuong.SelectedValue.ToString());
            }

        }

        private void dtpNgayTheoDoi_ValueChanged(object sender, EventArgs e)
        {
            if (cboGiuong.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
            }

        }

        private void dtpThoiGianTheoDoi_ValueChanged(object sender, EventArgs e)
        {
            if (cboGiuong.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
            }
        }

        private void btnThemThoiDoi_Click(object sender, EventArgs e)
        {
            string pkb = cboBN.SelectedValue.ToString();
            DateTime ngayTheoDoi = dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay;
            if (cboNhanVien.SelectedValue != null)
            {
                if (BUS_TheoDoiDieuTri.Instance.KiemTraNgayTheoDoi(pkb, cboGiuong.SelectedValue.ToString(), ngayTheoDoi))
                {
                    DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ret == DialogResult.Yes)
                    {
                        if (float.TryParse(txtCanNang.Text, out float chiSoCanNang))
                        {
                            // Định dạng giá trị float để chỉ hiển thị 2 chữ số sau dấu phẩy
                            string formattedValue = chiSoCanNang.ToString("0.00");

                            // Đặt lại giá trị đã định dạng vào TextBox
                            txtCanNang.Text = formattedValue;
                        }
                        if (float.TryParse(txtNhietDo.Text, out float nhietDo))
                        {
                            // Định dạng giá trị float để chỉ hiển thị 2 chữ số sau dấu phẩy
                            string formattedValue = nhietDo.ToString("0.00");

                            // Đặt lại giá trị đã định dạng vào TextBox
                            txtNhietDo.Text = formattedValue;
                        }
                        if (float.TryParse(txtDuongHuyet.Text, out float duongHuyet))
                        {
                            // Định dạng giá trị float để chỉ hiển thị 2 chữ số sau dấu phẩy
                            string formattedValue = duongHuyet.ToString("0.00");

                            // Đặt lại giá trị đã định dạng vào TextBox
                            txtDuongHuyet.Text = formattedValue;
                        }
                        //Lấy tên mã nhân viên
                        string input = cboNhanVien.SelectedValue.ToString();
                        BUS_TheoDoiDieuTri.Instance.ThemTheoDoi(new ET_TheoDoiDieuTri(pkb, dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay, txtCanNang.Text, txtHuyetAp.Text, txtNhipTho.Text, txtNhietDo.Text, txtMachDap.Text, txtDuongHuyet.Text, txtYLenh.Text, input, cboGiuong.SelectedValue.ToString(), txtMaTheoDoi.Text));
                        BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
                    }
                }
                else
                {
                    MessageBox.Show("Ngày theo dõi không thể nhỏ hơn ngày nhận giường hoặc Đã trả giường thì không thể theo dõi", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Phải có mã nhân viên mới thêm được !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            cboBN.Enabled = true;
            cboGiuong.Enabled = true;
            cboNhanVien.Enabled = true;
            btnThemThoiDoi.Enabled = false;
            btnSuaTD.Enabled = false;
            txtYLenh.Text = string.Empty;
            txtCanNang.Text = string.Empty;
            txtNhipTho.Text = string.Empty;
            txtHuyetAp.Text = string.Empty;
            txtMachDap.Text = string.Empty;
            txtDuongHuyet.Text = string.Empty;
            txtNhietDo.Text = string.Empty;
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
            BUS_TheoDoiDieuTri.Instance.TimKiemTheoTen(dgvTheoDoiDT, txtTimKiem.Text);
        }

        private void dgvTheoDoiDT_Click(object sender, EventArgs e)
        {
            if (dgvTheoDoiDT.CurrentRow != null && !dgvTheoDoiDT.Rows[dgvTheoDoiDT.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvTheoDoiDT.CurrentCell.RowIndex;

                cboBN.SelectedValue = dgvTheoDoiDT.Rows[dong].Cells[0].Value.ToString();


                cboGiuong.SelectedValue = dgvTheoDoiDT.Rows[dong].Cells[1].Value.ToString();

                // Lấy giá trị từ DataGridView (cột thứ 5)
                string ngayNhan = dgvTheoDoiDT.Rows[dong].Cells[2].Value.ToString();

                // Chuyển chuỗi ngày giờ thành kiểu DateTime
                DateTime ngayGio = DateTime.Parse(ngayNhan);

                // Gán phần ngày cho DateTimePicker (chỉ ngày)
                dtpNgayTheoDoi.Value = ngayGio.Date;  // Sử dụng .Date để chỉ lấy phần ngày

                // Gán phần giờ cho DateTimePicker khác (chỉ giờ)
                dtpThoiGianTheoDoi.Value = DateTime.Parse("01/01/2000 " + ngayGio.ToString("HH:mm"));
                txtCanNang.Text = dgvTheoDoiDT.Rows[dong].Cells[3].Value.ToString();
                txtNhietDo.Text = dgvTheoDoiDT.Rows[dong].Cells[4].Value.ToString();
                txtNhipTho.Text = dgvTheoDoiDT.Rows[dong].Cells[5].Value.ToString();
                txtHuyetAp.Text = dgvTheoDoiDT.Rows[dong].Cells[6].Value.ToString();
                txtMachDap.Text = dgvTheoDoiDT.Rows[dong].Cells[7].Value.ToString();
                txtDuongHuyet.Text = dgvTheoDoiDT.Rows[dong].Cells[8].Value.ToString();
                txtYLenh.Text = dgvTheoDoiDT.Rows[dong].Cells[9].Value.ToString();

                //Nhân viên
                cboNhanVien.SelectedValue = dgvTheoDoiDT.Rows[dong].Cells[10].Value.ToString();
                txtMaTheoDoi.Text = dgvTheoDoiDT.Rows[dong].Cells[11].Value.ToString();
                //    dtpNgayTra.Enabled = true;
                //    dtpThoiGianTra.Enabled = true;
                //    btnThem.Enabled = false;
                //    btnSua.Enabled = true;
                //    cboGiuongBenh.Enabled = false;
                //    btnLamMoi.Enabled = true;
                cboBN.Enabled = false;
                cboGiuong.Enabled = false;
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = true;   
            }
        }

        private void label9_Click(object sender, EventArgs e)
        {

        }


        private void txtMachDapDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void txtMachDap_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtCanNang.Text, txtHuyetAp.Text, txtNhietDo.Text, txtNhipTho.Text, txtDuongHuyet.Text, txtMachDap.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThoiDoi.Enabled = true;
                btnSuaTD.Enabled = false;
            }
            else
            {
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = false;
            }
            if (txtMachDap.Text.Length > 30)
            {
                // Cắt chuỗi về 10 ký tự
                txtMachDap.Text = txtMachDap.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtMachDap.SelectionStart = txtMachDap.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtNhietDoDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void txtNhietDo_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtCanNang.Text, txtHuyetAp.Text, txtNhietDo.Text, txtNhipTho.Text, txtDuongHuyet.Text, txtMachDap.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThoiDoi.Enabled = true;
                btnSuaTD.Enabled = false;
            }
            else
            {
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = false;
            }
            if (txtNhietDo.Text.Length > 30)
            {
                // Cắt chuỗi về 10 ký tự
                txtNhietDo.Text = txtNhietDo.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtNhietDo.SelectionStart = txtNhietDo.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtChuanDoan_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtNhipThoDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtHuyetApDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCanNangDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void cboNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboBN.SelectedValue != null)
            {
                txtMaTheoDoi.Text = BUS_TheoDoiDieuTri.Instance.TaoMaTheoDoi(cboBN.SelectedValue.ToString(), cboGiuong.SelectedValue.ToString());
            }
        }

        private void label24_Click(object sender, EventArgs e)
        {

        }

        private void txtYLenh_TextChanged(object sender, EventArgs e)
        {
            if (txtYLenh.Text.Length > 500)
            {
                // Cắt chuỗi về 10 ký tự
                txtYLenh.Text = txtYLenh.Text.Substring(0, 500);

                // Đặt con trỏ chuột ở cuối văn bản
                txtYLenh.SelectionStart = txtYLenh.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 500 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void label23_Click(object sender, EventArgs e)
        {

        }

        private void txtNhipTho_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtCanNang.Text, txtHuyetAp.Text, txtNhietDo.Text, txtNhipTho.Text, txtDuongHuyet.Text, txtMachDap.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThoiDoi.Enabled = true;
                btnSuaTD.Enabled = false;
            }
            else
            {
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = false;
            }
            if (txtNhipTho.Text.Length > 30)
            {
                // Cắt chuỗi về 10 ký tự
                txtNhipTho.Text = txtNhipTho.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtNhipTho.SelectionStart = txtNhipTho.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void label22_Click(object sender, EventArgs e)
        {

        }

        private void txtHuyetAp_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtCanNang.Text, txtHuyetAp.Text, txtNhietDo.Text, txtNhipTho.Text, txtDuongHuyet.Text, txtMachDap.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThoiDoi.Enabled = true;
                btnSuaTD.Enabled = false;
            }
            else
            {
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = false;
            }
            if (txtHuyetAp.Text.Length > 30)
            {
                // Cắt chuỗi về 10 ký tự
                txtHuyetAp.Text = txtHuyetAp.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtHuyetAp.SelectionStart = txtHuyetAp.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void txtCanNang_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtCanNang.Text, txtHuyetAp.Text, txtNhietDo.Text, txtNhipTho.Text, txtDuongHuyet.Text, txtMachDap.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThoiDoi.Enabled = true;
                btnSuaTD.Enabled = false;
            }
            else
            {
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = false;
            }
            if (txtCanNang.Text.Length > 30)
            {
                // Cắt chuỗi về 10 ký tự
                txtCanNang.Text = txtCanNang.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtCanNang.SelectionStart = txtCanNang.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void label19_Click(object sender, EventArgs e)
        {

        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void cboBN_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboBN.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.HienThiComboboxGiuong(cboGiuong, cboBN.SelectedValue.ToString());
                txtChuanDoan.Text = BUS_TheoDoiDieuTri.Instance.HienThiChuanDoan(cboBN.SelectedValue.ToString());
            }

        }

        private void cboBN_TextChanged(object sender, EventArgs e)
        {

        }

        private void cboBN_KeyPress(object sender, KeyPressEventArgs e)
        {

        }

        private void cboBN_DropDown(object sender, EventArgs e)
        {

        }

        private void txtCanNang_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back && e.KeyChar != '.')
            {
                e.Handled = true; // Ngăn ký tự không hợp lệ
            }

            // Kiểm tra nếu ký tự nhập vào là dấu chấm (.) và đã có dấu chấm trong TextBox
            if (e.KeyChar == '.' && txtCanNang.Text.Contains("."))
            {
                e.Handled = true; // Ngăn nhập thêm dấu chấm
            }
        }

        private void txtDuongHuyet_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtCanNang.Text, txtHuyetAp.Text, txtNhietDo.Text, txtNhipTho.Text, txtDuongHuyet.Text, txtMachDap.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThoiDoi.Enabled = true;
                btnSuaTD.Enabled = false;
            }
            else
            {
                btnThemThoiDoi.Enabled = false;
                btnSuaTD.Enabled = false;
            }
            if (txtDuongHuyet.Text.Length > 30)
            {
                // Cắt chuỗi về 10 ký tự
                txtDuongHuyet.Text = txtDuongHuyet.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtDuongHuyet.SelectionStart = txtDuongHuyet.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtNhietDo_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back && e.KeyChar != '.')
            {
                e.Handled = true; // Ngăn ký tự không hợp lệ
            }

            // Kiểm tra nếu ký tự nhập vào là dấu chấm (.) và đã có dấu chấm trong TextBox
            if (e.KeyChar == '.' && txtNhietDo.Text.Contains("."))
            {
                e.Handled = true; // Ngăn nhập thêm dấu chấm
            }
        }

        private void txtDuongHuyet_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back && e.KeyChar != '.')
            {
                e.Handled = true; // Ngăn ký tự không hợp lệ
            }

            // Kiểm tra nếu ký tự nhập vào là dấu chấm (.) và đã có dấu chấm trong TextBox
            if (e.KeyChar == '.' && txtDuongHuyet.Text.Contains("."))
            {
                e.Handled = true; // Ngăn nhập thêm dấu chấm
            }
        }

        private void txtNhipTho_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true; // Ngăn ký tự không hợp lệ
            }
        }

        private void txtMachDap_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true; // Ngăn ký tự không hợp lệ
            }
        }

        private void txtHuyetAp_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true; // Ngăn ký tự không hợp lệ
            }
        }

        private void txtCanNang_Leave(object sender, EventArgs e)
        {
            // Kiểm tra giá trị của txtSoLuong
            if (float.TryParse(txtCanNang.Text, out float canNang))
            {
                if (canNang <= 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtCanNang.Text = "1";
                }
                
            }
        }

        private void txtNhietDo_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtNhietDo.Text, out float nhietDo))
            {
                if (nhietDo <= 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtNhietDo.Text = "1";
                }
                
            }
        }

        private void txtNhipTho_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtNhipTho.Text, out float nhipTho))
            {
                if (nhipTho <= 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtNhipTho.Text = "1";
                }
                
            }
        }

        private void txtMachDap_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtMachDap.Text, out float machDap))
            {
                if (machDap <= 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtMachDap.Text = "1";
                }
                
            }
        }

        private void txtHuyetAp_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtHuyetAp.Text, out float huyetAp))
            {
                if (huyetAp <= 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtHuyetAp.Text = "1";
                }
                
            }
        }

        private void txtDuongHuyet_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtDuongHuyet.Text, out float duongHuyet))
            {
                if (duongHuyet <= 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtDuongHuyet.Text = "1";
                }
                
            }
        }

        private void dtpNgayTheoDoi_Leave(object sender, EventArgs e)
        {
            //// Lấy giá trị từ DateTimePicker
            //DateTime ngayTD = dtpNgayTheoDoi.Value;

            //// So sánh với ngày hiện tại
            //if (ngayTD > DateTime.Now)
            //{
            //    // Hiển thị thông báo lỗi
            //    MessageBox.Show("Ngày theo dõi không được lớn hơn ngày hiện tại!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);

            //    // Đặt lại giá trị về ngày hiện tại hoặc ngày hợp lệ tùy ý
            //    dtpNgayTheoDoi.Value = DateTime.Now;
            //}
        }
    }
}
