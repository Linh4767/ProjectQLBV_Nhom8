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
    public partial class frmInDSBNNoiTruTheoNam : Form
    {
        public frmInDSBNNoiTruTheoNam()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public frmInDSBNNoiTruTheoNam(DateTime data)
        {
            InitializeComponent();
            Data = data;
        }
        private void frmInDSBNNoiTruTheoNam_Load(object sender, EventArgs e)
        {

            this.rptDSBNNoiTruTheoNam.RefreshReport();
            var ds = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoNam(Data.Year);
            try
            {
                //Clear previous data sources
                rptDSBNNoiTruTheoNam.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoNam", ds);
                ReportParameter[] reportParameters = new ReportParameter[2];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("Nam", Data.Year.ToString());
                rptDSBNNoiTruTheoNam.LocalReport.SetParameters(reportParameters);
                rptDSBNNoiTruTheoNam.LocalReport.DataSources.Add(rds1);
                //Refresh and show the report
                rptDSBNNoiTruTheoNam.RefreshReport();
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
