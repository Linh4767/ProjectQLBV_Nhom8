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
    public partial class frmDSBenhNhanNoiTru : Form
    {
        public frmDSBenhNhanNoiTru()
        {
            InitializeComponent();
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            dgvTongHop.ColumnHeadersHeight = 40;
            rptDSBNNoiTruTheoNam.Visible = false;
            rptDSBNNoiTruTheoNgay.Visible = false;
            rptDSBNNoiTruTheoThang.Visible = false;
            rptDSBNNoiTruTheoKhoangTG.Visible = false;
            if (radTheoNgay.Checked)
            {
                BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoNgay(dtpTuNgay.Value,dgvTongHop);
            }
            if (radTheoThang.Checked)
            {
                BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoThang(dtpTuNgay.Value.Month,dtpTuNgay.Value.Year, dgvTongHop);
            }
            if (radTheoNam.Checked)
            {
                BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoNam(dtpTuNgay.Value.Year, dgvTongHop);
            }
            if (radTheoKhoangTG.Checked)
            {
                if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                    BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value, dgvTongHop);
                }
                else
                {
                    MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void frmDSBenhNhanNoiTru_Load(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = false;
            dtpTuNgay.Value = DateTime.Now;
            dtpDenNgay.Value = DateTime.Now;
            this.rptDSBNNoiTruTheoNgay.RefreshReport();
            this.rptDSBNNoiTruTheoThang.RefreshReport();
            this.rptDSBNNoiTruTheoNam.RefreshReport();
            this.rptDSBNNoiTruTheoKhoangTG.RefreshReport();
            rptDSBNNoiTruTheoNam.Visible = false;
            rptDSBNNoiTruTheoNgay.Visible = false;
            rptDSBNNoiTruTheoThang.Visible = false;
            rptDSBNNoiTruTheoKhoangTG.Visible = false;
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            if (radTheoNgay.Checked)
            {
                rptDSBNNoiTruTheoNgay.Visible = true;
                rptDSBNNoiTruTheoThang.Visible = false;
                rptDSBNNoiTruTheoNam.Visible = false;
                rptDSBNNoiTruTheoKhoangTG.Visible = false;
                //var dsBNNoiTruTheoNgay = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoNgay(dtpTuNgay.Value);
                //try
                //{
                //    // Clear previous data sources
                //    rptDSBNNoiTruTheoNgay.LocalReport.DataSources.Clear();

                //    // Setup new data sources
                //    ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoNgay", dsBNNoiTruTheoNgay);

                //    ReportParameter[] reportParameters = new ReportParameter[2];
                //    string userName = CurrentUser.UserName;
                //    reportParameters[0] = new ReportParameter("TenNV", userName);
                //    reportParameters[1] = new ReportParameter("NgayTK", dtpTuNgay.Value.ToShortDateString());
                //    rptDSBNNoiTruTheoNgay.LocalReport.SetParameters(reportParameters);
                //    rptDSBNNoiTruTheoNgay.LocalReport.DataSources.Add(rds1);

                //    // Refresh and show the report
                //    rptDSBNNoiTruTheoNgay.RefreshReport();
                //}
                //catch (Exception ex)
                //{
                //    MessageBox.Show("Failed to load report: " + ex.Message);
                //}
                DateTime dataToSend = dtpTuNgay.Value;
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmInDSBNNoiTruTheoNgay(dataToSend));
            }
            if (radTheoThang.Checked)
            {
                rptDSBNNoiTruTheoNgay.Visible = false;
                rptDSBNNoiTruTheoThang.Visible = true;
                rptDSBNNoiTruTheoNam.Visible = false;
                rptDSBNNoiTruTheoKhoangTG.Visible = false;
                DateTime dataToSend = dtpTuNgay.Value;
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmInDSBNNoiTruTheoThang(dataToSend));
                //var dsBNNoiTruTheoThang = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoThang(dtpTuNgay.Value.Month, dtpTuNgay.Value.Year);
                //try
                //{
                //    //Clear previous data sources
                //    rptDSBNNoiTruTheoThang.LocalReport.DataSources.Clear();

                //    //Setup new data sources
                //    ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoThang", dsBNNoiTruTheoThang);
                   
                //    ReportParameter[] reportParameters = new ReportParameter[3];
                //    string userName = CurrentUser.UserName;
                //    reportParameters[0] = new ReportParameter("TenNV", userName);
                //    reportParameters[1] = new ReportParameter("Thang", dtpTuNgay.Value.Month.ToString());
                //    reportParameters[2] = new ReportParameter("Nam", dtpTuNgay.Value.Year.ToString());
                //    rptDSBNNoiTruTheoThang.LocalReport.SetParameters(reportParameters);
                //    rptDSBNNoiTruTheoThang.LocalReport.DataSources.Add(rds1);
                //    //Refresh and show the report
                //    rptDSBNNoiTruTheoThang.RefreshReport();
                //}
                //catch (Exception ex)
                //{
                //    MessageBox.Show("Failed to load report: " + ex.Message);
                //}
            }
            if (radTheoNam.Checked)
            {
                rptDSBNNoiTruTheoNgay.Visible = false;
                rptDSBNNoiTruTheoThang.Visible = false;
                rptDSBNNoiTruTheoNam.Visible = true;
                rptDSBNNoiTruTheoKhoangTG.Visible = false;
                DateTime dataToSend = dtpTuNgay.Value;
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmInDSBNNoiTruTheoNam(dataToSend));
                //var ds = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoNam(dtpTuNgay.Value.Year);
                //try
                //{
                //    //Clear previous data sources
                //    rptDSBNNoiTruTheoNam.LocalReport.DataSources.Clear();

                //    //Setup new data sources
                //    ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoNam", ds);
                //    ReportParameter[] reportParameters = new ReportParameter[2];
                //    string userName = CurrentUser.UserName;
                //    reportParameters[0] = new ReportParameter("TenNV", userName);
                //    reportParameters[1] = new ReportParameter("Nam", dtpTuNgay.Value.Year.ToString());
                //    rptDSBNNoiTruTheoNam.LocalReport.SetParameters(reportParameters);
                //    rptDSBNNoiTruTheoNam.LocalReport.DataSources.Add(rds1);
                //    //Refresh and show the report
                //    rptDSBNNoiTruTheoNam.RefreshReport();
                //}
                //catch (Exception ex)
                //{
                //    MessageBox.Show("Failed to load report: " + ex.Message);
                //}
            }
            if (radTheoKhoangTG.Checked)
            {
                if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                    rptDSBNNoiTruTheoNgay.Visible = false;
                    rptDSBNNoiTruTheoThang.Visible = false;
                    rptDSBNNoiTruTheoNam.Visible = false;
                    rptDSBNNoiTruTheoKhoangTG.Visible = true;
                    DateTime dataToSend = dtpTuNgay.Value;
                    DateTime dataToSend1 = dtpDenNgay.Value;
                    frmMain frmMain = (frmMain)this.ParentForm;
                    frmMain.openChildForm(new frmInDSBNNoiTruTheoKhoangTG(dataToSend,dataToSend1));
                    //var tongDoanhThuTheoKhoangTG = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);                
                    //try
                    //{
                    //    //Clear previous data sources
                    //    rptDSBNNoiTruTheoKhoangTG.LocalReport.DataSources.Clear();

                    //    //Setup new data sources
                    //    ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoKhoangTG", tongDoanhThuTheoKhoangTG);
                    //    ReportParameter[] reportParameters = new ReportParameter[3];
                    //    string userName = CurrentUser.UserName;
                    //    reportParameters[0] = new ReportParameter("TenNV", userName);
                    //    reportParameters[1] = new ReportParameter("TuNgay", dtpTuNgay.Value.Date.ToShortDateString());
                    //    reportParameters[2] = new ReportParameter("DenNgay", dtpDenNgay.Value.Date.ToShortDateString());
                    //    rptDSBNNoiTruTheoKhoangTG.LocalReport.SetParameters(reportParameters);
                    //    rptDSBNNoiTruTheoKhoangTG.LocalReport.DataSources.Add(rds1);
                    //    //Refresh and show the report
                    //    rptDSBNNoiTruTheoKhoangTG.RefreshReport();
                    //}
                    //catch (Exception ex)
                    //{
                    //    MessageBox.Show("Failed to load report: " + ex.Message);
                    //}
                }
                else
                {
                    MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void radTheoKhoangTG_CheckedChanged(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = true;
        }

        private void radTheoNgay_CheckedChanged(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = false;
        }

        private void radTheoThang_CheckedChanged(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = false;
        }

        private void radTheoNam_CheckedChanged(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = false;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
