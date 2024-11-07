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
        private string maCH { get; set; }
        private string maNVPT { get; set; }

        private bool isSelectingRow = false;
        //Nút tái khám
        public frmTaiKham(string pkb, string maNV)
        {
            InitializeComponent();
            maPKB = pkb;

            txtMaBN.Text = BUS_TaiKham.Instance.LayMaBN(maPKB);
            maNVPT = maNV;
            txtMaNV.Text = maNVPT;

            btnThemTK.Enabled = false;
        }

        //Nút nút đặt lịch
        public frmTaiKham(string pkb)
        {
            InitializeComponent();
            maPKB = pkb;
            txtMaBN.Text = BUS_TaiKham.Instance.LayMaBN(maPKB);
            txtMaNV.Text = "";
            btnSuaTK.Enabled = false;
        }
        //Lấy dữ liệu 
        private void TaiDuLieu()
        {
            BUS_TaiKham.Instance.LayDSTaiKham(dgvDSTaiKham);
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
            if (cboTrangThai.SelectedItem.ToString() != "Chưa hoàn thành")
            {
                MessageBox.Show("Trạng thái không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            string ma = BUS_TaiKham.Instance.TaoMa(maPKB);
            string maPhieuKB = ma.Split('-')[1];         
            if(!BUS_TaiKham.Instance.KiemTraKoDatLichTaiKhamNhieuLan(maPhieuKB))
            {
                string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKQ.Text);
                string kq = BUS_TaiKham.Instance.ThemTaiKham(new ET_TaiKham(ma, txtMaBN.Text, txtMaNV.Text, Convert.ToDateTime(dtpNgayTaiKham.Text), cboTrangThai.SelectedItem.ToString(), ketQua));
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
            else
            {
                MessageBox.Show("Phiếu khám bệnh đã thực hiện đặt lịch", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
            
        }

        private void frmTaiKham_Load(object sender, EventArgs e)
        {
            TaiDuLieu();

            //độ rộng cột
            dgvDSTaiKham.ColumnHeadersHeight = 40;

            dgvDSTaiKham.Columns[1].Visible = false;
            //btnSuaTK.Enabled = false;
            dtpNgayTaiKham.Value = DateTime.Now;
            cboTrangThai.SelectedIndex = 0;
            UpdateTrangThai();
        }

        private void btnSuaTK_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn lưu thông tin đã được thay đổi không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                string trangThai = cboTrangThai.SelectedItem.ToString();
                if (trangThai == "Đã hoàn thành" && txtKQ.Text == "")
                {
                    MessageBox.Show("Vui lòng nhập kết quả", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                string ketQua = BUS_BatLoi.Instance.GiupKyTuVietHoaVaBoKhoangTrangThua(txtKQ.Text);
                string kq = BUS_TaiKham.Instance.CapNhatTaiKham(new ET_TaiKham(maCH, txtMaBN.Text, txtMaNV.Text, Convert.ToDateTime(dtpNgayTaiKham.Text), cboTrangThai.SelectedItem.ToString(), ketQua));
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
            isSelectingRow = true;
            // Kiểm tra nếu có dòng được chọn và dòng đó không phải là dòng trống
            if (dgvDSTaiKham.CurrentRow != null && !dgvDSTaiKham.Rows[dgvDSTaiKham.CurrentRow.Index].IsNewRow)
            {
                btnThemTK.Enabled = false;
                btnSuaTK.Enabled = true;

                int dong = dgvDSTaiKham.CurrentCell.RowIndex;
                maCH = dgvDSTaiKham.Rows[dong].Cells[0].Value?.ToString() ?? "";
                txtMaBN.Text = dgvDSTaiKham.Rows[dong].Cells[1].Value?.ToString() ?? "";
                dtpNgayTaiKham.Text = dgvDSTaiKham.Rows[dong].Cells[4].Value?.ToString() ?? "";

                txtMaNV.Text = dgvDSTaiKham.Rows[dong].Cells[3].Value?.ToString() ?? maNVPT;
                txtKQ.Text = dgvDSTaiKham.Rows[dong].Cells[6].Value?.ToString() ?? "";

                // Thiết lập nguồn dữ liệu cho cboTrangThai dựa vào txtMaNV
                cboTrangThai.DataSource = string.IsNullOrEmpty(txtMaNV.Text) ? partialStatusList : fullStatusList;
                cboTrangThai.SelectedItem = dgvDSTaiKham.Rows[dong].Cells[5].Value?.ToString();

                if (cboTrangThai.SelectedItem.ToString() == "Đã hoàn thành")
                {
                    cboTrangThai.Enabled = false;
                    btnSuaTK.Enabled = false;
                    txtKQ.Enabled = false;
                }
                else
                {
                    cboTrangThai.Enabled = true;
                    btnSuaTK.Enabled = true;
                    txtKQ.Enabled = true;
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
            isSelectingRow = false;
        }

        private List<string> fullStatusList = new List<string> { "Chưa hoàn thành", "Đã hoàn thành", "Đã hủy" };
        private List<string> partialStatusList = new List<string> { "Chưa hoàn thành", "Đã hủy" };
        private void UpdateTrangThai()
        {
            if (!isSelectingRow)
            {
                if (string.IsNullOrEmpty(txtMaNV.Text))
                {
                    cboTrangThai.DataSource = partialStatusList;
                }
                else
                {
                    cboTrangThai.DataSource = fullStatusList;
                }
            }
        }

        private void cboTrangThai_SelectedIndexChanged(object sender, EventArgs e)
        {
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
}
