using BUS;
using ET;
using Microsoft.Reporting.WinForms;
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
    public partial class frmTraCuuHoaDonDV : Form
    {
        public frmTraCuuHoaDonDV()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        public frmTraCuuHoaDonDV(string data)
        {
            InitializeComponent();
            Data = data;
            txtTuKhoa.Text = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmTraCuuHoaDonDV_Load(object sender, EventArgs e)
        {
            dgvDSBenhNhan.Enabled = false;
            rptInHoaDon.Visible = false;
            this.rptInHoaDon.RefreshReport();
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            rptInHoaDon.Visible = false;
            if (!string.IsNullOrEmpty(txtTuKhoa.Text))
            {
                if (radTheoMaPhieuKB.Checked)
                {
                    //decimal tienSuDung = (decimal)BUS_TraCuuHoaDonDV.Instance.TinhTienSuDungDVGiaNiemYetTheoPhieuVaBenhNhan(txtTuKhoa.Text);
                    //txtTongTienSDDV.Text = tienSuDung.ToString("F0");
                    //decimal tienBNChiTra = (decimal)BUS_TraCuuHoaDonDV.Instance.TinhTienSuDungDVThucTuBNTheoPhieuVaBenhNhan(txtTuKhoa.Text);
                    //txtDoanhThuThucTe.Text = tienBNChiTra.ToString("F0");
                    BUS_TraCuuHoaDonDV.Instance.ChiTietDSSDVTheoTenHoacPhieu(txtTuKhoa.Text, dgvTongHop);
                    dgvTongHop.ColumnHeadersHeight = 40;
                }
                if (radTheoTenBN.Checked)
                {
                    BUS_TraCuuHoaDonDV.Instance.LayDanhSachPhieuKhamBenhTheoTenBN(txtTuKhoa.Text, dgvDSBenhNhan);
                    dgvDSBenhNhan.ColumnHeadersHeight = 40;
                    //dgvDSBenhNhan.Columns[6].Visible = false;
                    //dgvDSBenhNhan.Columns[7].Visible = false;
                    //txtTongTienSDDV.Text = "0";
                    //txtDoanhThuThucTe.Text = "0";
                    btnIn.Enabled = false;
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void radTheoMaPhieuKB_CheckedChanged(object sender, EventArgs e)
        {
            dgvDSBenhNhan.Enabled = false;
            btnIn.Enabled = true;
        }

        private void radTheoTenBN_CheckedChanged(object sender, EventArgs e)
        {
            dgvDSBenhNhan.Enabled = true;
            dgvTongHop.DataSource = null;
            btnIn.Enabled = false;
        }

        private void dgvDSBenhNhan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0) // Đảm bảo không click vào tiêu đề hoặc vùng trống
            {
                // Lấy dòng được click
                DataGridViewRow selectedRow = dgvDSBenhNhan.Rows[e.RowIndex];
                // Ví dụ: Lấy giá trị cột đầu tiên (cột mã bệnh nhân)
                string maBN = selectedRow.Cells[0].Value?.ToString();
                BUS_TraCuuHoaDonDV.Instance.ChiTietDSSDVTheoTen(maBN, dgvTongHop);
                dgvTongHop.ColumnHeadersHeight = 40;
                btnIn.Enabled = true;

            }
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            rptInHoaDon.Visible = true;
            if (radTheoMaPhieuKB.Checked)
            {
                string dataToSend = txtTuKhoa.Text;
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmInHoaDonSDDVTheoMaPhieuKB(dataToSend));
            }
            if (radTheoTenBN.Checked)
            {
                if (dgvDSBenhNhan.CurrentRow != null)
                {
                    string maPhieuKB = dgvDSBenhNhan.CurrentRow.Cells[0].Value.ToString();
                    frmMain frmMain = (frmMain)this.ParentForm;
                    frmMain.openChildForm(new frmInHoaDonSDDVTheoTenBN(maPhieuKB));
                    

                }
            }
        }

        private void dgvTongHop_Click(object sender, EventArgs e)
        {
            //btnIn.Enabled = true;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
