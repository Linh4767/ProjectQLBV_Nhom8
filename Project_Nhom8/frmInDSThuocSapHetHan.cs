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
    public partial class frmInDSThuocSapHetHan : Form
    {
        public frmInDSThuocSapHetHan()
        {
            InitializeComponent();
        }

        private void frmInDSThuocSapHetHan_Load(object sender, EventArgs e)
        {

            this.rptThuocGanHH.RefreshReport();
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
