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
    public partial class frmCaTruc : Form
    {
        public frmCaTruc()
        {
            InitializeComponent();
        }

        private string maCT { get; set; }
        private void btnTimNV_Click(object sender, EventArgs e)
        {
            BUS_CaTruc.Instance.TimNhanVien(txtTimNV.Text, dgvCaTruc);
        }

        private void frmCaTruc_Load(object sender, EventArgs e)
        {
            //tải danh sách ca trực
            TaiDuLieu();
            dgvCaTruc.ColumnHeadersHeight = 40;
            //ẩn cột
            dgvCaTruc.Columns[1].Visible = false;
            dgvCaTruc.Columns[3].Visible = false;
            dgvCaTruc.Columns[7].Visible = false;

            //lấy dữ liệu cho cboKhoa
            BUS_CaTruc.Instance.LayDanhSachKhoa(cboChonKhoa);
            cboChonKhoa.DisplayMember = "TenKhoa";
            cboChonKhoa.ValueMember = "MaKhoa";

            // Lấy dữ liệu cho phòng, nhân viên với khoa đầu tiên trong danh sách
            if (cboChonKhoa.Items.Count > 0)
            {
                string maKhoa = cboChonKhoa.SelectedValue.ToString();
                BUS_CaTruc.Instance.LayDanhSachPhong(maKhoa, cboPhong); //lấy danh sách phòng theo khoa
                BUS_CaTruc.Instance.LayDanhSachNhanVien(maKhoa, cboMaNV); //lấy danh sách nhân viên theo khoa
            }

            cboPhong.DisplayMember = "TenPhong";
            cboPhong.ValueMember = "MSPhong";

            cboMaNV.DisplayMember = "HienThi";
            cboMaNV.ValueMember = "MaNV";

            //chọn item đầu tiên
            cboCaTruc.SelectedIndex = 0;
            btnSuaCaTruc.Enabled = false;
            cboChonKhoa.DropDownWidth = 150;
            cboChonKhoa.DropDownHeight = 300;

            cboPhong.DropDownWidth = 150;
            cboPhong.DropDownHeight = 300;

            cboMaNV.DropDownWidth = 150;
            cboMaNV.DropDownHeight = 300;
            dtpNgayTruc.Value = DateTime.Now;
        }

        //Tải dữ liệu cho form ca trực
        private void TaiDuLieu()
        {
            BUS_CaTruc.Instance.LayDSCaTruc(dgvCaTruc);
        }
        private void btnThemCaTruc_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn muốn thực hiện thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                string ca = cboCaTruc.SelectedItem.ToString();
                string maCT = BUS_CaTruc.Instance.TaoMa(ca);
                string kq = BUS_CaTruc.Instance.ThemCatruc(new ET_CaTruc(maCT, cboPhong.SelectedValue.ToString(), cboMaNV.SelectedValue.ToString(), ca, Convert.ToDateTime(dtpNgayTruc.Text)));
                MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                TaiDuLieu();
            }

        }

        private void txtTimNV_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ cái và số
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back && !char.IsWhiteSpace(e.KeyChar))
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void cboChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maKhoa = cboChonKhoa.SelectedValue.ToString();

            //tải dữ liêu cho combobox Phòng
            BUS_CaTruc.Instance.LayDanhSachPhong(maKhoa, cboPhong);
            cboPhong.DisplayMember = "TenPhong";
            cboPhong.ValueMember = "MSPhong";

            //tải dữ liêu cho combobox MaNV
            BUS_CaTruc.Instance.LayDanhSachNhanVien(maKhoa, cboMaNV);
            cboMaNV.DisplayMember = "TenNV";
            cboMaNV.ValueMember = "MaNV";
        }

        private void bntThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void dgvCaTruc_Click(object sender, EventArgs e)
        {
            // Kiểm tra nếu có dòng được chọn và dòng đó không phải là dòng trống
            if (dgvCaTruc.CurrentRow != null && !dgvCaTruc.Rows[dgvCaTruc.CurrentRow.Index].IsNewRow)
            {
                btnThemCaTruc.Enabled = false;
                btnSuaCaTruc.Enabled = true;
                cboCaTruc.Enabled = false;
                cboChonKhoa.Enabled = false;

                int dong = dgvCaTruc.CurrentCell.RowIndex;
                maCT = dgvCaTruc.Rows[dong].Cells[0].Value.ToString();
                cboPhong.SelectedValue = dgvCaTruc.Rows[dong].Cells[1].Value.ToString();
                cboMaNV.SelectedValue = dgvCaTruc.Rows[dong].Cells[3].Value.ToString();
                cboCaTruc.SelectedItem = dgvCaTruc.Rows[dong].Cells[5].Value.ToString();
                dtpNgayTruc.Text = dgvCaTruc.Rows[dong].Cells[6].Value.ToString();

                string maKhoa = dgvCaTruc.Rows[dong].Cells[7].Value.ToString();
                BUS_CaTruc.Instance.LayKhoa(maKhoa, cboChonKhoa);
            }
        }

        private void btnSuaCaTruc_Click(object sender, EventArgs e)
        {
            DialogResult tb = MessageBox.Show("Bạn có muốn lưu thông tin đã được thay đổi không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (tb == DialogResult.Yes)
            {
                string kq = BUS_CaTruc.Instance.CapNhatCatruc(new ET_CaTruc(maCT, cboPhong.SelectedValue.ToString(), cboMaNV.SelectedValue.ToString(), cboCaTruc.SelectedItem.ToString(), Convert.ToDateTime(dtpNgayTruc.Text)));
                MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (kq == "Cập nhật thành công")
                {
                    btnSuaCaTruc.Enabled = false;
                    cboPhong.Enabled = true;
                    cboMaNV.Enabled = true;
                    cboChonKhoa.Enabled = true;
                    cboCaTruc.Enabled = true;
                }
                TaiDuLieu();
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            cboChonKhoa.SelectedIndex = 0;
            cboCaTruc.SelectedIndex = 0;
            cboPhong.Enabled = true;
            cboMaNV.Enabled = true;
            cboChonKhoa.Enabled = true;
            cboCaTruc.Enabled = true;
            btnThemCaTruc.Enabled = true;
            btnSuaCaTruc.Enabled = false;
            dtpNgayTruc.Value = DateTime.Now;
            TaiDuLieu();
        }

        private void dtpNgayTruc_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
