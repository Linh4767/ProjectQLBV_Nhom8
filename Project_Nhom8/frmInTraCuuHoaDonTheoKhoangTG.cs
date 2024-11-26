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
using System.Xml.Linq;

namespace Project_Nhom8
{
    public partial class frmInTraCuuHoaDonTheoKhoangTG : Form
    {
        public frmInTraCuuHoaDonTheoKhoangTG()
        {
            InitializeComponent();
        }
        public DateTime Data { get; set; }
        public DateTime Data1 { get; set; }
        public frmInTraCuuHoaDonTheoKhoangTG(DateTime data, DateTime data1)
        {
            InitializeComponent();
            Data = data;
            Data1 = data1;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
        }
        private void frmInTraCuuHoaDonTheoKhoangTG_Load(object sender, EventArgs e)
        {
            this.rptThongKeDoanhThuTheoKhoangTG.RefreshReport();
            var tongDoanhThuTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoKhoangTG(Data,Data1);
            var tongDoanhThuThucTuBNTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoKhoangTG(Data, Data1);
            var chiTietDSSuDungDVTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoKhoangTG(Data, Data1);
            var thongKeDSThuocTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoKhoangTGVaDoanhThu(Data, Data1);
            var tongDoanhThuThuocTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoKhoangTGVaDoanhThu(Data, Data1);
            try
            {
                //Clear previous data sources
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.DataSources.Clear();

                //Setup new data sources
                ReportDataSource rds1 = new ReportDataSource("DataSetTongDoanhThuSDDVTheoKhoangTG", tongDoanhThuTheoKhoangTG);
                ReportDataSource rds2 = new ReportDataSource("DataSetChiTietDSSuDungDVTheoKhoangTG", chiTietDSSuDungDVTheoKhoangTG);
                ReportDataSource rds3 = new ReportDataSource("DataSetTongDoanhThuThucTuBNTheoKhoangTG", tongDoanhThuThucTuBNTheoKhoangTG);
                ReportDataSource rds4 = new ReportDataSource("DataSetChiTietDSThuocTheoKhoangTG", thongKeDSThuocTheoKhoangTG);
                ReportDataSource rds5 = new ReportDataSource("DataSetTinhTongTienThuocTheoKhoangTG", tongDoanhThuThuocTheoKhoangTG);
                ReportParameter[] reportParameters = new ReportParameter[3];
                string userName = CurrentUser.UserName;
                reportParameters[0] = new ReportParameter("TenNV", userName);
                reportParameters[1] = new ReportParameter("TuNgay", Data.Date.ToShortDateString());
                reportParameters[2] = new ReportParameter("DenNgay", Data1.Date.ToShortDateString());
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.SetParameters(reportParameters);
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.DataSources.Add(rds1);
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.DataSources.Add(rds2);
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.DataSources.Add(rds3);
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.DataSources.Add(rds4);
                rptThongKeDoanhThuTheoKhoangTG.LocalReport.DataSources.Add(rds5);
                //Refresh and show the report
                rptThongKeDoanhThuTheoKhoangTG.RefreshReport();
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
                frmMain.openChildForm(new frmTraCuuDoanhThu());
            }
        }
    }
}
