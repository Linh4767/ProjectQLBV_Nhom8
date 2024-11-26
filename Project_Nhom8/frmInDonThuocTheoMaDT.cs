using BUS;
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
    public partial class frmInDonThuocTheoMaDT : Form
    {
        public frmInDonThuocTheoMaDT()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        public frmInDonThuocTheoMaDT(string data)
        {
            InitializeComponent();
            Data = data;
        }
        private void frmInDonThuocTheoMaDT_Load(object sender, EventArgs e)
        {

            this.rptInDonThuoc.RefreshReport();
            var ds = BUS_InDonThuoc.Instance.InDonThuoc(Data);
            try
            {
                //Clear previous data sources
                rptInDonThuoc.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetInDonThuoc", ds);
                rptInDonThuoc.LocalReport.DataSources.Add(rds1);
                //Refresh and show the report
                rptInDonThuoc.RefreshReport();
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
                frmMain.openChildForm(new frmInDonThuoc());
            }
        }
    }
}
