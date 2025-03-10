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
    public partial class frmInTraCuuHoaDonTheoNgay : Form
    {
        public frmInTraCuuHoaDonTheoNgay()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public frmInTraCuuHoaDonTheoNgay(DateTime data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInTraCuuHoaDonTheoNgay_Load(object sender, EventArgs e)
        {

            this.rptTraCuuHoaDonTheoNgay.RefreshReport();
            var tongDoanhThuTheoNgay = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoNgay(Data);
            var tongDoanhThuThucTuBNTheoNgay = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoNgay(Data);
            var chiTietDSSuDungDVTheoNgay = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoNgay(Data);
            var thongKeDSThuocTheoNgay = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNgayVaDoanhThu(Data);
            var tongDoanhThuThuocTheoNgay = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoNgayVaDoanhThu(Data);
            try
            {
                // Clear previous data sources
                rptTraCuuHoaDonTheoNgay.LocalReport.DataSources.Clear();

                // Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetTongDoanhThuSDDVTheoNgay", tongDoanhThuTheoNgay);
                ReportDataSource rds2 = new ReportDataSource("DataSetChiTietDSSuDungDVTheoNgay", chiTietDSSuDungDVTheoNgay);
                ReportDataSource rds3 = new ReportDataSource("DataSetTongDoanhThuThucTuBNTheoNgay", tongDoanhThuThucTuBNTheoNgay);
                ReportDataSource rds4 = new ReportDataSource("DataSetChiTietDSThuocTheoNgay", thongKeDSThuocTheoNgay);
                ReportDataSource rds5 = new ReportDataSource("DataSetTinhTongTienThuocTheoNgay", tongDoanhThuThuocTheoNgay);
                ReportParameter[] reportParameters = new ReportParameter[2];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("NgayTK", Data.ToShortDateString());
                rptTraCuuHoaDonTheoNgay.LocalReport.SetParameters(reportParameters);
                rptTraCuuHoaDonTheoNgay.LocalReport.DataSources.Add(rds1);
                rptTraCuuHoaDonTheoNgay.LocalReport.DataSources.Add(rds2);
                rptTraCuuHoaDonTheoNgay.LocalReport.DataSources.Add(rds3);
                rptTraCuuHoaDonTheoNgay.LocalReport.DataSources.Add(rds4);
                rptTraCuuHoaDonTheoNgay.LocalReport.DataSources.Add(rds5);
                // Refresh and show the report
                rptTraCuuHoaDonTheoNgay.RefreshReport();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load report: " + ex.Message);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có chắc muốn quay lại không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                frmMain frmMain = (frmMain)this.ParentForm;
                frmMain.openChildForm(new frmTraCuuDoanhThu());
            }
        }
    }
}
