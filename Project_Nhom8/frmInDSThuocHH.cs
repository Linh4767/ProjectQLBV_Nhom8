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
    public partial class frmInDSThuocHH : Form
    {
        public frmInDSThuocHH()
        {
            InitializeComponent();
        }

        private void frmInDSThuocHH_Load(object sender, EventArgs e)
        {
            this.rptThuocHH.RefreshReport();
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

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn quay lại không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmHanSuDung());
            }
        }
    }
}
