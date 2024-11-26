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
    public partial class frmInHoaDonSDDVTheoTenBN : Form
    {
        public frmInHoaDonSDDVTheoTenBN()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        public frmInHoaDonSDDVTheoTenBN(string data)
        {
            InitializeComponent();
            Data = data;
        }
        private void frmInHoaDonSDDVTheoTenBN_Load(object sender, EventArgs e)
        {
            this.rptInHoaDon.RefreshReport();
            var tongTien = BUS_TraCuuHoaDonDV.Instance.ThongKeHoaDonSuDungDV(Data);
            var ds = BUS_TraCuuHoaDonDV.Instance.ChiTietDSSDVTheoTenHoacPhieu(Data);
            try
            {
                //Clear previous data sources
                rptInHoaDon.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetTienSDDVCuaPKB", tongTien);
                ReportDataSource rds2 = new ReportDataSource("DataSetDSSDDVCuaPKB", ds);
                string userName = CurrentUser.UserName;
                ReportParameter[] reportParameters = new ReportParameter[1];
                reportParameters[0] = new ReportParameter("TenNV", userName);
                rptInHoaDon.LocalReport.SetParameters(reportParameters);
                rptInHoaDon.LocalReport.DataSources.Add(rds1);
                rptInHoaDon.LocalReport.DataSources.Add(rds2);
                //Refresh and show the report
                rptInHoaDon.RefreshReport();
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
                frmMain.openChildForm(new frmTraCuuHoaDonDV());
            }
        }
    }
}
