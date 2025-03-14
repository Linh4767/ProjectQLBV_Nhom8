﻿using BUS;
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
    public partial class frmTTBenhNhan : Form
    {
        public frmTTBenhNhan()
        {
            InitializeComponent();
        }
        private frmMain mainForm;
        public frmTTBenhNhan(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
            //frmTTBenhNhan ttBenhNhanForm = new frmTTBenhNhan(mainForm);
            //ttBenhNhanForm.Show();
        }
        private void LayDanhSachBenhNhan()
        {
            txtMaBN.Text = BUS_BenhNhan.Instance.TaoMaTuDong();
            BUS_BenhNhan.Instance.LayDSBenhNhan(dgvBenhNhan);
        }
        //Kiểm tra mã
        public bool KTraMa(string maBN)
        {
            for (int i = 0; i < dgvBenhNhan.Rows.Count; i++)
            {
                // Kiểm tra xem ô có giá trị không null không
                if (dgvBenhNhan.Rows[i].Cells[0].Value != null)
                {
                    // So sánh giá trị với maBN
                    if (maBN.Equals(dgvBenhNhan.Rows[i].Cells[0].Value.ToString()))
                    {
                        return true; // Trả về true nếu tìm thấy
                    }
                }
            }
            return false;
        }
        //Làm mới
        private void LamMoi()
        {
            txtTenBN.Clear();
            dtpNgaySinh.Value = DateTime.Now;
            txtDiaChi.Clear();
            txtNgheNghiep.Clear();
            txtSDT.Clear();
            txtDanToc.Clear();
            txtTTLH.Clear();
            txtMaBHYT.Clear();
            txtTenBN.Focus();
            btnSua.Enabled = false;
            btnThem.Enabled = true;
            dtpNgaySinh.Value = DateTime.Now;
            dtpNgayCap.Value = DateTime.Now;
            dtpNgayHH.Value = DateTime.Now;
            radNam.Checked = true;
        }
        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            LamMoi();
            LayDanhSachBenhNhan();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }

        //Kiểm tra tính hợp lệ của mã BHYT
        private bool KiemTraMaBHYT(string maBHYT)
        {
            // Kiểm tra hai ký tự đầu
            string tienTo = maBHYT.Substring(0, 2);
            if (tienTo != "GD" && tienTo != "TE" && tienTo != "HS" && tienTo != "SV")
            {
                MessageBox.Show("Hai ký tự đầu của mã BHYT phải là GD, TE, HS, hoặc SV.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            // Kiểm tra ký tự thứ ba phải là số từ 1 đến 5
            char kyTuThuBa = maBHYT[2];
            if (kyTuThuBa < '1' || kyTuThuBa > '5')
            {
                MessageBox.Show("Ký tự thứ ba của mã BHYT phải là số từ 1 đến 5.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            // Kiểm tra 12 ký tự còn lại phải là số
            string phanConLai = maBHYT.Substring(3);
            if (!phanConLai.All(char.IsDigit))
            {
                MessageBox.Show("12 ký tự cuối của mã BHYT phải là số.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

            // Mã BHYT hợp lệ
            return true;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn muốn thực hiện thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                if (txtTenBN.Text == "" || txtDiaChi.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập đủ thông tin!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    //kiểm tra ngày sinh
                    DateTime ngaySinh = dtpNgaySinh.Value;
                    if (ngaySinh.Date > DateTime.Now.Date)
                    {
                        MessageBox.Show("Độ tuổi không phù hợp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }

                    if (txtMaBHYT.Text != "")
                    {
                        //Kiểm tra tính hợp lệ của mã BHYT
                        if (!KiemTraMaBHYT(txtMaBHYT.Text))
                        {
                            return;
                        }

                        // Kiểm tra ngày cấp và ngày hết hạn của thẻ BHYT
                        DateTime ngayCap = dtpNgayCap.Value;

                        // Ngày cấp phải lớn hơn ngày sinh
                        if (ngayCap <= ngaySinh)
                        {
                            MessageBox.Show("Ngày cấp phải lớn hơn ngày sinh!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return;
                        }

                        // Tự động tính toán ngày hết hạn (5 năm sau ngày cấp)
                        DateTime ngayHetHan = ngayCap.AddYears(5);
                        dtpNgayHH.Value = ngayHetHan;
                    }

                    //Kiểm tra giới tính
                    string gioiTinh = "";
                    if (radNam.Checked)
                    {
                        gioiTinh = "Nam";
                    }
                    else
                    {
                        gioiTinh = "Nữ";
                    }

                    // Xử lý tên bệnh nhân (viết hoa và bỏ khoảng trắng thừa)
                    txtTenBN.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenBN.Text);
                    txtDiaChi.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtDiaChi.Text);
                    txtNgheNghiep.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtNgheNghiep.Text);
                    txtDanToc.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtDanToc.Text);

                    //Thêm bệnh nhân
                    string kq = BUS_BenhNhan.Instance.ThemBenhNhan(new ET_BenhNhan(txtMaBN.Text.Trim(), txtTenBN.Text, gioiTinh, ngaySinh, txtDiaChi.Text, txtNgheNghiep.Text, txtSDT.Text, txtDanToc.Text, txtTTLH.Text), new ET_TheBHYT(txtMaBHYT.Text, Convert.ToDateTime(dtpNgayCap.Text), Convert.ToDateTime(dtpNgayHH.Text), txtMaBN.Text));
                    MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    if (kq == "Thêm bệnh nhân và Thẻ BHYT thành công!" || kq == "Thêm bệnh nhân thành công!")
                    {
                        LamMoi();
                    }
                    LayDanhSachBenhNhan();
                    if (kq == "Thêm bệnh nhân và Thẻ BHYT thành công!" || kq == "Thêm bệnh nhân thành công!")
                    {
                        if (BUS_SoBenhAn.Instance.KiemTraBNCoSoBAChua(dgvBenhNhan.CurrentRow.Cells[0].Value.ToString()) == true)
                        {
                            DialogResult ret = MessageBox.Show("Bệnh nhân chưa có sổ bệnh án. Bạn muốn tạo sổ bệnh án không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (ret == DialogResult.Yes)
                            {
                                string dataToSend = dgvBenhNhan.CurrentRow.Cells[0].Value.ToString() + "-" + dgvBenhNhan.CurrentRow.Cells[1].Value.ToString();  // Dữ liệu bạn muốn gửi
                                frmMain frmMain = (frmMain)this.ParentForm;
                                frmMain.openChildForm(new frmSoBenhAn(dataToSend));
                            }
                        }
                        else if (BUS_SoBenhAn.Instance.KiemTraBNCoSoBAChua(dgvBenhNhan.CurrentRow.Cells[0].Value.ToString()) == false)
                        {
                            DialogResult ret = MessageBox.Show("Bệnh nhân đã có sổ bệnh án. Bạn muốn tiến hành tạo phiếu khám bệnh không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                            if (ret == DialogResult.Yes)
                            {
                                //string dataToSend = dgvBenhNhan.CurrentRow.Cells[0].Value.ToString() + "-" + dgvBenhNhan.CurrentRow.Cells[1].Value.ToString();  // Dữ liệu bạn muốn gửi
                                frmMain frmMain = (frmMain)this.ParentForm;
                                frmMain.openChildForm(new frmPhieuKhamBenh());
                            }
                        }
                    }
                }

            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn lưu thông tin đã được thay đổi không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                if (txtTenBN.Text == "" || txtDiaChi.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập đủ thông tin!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                //kiểm tra ngày sinh
                DateTime nS = dtpNgaySinh.Value;
                if (nS.Date > DateTime.Now.Date)
                {
                    MessageBox.Show("Độ tuổi không phù hợp", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                if (txtMaBHYT.Text != "")
                {
                    //Kiểm tra tính hợp lệ của mã BHYT
                    if (!KiemTraMaBHYT(txtMaBHYT.Text))
                    {
                        return;
                    }
                    // Kiểm tra ngày cấp và ngày hết hạn của thẻ BHYT
                    DateTime ngayCap = Convert.ToDateTime(dtpNgayCap.Text);
                    //DateTime ngayHH = Convert.ToDateTime(dtpNgayHH.Text);
                    //if (ngayCap >= ngayHH)
                    //{
                    //    MessageBox.Show("Ngày cấp thẻ BHYT phải nhỏ hơn ngày hết hạn!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //    return;
                    //}
                    DateTime ngayHetHan = ngayCap.AddYears(5);
                    dtpNgayHH.Value = ngayHetHan;
                }

                string gioiTinh = "";
                if (radNam.Checked)
                {
                    gioiTinh = "Nam";
                }
                else
                {
                    gioiTinh = "Nữ";
                }
                txtTenBN.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenBN.Text);
                txtDiaChi.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtDiaChi.Text);
                txtNgheNghiep.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtNgheNghiep.Text);
                txtDanToc.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtDanToc.Text);

                string kq = BUS_BenhNhan.Instance.SuaTTBenhNhan(new ET_BenhNhan(txtMaBN.Text.Trim(), txtTenBN.Text, gioiTinh, Convert.ToDateTime(dtpNgaySinh.Text), txtDiaChi.Text, txtNgheNghiep.Text, txtSDT.Text, txtDanToc.Text, txtTTLH.Text), new ET_TheBHYT(txtMaBHYT.Text, Convert.ToDateTime(dtpNgayCap.Text), Convert.ToDateTime(dtpNgayHH.Text), txtMaBN.Text));
                MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                LayDanhSachBenhNhan();
                if (kq == "Cập nhật thông tin bệnh nhân thành công." || kq == "Cập nhật thông tin bệnh nhân thành công, nhưng không thể thêm thẻ BHYT!")
                {
                    if (BUS_SoBenhAn.Instance.KiemTraBNCoSoBAChua(dgvBenhNhan.CurrentRow.Cells[0].Value.ToString()) == true)
                    {
                        DialogResult ret = MessageBox.Show("Bệnh nhân chưa có sổ bệnh án. Bạn muốn tạo sổ bệnh án không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (ret == DialogResult.Yes)
                        {
                            string dataToSend = dgvBenhNhan.CurrentRow.Cells[0].Value.ToString() + "-" + dgvBenhNhan.CurrentRow.Cells[1].Value.ToString();  // Dữ liệu bạn muốn gửi
                            frmMain frmMain = (frmMain)this.ParentForm;
                            frmMain.openChildForm(new frmSoBenhAn(dataToSend));
                        }
                    }
                    else if (BUS_SoBenhAn.Instance.KiemTraBNCoSoBAChua(dgvBenhNhan.CurrentRow.Cells[0].Value.ToString()) == false)
                    {
                        DialogResult ret = MessageBox.Show("Bệnh nhân đã có sổ bệnh án. Bạn muốn tiến hành tạo phiếu khám bệnh không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (ret == DialogResult.Yes)
                        {
                            //string dataToSend = dgvBenhNhan.CurrentRow.Cells[0].Value.ToString() + "-" + dgvBenhNhan.CurrentRow.Cells[1].Value.ToString();  // Dữ liệu bạn muốn gửi
                            frmMain frmMain = (frmMain)this.ParentForm;
                            frmMain.openChildForm(new frmPhieuKhamBenh());
                        }
                    }
                }
            }
        }

        private void btnSoBenhAn_Click(object sender, EventArgs e)
        {
            if (dgvBenhNhan.SelectedRows.Count > 0 && txtTenBN.Text != string.Empty && KTraMa(txtMaBN.Text) == true)
            {
                if (BUS_SoBenhAn.Instance.KiemTraBNCoSoBAChua(txtMaBN.Text) == true)
                {
                    DialogResult ret = MessageBox.Show("Bệnh nhân chưa có sổ bệnh án. Bạn muốn tạo sổ bệnh án không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ret == DialogResult.Yes)
                    {
                        string dataToSend = dgvBenhNhan.CurrentRow.Cells[0].Value.ToString() + "-" + dgvBenhNhan.CurrentRow.Cells[1].Value.ToString();  // Dữ liệu bạn muốn gửi
                        frmMain frmMain = (frmMain)this.ParentForm;
                        frmMain.openChildForm(new frmSoBenhAn(dataToSend));
                    }
                }
                else if (BUS_SoBenhAn.Instance.KiemTraBNCoSoBAChua(txtMaBN.Text) == false)
                {
                    DialogResult ret = MessageBox.Show("Bệnh nhân đã có sổ bệnh án. Bạn muốn tiến hành tạo phiếu khám bệnh không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ret == DialogResult.Yes)
                    {
                        //string dataToSend = dgvBenhNhan.CurrentRow.Cells[0].Value.ToString() + "-" + dgvBenhNhan.CurrentRow.Cells[1].Value.ToString();  // Dữ liệu bạn muốn gửi
                        frmMain frmMain = (frmMain)this.ParentForm;
                        frmMain.openChildForm(new frmPhieuKhamBenh());
                    }
                }
            }
            else if (KTraMa(txtMaBN.Text) == false)
            {
                MessageBox.Show("Bệnh nhân chưa được lưu thông tin vào danh sách", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                MessageBox.Show("Vui lòng chọn dòng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void frmTTBenhNhan_Load(object sender, EventArgs e)
        {
            LayDanhSachBenhNhan();
            btnSua.Enabled = false;
            dgvBenhNhan.ColumnHeadersHeight = 40;
            dgvBenhNhan.Columns[9].Visible = false;
            dtpNgaySinh.Value = DateTime.Now;
        }

        private void dgvBenhNhan_Click(object sender, EventArgs e)
        {
            // Kiểm tra nếu có dòng được chọn và dòng đó không phải là dòng trống
            if (dgvBenhNhan.CurrentRow != null && !dgvBenhNhan.Rows[dgvBenhNhan.CurrentRow.Index].IsNewRow)
            {
                btnSua.Enabled = true;
                btnThem.Enabled = false;

                int dong = dgvBenhNhan.CurrentCell.RowIndex;
                txtMaBN.Text = dgvBenhNhan.Rows[dong].Cells[0].Value.ToString();
                txtTenBN.Text = dgvBenhNhan.Rows[dong].Cells[1].Value.ToString();
                if (dgvBenhNhan.Rows[dong].Cells[2].Value.ToString() == "Nam")
                {
                    radNam.Checked = true;
                }
                else
                {
                    radNu.Checked = true;
                }
                dtpNgaySinh.Text = dgvBenhNhan.Rows[dong].Cells[3].Value.ToString();
                txtDiaChi.Text = dgvBenhNhan.Rows[dong].Cells[4].Value.ToString();
                txtNgheNghiep.Text = dgvBenhNhan.Rows[dong].Cells[5].Value.ToString();
                txtSDT.Text = dgvBenhNhan.Rows[dong].Cells[6].Value.ToString();
                txtDanToc.Text = dgvBenhNhan.Rows[dong].Cells[7].Value.ToString();
                txtTTLH.Text = dgvBenhNhan.Rows[dong].Cells[8].Value.ToString();

                //lấy thông tin thẻ bhyt nếu có
                string[] theBHYT = BUS_BenhNhan.Instance.layTheBHYT(txtMaBN.Text);
                if (theBHYT != null)
                {
                    txtMaBHYT.Text = theBHYT[0];
                    dtpNgayCap.Text = theBHYT[1];
                    dtpNgayHH.Text = theBHYT[2];
                }
                else
                {
                    txtMaBHYT.Text = "";
                    dtpNgayCap.Text = DateTime.Now.ToString();
                    dtpNgayHH.Text = DateTime.Now.ToString();
                }

            }
        }

        private void txtTenBN_TextChanged(object sender, EventArgs e)
        {
            if (txtTenBN.Text.Length > 50)
            {
                // Cắt chuỗi về 10 ký tự
                txtTenBN.Text = txtTenBN.Text.Substring(0, 50);

                // Đặt con trỏ chuột ở cuối văn bản
                txtTenBN.SelectionStart = txtTenBN.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 50 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtTenBN_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtDiaChi_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ cái và số
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != '/' && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtNgheNghiep_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ cái
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtDanToc_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ cái
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
            if (txtSDT.Text.Length >= 10 && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập thêm ký tự
                e.Handled = true;
            }
        }

        private void txtSDT_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtTTLH_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void txtTTLH_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
            if (txtTTLH.Text.Length >= 10 && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập thêm ký tự
                e.Handled = true;
            }
        }

        private void txtMaBHYT_TextChanged(object sender, EventArgs e)
        {

            // Giới hạn độ dài của chuỗi
            if (txtMaBHYT.Text.Length > 15)
            {
                MessageBox.Show("Chỉ được nhập tối đa 15 ký tự", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);

                // Giới hạn độ dài của chuỗi
                txtMaBHYT.Text = txtMaBHYT.Text.Substring(0, 15);
            }

            // Gán lại giá trị đã lọc cho TextBox
            txtMaBHYT.Text = txtMaBHYT.Text;

            // Di chuyển con trỏ đến cuối chuỗi
            txtMaBHYT.SelectionStart = txtMaBHYT.Text.Length;
        }

        private void txtMaBHYT_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ cái và số
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtSDT_Leave(object sender, EventArgs e)
        {
            if (txtSDT.Text.Length > 0 && txtSDT.Text.Length < 10)
            {
                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Số điện thoại phải đủ 10 ký tự hoặc không nhập", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtSDT.Focus(); // Đưa con trỏ chuột về lại ô nhập
            }
        }

        private void txtTTLH_Leave(object sender, EventArgs e)
        {
            if (txtTTLH.Text.Length > 0 && txtTTLH.Text.Length < 10)
            {
                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Thông tin liên hệ phải đủ 10 ký tự hoặc không nhập", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTTLH.Focus(); // Đưa con trỏ chuột về lại ô nhập
            }
        }

        private void txtMaBHYT_Leave(object sender, EventArgs e)
        {
            if (txtMaBHYT.Text.Length > 0 && txtMaBHYT.Text.Length < 15)
            {
                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Mã BHYT phải đủ 15 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaBHYT.Focus(); // Đưa con trỏ chuột về lại ô nhập
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_BenhNhan.Instance.TimKiemBenhNhan(txtTimKiem.Text, dgvBenhNhan);
        }
    }
}
