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
    public partial class frmInDSBNTheoDoiDieuTri : Form
    {
        public frmInDSBNTheoDoiDieuTri()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public DateTime Data1 { get; set; }
        public frmInDSBNTheoDoiDieuTri(DateTime data, DateTime data1)
        {
            InitializeComponent();
            Data = data;
            Data1 = data1;
        }
        private void frmInDSBNTheoDoiDieuTri_Load(object sender, EventArgs e)
        {

            this.rptBaoCaoTDDT.RefreshReport();
            var tongDoanhThuTheoKhoangTG = BUS_BaoCaoTDDT.Instance.LayDSTheoDoiDieuTri(Data, Data1);
            try
            {
                //Clear previous data sources
                rptBaoCaoTDDT.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetDSTheoDoiDieuTri", tongDoanhThuTheoKhoangTG);
                ReportParameter[] reportParameters = new ReportParameter[3];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("TuNgay", Data.Date.ToShortDateString());
                reportParameters[2] = new ReportParameter("DenNgay",Data1.Date.ToShortDateString());
                rptBaoCaoTDDT.LocalReport.SetParameters(reportParameters);
                rptBaoCaoTDDT.LocalReport.DataSources.Add(rds1);
                //Refresh rptBaoCaoTDDT show the report
                rptBaoCaoTDDT.RefreshReport();
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
                frmMain.openChildForm(new frmBaoCaoTheoDoiDieuTri());
            }
        }
    }
}
