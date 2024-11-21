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
    public partial class frmHanSuDung : Form
    {
        public frmHanSuDung()
        {
            InitializeComponent();
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            if(radThuocGanHH.Checked == true)
            {
                rptThuocHH.Visible = false;
                dgvHSD.Visible = false;
                rptThuocGanHH.Visible = true;
                var dsThuoc = BUS_HSD.Instance.LayDSThuocGanHH();
                try
                {
                    // Clear previous data sources
                    rptThuocGanHH.LocalReport.DataSources.Clear();

                    // Setup new data sources
                    ReportDataSource rds1 = new ReportDataSource("DataSetThuocGanHH", dsThuoc);

                    ReportParameter[] reportParameters = new ReportParameter[1];
                    string userName = CurrentUser.UserName;
                    reportParameters[0] = new ReportParameter("TenNV", userName);
                    rptThuocGanHH.LocalReport.SetParameters(reportParameters);
                    rptThuocGanHH.LocalReport.DataSources.Add(rds1);

                    // Refresh and show the report
                    rptThuocGanHH.RefreshReport();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Failed to load report: " + ex.Message);
                }
            }
            else
            {
                rptThuocHH.Visible = true;
                dgvHSD.Visible = false;
                rptThuocGanHH.Visible = false;
                var dsThuoc = BUS_HSD.Instance.LayDSThuocHH();
                try
                {
                    // Clear previous data sources
                    rptThuocHH.LocalReport.DataSources.Clear();

                    // Setup new data sources
                    ReportDataSource rds1 = new ReportDataSource("DataSetThuocHH", dsThuoc);

                    ReportParameter[] reportParameters = new ReportParameter[1];
                    string userName = CurrentUser.UserName;
                    reportParameters[0] = new ReportParameter("TenNV", userName);
                    rptThuocHH.LocalReport.SetParameters(reportParameters);
                    rptThuocHH.LocalReport.DataSources.Add(rds1);

                    // Refresh and show the report
                    rptThuocHH.RefreshReport();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Failed to load report: " + ex.Message);
                }
            }

        }

        private void frmHanSuDung_Load(object sender, EventArgs e)
        {

            this.rptThuocGanHH.RefreshReport();
            this.rptThuocHH.RefreshReport();
            dgvHSD.ColumnHeadersHeight = 40;
            rptThuocHH.Visible = false;
            rptThuocGanHH.Visible = false;
        }

        private void btnXoaSLThuoc_Click(object sender, EventArgs e)
        {
            // Danh sách thuốc cần xóa (chứa cặp mã thuốc và mã lô)
            var danhSachThuoc = new List<Tuple<string, string>>();

            // Duyệt qua các dòng đã chọn trong DataGridView
            foreach (DataGridViewRow row in dgvHSD.SelectedRows)
            {
                string maThuoc = row.Cells["MaThuoc"].Value.ToString(); // Lấy mã thuốc từ cột MaThuoc
                string maLo = row.Cells["MaLo"].Value.ToString(); // Lấy mã lô từ cột MaLo

                // Thêm vào danh sách thuốc cần xóa
                danhSachThuoc.Add(new Tuple<string, string>(maThuoc, maLo));
            }

            // Kiểm tra nếu không có dòng nào được chọn
            if (danhSachThuoc.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn ít nhất một thuốc để xóa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Gọi phương thức XoaNhieuThuocTrongKho từ BUS_KhoThuoc để xóa các thuốc đã chọn
            int soLuongThuocXoa = BUS_KhoThuoc.Instance.XoaNhieuThuocTrongKho(danhSachThuoc);

            // Kiểm tra kết quả trả về
            if (soLuongThuocXoa > 0)
            {
                MessageBox.Show($"Đã xóa thành công {soLuongThuocXoa} thuốc khỏi kho!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Cập nhật lại giao diện, ví dụ như hiển thị lại danh sách thuốc trong kho
                BUS_Thuoc.Instance.HienThiThuoc(dgvHSD);
            }
            else
            {
                MessageBox.Show("Không thể xóa thuốc!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvHSD_Click(object sender, EventArgs e)
        {
            btnXoaSLThuoc.Enabled = true;
        }

        private void btnTim_Click(object sender, EventArgs e)
        {

            if(radThuocGanHH.Checked == true)
            {
                BUS_Thuoc.Instance.HienThịThuocSapHetHan(dgvHSD);
            }
            else
            {
                BUS_Thuoc.Instance.HienThịThuocHetHan(dgvHSD);
            }
            dgvHSD.Visible = true;
            rptThuocGanHH.Visible = false;
            rptThuocHH.Visible = false;
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thoát không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
