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
        //Nút tái khám
        public frmTaiKham(string pkb, string maNV)
        {
            InitializeComponent();
            maPKB = pkb;

            txtMaBN.Text = BUS_TaiKham.Instance.LayMaBN(maPKB);
            txtMaNV.Text = maNV;

            btnThemTK.Enabled = false;
        }

        //Nút nút đặt lịch
        public frmTaiKham(string pkb)
        {
            InitializeComponent();
            maPKB = pkb;
            txtMaBN.Text = BUS_TaiKham.Instance.LayMaBN(maPKB);
            txtMaNV.Text = "";
        }
        //Lấy dữ liệu 
        private void TaiDuLieu()
        {
            BUS_TaiKham.Instance.LayDSTaiKham(dgvDSTaiKham);
            txtMaCH.Text = BUS_TaiKham.Instance.TaoMa();
        }
        private void btnThemTK_Click(object sender, EventArgs e)
        {
            //kiểm tra ngày
            DateTime ngayTaiKham = dtpNgayTaiKham.Value;
            if (ngayTaiKham.Date < DateTime.Now.Date)
            {
                MessageBox.Show("Thời gian không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKQ.Text);
            string kq = BUS_TaiKham.Instance.ThemTaiKham(new ET_TaiKham(txtMaCH.Text, txtMaBN.Text, txtMaNV.Text, Convert.ToDateTime(dtpNgayTaiKham.Text), cboTrangThai.SelectedItem.ToString(), ketQua));
            MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            if (kq == "Thêm thành công")
            {
                txtMaBN.Clear();
                txtKQ.Clear();
                txtMaBN.Clear();
                txtMaNV.Clear();
                btnThemTK.Enabled = false;
                TaiDuLieu();
            }
        }

        private void frmTaiKham_Load(object sender, EventArgs e)
        {
            TaiDuLieu();

            //độ rộng cột
            dgvDSTaiKham.ColumnHeadersHeight = 40;

            dgvDSTaiKham.Columns[1].Visible = false;
            btnSuaTK.Enabled = false;
            dtpNgayTaiKham.Value = DateTime.Now;
            cboTrangThai.SelectedIndex = 0;
            UpdateTrangThai();
        }

        private void btnSuaTK_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn lưu thông tin đã được thay đổi không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                //kiểm tra ngày
                //DateTime ngayTaiKham = dtpNgayTaiKham.Value;
                //if (ngayTaiKham.Date < DateTime.Now.Date)
                //{
                //    MessageBox.Show("Thời gian không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                //    return;
                //}

                string trangThai = cboTrangThai.SelectedItem.ToString();
                if (trangThai == "Đã hoàn thành" && txtKQ.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập kết quả", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKQ.Text);
                string kq = BUS_TaiKham.Instance.CapNhatTaiKham(new ET_TaiKham(txtMaCH.Text, txtMaBN.Text, txtMaNV.Text, Convert.ToDateTime(dtpNgayTaiKham.Text), cboTrangThai.SelectedItem.ToString(), ketQua));
                MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (kq == "Cập nhật thành công")
                {
                    txtMaBN.Clear();
                    txtKQ.Clear();
                    txtMaBN.Clear();
                    txtMaNV.Clear();
                    btnSuaTK.Enabled = false;
                    TaiDuLieu();
                }
            }
        }

        private void btnQuayLai_Click(object sender, EventArgs e)
        {
            // Tạo tham chiếu đến frmMain
            frmMain mainForm = (frmMain)this.ParentForm;
            // Gọi phương thức mở frmKhamBenh từ frmMain
            mainForm.openChildForm(new frmKhamBenh());
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            BUS_TaiKham.Instance.TimKiemBenhNhan(txtTimKiem.Text, dgvDSTaiKham);
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
                btnThemTK.Enabled = false;
                btnSuaTK.Enabled = true;

                int dong = dgvDSTaiKham.CurrentCell.RowIndex;
                txtMaCH.Text = dgvDSTaiKham.Rows[dong].Cells[0].Value?.ToString() ?? "";
                txtMaBN.Text = dgvDSTaiKham.Rows[dong].Cells[1].Value?.ToString() ?? "";
                dtpNgayTaiKham.Text = dgvDSTaiKham.Rows[dong].Cells[4].Value?.ToString() ?? "";
                cboTrangThai.SelectedItem = dgvDSTaiKham.Rows[dong].Cells[5].Value?.ToString() ?? "";

                txtMaNV.Text = dgvDSTaiKham.Rows[dong].Cells[3].Value?.ToString() ?? "";
                txtKQ.Text = dgvDSTaiKham.Rows[dong].Cells[6].Value?.ToString() ?? "";

                //if (cboTrangThai.SelectedItem.ToString() == "Đã hủy")
                //{
                //    btnSuaTK.Enabled = false;
                //}
            }
        }

        private void UpdateTrangThai()
        {
            if (string.IsNullOrEmpty(txtMaNV.Text))
            {
                // Hiển thị chỉ 2 trạng thái khi txtMaNV trống
                cboTrangThai.DataSource = new List<string> { "Chưa hoàn thành", "Đã hủy" };
            }
            else
            {
                // Hiển thị đầy đủ 3 trạng thái khi txtMaNV có giá trị
                cboTrangThai.DataSource = new List<string> { "Chưa hoàn thành", "Đã hoàn thành", "Đã hủy" };
            }
        }

        private void cboTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
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
}
