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
    public partial class frmInDonThuoc : Form
    {
        public frmInDonThuoc()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        public frmInDonThuoc(string data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
            txtTuKhoa.Text = Data;
        }
        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void frmInDonThuoc_Load(object sender, EventArgs e)
        {
            radTheoMaDonThuoc.Checked = true;
            dgvDSBenhNhan.Enabled = false;
            this.rptInDonThuoc.RefreshReport();
            rptInDonThuoc.Visible = false;
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            rptInDonThuoc.Visible = false;
            if (!string.IsNullOrEmpty(txtTuKhoa.Text))
            {
                dgvTongHop.ColumnHeadersHeight = 40;
                if (radTheoMaDonThuoc.Checked)
                {
                    BUS_InDonThuoc.Instance.InDonThuoc(txtTuKhoa.Text, dgvTongHop);
                }
                if (radTheoTenBN.Checked)
                {
                    dgvDSBenhNhan.Enabled = true;
                    BUS_InDonThuoc.Instance.LayDanhSachDonThuocTheoTenBN(txtTuKhoa.Text, dgvDSBenhNhan);
                    dgvDSBenhNhan.ColumnHeadersHeight = 40;
                    dgvDSBenhNhan.Columns[4].Visible = false;
                    dgvDSBenhNhan.Columns[5].Visible = false;
                    btnIn.Enabled = false;
                }
            }
            else
            {
                MessageBox.Show("Vui lòng nhập từ khóa tìm kiếm", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            rptInDonThuoc.Visible = true;
            if (radTheoMaDonThuoc.Checked)
            {
                string dataToSend = txtTuKhoa.Text;
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmInDonThuocTheoMaDT(dataToSend));
                //var ds = BUS_InDonThuoc.Instance.InDonThuoc(txtTuKhoa.Text);
                //try
                //{
                //    //Clear previous data sources
                //    rptInDonThuoc.LocalReport.DataSources.Clear();

                //    //Setup new data sources
                //    ReportDataSource rds1 = new ReportDataSource("DataSetInDonThuoc", ds);
                //    rptInDonThuoc.LocalReport.DataSources.Add(rds1);
                //    //Refresh and show the report
                //    rptInDonThuoc.RefreshReport();
                //}
                //catch (Exception ex)
                //{
                //    MessageBox.Show("Failed to load report: " + ex.Message);
                //}
            }
            if (radTheoTenBN.Checked)
            {
                if (dgvDSBenhNhan.CurrentRow != null)
                {
                    string maPhieuKB = dgvDSBenhNhan.CurrentRow.Cells[0].Value.ToString();
                    frmMain frmMain = (frmMain)this.ParentForm;
                    frmMain.openChildForm(new frmInDonThuocTheoTenBN(maPhieuKB));
                    //var ds = BUS_InDonThuoc.Instance.InDonThuoc(maPhieuKB);
                    //try
                    //{
                    //    //Clear previous data sources
                    //    rptInDonThuoc.LocalReport.DataSources.Clear();

                    //    //Setup new data sources
                    //    ReportDataSource rds1 = new ReportDataSource("DataSetInDonThuoc", ds);
                    //    rptInDonThuoc.LocalReport.DataSources.Add(rds1);
                    //    //Refresh and show the report
                    //    rptInDonThuoc.RefreshReport();
                    //}
                    //catch (Exception ex)
                    //{
                    //    MessageBox.Show("Failed to load report: " + ex.Message);
                    //}

                }
            }
        }

        private void radTheoTenBN_CheckedChanged(object sender, EventArgs e)
        {
            btnIn.Enabled = false;
            dgvDSBenhNhan.Enabled = true;
        }

        private void radTheoMaDonThuoc_CheckedChanged(object sender, EventArgs e)
        {
            btnIn.Enabled = true;
        }

        private void dgvDSBenhNhan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0) // Đảm bảo không click vào tiêu đề hoặc vùng trống
            {
                // Lấy dòng được click
                DataGridViewRow selectedRow = dgvDSBenhNhan.Rows[e.RowIndex];
                // Ví dụ: Lấy giá trị cột đầu tiên (cột mã bệnh nhân)
                string maBN = selectedRow.Cells[0].Value?.ToString();
                BUS_InDonThuoc.Instance.InDonThuoc(maBN, dgvTongHop);
                dgvTongHop.ColumnHeadersHeight = 40;
                
                btnIn.Enabled = true;
            }
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
