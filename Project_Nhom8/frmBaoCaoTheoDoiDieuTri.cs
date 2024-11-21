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
    public partial class frmBaoCaoTheoDoiDieuTri : Form
    {
        public frmBaoCaoTheoDoiDieuTri()
        {
            InitializeComponent();
        }

        private void frmBaoCaoTheoDoiDieuTri_Load(object sender, EventArgs e)
        {
            this.rptBaoCaoTDDT.RefreshReport();
            dtpTuNgay.Value = DateTime.Now;
            dtpDenNgay.Value = DateTime.Now;
            rptBaoCaoTDDT.Visible = false;
            dgvBaoCaoTDDT.ColumnHeadersHeight = 40;
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
            {
                BUS_BaoCaoTDDT.Instance.LayDSTheoDoiDieuTri(dtpTuNgay.Value, dtpDenNgay.Value, dgvBaoCaoTDDT);
            }
            else
            {
                MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            rptBaoCaoTDDT.Visible = false;
        }


        private void btnIn_Click(object sender, EventArgs e)
        {
            if(dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                rptBaoCaoTDDT.Visible = true;
                var tongDoanhThuTheoKhoangTG = BUS_BaoCaoTDDT.Instance.LayDSTheoDoiDieuTri(dtpTuNgay.Value, dtpDenNgay.Value);
                try
                {
                    //Clear previous data sources
                    rptBaoCaoTDDT.LocalReport.DataSources.Clear();

                    //Setup new data sources
                    ReportDataSource rds1 = new ReportDataSource("DataSetDSTheoDoiDieuTri", tongDoanhThuTheoKhoangTG);
                    ReportParameter[] reportParameters = new ReportParameter[3];
                    string userName = CurrentUser.UserName;
                    reportParameters[0] = new ReportParameter("TenNV", userName);
                    reportParameters[1] = new ReportParameter("TuNgay", dtpTuNgay.Value.Date.ToShortDateString());
                    reportParameters[2] = new ReportParameter("DenNgay", dtpDenNgay.Value.Date.ToShortDateString());
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
                else
            {
                MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
    }
}
