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
    public partial class frmInDSBNNoiTruTheoKhoangTG : Form
    {
        public frmInDSBNNoiTruTheoKhoangTG()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public DateTime Data1 { get; set; }
        public frmInDSBNNoiTruTheoKhoangTG(DateTime data, DateTime data1)
        {
            InitializeComponent();
            Data = data;
            Data1 = data1;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInDSBNNoiTruTheoKhoangTG_Load(object sender, EventArgs e)
        {

            this.rptDSBNNoiTruTheoKhoangTG.RefreshReport();
            var tongDoanhThuTheoKhoangTG = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoKhoangTG(Data, Data1);
            try
            {
                //Clear previous data sources
                rptDSBNNoiTruTheoKhoangTG.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoKhoangTG", tongDoanhThuTheoKhoangTG);
                ReportParameter[] reportParameters = new ReportParameter[3];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("TuNgay", Data.Date.ToShortDateString());
                reportParameters[2] = new ReportParameter("DenNgay", Data1.Date.ToShortDateString());
                rptDSBNNoiTruTheoKhoangTG.LocalReport.SetParameters(reportParameters);
                rptDSBNNoiTruTheoKhoangTG.LocalReport.DataSources.Add(rds1);
                //Refresh and show the report
                rptDSBNNoiTruTheoKhoangTG.RefreshReport();
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
