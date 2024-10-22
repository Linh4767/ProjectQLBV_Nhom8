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
            dgvCaTruc.Columns[4].Visible = false;
            dgvCaTruc.Columns[5].Visible = false;

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

            cboMaNV.DisplayMember = "TenNV";
            cboMaNV.ValueMember = "MaNV";

            //chọn item đầu tiên
            cboCaTruc.SelectedIndex = 0;
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
                string kq = BUS_CaTruc.Instance.ThemCatruc(new ET_CaTruc(cboPhong.SelectedValue.ToString(), cboMaNV.SelectedValue.ToString(), cboCaTruc.SelectedItem.ToString(), Convert.ToDateTime(dtpCaTruc.Text)));
                MessageBox.Show(kq, "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                TaiDuLieu();
            }
        }

        private void txtTimNV_KeyPress(object sender, KeyPressEventArgs e)
        {
            // Chỉ cho phép nhập chữ cái và số
            if (!char.IsLetterOrDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                // Hủy việc nhập ký tự
                e.Handled = true;
            }
        }

        private void cboChonKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            string maKhoa = cboChonKhoa.SelectedValue.ToString();

            BUS_CaTruc.Instance.LayDanhSachPhong(maKhoa, cboPhong);
            cboPhong.DisplayMember = "TenPhong";
            cboPhong.ValueMember = "MSPhong";

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
    }
}
