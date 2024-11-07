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

    public partial class frmKhoThuoc : Form
    {

        public frmKhoThuoc()
        {
            InitializeComponent();
        }

        private void UpdateMaThuoc()
        {
            if (!string.IsNullOrEmpty(txtTenThuoc.Text)
            && !string.IsNullOrEmpty(txtXuatXu.Text)
            && !string.IsNullOrEmpty(txtNhaCC.Text)
            && cboLoaiThuoc.SelectedIndex != -1 // kiểm tra SelectedIndex
            && !string.IsNullOrEmpty(cboLoaiThuoc.SelectedItem.ToString()) // lấy SelectedItem thay vì SelectedValue
            && !string.IsNullOrEmpty(txtHamLuong.Text))
            {
                txtMaThuoc.Text = BUS_Thuoc.Instance.TaoMaTuDong(
                    txtTenThuoc.Text,
                    txtXuatXu.Text,
                    txtNhaCC.Text,
                    cboLoaiThuoc.SelectedItem?.ToString() ?? string.Empty, // sử dụng SelectedItem
                    txtHamLuong.Text
                );
            }

        }

        private void txtTenThuoc_TextChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }
            if (txtSLDonViTinh.Text.Length > 30)
            {
                // Cắt chuỗi về 30 ký tự
                txtTenThuoc.Text = txtTenThuoc.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtTenThuoc.SelectionStart = txtTenThuoc.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtXuatXu_TextChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }
            if (txtXuatXu.Text.Length > 30)
            {
                // Cắt chuỗi về 30 ký tự
                txtXuatXu.Text = txtXuatXu.Text.Substring(0, 30);

                // Đặt con trỏ chuột ở cuối văn bản
                txtXuatXu.SelectionStart = txtXuatXu.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 30 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtNhaCC_TextChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }
            if (txtNhaCC.Text.Length > 100)
            {
                // Cắt chuỗi về 100 ký tự
                txtNhaCC.Text = txtNhaCC.Text.Substring(0, 100);

                // Đặt con trỏ chuột ở cuối văn bản
                txtNhaCC.SelectionStart = txtNhaCC.Text.Length;

                // Hiển thị thông báo cảnh báo
                MessageBox.Show("Chỉ được nhập tối đa 100 ký tự", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void txtHamLuong_TextChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }
            
        }

        private void frmKhoThuoc_Load(object sender, EventArgs e)
        {
            dgvKhoThuoc.ColumnHeadersHeight = 40;
            BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
            btnThemThuoc.Enabled = false;
            btnCapNhat.Enabled = false;
        }

        private void btnThemSLThuoc_Click(object sender, EventArgs e)
        {
            int soLuongThem;

            // Kiểm tra số lượng có hợp lệ không
            if (int.TryParse(txtSLThuocNhapVao.Text, out soLuongThem))
            {
                // Gọi phương thức ThemThuocVaoKho từ DAL_KhoThuoc
                bool success = BUS_KhoThuoc.Instance.ThemSoLuongThuoc(txtMaThuoc.Text, soLuongThem);

                // Nếu thêm số lượng thuốc thành công
                if (success)
                {
                    MessageBox.Show("Cập nhật số lượng thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // Cập nhật lại giao diện, ví dụ như hiển thị lại danh sách thuốc trong kho
                    BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);

                    // Cập nhật lại số lượng thuốc trong kho (hiển thị trong txtSLThuocTrongKho)
                    int soLuongTrongKho;

                    // Kiểm tra và chuyển đổi số lượng hiện tại từ txtSLThuocTrongKho
                    if (int.TryParse(txtSLThuocTrongKho.Text, out soLuongTrongKho))
                    {
                        // Cộng thêm số lượng mới vào số lượng trong kho
                        soLuongTrongKho += soLuongThem;
                    }
                    else
                    {
                        // Nếu txtSLThuocTrongKho không có giá trị hợp lệ, thì đặt lại giá trị bằng soLuongThem
                        soLuongTrongKho = soLuongThem;
                    }

                    // Gán giá trị mới vào txtSLThuocTrongKho
                    txtSLThuocTrongKho.Text = soLuongTrongKho.ToString();
                }
                else
                {
                    // Nếu không thể thêm thuốc vào kho
                    MessageBox.Show("Không tìm thấy thuốc!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                // Thông báo nếu người dùng nhập số lượng không hợp lệ
                MessageBox.Show("Vui lòng nhập số lượng hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string trangThai = "";
                if (radHoatDong.Checked)
                {
                    trangThai = "Hoạt Động";
                }
                else
                {
                    trangThai = "Ngừng Sản Xuất";
                }
                //txtHoTenNV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtHoTenNV.Text);
                int? slTieuChuan = string.IsNullOrWhiteSpace(txtSLTieuChuan.Text) ? (int?)null : int.Parse(txtSLTieuChuan.Text);
                string tenDVT = cboDVT.GetItemText(cboDVT.SelectedItem);
                BUS_Thuoc.Instance.SuaThuoc(txtMaThuoc.Text, float.Parse(txtDonGia.Text), trangThai, txtDongGoiBenNgoai.Text, tenDVT, int.Parse(txtSLDonViTinh.Text), slTieuChuan);
                BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
            }
        }

        private void cboLoaiThuoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();

            if (cboLoaiThuoc.SelectedIndex == 0 && radNgungSX.Checked)
            {
                txtSLTieuChuan.Enabled = false;
            }
            else if (cboLoaiThuoc.SelectedIndex == 0)
            {
                txtSLTieuChuan.Enabled = true;
            }
            else
            {
                txtSLTieuChuan.Enabled = false;
            }

            if (cboLoaiThuoc.SelectedIndex == 1)
            {
                cboDVT.Items.Clear();
                cboDVT.Items.Add("Lọ");
                cboDVT.Items.Add("Chai");
                cboDVT.SelectedIndex = 0;

                cboHamLuong.Items.Clear();
                cboHamLuong.Items.Add("mg/5 mL");
                cboHamLuong.Items.Add("mg/mL");
                cboHamLuong.SelectedIndex = 0;
                //cboHamLuong.Items.Clear();
                //cboHamLuong.Items.Add("mg");
            }
            else if (cboLoaiThuoc.SelectedIndex == 2)
            {
                cboDVT.Items.Clear();

                cboDVT.Items.Add("Lọ");
                cboDVT.Items.Add("Chai");
                cboDVT.Items.Add("Gói");
                cboDVT.SelectedIndex = 0;

                cboHamLuong.Items.Clear();
                cboHamLuong.Items.Add("mg");
                cboHamLuong.SelectedIndex = 0;
                //cboHamLuong.Items.Clear();
                //cboHamLuong.Items.Add("mg/5 mL");
                //cboHamLuong.Items.Add("mg/mL");
            }
            else
            {
                cboDVT.Items.Clear();
                cboDVT.Items.Add("Vỉ");
                cboDVT.Items.Add("Lọ");
                cboDVT.Items.Add("Chai");
                cboDVT.Items.Add("Gói");
                cboDVT.SelectedIndex = 0;

                cboHamLuong.Items.Clear();
                cboHamLuong.Items.Add("mg");
                cboHamLuong.SelectedIndex = 0;
            }
        }

        private void btnThemThuoc_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string trangThai = "";
                if (radHoatDong.Checked)
                {
                    trangThai = "Hoạt Động";
                }
                else
                {
                    trangThai = "Ngừng Sản Xuất";
                }
                //txtHoTenNV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtHoTenNV.Text);
                int? slTieuChuan = string.IsNullOrWhiteSpace(txtSLTieuChuan.Text) ? (int?)null : int.Parse(txtSLTieuChuan.Text);
                // Kiểm tra nếu txtHamLuong và cboHamLuong có giá trị
                string hamLuong = "";
                if (!string.IsNullOrEmpty(txtHamLuong.Text) && cboHamLuong.SelectedIndex != -1)
                {
                    // Kết hợp nội dung của txtHamLuong và cboHamLuong

                    hamLuong = $"{txtHamLuong.Text} {cboHamLuong.SelectedItem.ToString()}";
                }
                string tenLoaiThuoc = cboLoaiThuoc.GetItemText(cboLoaiThuoc.SelectedItem);
                string tenDVT = cboDVT.GetItemText(cboDVT.SelectedItem);
                txtTenThuoc.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenThuoc.Text);
                txtXuatXu.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtXuatXu.Text);
                txtNhaCC.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtNhaCC.Text);
                BUS_Thuoc.Instance.ThemThuoc(new ET_Thuoc(txtMaThuoc.Text, txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, trangThai, tenLoaiThuoc, txtDongGoiBenNgoai.Text, tenDVT, int.Parse(txtSLDonViTinh.Text), slTieuChuan, hamLuong, float.Parse(txtDonGia.Text)));
                BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
                dgvKhoThuoc.Refresh();
            }

        }

        private void dgvKhoThuoc_Click_1(object sender, EventArgs e)
        {
            if (dgvKhoThuoc.CurrentRow != null && !dgvKhoThuoc.Rows[dgvKhoThuoc.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvKhoThuoc.CurrentCell.RowIndex;
                txtMaThuoc.Text = dgvKhoThuoc.Rows[dong].Cells[0].Value.ToString();
                txtTenThuoc.Text = dgvKhoThuoc.Rows[dong].Cells[1].Value.ToString();
                cboLoaiThuoc.SelectedIndex = cboLoaiThuoc.FindStringExact(dgvKhoThuoc.Rows[dong].Cells[2].Value.ToString());
                string hamLuong = dgvKhoThuoc.Rows[dong].Cells[3].Value.ToString();
                txtHamLuong.Text = hamLuong.Split(' ')[0];
                string dv = hamLuong.Split(' ')[1];
                if (dv == "mg")
                {
                    cboHamLuong.SelectedIndex = 0;
                }
                else if (dv == "mg/5 mL")
                {
                    cboHamLuong.SelectedIndex = 2;
                }
                else
                {
                    cboHamLuong.SelectedIndex = 1;
                }
                txtXuatXu.Text = dgvKhoThuoc.Rows[dong].Cells[4].Value.ToString();
                txtNhaCC.Text = dgvKhoThuoc.Rows[dong].Cells[5].Value.ToString();
                txtDongGoiBenNgoai.Text = dgvKhoThuoc.Rows[dong].Cells[6].Value.ToString();
                cboDVT.SelectedIndex = cboDVT.FindStringExact(dgvKhoThuoc.Rows[dong].Cells[7].Value.ToString());
                txtSLDonViTinh.Text = dgvKhoThuoc.Rows[dong].Cells[8].Value.ToString();
                if (dgvKhoThuoc.Rows[dong].Cells[9].Value != null)
                {
                    txtSLTieuChuan.Text = dgvKhoThuoc.Rows[dong].Cells[9].Value.ToString();
                }
                else
                {
                    txtSLTieuChuan.Text = "";
                }
                txtDonGia.Text = dgvKhoThuoc.Rows[dong].Cells[10].Value.ToString();
                txtSLThuocTrongKho.Text = dgvKhoThuoc.Rows[dong].Cells[11].Value.ToString();
                if (dgvKhoThuoc.Rows[dong].Cells[12].Value.ToString() == "Hoạt Động")
                {
                    radHoatDong.Checked = true;
                    txtMaThuoc.Enabled = false;
                    txtTenThuoc.Enabled = false;
                    cboLoaiThuoc.Enabled = false;
                    txtXuatXu.Enabled = false;
                    txtNhaCC.Enabled = false;
                    txtHamLuong.Enabled = false;
                    cboHamLuong.Enabled = false;
                    txtDonGia.Enabled = true;
                    txtDongGoiBenNgoai.Enabled = false;
                    cboDVT.Enabled = true;
                    txtSLDonViTinh.Enabled = true;
                    txtSLTieuChuan.Enabled = true;
                    txtSLThuocNhapVao.Enabled = true;
                    btnThemSLThuoc.Enabled = true;
                    btnXoaSLThuoc.Enabled = true;
                }
                else if (dgvKhoThuoc.Rows[dong].Cells[12].Value.ToString() == "Ngừng Sản Xuất")
                {
                    radNgungSX.Checked = true;
                    txtMaThuoc.Enabled = false;
                    txtTenThuoc.Enabled = false;
                    cboLoaiThuoc.Enabled = false;
                    txtXuatXu.Enabled = false;
                    txtNhaCC.Enabled = false;
                    txtHamLuong.Enabled = false;
                    cboHamLuong.Enabled = false;
                    txtDonGia.Enabled = false;
                    cboDVT.Enabled = false;
                    txtSLDonViTinh.Enabled = false;
                    txtSLTieuChuan.Enabled = false;
                    txtSLThuocNhapVao.Enabled = false;

                    btnThemSLThuoc.Enabled = false;
                }
                if (cboLoaiThuoc.SelectedIndex == 0 && radNgungSX.Checked)
                {
                    txtSLTieuChuan.Enabled = false;
                }
                else if (cboLoaiThuoc.SelectedIndex == 0 && radHoatDong.Checked)
                {
                    txtSLTieuChuan.Enabled = true;
                }
                else
                {
                    txtSLTieuChuan.Enabled = false;
                }

                //cboHamLuong.Enabled = false;

                btnThemThuoc.Enabled = false;

            }
        }

        private void btnXoaSLThuoc_Click(object sender, EventArgs e)
        {
            int soLuongXoa;

            // Kiểm tra số lượng có hợp lệ không
            if (int.TryParse(txtSLThuocNhapVao.Text, out soLuongXoa))
            {
                // Kiểm tra nếu số lượng muốn xóa lớn hơn số lượng trong kho
                int soLuongTrongKho;

                if (int.TryParse(txtSLThuocTrongKho.Text, out soLuongTrongKho))
                {
                    // Kiểm tra số lượng thuốc muốn xóa có lớn hơn số lượng trong kho không
                    if (soLuongXoa > soLuongTrongKho)
                    {
                        // Nếu số lượng xóa lớn hơn số lượng trong kho, thông báo lỗi
                        MessageBox.Show("Số lượng thuốc muốn xóa không hợp lệ. Không thể xóa nhiều hơn số lượng trong kho!",
                                        "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return; // Dừng lại không thực hiện xóa
                    }

                    // Nếu không, tiếp tục xóa thuốc khỏi kho
                    bool success = BUS_KhoThuoc.Instance.XoaSoLuongThuoc(txtMaThuoc.Text, soLuongXoa);

                    // Nếu xóa số lượng thuốc thành công
                    if (success)
                    {
                        MessageBox.Show("Cập nhật số lượng thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Cập nhật lại giao diện, ví dụ như hiển thị lại danh sách thuốc trong kho
                        BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);

                        // Cập nhật lại số lượng thuốc trong kho (hiển thị trong txtSLThuocTrongKho)
                        soLuongTrongKho -= soLuongXoa;

                        // Gán giá trị mới vào txtSLThuocTrongKho
                        txtSLThuocTrongKho.Text = soLuongTrongKho.ToString();
                    }
                    else
                    {
                        // Nếu không thể xóa thuốc khỏi kho
                        MessageBox.Show("Không tìm thấy thuốc!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    // Nếu không thể lấy số lượng thuốc trong kho từ txtSLThuocTrongKho
                    MessageBox.Show("Số lượng trong kho không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                // Thông báo nếu người dùng nhập số lượng không hợp lệ
                MessageBox.Show("Vui lòng nhập số lượng hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_Thuoc.Instance.TimKiemThuoc(txtTimKiem.Text, dgvKhoThuoc);
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaThuoc.Clear();
            UpdateMaThuoc();
            txtTenThuoc.Clear();
            txtTenThuoc.Enabled = true;
            cboLoaiThuoc.SelectedIndex = 0;
            cboLoaiThuoc.Enabled = true;
            txtXuatXu.Clear();
            txtXuatXu.Enabled = true;
            txtNhaCC.Clear();
            txtNhaCC.Enabled = true;
            txtHamLuong.Clear();
            txtHamLuong.Enabled = true;
            cboHamLuong.SelectedIndex = 0;
            cboHamLuong.Enabled = true;
            txtDonGia.Clear();
            radHoatDong.Checked = true;
            cboDVT.SelectedIndex = 0;
            txtSLDonViTinh.Clear();
            txtSLTieuChuan.Clear();
            txtSLThuocNhapVao.Clear();
            txtSLThuocNhapVao.Enabled = false;
            btnThemThuoc.Enabled = false;
            btnCapNhat.Enabled = false;
            btnThemSLThuoc.Enabled = false;
            btnXoaSLThuoc.Enabled = false;
            BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
        }

        private void txtDonGia_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }
        }

        private void txtSLDonViTinh_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }

        }

        private void txtTenThuoc_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtXuatXu_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtNhaCC_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ, xóa và khoảng trắng
            if (!char.IsLetter(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtHamLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && e.KeyChar != '.')
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
            // Chỉ cho phép một dấu chấm
            if (e.KeyChar == '.')
            {
                TextBox textBox = sender as TextBox;

                // Nếu TextBox đã chứa dấu chấm, không cho phép nhập thêm
                if (textBox != null && textBox.Text.Contains('.'))
                {
                    e.Handled = true; // Hủy ký tự
                }
            }
        }

        private void txtDonGia_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtSLDonViTinh_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtSLTieuChuan_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtSLTieuChuan_TextChanged(object sender, EventArgs e)
        {
            // Tạo danh sách các trường cần kiểm tra
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text, txtSLDonViTinh.Text };

            // Kiểm tra trường hợp cboLoaiThuoc.SelectedIndex == 0, cần phải kiểm tra txtSLTieuChuan
            if (cboLoaiThuoc.SelectedIndex == 0)
            {
                textbox.Add(txtSLTieuChuan.Text); // Thêm txtSLTieuChuan vào danh sách kiểm tra
            }

            // Kiểm tra xem tất cả các trường có trống hay không
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            else
            {
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }


        }

        private void txtSLThuocNhapVao_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtSLThuocNhapVao.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemSLThuoc.Enabled = true;
                btnXoaSLThuoc.Enabled = true;
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = false;
            }
            else
            {
                btnThemSLThuoc.Enabled = false;
                btnXoaSLThuoc.Enabled = false;
                btnThemThuoc.Enabled = true;
                btnCapNhat.Enabled = true;
            }
            if (int.TryParse(txtSLThuocNhapVao.Text, out int slTNV))
            {
                if (slTNV <= 0 || slTNV > 1000)
                {
                    MessageBox.Show("Số lượng thuốc được nhập chỉ từ 1 đến 1000", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtSLThuocNhapVao.Text = "1";
                }
            }
        }

        private void txtSLThuocNhapVao_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập số, xóa
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void txtDonGia_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtDonGia.Text, out float donGia))
            {
                if (donGia < 10000 || donGia > 10000000)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 10.000 và nhỏ hơn hoặc bằng 10.000.000!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtDonGia.Text = "10000";
                }
            }
        }

        private void txtTenThuoc_Leave(object sender, EventArgs e)
        {
            // Kiểm tra nếu độ dài của txtTenThuoc nhỏ hơn 3 ký tự
            if (txtTenThuoc.Text.Length < 3)
            {
                // Hiển thị thông báo lỗi
                MessageBox.Show("Tên thuốc phải có ít nhất 3 ký tự.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                // Đưa con trỏ lại vào txtTenThuoc để người dùng có thể nhập lại
                txtTenThuoc.Focus();
            }
        }

        private void txtSLDonViTinh_Leave(object sender, EventArgs e)
        {
            if (int.TryParse(txtSLDonViTinh.Text, out int slDVT))
            {
                if (slDVT <= 0 || slDVT > 30)
                {
                    MessageBox.Show("Số lượng phải lớn hơn 0 và nhỏ hơn 30", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtSLDonViTinh.Text = "1";
                }
            }
        }

        private void txtSLTieuChuan_Leave(object sender, EventArgs e)
        {
            if (int.TryParse(txtSLTieuChuan.Text, out int slTC))
            {
                if (slTC < 10 || slTC > 30)
                {
                    MessageBox.Show("Số lượng phải từ 10 đến 30 viên", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtSLTieuChuan.Text = "10";
                }
            }
        }

        private void txtHamLuong_Leave(object sender, EventArgs e)
        {
            if (float.TryParse(txtHamLuong.Text, out float hamLuong))
            {
                if (hamLuong <= 0 || hamLuong > 1200)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0 và nhỏ hơn 1200!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtHamLuong.Text = "0.025";
                }
            }
        }
    }
}
