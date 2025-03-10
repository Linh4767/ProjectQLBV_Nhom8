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
    public partial class frmInTraCuuHoaDonTheoThang : Form
    {
        public frmInTraCuuHoaDonTheoThang()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public frmInTraCuuHoaDonTheoThang(DateTime data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInTraCuuHoaDonTheoThang_Load(object sender, EventArgs e)
        {
            this.rptThongKeDoanhThuTheoThang.RefreshReport();
            var tongDoanhThuTheoThang = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoThang(Data.Month, Data.Year);
            var tongDoanhThuThucTuBNTheoThang = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoThang(Data.Month, Data.Year);
            var chiTietDSSuDungDVTheoThang = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoThang(Data.Month, Data.Year);
            var thongKeDSThuocTheoThang = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoThangVaDoanhThu(Data.Month, Data.Year);
            var tongDoanhThuThuocTheoThang = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoThangVaDoanhThu(Data.Month, Data.Year);
            try
            {
                //Clear previous data sources
                rptThongKeDoanhThuTheoThang.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetTongDoanhThuSDDVTheoThang", tongDoanhThuTheoThang);
                ReportDataSource rds2 = new ReportDataSource("DataSetChiTietDSSuDungDVTheoThang", chiTietDSSuDungDVTheoThang);
                ReportDataSource rds3 = new ReportDataSource("DataSetTongDoanhThuThucTuBNTheoThang", tongDoanhThuThucTuBNTheoThang);
                ReportDataSource rds4 = new ReportDataSource("DataSetChiTietDSThuocTheoThang", thongKeDSThuocTheoThang);
                ReportDataSource rds5 = new ReportDataSource("DataSetTinhTongTienThuocTheoThang", tongDoanhThuThuocTheoThang);
                ReportParameter[] reportParameters = new ReportParameter[3];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("Thang", Data.Month.ToString());
                reportParameters[2] = new ReportParameter("Nam", Data.Year.ToString());
                rptThongKeDoanhThuTheoThang.LocalReport.SetParameters(reportParameters);
                rptThongKeDoanhThuTheoThang.LocalReport.DataSources.Add(rds1);
                rptThongKeDoanhThuTheoThang.LocalReport.DataSources.Add(rds2);
                rptThongKeDoanhThuTheoThang.LocalReport.DataSources.Add(rds3);
                rptThongKeDoanhThuTheoThang.LocalReport.DataSources.Add(rds4);
                rptThongKeDoanhThuTheoThang.LocalReport.DataSources.Add(rds5);
                //Refresh and show the report
                rptThongKeDoanhThuTheoThang.RefreshReport();
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
