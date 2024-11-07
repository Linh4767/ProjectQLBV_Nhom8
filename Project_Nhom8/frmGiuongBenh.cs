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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Project_Nhom8
{
    public partial class frmGiuongBenh : Form
    {
        public frmGiuongBenh()
        {
            InitializeComponent();
        }

        private void frmGiuongBenh_Load(object sender, EventArgs e)
        {
            dgvGiuongBenh.ColumnHeadersHeight = 40;
            cboMaPhong.Items.Clear();          
            BUS_GiuongBenh.Instance.HienThiComboboxKhoa(cboKhoa);
            btnThem.Enabled = true;
            btnCapNhat.Enabled = false;
            nurSoGiuong.Minimum = 1;
            nurSoGiuong.Maximum = 4;
            nurSoGiuong.Value = 1;
            //dgvGiuongBenh.Columns[].Visible = false;
            cboMaPhong.DropDownWidth = 150;  // Chiều rộng của phần danh sách khi bấm vào
            cboMaPhong.DropDownHeight = 300; // Chiều cao của phần danh sách thả xuống
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string tenKhoa = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboKhoa.SelectedValue.ToString());
                string trangThai = cboTrangThai.GetItemText(cboTrangThai.SelectedItem);
                if (tenKhoa != null && cboKhoa.SelectedValue != null && cboMaPhong.SelectedValue != null)
                {
                    BUS_GiuongBenh.Instance.ThemGiuongBenh(new ET_GiuongBenh(txtMaGiuongBenh.Text, int.Parse(nurSoGiuong.Text), trangThai, cboMaPhong.SelectedValue.ToString()));
                }           
                if (cboKhoa.SelectedValue.ToString() != null)
                {
                    BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh, cboKhoa.SelectedValue.ToString());
                }
            }
        }


        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaGiuongBenh.Clear();
            nurSoGiuong.Value = 1;
            txtTimKiem.Clear();
            cboMaPhong.SelectedIndex = 0;
            btnThem.Enabled = true;
            btnCapNhat.Enabled = false;
            nurSoGiuong.Enabled = true;
            cboKhoa.Enabled = true;
            cboMaPhong.Enabled = true;
            BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh, cboKhoa.SelectedValue.ToString());
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
            BUS_GiuongBenh.Instance.TimKiemGiuongBenh(txtTimKiem.Text, dgvGiuongBenh);
        }

        private void dgvGiuongBenh_Click(object sender, EventArgs e)
        {
            if (dgvGiuongBenh.CurrentRow != null && !dgvGiuongBenh.Rows[dgvGiuongBenh.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvGiuongBenh.CurrentCell.RowIndex;
                txtMaGiuongBenh.Text = dgvGiuongBenh.Rows[dong].Cells[0].Value.ToString();
                nurSoGiuong.Text = dgvGiuongBenh.Rows[dong].Cells[1].Value.ToString();
                cboMaPhong.SelectedValue = dgvGiuongBenh.Rows[dong].Cells[2].Value.ToString();
                cboTrangThai.SelectedIndex = cboTrangThai.FindStringExact(dgvGiuongBenh.Rows[dong].Cells[4].Value.ToString());
                cboKhoa.SelectedValue = dgvGiuongBenh.Rows[dong].Cells[5].Value.ToString();
                btnThem.Enabled = false;
                btnCapNhat.Enabled = true;
                nurSoGiuong.Enabled = false;
                cboMaPhong.Enabled = false;
                cboKhoa.Enabled = false;
            }
        }

        private void nurSoGiuong_ValueChanged(object sender, EventArgs e)
        {
            // Lấy giá trị hiện tại của NumericUpDown
            int soGiuong = (int)nurSoGiuong.Value;

            // Cập nhật mã giường bệnh dựa trên số giường
            string tenKhoa = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboKhoa.SelectedValue.ToString());
            if (tenKhoa != null && cboKhoa.SelectedValue != null && cboMaPhong.SelectedValue != null)
            {
                txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(soGiuong, cboMaPhong.SelectedValue.ToString(), tenKhoa);
            }
        }

        private void cboMaPhong_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tenKhoa = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboKhoa.SelectedValue.ToString());
            if (tenKhoa != null && cboKhoa.SelectedValue != null && cboMaPhong.SelectedValue != null)
            {
                txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(int.Parse(nurSoGiuong.Text), cboMaPhong.SelectedValue.ToString(), tenKhoa);
            }
        }

        private void nurSoGiuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '.' || e.KeyChar == ',' && !char.IsControl(e.KeyChar))
            {
                e.Handled = true; // Chặn nhập dấu thập phân
            }
        }

        private void cboKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            string tenKhoa = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboKhoa.SelectedValue.ToString());
            if (cboKhoa.SelectedValue != null)
            {
                BUS_GiuongBenh.Instance.HienThiComboboxPhong(cboMaPhong, cboKhoa.SelectedValue.ToString());
            }
            if (tenKhoa != null && cboKhoa.SelectedValue != null && cboMaPhong.SelectedValue != null)
            {
                txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(int.Parse(nurSoGiuong.Text), cboMaPhong.SelectedValue.ToString(), tenKhoa);
                BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh, cboKhoa.SelectedValue.ToString());
            }
           
        }

        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                string tenKhoa = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboKhoa.SelectedValue.ToString());
                string trangThai = cboTrangThai.GetItemText(cboTrangThai.SelectedItem);
                if (tenKhoa != null && cboKhoa.SelectedValue != null && cboMaPhong.SelectedValue != null)
                {
                    BUS_GiuongBenh.Instance.SuaGiuongBenh(new ET_GiuongBenh(txtMaGiuongBenh.Text, int.Parse(nurSoGiuong.Text), trangThai, cboMaPhong.SelectedValue.ToString()));
                }
                if (cboKhoa.SelectedValue.ToString() != null)
                {
                    BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh, cboKhoa.SelectedValue.ToString());
                }
            }
        }
    }
}
