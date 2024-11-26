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
    public partial class frmInTraCuuHoaDonTheoNam : Form
    {
        public frmInTraCuuHoaDonTheoNam()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public frmInTraCuuHoaDonTheoNam(DateTime data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInTraCuuHoaDonTheoNam_Load(object sender, EventArgs e)
        {
            this.rptThongKeDoanhThuTheoNam.RefreshReport();
            var tongDoanhThuTheoNam = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoNam(Data.Year);
            var tongDoanhThuThucTuBNTheoNam = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoNam(Data.Year);
            var chiTietDSSuDungDVTheoNam = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoNam(Data.Year);
            var thongKeDSThuocTheoNam = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNamVaDoanhThu(Data.Year);
            var tongDoanhThuThuocTheoNam = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoNamVaDoanhThu(Data.Year);
            try
            {
                //Clear previous data sources
                rptThongKeDoanhThuTheoNam.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetTongDoanhThuSDDVTheoNam", tongDoanhThuTheoNam);
                ReportDataSource rds2 = new ReportDataSource("DataSetChiTietDSSuDungDVTheoNam", chiTietDSSuDungDVTheoNam);
                ReportDataSource rds3 = new ReportDataSource("DataSetTongDoanhThuThucTuBNTheoNam", tongDoanhThuThucTuBNTheoNam);
                ReportDataSource rds4 = new ReportDataSource("DataSetChiTietDSThuocTheoNam", thongKeDSThuocTheoNam);
                ReportDataSource rds5 = new ReportDataSource("DataSetTinhTongTienThuocTheoNam", tongDoanhThuThuocTheoNam);
                ReportParameter[] reportParameters = new ReportParameter[2];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("Nam", Data.Year.ToString());
                rptThongKeDoanhThuTheoNam.LocalReport.SetParameters(reportParameters);
                rptThongKeDoanhThuTheoNam.LocalReport.DataSources.Add(rds1);
                rptThongKeDoanhThuTheoNam.LocalReport.DataSources.Add(rds2);
                rptThongKeDoanhThuTheoNam.LocalReport.DataSources.Add(rds3);
                rptThongKeDoanhThuTheoNam.LocalReport.DataSources.Add(rds4);
                rptThongKeDoanhThuTheoNam.LocalReport.DataSources.Add(rds5);
                //Refresh and show the report
                rptThongKeDoanhThuTheoNam.RefreshReport();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load report: " + ex.Message);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có chắc muốn quay lại không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if(ret == DialogResult.Yes)
            {
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmTraCuuDoanhThu());
            }
        }
    }
}
