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
using static System.Net.Mime.MediaTypeNames;

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

        private void UpdateMaLo()
        {
            if (!string.IsNullOrEmpty(txtTenThuoc.Text)
            && !string.IsNullOrEmpty(txtXuatXu.Text)
            && !string.IsNullOrEmpty(txtNhaCC.Text)
            && cboLoaiThuoc.SelectedIndex != -1 // kiểm tra SelectedIndex
            && !string.IsNullOrEmpty(cboLoaiThuoc.SelectedItem?.ToString()) // lấy SelectedItem thay vì SelectedValue
            && !string.IsNullOrEmpty(txtHamLuong.Text)
            && dtpNgaySX.Value != null) // kiểm tra ngày sản xuất
            {
                txtMaLo.Text = BUS_Thuoc.Instance.TaoMaLoTuDong(
                    txtTenThuoc.Text,
                    txtXuatXu.Text,
                    txtNhaCC.Text,
                    cboLoaiThuoc.SelectedItem?.ToString() ?? string.Empty, // sử dụng SelectedItem
                    txtHamLuong.Text,
                    dtpNgaySX.Value
                );
            }
        }


        private void txtTenThuoc_TextChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();
            UpdateMaLo();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text};
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
            if (txtTenThuoc.Text.Length > 30)
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
            UpdateMaLo();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text};
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
            UpdateMaLo();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text};
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
            UpdateMaLo();
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text};
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
            btnPhatThuocVeKhoa.Enabled = false;
        }

        private void btnThemSLThuoc_Click(object sender, EventArgs e)
        {
            int soLuongThem;

            // Kiểm tra xem số lượng nhập vào có hợp lệ không
            if (int.TryParse(txtSLThuocNhapVao.Text, out soLuongThem))
            {
                // Gọi phương thức ThemSoLuongThuoc từ BUS_KhoThuoc
                int? soLuongTrongKhoMoi = BUS_KhoThuoc.Instance.ThemSoLuongThuoc(txtMaThuoc.Text, txtMaLo.Text, soLuongThem);

                // Nếu thêm thuốc vào kho thành công
                if (soLuongTrongKhoMoi != -1)
                {
                    MessageBox.Show("Cập nhật số lượng thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // Cập nhật lại giao diện, ví dụ như hiển thị lại danh sách thuốc trong kho
                    BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);

                    // Gán số lượng tồn kho mới nhất vào txtSLThuocTrongKho
                    txtSLThuocTrongKho.Text = soLuongTrongKhoMoi.ToString();
                }
                else
                {
                    // Thông báo lỗi nếu không tìm thấy thuốc hoặc không thể cập nhật số lượng
                    MessageBox.Show("Không tìm thấy thuốc hoặc không thể cập nhật số lượng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
                    trangThai = "Ngừng Phát Thuốc";
                }
                //txtHoTenNV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtHoTenNV.Text);
                int? slTieuChuan = string.IsNullOrWhiteSpace(cboSLTieuChuan.SelectedItem.ToString()) ? (int?)null : int.Parse(cboSLTieuChuan.SelectedItem.ToString());
                string tenDVT = cboDVT.GetItemText(cboDVT.SelectedItem);
                DateTime ngaySanXuat = dtpNgaySX.Value;
                // Lấy giá trị hạn sử dụng từ ComboBox
                string hanSuDungChuoi = cboHSD.SelectedItem.ToString();

                // Loại bỏ chữ "tháng" và chuyển đổi sang số nguyên
                int hanSuDungThang = int.Parse(hanSuDungChuoi.Replace(" tháng", "").Trim());

                // Tính ngày hết hạn
                DateTime ngayHetHan = ngaySanXuat.AddMonths(hanSuDungThang);
                BUS_Thuoc.Instance.SuaThuoc(txtMaThuoc.Text, float.Parse(txtDonGia.Text), trangThai, txtDongGoiBenNgoai.Text, tenDVT, int.Parse(cboSLDVT.SelectedItem.ToString()), slTieuChuan, txtMaLo.Text, ngayHetHan, int.Parse(cboSLHop.SelectedItem.ToString()));
                BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
            }
        }

        private void cboLoaiThuoc_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateMaThuoc();
            UpdateMaLo();

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
                cboHSD.Items.Clear();
                cboHSD.Items.Add("12 tháng");
                cboHSD.Items.Add("24 tháng");
                cboHSD.Items.Add("36 tháng");
                cboHSD.Items.Add("48 tháng");
                cboHSD.Items.Add("60 tháng");
                cboHSD.SelectedIndex = 0;

                cboSLTieuChuan.Items.Clear();
                cboSLTieuChuan.Items.Add("");
                cboSLTieuChuan.SelectedIndex = 0;
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
                cboHSD.Items.Clear();
                cboHSD.Items.Add("12 tháng");
                cboHSD.Items.Add("24 tháng");
                cboHSD.Items.Add("36 tháng");
                cboHSD.Items.Add("48 tháng");
                cboHSD.Items.Add("60 tháng");
                cboHSD.SelectedIndex = 0;
                cboSLTieuChuan.Items.Clear();
                cboSLTieuChuan.Items.Add("");
                cboSLTieuChuan.SelectedIndex = 0;
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
                cboHSD.Items.Clear();
                cboHSD.Items.Add("12 tháng");
                cboHSD.Items.Add("24 tháng");
                cboHSD.Items.Add("36 tháng");
                cboHSD.Items.Add("48 tháng");
                cboHSD.Items.Add("60 tháng");
                cboHSD.SelectedIndex = 0;
                cboSLTieuChuan.Items.Clear();
                cboSLTieuChuan.Items.Add("10");
                cboSLTieuChuan.SelectedIndex = 0;
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
                    trangThai = "Ngừng Phát Thuốc";
                }
                //txtHoTenNV.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtHoTenNV.Text);
                int? slTieuChuan = string.IsNullOrWhiteSpace(cboSLTieuChuan.SelectedItem.ToString()) ? (int?)null : int.Parse(cboSLTieuChuan.SelectedItem.ToString());
                // Kiểm tra nếu txtHamLuong và cboHamLuong có giá trị
                string hamLuong = "";
                if (!string.IsNullOrEmpty(txtHamLuong.Text) && cboHamLuong.SelectedIndex != -1)
                {
                    // Kết hợp nội dung của txtHamLuong và cboHamLuong

                    hamLuong = $"{txtHamLuong.Text} {cboHamLuong.SelectedItem.ToString()}";
                }
                string tenLoaiThuoc = cboLoaiThuoc.GetItemText(cboLoaiThuoc.SelectedItem);
                string tenDVT = cboDVT.GetItemText(cboDVT.SelectedItem);
                DateTime ngaySanXuat = dtpNgaySX.Value;
                // Lấy giá trị hạn sử dụng từ ComboBox
                string hanSuDungChuoi = cboHSD.SelectedItem.ToString();

                // Loại bỏ chữ "tháng" và chuyển đổi sang số nguyên
                int hanSuDungThang = int.Parse(hanSuDungChuoi.Replace(" tháng", "").Trim());

                // Tính ngày hết hạn
                DateTime ngayHetHan = ngaySanXuat.AddMonths(hanSuDungThang);
                txtTenThuoc.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtTenThuoc.Text);
                txtXuatXu.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtXuatXu.Text);
                txtNhaCC.Text = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtNhaCC.Text);
                BUS_Thuoc.Instance.ThemThuoc(new ET_Thuoc(txtMaThuoc.Text, txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, trangThai, tenLoaiThuoc, txtDongGoiBenNgoai.Text, tenDVT, int.Parse(cboSLDVT.SelectedItem.ToString()), slTieuChuan, hamLuong, float.Parse(txtDonGia.Text), dtpNgaySX.Value, ngayHetHan, txtMaLo.Text, 0, int.Parse(cboSLHop.SelectedItem.ToString())));
                BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
                dgvKhoThuoc.Refresh();
            }

        }

        private void dgvKhoThuoc_Click_1(object sender, EventArgs e)
        {
            if (dgvKhoThuoc.CurrentRow != null && !dgvKhoThuoc.Rows[dgvKhoThuoc.CurrentRow.Index].IsNewRow)
            {
                btnPhatThuocVeKhoa.Enabled = true;
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
                cboSLDVT.SelectedItem = dgvKhoThuoc.Rows[dong].Cells[8].Value.ToString();
                if (dgvKhoThuoc.Rows[dong].Cells[9].Value != null)
                {
                    cboSLTieuChuan.SelectedItem = dgvKhoThuoc.Rows[dong].Cells[9].Value.ToString();
                }
                else
                {
                    cboSLTieuChuan.SelectedItem = "";
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
                    txtSLThuocNhapVao.Enabled = true;
                    btnThemSLThuoc.Enabled = true;
                    btnXoaSLThuoc.Enabled = true;
                    dtpNgaySX.Enabled = true;
                    cboSLHop.Enabled = true;
                    cboHSD.Enabled = true;
                }
                else
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
                    txtSLThuocNhapVao.Enabled = false;
                    btnThemSLThuoc.Enabled = false;
                    dtpNgaySX.Enabled = false;
                    cboSLHop.Enabled = false;
                    cboHSD.Enabled = false;
                }
                cboSLHop.SelectedItem = dgvKhoThuoc.Rows[dong].Cells[13].Value.ToString();
                if (dong >= 0 && dong < dgvKhoThuoc.Rows.Count && dgvKhoThuoc.Columns.Count > 14)
                {
                    var cellValue = dgvKhoThuoc.Rows[dong].Cells[14].Value;
                    if (cellValue != null)
                    {
                        txtSLThuocNhapVao.Text = cellValue.ToString();
                    }
                    else
                    {
                        txtSLThuocNhapVao.Text = "Không có dữ liệu";
                    }
                }
                else
                {
                    MessageBox.Show("Hàng hoặc cột không hợp lệ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                // Lấy giá trị từ DataGridView (cột thứ 5)
                string ngayNhan = dgvKhoThuoc.Rows[dong].Cells[15].Value.ToString();

                // Chuyển chuỗi ngày giờ thành kiểu DateTime
                DateTime ngayGio = DateTime.Parse(ngayNhan);

                // Gán phần ngày cho DateTimePicker (chỉ ngày)
                dtpNgaySX.Value = ngayGio.Date;

                // Lấy giá trị ngày hết hạn từ DataGridView
                string ngayHetHanChuoi = dgvKhoThuoc.Rows[dong].Cells[16].Value.ToString();
                DateTime ngayHetHan = DateTime.Parse(ngayHetHanChuoi);

                // Tính khoảng cách số tháng giữa ngày hiện tại và ngày hết hạn
                int soThangHSD = ((ngayHetHan.Year - ngayGio.Year) * 12) + (ngayHetHan.Month - ngayGio.Month);

                // Thêm giá trị mới vào ComboBox nếu chưa tồn tại
                string soThangHSDChuoi = $"{soThangHSD} tháng";
                //if (!cboHSD.Items.Contains(soThangHSDChuoi))
                //{
                //    cboHSD.Items.Add(soThangHSDChuoi);
                //}

                // Chọn giá trị mới được tính trong ComboBox
                cboHSD.SelectedItem = soThangHSDChuoi;

                // Khi chọn combobox và cần sử dụng lại số tháng:
                string hanSuDungChuoi = cboHSD.SelectedItem.ToString();
                int hanSuDungThang = int.Parse(hanSuDungChuoi.Replace(" tháng", "").Trim());

                // Tính ngày hết hạn mới nếu cần
                DateTime ngayHetHanMoi = ngayGio.AddMonths(hanSuDungThang);

                //cboHamLuong.Enabled = false;

                btnThemThuoc.Enabled = false;

            }
        }

        private void btnXoaSLThuoc_Click(object sender, EventArgs e)
        {
            int soLuongXoa;

            // Kiểm tra xem số lượng nhập vào có hợp lệ không
            if (int.TryParse(txtSLThuocNhapVao.Text, out soLuongXoa))
            {
                // Kiểm tra số lượng muốn xóa có hợp lệ
                int soLuongTrongKho;

                // Kiểm tra số lượng trong kho có hợp lệ không
                if (int.TryParse(txtSLThuocTrongKho.Text, out soLuongTrongKho))
                {
                    // Lấy thông tin thuốc từ bảng Thuoc
                    var thuoc = BUS_Thuoc.Instance.LayThuocByMa(txtMaThuoc.Text);  // Lấy thông tin thuốc theo mã
                    if (thuoc == null)
                    {
                        MessageBox.Show("Không tìm thấy thuốc!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }

                    // Tính số lượng thuốc cần xóa (soLuongGiam) theo công thức
                    int soLuongGiam = 0;
                    if (thuoc.LoaiThuoc == "Viên nén" || thuoc.LoaiThuoc == "Viên Nén")
                    {
                        soLuongGiam = (int)(soLuongXoa * thuoc.SoLuongDVT * thuoc.SoLuongQCDG); // Viên nén
                    }
                    else
                    {
                        soLuongGiam = (int)(soLuongXoa * thuoc.SoLuongDVT); // Các loại thuốc khác
                    }

                    // Kiểm tra số lượng cần xóa có hợp lệ không
                    if (soLuongGiam > soLuongTrongKho)
                    {
                        MessageBox.Show("Số lượng thuốc muốn xóa không hợp lệ. Không thể xóa nhiều hơn số lượng trong kho!",
                                        "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return; // Dừng lại không thực hiện xóa
                    }

                    // Gọi phương thức XoaSoLuongThuoc từ BUS_KhoThuoc để xóa thuốc khỏi kho
                    int? soLuongTrongKhoMoi = BUS_KhoThuoc.Instance.XoaSoLuongThuoc(txtMaThuoc.Text, soLuongXoa);

                    // Kiểm tra kết quả trả về từ phương thức XoaSoLuongThuoc
                    if (soLuongTrongKhoMoi != -1)
                    {
                        MessageBox.Show("Cập nhật số lượng thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Cập nhật lại giao diện, ví dụ như hiển thị lại danh sách thuốc trong kho
                        BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);

                        // Gán số lượng tồn kho mới nhất vào txtSLThuocTrongKho
                        txtSLThuocTrongKho.Text = soLuongTrongKhoMoi.ToString();
                    }
                    else
                    {
                        // Thông báo nếu không tìm thấy thuốc hoặc không thể xóa số lượng
                        MessageBox.Show("Không tìm thấy thuốc hoặc không thể cập nhật số lượng!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    // Thông báo lỗi nếu không thể lấy số lượng trong kho
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
            UpdateMaLo();
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
            txtSLThuocNhapVao.Clear();
            txtDonGia.Enabled = true;
            cboDVT.Enabled = true;
            txtSLThuocNhapVao.Enabled = false;
            btnThemThuoc.Enabled = false;
            btnCapNhat.Enabled = false;
            btnThemSLThuoc.Enabled = false;
            btnXoaSLThuoc.Enabled = false;
            BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
        }

        private void txtDonGia_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTenThuoc.Text, txtXuatXu.Text, txtNhaCC.Text, txtHamLuong.Text, txtDonGia.Text};
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

        

        private void txtSLThuocNhapVao_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtSLThuocNhapVao.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                btnThemSLThuoc.Enabled = true;
                btnXoaSLThuoc.Enabled = true;
                btnThemThuoc.Enabled = false;
                btnCapNhat.Enabled = true;
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
                if (slTNV < 0)
                {
                    MessageBox.Show("Số lượng thuốc được nhập không được âm !", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
                if (donGia < 0)
                {
                    MessageBox.Show("Giá trị phải lớn hơn 0!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtDonGia.Text = "1000000000";
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

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //Kiểm tra đã chọn dòng trên datagridview chưa
            if (dgvKhoThuoc.SelectedRows.Count == 0)
            {
                MessageBox.Show("Bạn phải chọn dòng để xóa", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialog == DialogResult.Yes)
                {
                    BUS_Thuoc.Instance.XoaThuoc(txtMaThuoc.Text);
                    BUS_Thuoc.Instance.HienThiThuoc(dgvKhoThuoc);
                }
            }
        }

        private void cboHSD_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dtpNgaySX_ValueChanged(object sender, EventArgs e)
        {
            UpdateMaLo();
        }

        private void cboDVT_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboLoaiThuoc.SelectedIndex == 1)
            {
                if (cboDVT.SelectedIndex == 0 || cboDVT.SelectedIndex == 1)
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("1");
                    cboSLDVT.SelectedIndex = 0;
                    cboSLDVT.SelectedIndex = 0;

                    cboSLTieuChuan.Items.Clear();
                    cboSLTieuChuan.Items.Add("");
                    cboSLTieuChuan.SelectedIndex = 0;
                }
            }
            else if (cboLoaiThuoc.SelectedIndex == 2)
            {

                if (cboDVT.SelectedIndex == 0 || cboDVT.SelectedIndex == 1)
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("1");
                    cboSLDVT.SelectedIndex = 0;
                    cboSLDVT.SelectedIndex = 0;
                    cboSLTieuChuan.Items.Clear();
                    cboSLTieuChuan.Items.Add("");
                    cboSLTieuChuan.SelectedIndex = 0;

                }
                else
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("20");
                    cboSLDVT.SelectedIndex = 0;
                    cboSLDVT.SelectedIndex = 0;
                    cboSLTieuChuan.Items.Clear();      
                    cboSLTieuChuan.Items.Add("");
                    cboSLTieuChuan.SelectedIndex = 0;

                }
            }
            else if (cboLoaiThuoc.SelectedIndex == 0)
            {
                if (cboDVT.SelectedIndex == 0)
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("10");
                    cboSLDVT.SelectedIndex = 0;

                    cboSLTieuChuan.Items.Clear();
                    cboSLTieuChuan.Items.Add("10");
                    cboSLTieuChuan.SelectedIndex = 0;
                }
                else if (cboDVT.SelectedIndex == 1)
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("1");
                    cboSLDVT.SelectedIndex = 0;
                    cboSLTieuChuan.Items.Clear();
                    cboSLTieuChuan.Items.Add("100");
                    cboSLTieuChuan.SelectedIndex = 0;
                }
                else if (cboDVT.SelectedIndex == 2)
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("1");
                    cboSLDVT.SelectedIndex = 0;
                    cboSLTieuChuan.Items.Clear();
                    cboSLTieuChuan.Items.Add("30");
                    cboSLTieuChuan.SelectedIndex = 0;
                }
                else
                {
                    cboSLDVT.Items.Clear();
                    cboSLDVT.Items.Add("20");
                    cboSLDVT.SelectedIndex = 0;
                    cboSLTieuChuan.Items.Clear();
                    cboSLTieuChuan.Items.Add("10");
                    cboSLTieuChuan.SelectedIndex = 0;
                }
            }         
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void cboSLTieuChuan_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void dtpNgaySX_Leave(object sender, EventArgs e)
        {
            // Lấy giá trị từ DateTimePicker
            DateTime ngaySX = dtpNgaySX.Value;

            // So sánh với ngày hiện tại
            if (ngaySX > DateTime.Now)
            {
                // Hiển thị thông báo lỗi
                MessageBox.Show("Ngày sản xuất không được lớn hơn ngày hiện tại!", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);

                // Đặt lại giá trị về ngày hiện tại hoặc ngày hợp lệ tùy ý
                dtpNgaySX.Value = DateTime.Now;
            }
        }

        private void btnPhatThuocVeKhoa_Click(object sender, EventArgs e)
        {
            string maThuoc = dgvKhoThuoc.CurrentRow.Cells[0].Value.ToString();
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmPhatThuocTheoKhoa(maThuoc));
        }
    }
}
