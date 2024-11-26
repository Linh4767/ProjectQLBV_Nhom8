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
    public partial class frmInDSBNNoiTruTheoThang : Form
    {
        public frmInDSBNNoiTruTheoThang()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public frmInDSBNNoiTruTheoThang(DateTime data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInDSBNNoiTruTheoThang_Load(object sender, EventArgs e)
        {

            this.rptDSBNNoiTruTheoThang.RefreshReport();
            var dsBNNoiTruTheoThang = BUS_DSBenhNhanNoiTru.Instance.LayDSBNNoiTruTheoThang(Data.Month, Data.Year);
            try
            {
                //Clear previous data sources
                rptDSBNNoiTruTheoThang.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetDSBNNoiTruTheoThang", dsBNNoiTruTheoThang);

                ReportParameter[] reportParameters = new ReportParameter[3];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("Thang", Data.Month.ToString());
                reportParameters[2] = new ReportParameter("Nam", Data.Year.ToString());
                rptDSBNNoiTruTheoThang.LocalReport.SetParameters(reportParameters);
                rptDSBNNoiTruTheoThang.LocalReport.DataSources.Add(rds1);
                //Refresh and show the report
                rptDSBNNoiTruTheoThang.RefreshReport();
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
