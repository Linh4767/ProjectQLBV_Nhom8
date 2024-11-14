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
    public partial class frmPhanGiuong : Form
    {
        public frmPhanGiuong()
        {
            InitializeComponent();
        }

        public frmPhanGiuong(string maBN, string maNVYC, string maNVTH, string khoa, string phong, DateTime ngayNhan, DateTime thoiGianNhan)
        {
            InitializeComponent();

            //Lấy mã bệnh nhân
            txtBenhNhan.Text = maBN;
            txtNhanVienTH.Text = maNVTH;
            txtKhoa.Text = khoa;
            txtPhongBenh.Text = phong;
            dtpNgayNhanGiuong.Value = ngayNhan;
            dtpThoiGianNhan.Value = thoiGianNhan;
        }

        private void frmPhanGiuong_Load(object sender, EventArgs e)
        {
            dgvPhanGiuong.ColumnHeadersHeight = 40;
            BUS_PhanGiuong.Instance.HienThiPhanGiuong(dgvPhanGiuong, dtpNgay.Value);
            dtpThoiGianTra.ShowUpDown = true;
        }

        private void txtNhanVienTH_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string pkb = txtBenhNhan.Text;
            string[] pkbs = pkb.Split('-');
            string maPKB = "";
            string maBN = "";
            string tenBN = "";
            if (pkbs.Length >= 2)
            {
                maPKB = pkbs[0].Trim() + "-" + pkbs[1].Trim();
            }
            if (BUS_PhanGiuong.Instance.KiemTraHoanThienTraGiuong(maPKB))
            {
                DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    //Lấy tên mã nhân viên
                    string input = txtNhanVienTH.Text;
                    string[] parts = input.Split('-');
                    string maNV = "";
                    string tenNV = "";
                    if (parts.Length == 2)
                    {
                        maNV = parts[0].Trim();
                        tenNV = parts[1].Trim();
                    }

                    //Lấy mã pkb, mã bệnh nhân, tên bệnh nhân

                    //Mã phòng
                    string p = txtPhongBenh.Text;
                    string[] phong = p.Split('-');
                    string maPhong = "";
                    if (phong.Length == 3)
                    {
                        maPhong = phong[0].Trim();
                        //MessageBox.Show("Mã nè con" + maPhong);
                    }
                    BUS_PhanGiuong.Instance.ThemPhanGiuong(new ET_PhanGiuong(cboGiuongBenh.SelectedValue.ToString(), maPKB, dtpNgayTra.Value.Date + dtpThoiGianTra.Value.TimeOfDay, dtpNgayNhanGiuong.Value.Date + dtpThoiGianNhan.Value.TimeOfDay, maPhong, maNV, txtGhiChu.Text));
                    BUS_PhanGiuong.Instance.HienThiPhanGiuong(dgvPhanGiuong, dtpNgay.Value);
                }
            }
            else
            {
                MessageBox.Show("Vui lòng trả giường trước khi phân giường khác", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            // Lấy mã phiếu khám bệnh, mã bệnh nhân, tên bệnh nhân
            string pkb = txtBenhNhan.Text;
            string[] pkbs = pkb.Split('-');
            string maPKB = "";
            if (pkbs.Length >= 2)
            {
                maPKB = pkbs[0].Trim() + "-" + pkbs[1].Trim();
            }

            // Lấy tên mã nhân viên
            string input = txtNhanVienTH.Text;
            string[] parts = input.Split('-');
            string maNV = "";
            string tenNV = "";
            if (parts.Length == 2)
            {
                maNV = parts[0].Trim();
                tenNV = parts[1].Trim();
            }

            // Mã phòng
            string p = txtPhongBenh.Text;
            string[] phong = p.Split('-');
            string maPhong = "";
            if (phong.Length == 3)
            {
                maPhong = phong[0].Trim();
            }

            DateTime ngayNhanGiuong = dtpNgayNhanGiuong.Value.Date + dtpThoiGianNhan.Value.TimeOfDay;
            DateTime ngayTraGiuong = dtpNgayTra.Value.Date + dtpThoiGianTra.Value.TimeOfDay;

            if (ngayNhanGiuong >= ngayTraGiuong)
            {
                MessageBox.Show("Ngày trả giường phải sau ngày nhận giường", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                BUS_PhanGiuong.Instance.SuaPhanGiuong(new ET_PhanGiuong(cboGiuongBenh.SelectedValue.ToString(), maPKB, ngayTraGiuong, ngayNhanGiuong, maPhong, maNV, txtGhiChu.Text));
                BUS_PhanGiuong.Instance.HienThiPhanGiuong(dgvPhanGiuong, dtpNgay.Value);
            }

        }

        private void btnThoát_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc chắn muốn thoát?", "Thông báo!", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            dgvPhanGiuong.ColumnHeadersHeight = 40;
            BUS_PhanGiuong.Instance.HienThiPhanGiuong(dgvPhanGiuong, dtpNgay.Value);
        }

        private void txtPhongBenh_TextChanged(object sender, EventArgs e)
        {
            BUS_PhanGiuong.Instance.HienThiGiuong(txtPhongBenh.Text, cboGiuongBenh);
        }

        private void dgvPhanGiuong_Click(object sender, EventArgs e)
        {
            if (dgvPhanGiuong.CurrentRow != null && !dgvPhanGiuong.Rows[dgvPhanGiuong.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvPhanGiuong.CurrentCell.RowIndex;
                //Bệnh nhân
                string maBN = dgvPhanGiuong.Rows[dong].Cells[0].Value.ToString();
                string tenBN = BUS_PhanGiuong.Instance.HienThiTenBN(maBN);
                string maPKB = dgvPhanGiuong.Rows[dong].Cells[1].Value.ToString();
                txtBenhNhan.Text = maPKB + "-" + maBN + "-" + tenBN;

                //Khoa
                string maKhoa = dgvPhanGiuong.Rows[dong].Cells[4].Value.ToString();
                string tenKhoa = BUS_PhanGiuong.Instance.HienThiTenKhoa(maKhoa);
                txtKhoa.Text = maKhoa + "-" + tenKhoa;

                //Phong
                string maPhong = dgvPhanGiuong.Rows[dong].Cells[2].Value.ToString();
                string tenPhong = BUS_PhanGiuong.Instance.HienThiTenPhong(maPhong);
                txtPhongBenh.Text = maPhong + "-" + tenPhong;

                cboGiuongBenh.SelectedValue = dgvPhanGiuong.Rows[dong].Cells[3].Value.ToString();

                // Lấy giá trị từ DataGridView (cột thứ 5)
                string ngayNhan = dgvPhanGiuong.Rows[dong].Cells[5].Value.ToString();

                // Chuyển chuỗi ngày giờ thành kiểu DateTime
                DateTime ngayGio = DateTime.Parse(ngayNhan);

                // Gán phần ngày cho DateTimePicker (chỉ ngày)
                dtpNgayNhanGiuong.Value = ngayGio.Date;  // Sử dụng .Date để chỉ lấy phần ngày

                // Gán phần giờ cho DateTimePicker khác (chỉ giờ)
                dtpThoiGianNhan.Value = DateTime.Parse("01/01/2000 " + ngayGio.ToString("HH:mm"));

                // Lấy giá trị từ DataGridView (cột thứ 5)
                // Kiểm tra nếu dòng và cột có tồn tại và giá trị không phải null
                if (dgvPhanGiuong.Rows.Count > dong && dgvPhanGiuong.Rows[dong].Cells[6].Value != null)
                {
                    // Lấy giá trị từ DataGridView (cột thứ 6)
                    string ngayTra = dgvPhanGiuong.Rows[dong].Cells[6].Value.ToString();

                    // Kiểm tra nếu giá trị ngày trả không rỗng
                    if (!string.IsNullOrEmpty(ngayTra))
                    {
                        // Chuyển chuỗi ngày giờ thành kiểu DateTime
                        DateTime ngayGioTra = DateTime.Parse(ngayTra);

                        // Gán phần ngày cho DateTimePicker (chỉ ngày)
                        dtpNgayTra.Value = ngayGioTra.Date;  // Sử dụng .Date để chỉ lấy phần ngày

                        // Gán phần giờ cho DateTimePicker khác (chỉ giờ)
                        dtpThoiGianTra.Value = DateTime.Parse("01/01/2000 " + ngayGioTra.ToString("HH:mm"));
                    }
                    else
                    {
                        // Nếu ngày trả là null hoặc không có giá trị, thiết lập các giá trị mặc định cho DateTimePicker
                        dtpNgayTra.Value = DateTime.Now.Date;  // Đặt ngày mặc định là ngày hiện tại
                        dtpThoiGianTra.Value = DateTime.Now;  // Đặt giờ mặc định là giờ hiện tại
                    }
                }
                txtGhiChu.Text = dgvPhanGiuong.Rows[dong].Cells[7].Value.ToString();
                //Nhân viên
                string maNV = dgvPhanGiuong.Rows[dong].Cells[8].Value.ToString();
                string tenNV = BUS_PhanGiuong.Instance.HienThiTenNV(maNV);
                txtNhanVienTH.Text = maNV + "-" + tenNV;
                dtpNgayTra.Enabled = true;
                dtpThoiGianTra.Enabled = true;
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                cboGiuongBenh.Enabled = false;
                btnLamMoi.Enabled = true;
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            cboGiuongBenh.Enabled = true;
            btnThem.Enabled = true;
            btnSua.Enabled = false;
        }
    }
}
