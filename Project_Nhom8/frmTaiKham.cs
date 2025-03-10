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
    public partial class frmTaiKham : Form
    {
        public frmTaiKham()
        {
            InitializeComponent();
        }

        private string maPKB { get; set; }

        //Nút nút đặt lịch
        public frmTaiKham(string pkb)
        {
            InitializeComponent();
            maPKB = pkb;
        }
        //Lấy dữ liệu 
        private void TaiDuLieu()
        {
            BUS_TaiKham.Instance.LayDSTaiKham(dgvDSTaiKham, Convert.ToDateTime(dtpChonNgay.Text));
            txtMaCH.Text = BUS_TaiKham.Instance.TaoMa();
        }

        private void frmTaiKham_Load(object sender, EventArgs e)
        {
            cboChonKhoa.SelectedIndexChanged -= cboChonKhoa_SelectedIndexChanged;
            cboPhong.SelectedIndexChanged -= cboPhong_SelectedIndexChanged;
            if (!string.IsNullOrEmpty(maPKB))
            {
                txtBN.Text = BUS_TaiKham.Instance.LayTenBN(maPKB);
                BUS_TaiKham.Instance.LayPhongTheoPKB(maPKB, cboPhong);
                if (cboPhong.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayKhoaTheoPhong(cboPhong.SelectedValue.ToString(), cboChonKhoa);
                    BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                }
                BUS_TaiKham.Instance.LaySoBATheoPKB(maPKB, cboSoBA);
                cboChonKhoa.Enabled = false;
                cboSoBA.Enabled = false;
            }
            else
            {
                BUS_TaiKham.Instance.LayDSKhoa(cboChonKhoa);

                if (cboChonKhoa.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayPhongTheoPhanCong(cboPhong, dtpChonNgay.Value, dtpTGCa.Value, cboChonKhoa.SelectedValue.ToString());

                    if (cboPhong.SelectedValue != null)
                    {
                        BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                    }
                    else
                    {
                        cboMaNV.DataSource = null;
                    }
                }
                BUS_TaiKham.Instance.LayDSSoBA(dtpChonNgay.Value, cboSoBA);
                if (cboSoBA.SelectedValue != null)
                {
                    string soBA = cboSoBA.Text;
                    txtBN.Text = soBA.Split('-')[1];
                }
                cboChonKhoa.Enabled = true;

            }
            TaiDuLieu();
            //độ rộng cột
            dgvDSTaiKham.ColumnHeadersHeight = 40;

            cboChonKhoa.DropDownWidth = 150;
            cboChonKhoa.DropDownHeight = 300;
            cboPhong.DropDownWidth = 150;
            cboPhong.DropDownHeight = 300;

            btnSuaTK.Enabled = false;
            dtpNgayTaiKham.Value = DateTime.Now;
            dtpChonNgay.Value = DateTime.Now;
            cboTrangThai.SelectedIndex = 0;
            UpdateTrangThai();

            dtpTGCa.Format = DateTimePickerFormat.Custom;
            dtpTGCa.CustomFormat = "HH:mm";
            dtpTGCa.ShowUpDown = true;
            cboChonKhoa.SelectedIndexChanged += cboChonKhoa_SelectedIndexChanged;
            cboPhong.SelectedIndexChanged += cboPhong_SelectedIndexChanged;

        }
        private void btnThemTK_Click(object sender, EventArgs e)
        {
            if (cboSoBA.SelectedValue != null && cboPhong.SelectedValue != null && cboMaNV.SelectedValue != null)
            {
                //kiểm tra ngày
                DateTime ngayTK = dtpNgayTaiKham.Value;
                if (ngayTK.Date < DateTime.Now.Date)
                {
                    MessageBox.Show("Thời gian không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (cboTrangThai.SelectedItem.ToString() != "Chưa hoàn thành")
                {
                    MessageBox.Show("Trạng thái không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                if (!string.IsNullOrEmpty(txtKQ.Text))
                {
                    MessageBox.Show("Vui lòng không điền vào ô kết quả!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    string maCH = BUS_TaiKham.Instance.TaoMa();
                    string maSBA = cboSoBA.SelectedValue.ToString();
                    string maPhong = cboPhong.SelectedValue.ToString();

                    if (!string.IsNullOrEmpty(maSBA) && !string.IsNullOrEmpty(maPhong))
                    {
                        string kq = BUS_TaiKham.Instance.ThemTaiKham(new ET_TaiKham(maCH, maSBA, maPhong, null, Convert.ToDateTime(dtpNgayTaiKham.Text), cboTrangThai.SelectedItem.ToString(), txtKQ.Text));
                        if (kq == "Thêm thành công")
                        {
                            MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            maPKB = "";
                            TaiDuLieu();
                        }
                        else
                        {
                            MessageBox.Show(kq, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Chưa đủ thông tin", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                
            }
            else
            {
                MessageBox.Show("Chưa đủ thông tin để thêm", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSuaTK_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn lưu thông tin đã được thay đổi không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                string trangThai = cboTrangThai.SelectedItem.ToString();
                if (trangThai == "Đã hoàn thành")
                {
                    if (string.IsNullOrEmpty(txtKQ.Text))
                    {
                        MessageBox.Show("Vui lòng nhập kết quả", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    if (string.IsNullOrEmpty(cboMaNV.SelectedValue.ToString()))
                    {
                        MessageBox.Show("Vui lòng cho biết người phụ trách", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }

                DateTime ngay = dtpNgayTaiKham.Value.Date;
                string ketLuan = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKQ.Text);
                string maSBA = cboSoBA.SelectedValue.ToString();
                string maPhong = cboPhong.SelectedValue.ToString();

                if (!string.IsNullOrEmpty(maSBA) && !string.IsNullOrEmpty(maPhong))
                {
                    string kQua = BUS_TaiKham.Instance.CapNhatTaiKham(new ET_TaiKham(txtMaCH.Text, maSBA, maPhong, cboMaNV.SelectedValue.ToString(), ngay, cboTrangThai.SelectedItem.ToString(), ketLuan));
                    MessageBox.Show(kQua, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    if (kQua.Contains("thành công"))
                    {
                        btnSuaTK.Enabled = false;
                        TaiDuLieu();
                    }
                    else
                    {
                        MessageBox.Show(kQua, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                else
                {
                    MessageBox.Show("Mã số bệnh án hoặc mã phòng không hợp lệ.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            if (radCuocHen.Checked)
            {
                BUS_TaiKham.Instance.TimKiemCuocHenBenhNhan(txtTimKiem.Text, dgvDSTaiKham, dtpChonNgay.Value);
            }
            else
            {
                BUS_TaiKham.Instance.TimKiemDSTaiKhamBenhNhan(txtTimKiem.Text, dgvDSTaiKham);
            }
        }

        private void bntThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void dgvDSTaiKham_Click(object sender, EventArgs e)
        {
            // Kiểm tra nếu có dòng được chọn và dòng đó không phải là dòng trống
            if (dgvDSTaiKham.CurrentRow != null && !dgvDSTaiKham.Rows[dgvDSTaiKham.CurrentRow.Index].IsNewRow)
            {
                //btnThemTK.Enabled = false;
                btnSuaTK.Enabled = true;
                cboChonKhoa.Enabled = false;
                cboSoBA.Enabled = false;

                int dong = dgvDSTaiKham.CurrentCell.RowIndex;
                txtMaCH.Text = dgvDSTaiKham.Rows[dong].Cells[0].Value?.ToString();
                txtBN.Text = dgvDSTaiKham.Rows[dong].Cells[5].Value?.ToString() ?? "";
                dtpNgayTaiKham.Text = dgvDSTaiKham.Rows[dong].Cells[7].Value?.ToString();
                txtKQ.Text = dgvDSTaiKham.Rows[dong].Cells[9].Value?.ToString() ?? "";

                cboChonKhoa.SelectedValue = dgvDSTaiKham.Rows[dong].Cells[10].Value?.ToString();
                cboPhong.SelectedValue = dgvDSTaiKham.Rows[dong].Cells[1].Value?.ToString() ?? "";

                string maSoBA = dgvDSTaiKham.Rows[dong].Cells[3].Value?.ToString() ?? "";
                if (!string.IsNullOrEmpty(maSoBA))
                {
                    BUS_TaiKham.Instance.LaySoBA(maSoBA, cboSoBA);
                }

                string maNV = dgvDSTaiKham.Rows[dong].Cells[6].Value?.ToString() ?? "";
                if (!string.IsNullOrEmpty(maNV))
                {
                    BUS_TaiKham.Instance.LayNhanVienTheoMa(maNV, cboMaNV);
                    cboMaNV.Enabled = false;
                }
                else
                {
                    if (cboPhong.SelectedValue != null)
                    {
                        BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                        cboMaNV.Enabled = true;
                    }
                }
                UpdateTrangThai();

                // Thiết lập nguồn dữ liệu cho cboTrangThai dựa vào cbomaNV
                cboTrangThai.SelectedItem = dgvDSTaiKham.Rows[dong].Cells[8].Value?.ToString();

                if (cboTrangThai.SelectedItem.ToString() != "Chưa hoàn thành")
                {
                    btnSuaTK.Enabled = false;
                }
                else
                {
                    btnSuaTK.Enabled = true;
                }

                if (!cboTrangThai.Enabled) return;
                string trangThai = cboTrangThai.SelectedItem.ToString();
                if (trangThai == "Đã hoàn thành")
                {
                    txtKQ.Enabled = true;
                }
                else
                {
                    txtKQ.Enabled = false;
                }
            }
        }

        private List<string> fullStatusList = new List<string> { "Chưa hoàn thành", "Đã hoàn thành", "Đã hủy" };
        private List<string> partialStatusList = new List<string> { "Chưa hoàn thành", "Đã hủy" };
        private void UpdateTrangThai()
        {
            if (cboMaNV.Items.Count > 0 && cboMaNV.SelectedItem != null)
            {
                cboTrangThai.DataSource = fullStatusList;
            }
            else
            {
                cboTrangThai.DataSource = partialStatusList;
            }
        }

        private void cboTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cboTrangThai.Enabled) return;
            if (cboTrangThai.SelectedItem == null)
            {
                return;
            }
            string trangThai = cboTrangThai.SelectedItem.ToString();
            if (trangThai == "Đã hoàn thành")
            {
                txtKQ.Enabled = true;
            }
            else
            {
                txtKQ.Enabled = false;
            }
        }

        private bool isChanging = false;  // Flag để tránh vòng lặp vô hạn
        private void cboChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Tránh gọi lại sự kiện khi đang thay đổi giá trị
            if (isChanging) return;

            if (!string.IsNullOrEmpty(maPKB))
            {
                isChanging = true;  // Đặt flag để tránh vòng lặp

                txtBN.Text = BUS_TaiKham.Instance.LayTenBN(maPKB);
                BUS_TaiKham.Instance.LayPhongTheoPKB(maPKB, cboPhong);
                if (cboPhong.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayKhoaTheoPhong(cboPhong.SelectedValue.ToString(), cboChonKhoa);
                    BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                }
                cboChonKhoa.Enabled = false;

                isChanging = false;  // Đặt lại flag sau khi xong
            }
            else
            {

                if (cboChonKhoa.SelectedValue != null)
                {
                    isChanging = true;

                    BUS_TaiKham.Instance.LayPhongTheoPhanCong(cboPhong, dtpChonNgay.Value, dtpTGCa.Value, cboChonKhoa.SelectedValue.ToString());

                    if (cboPhong.SelectedValue != null)
                    {
                        BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                    }
                    else
                    {
                        cboMaNV.DataSource = null;
                    }

                    isChanging = false;
                }

            }
        }

        private void cboPhong_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Tránh gọi lại sự kiện khi đang thay đổi giá trị
            if (isChanging) return;

            if (!string.IsNullOrEmpty(maPKB))
            {
                isChanging = true;  // Đặt flag để tránh vòng lặp

                if (cboPhong.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayKhoaTheoPhong(cboPhong.SelectedValue.ToString(), cboChonKhoa);
                }

                isChanging = false;
            }

            if (cboPhong.SelectedValue != null)
            {
                isChanging = true;
                BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                isChanging = false;
            }
            else
            {
                cboMaNV.DataSource = null;
            }
        }

        private void cboMaNV_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateTrangThai();
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            btnSuaTK.Enabled = false;
            maPKB = "";
            txtKQ.Clear();
            txtBN.Text = string.Empty;
            btnThemTK.Enabled = true;
            cboMaNV.Enabled = true;
            cboChonKhoa.Enabled = true;
            cboTrangThai.Enabled = true;
            cboTrangThai.SelectedIndex = 0;
            cboSoBA.Enabled = true;
            BUS_TaiKham.Instance.LayDSKhoa(cboChonKhoa);
            BUS_TaiKham.Instance.LayDSSoBA(dtpNgayTaiKham.Value, cboSoBA);
            if (cboSoBA.SelectedValue != null)
            {
                string soBA = cboSoBA.Text;
                txtBN.Text = soBA.Split('-')[1];
            }

            TaiDuLieu();
        }

        private void dtpChonNgay_ValueChanged(object sender, EventArgs e)
        {
            // Tránh gọi lại sự kiện khi đang thay đổi giá trị
            if (isChanging) return;
            BUS_TaiKham.Instance.LayDSTaiKham(dgvDSTaiKham, dtpChonNgay.Value);
            if (!string.IsNullOrEmpty(maPKB))
            {
                isChanging = true;  // Đặt flag để tránh vòng lặp
                txtBN.Text = BUS_TaiKham.Instance.LayTenBN(maPKB);
                BUS_TaiKham.Instance.LayPhongTheoPKB(maPKB, cboPhong);
                if (cboPhong.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayKhoaTheoPhong(cboPhong.SelectedValue.ToString(), cboChonKhoa);
                    BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                }
                BUS_TaiKham.Instance.LaySoBATheoPKB(maPKB, cboSoBA);
                cboChonKhoa.Enabled = false;
                cboSoBA.Enabled = false;
                isChanging = false;
            }
            else
            {
                if (cboChonKhoa.SelectedValue != null)
                {
                    isChanging = true;  // Đặt flag để tránh vòng lặp
                    BUS_TaiKham.Instance.LayPhongTheoPhanCong(cboPhong, dtpChonNgay.Value, dtpTGCa.Value, cboChonKhoa.SelectedValue.ToString());

                    if (cboPhong.SelectedValue != null)
                    {
                        BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                    }
                    else
                    {
                        cboMaNV.DataSource = null;
                    }
                    isChanging = false;
                }

                BUS_TaiKham.Instance.LayDSSoBA(dtpChonNgay.Value, cboSoBA);
                cboChonKhoa.Enabled = true;

            }
        }

        private void dtpTGCa_ValueChanged(object sender, EventArgs e)
        {
            // Tránh gọi lại sự kiện khi đang thay đổi giá trị
            if (isChanging) return;

            if (!string.IsNullOrEmpty(maPKB))
            {
                isChanging = true;  // Đặt flag để tránh vòng lặp
                txtBN.Text = BUS_TaiKham.Instance.LayTenBN(maPKB);
                BUS_TaiKham.Instance.LayPhongTheoPKB(maPKB, cboPhong);
                if (cboPhong.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                }
                isChanging = false;
            }
            else
            {
                isChanging = true;  // Đặt flag để tránh vòng lặp
                if (cboChonKhoa.SelectedValue != null)
                {
                    BUS_TaiKham.Instance.LayPhongTheoPhanCong(cboPhong, dtpChonNgay.Value, dtpTGCa.Value, cboChonKhoa.SelectedValue.ToString());

                    if (cboPhong.SelectedValue != null)
                    {
                        BUS_TaiKham.Instance.LayNhanVienTheoPhanCongVaPhong(cboMaNV, dtpChonNgay.Value, dtpTGCa.Value, cboPhong.SelectedValue.ToString());
                    }
                    else
                    {
                        cboMaNV.DataSource = null;
                    }
                }
                isChanging = false;
                cboChonKhoa.Enabled = true;
            }
        }

        private void cboSoBA_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboSoBA.SelectedValue != null)
            {
                string soBA = cboSoBA.Text;
                txtBN.Text = soBA.Split('-')[1];
            }
        }

        private void txtKQ_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != ' ' && e.KeyChar != '-' &&
                !char.IsControl(e.KeyChar) && e.KeyChar != ',' && e.KeyChar != '/' && e.KeyChar != '.')
            {
                e.Handled = true;
                MessageBox.Show("Nhập được chữ và số và các dấu -,/,. hoặc dấu ,", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            if (txtKQ.Text.Length > 999 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Nhập quá ký tự tự cho phép là 1000", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
