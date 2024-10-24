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
            BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh);
            BUS_GiuongBenh.Instance.HienThiComboboxPhong(cboMaPhong);
            txtKhoa.Text = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboMaPhong.SelectedValue.ToString());
            txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(int.Parse(nurSoGiuong.Text), cboMaPhong.SelectedValue.ToString());
            btnThem.Enabled = true;
            btnXoa.Enabled = false;
            nurSoGiuong.Minimum = 1;
            nurSoGiuong.Maximum = 7;
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
                BUS_GiuongBenh.Instance.ThemGiuongBenh(new ET_GiuongBenh(txtMaGiuongBenh.Text, int.Parse(nurSoGiuong.Text), cboMaPhong.SelectedValue.ToString()));
                BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            //Kiểm tra đã chọn dòng trên datagridview chưa
            if (dgvGiuongBenh.SelectedRows.Count == 0)
            {
                MessageBox.Show("Bạn phải chọn dòng để xóa", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                DialogResult dialog = MessageBox.Show("Bạn có muốn xóa không ?", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dialog == DialogResult.Yes)
                {
                    BUS_GiuongBenh.Instance.XoaGiuongBenh(txtMaGiuongBenh.Text);
                    BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh);
                    btnThem.Enabled = true;
                    btnXoa.Enabled = false;
                }
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtMaGiuongBenh.Clear();
            txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(int.Parse(nurSoGiuong.Text), cboMaPhong.SelectedValue.ToString());
            nurSoGiuong.Value = 1;
            txtTimKiem.Clear();
            cboMaPhong.SelectedIndex = 0;
            btnThem.Enabled = true;
            btnXoa.Enabled = false;
            BUS_GiuongBenh.Instance.HienThiGiuongBenh(dgvGiuongBenh);
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
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
            }
        }

        private void nurSoGiuong_ValueChanged(object sender, EventArgs e)
        {
            // Lấy giá trị hiện tại của NumericUpDown
            int soGiuong = (int)nurSoGiuong.Value;

            // Cập nhật mã giường bệnh dựa trên số giường
            txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(soGiuong, cboMaPhong.SelectedValue.ToString());
        }

        private void cboMaPhong_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtMaGiuongBenh.Text = BUS_GiuongBenh.Instance.TaoMaTuDong(int.Parse(nurSoGiuong.Text), cboMaPhong.SelectedValue.ToString());
            txtKhoa.Text = BUS_GiuongBenh.Instance.HienThiTenKhoa(cboMaPhong.SelectedValue.ToString());
        }

        private void nurSoGiuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == '.' || e.KeyChar == ',' && !char.IsControl(e.KeyChar))
            {
                e.Handled = true; // Chặn nhập dấu thập phân
            }
        }
    }
}
