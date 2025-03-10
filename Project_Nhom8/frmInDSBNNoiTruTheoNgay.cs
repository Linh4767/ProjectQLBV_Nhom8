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
    public partial class frmInDSBNNoiTruTheoNgay : Form
    {
        public frmInDSBNNoiTruTheoNgay()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public frmInDSBNNoiTruTheoNgay(DateTime data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInDSBNNoiTruTheoNgay_Load(object sender, EventArgs e)
        {

            this.rptDSBNNoiTruTheoNgay.RefreshReport();
            var dsBNNoiTruTheoNgay = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoNgay(Data);
            try
            {
                // Clear previous data sources
                rptDSBNNoiTruTheoNgay.LocalReport.DataSources.Clear();

                // Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoNgay", dsBNNoiTruTheoNgay);

                ReportParameter[] reportParameters = new ReportParameter[2];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("NgayTK", Data.ToShortDateString());
                rptDSBNNoiTruTheoNgay.LocalReport.SetParameters(reportParameters);
                rptDSBNNoiTruTheoNgay.LocalReport.DataSources.Add(rds1);

                // Refresh and show the report
                rptDSBNNoiTruTheoNgay.RefreshReport();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load report: " + ex.Message);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn quay lại không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmDSBenhNhanNoiTru());
            }
        }
    }
}
