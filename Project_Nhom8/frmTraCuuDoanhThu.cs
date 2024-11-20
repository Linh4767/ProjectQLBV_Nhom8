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
    public partial class frmTraCuuDoanhThu : Form
    {
        public frmTraCuuDoanhThu()
        {
            InitializeComponent();
        }

        private void frmTraCuuDoanhThu_Load(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = false;
            dtpTuNgay.Value = DateTime.Now;
            dtpDenNgay.Value = DateTime.Now;
            rptThongKeDoanhThu.Visible = false;
            rptThongKeDoanhThuTheoThang.Visible = false;
            rptThongKeDoanhThuTheoNam.Visible = false;
            rptThongKeDoanhThuTheoKhoangTG.Visible = false;
            this.rptThongKeDoanhThu.RefreshReport();
            this.rptThongKeDoanhThuTheoThang.RefreshReport();
            this.rptThongKeDoanhThuTheoNam.RefreshReport();
            this.rptThongKeDoanhThuTheoKhoangTG.RefreshReport();
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            isChiTietDTClicked = false;
            if (radTheoNgay.Checked)
            {
                decimal tienSuDung = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTheoNgay(dtpTuNgay.Value);
                txtDoanhThuThucTe.Text = tienSuDung.ToString("F0");
                decimal tienThuUocTinh = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTheoNgay(dtpTuNgay.Value);
                txtTongTienSDDV.Text = tienThuUocTinh.ToString("F0");
                decimal tienThuoc = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNgay(dtpTuNgay.Value);
                txtTongTienThuoc.Text = tienThuoc.ToString("F0");
                decimal tienThuocGiamBHYT = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNgayCoGiamBHYT(dtpTuNgay.Value);
                txtDoanhThuTTThuoc.Text = tienThuocGiamBHYT.ToString("F0");
                decimal tongTien = tienSuDung + tienThuocGiamBHYT;
                txtTongTien.Text = tongTien.ToString("F0");
            }
            if (radTheoThang.Checked)
            {
                decimal tienSuDung = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTheoThang(dtpTuNgay.Value);
                txtDoanhThuThucTe.Text = tienSuDung.ToString("F0");
                decimal tienThuoc = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoThang(dtpTuNgay.Value);
                txtTongTienThuoc.Text = tienThuoc.ToString("F0");
                decimal tienThuocGiamBHYT = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoThangCoGiamBHYT(dtpTuNgay.Value);
                txtDoanhThuTTThuoc.Text = tienThuocGiamBHYT.ToString("F0");
                decimal tienThuUocTinh = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTheoThang(dtpTuNgay.Value);
                txtTongTienSDDV.Text = tienThuUocTinh.ToString("F0");
                decimal tongTien = tienSuDung + tienThuocGiamBHYT;
                txtTongTien.Text = tongTien.ToString("F0");
            }
            if (radTheoNam.Checked)
            {
                decimal tienSuDung = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTheoNam(dtpTuNgay.Value);
                txtDoanhThuThucTe.Text = tienSuDung.ToString("F0");
                decimal tienThuoc = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNam(dtpTuNgay.Value);
                txtTongTienThuoc.Text = tienThuoc.ToString("F0");
                decimal tienThuocGiamBHYT = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNamCoGiamBHYT(dtpTuNgay.Value);
                txtDoanhThuTTThuoc.Text = tienThuocGiamBHYT.ToString("F0");
                decimal tienThuUocTinh = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTheoNam(dtpTuNgay.Value);
                txtTongTienSDDV.Text = tienThuUocTinh.ToString("F0");
                decimal tongTien = tienSuDung + tienThuocGiamBHYT;
                txtTongTien.Text = tongTien.ToString("F0");

            }
            if (radTheoKhoangTG.Checked)
            {
                if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                    decimal tienSuDung = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTrongKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);
                    txtDoanhThuThucTe.Text = tienSuDung.ToString("F0");
                    decimal tienThuUocTinh = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTrongKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);
                    txtTongTienSDDV.Text = tienThuUocTinh.ToString("F0");
                    decimal tienThuoc = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);
                    txtTongTienThuoc.Text = tienThuoc.ToString("F0");
                    decimal tienThuocGiamBHYT = (decimal)BUS_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoKhoangTGCoGiamBHYT(dtpTuNgay.Value, dtpDenNgay.Value);
                    txtDoanhThuTTThuoc.Text = tienThuocGiamBHYT.ToString("F0");
                    decimal tongTien = tienSuDung + tienThuocGiamBHYT;
                    txtTongTien.Text = tongTien.ToString("F0");

                }
                else
                {
                    MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnChiTietSDDV_Click(object sender, EventArgs e)
        {
            isChiTietDTClicked = false;
            rptThongKeDoanhThu.Visible = false;
            rptThongKeDoanhThuTheoThang.Visible = false;
            rptThongKeDoanhThuTheoNam.Visible = false;
            rptThongKeDoanhThuTheoKhoangTG.Visible = false;
            dgvTongHop.ColumnHeadersHeight = 40;
            if (radTheoNgay.Checked)
            {
                BUS_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoNgay(dtpTuNgay.Value, dgvTongHop);
            }
            if (radTheoThang.Checked)
            {
                BUS_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoThang(dtpTuNgay.Value, dgvTongHop);
            }
            if (radTheoNam.Checked)
            {
                BUS_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoNam(dtpTuNgay.Value, dgvTongHop);
            }
            if (radTheoKhoangTG.Checked)
            {
                if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                    BUS_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value, dgvTongHop);
                }
                else
                {
                    MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnChiTietDT_Click(object sender, EventArgs e)
        {
            isChiTietDTClicked = true;

            rptThongKeDoanhThu.Visible = false;
            rptThongKeDoanhThuTheoThang.Visible = false;
            rptThongKeDoanhThuTheoNam.Visible = false;
            rptThongKeDoanhThuTheoKhoangTG.Visible = false;
            dgvTongHop.ColumnHeadersHeight = 40;
            if (radTheoNgay.Checked)
            {
                BUS_TraCuuDoanhThu.Instance.TinhChiTietTienTheoThuocTheoNgay(dtpTuNgay.Value, dgvTongHop);
            }
            if (radTheoThang.Checked)
            {
                BUS_TraCuuDoanhThu.Instance.TinhChiTietTienTheoThuocTheoThang(dtpTuNgay.Value, dgvTongHop);
            }
            if (radTheoNam.Checked)
            {
                BUS_TraCuuDoanhThu.Instance.TinhChiTietTienTheoThuocTheoNam(dtpTuNgay.Value, dgvTongHop);
            }
            if (radTheoKhoangTG.Checked)
            {
                if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                    BUS_TraCuuDoanhThu.Instance.TinhChiTietTienTheoThuocTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value, dgvTongHop);
                }
                else
                {
                    MessageBox.Show("Ngày đến phải lớn hơn hoặc bằng ngày " + dtpTuNgay.Value.Date.ToShortDateString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnIn_Click(object sender, EventArgs e)
        {
            isChiTietDTClicked = false;
            if (radTheoNgay.Checked)
            {
                rptThongKeDoanhThu.Visible = true;
                rptThongKeDoanhThuTheoThang.Visible = false;
                rptThongKeDoanhThuTheoNam.Visible = false;
                rptThongKeDoanhThuTheoKhoangTG.Visible = false;
                var tongDoanhThuTheoNgay = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoNgay(dtpTuNgay.Value);
                var tongDoanhThuThucTuBNTheoNgay = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoNgay(dtpTuNgay.Value);
                var chiTietDSSuDungDVTheoNgay = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoNgay(dtpTuNgay.Value);
                var thongKeDSThuocTheoNgay = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNgayVaDoanhThu(dtpTuNgay.Value);
                var tongDoanhThuThuocTheoNgay = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoNgayVaDoanhThu(dtpTuNgay.Value);
                try
                {
                    // Clear previous data sources
                    rptThongKeDoanhThu.LocalReport.DataSources.Clear();

                    // Setup new data sources
                    ReportDataSource rds1 = new ReportDataSource("DataSetTongDoanhThuSDDVTheoNgay", tongDoanhThuTheoNgay);
                    ReportDataSource rds2 = new ReportDataSource("DataSetChiTietDSSuDungDVTheoNgay", chiTietDSSuDungDVTheoNgay);
                    ReportDataSource rds3 = new ReportDataSource("DataSetTongDoanhThuThucTuBNTheoNgay", tongDoanhThuThucTuBNTheoNgay);
                    ReportDataSource rds4 = new ReportDataSource("DataSetChiTietDSThuocTheoNgay", thongKeDSThuocTheoNgay);
                    ReportDataSource rds5 = new ReportDataSource("DataSetTinhTongTienThuocTheoNgay", tongDoanhThuThuocTheoNgay);
                    ReportParameter[] reportParameters = new ReportParameter[2];
                    string userName = CurrentUser.UserName;
                    reportParameters[0] = new ReportParameter("TenNV", userName);
                    reportParameters[1] = new ReportParameter("NgayTK", dtpTuNgay.Value.ToShortDateString());
                    rptThongKeDoanhThu.LocalReport.SetParameters(reportParameters);
                    rptThongKeDoanhThu.LocalReport.DataSources.Add(rds1);
                    rptThongKeDoanhThu.LocalReport.DataSources.Add(rds2);
                    rptThongKeDoanhThu.LocalReport.DataSources.Add(rds3);
                    rptThongKeDoanhThu.LocalReport.DataSources.Add(rds4);
                    rptThongKeDoanhThu.LocalReport.DataSources.Add(rds5);
                    // Refresh and show the report
                    rptThongKeDoanhThu.RefreshReport();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Failed to load report: " + ex.Message);
                }
            }
            if (radTheoThang.Checked)
            {
                rptThongKeDoanhThu.Visible = false;
                rptThongKeDoanhThuTheoThang.Visible = true;
                rptThongKeDoanhThuTheoNam.Visible = false;
                rptThongKeDoanhThuTheoKhoangTG.Visible = false;
                var tongDoanhThuTheoThang = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoThang(dtpTuNgay.Value.Month, dtpTuNgay.Value.Year);
                var tongDoanhThuThucTuBNTheoThang = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoThang(dtpTuNgay.Value.Month, dtpTuNgay.Value.Year);
                var chiTietDSSuDungDVTheoThang = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoThang(dtpTuNgay.Value.Month, dtpTuNgay.Value.Year);
                var thongKeDSThuocTheoThang = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoThangVaDoanhThu(dtpTuNgay.Value.Month, dtpTuNgay.Value.Year);
                var tongDoanhThuThuocTheoThang = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoThangVaDoanhThu(dtpTuNgay.Value.Month, dtpTuNgay.Value.Year);
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
                    reportParameters[1] = new ReportParameter("Thang", dtpTuNgay.Value.Month.ToString());
                    reportParameters[2] = new ReportParameter("Nam", dtpTuNgay.Value.Year.ToString());
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
            if (radTheoNam.Checked)
            {
                rptThongKeDoanhThu.Visible = false;
                rptThongKeDoanhThuTheoThang.Visible = false;
                rptThongKeDoanhThuTheoNam.Visible = true;
                rptThongKeDoanhThuTheoKhoangTG.Visible = false;
                var tongDoanhThuTheoNam = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoNam(dtpTuNgay.Value.Year);
                var tongDoanhThuThucTuBNTheoNam = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoNam(dtpTuNgay.Value.Year);
                var chiTietDSSuDungDVTheoNam = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoNam(dtpTuNgay.Value.Year);
                var thongKeDSThuocTheoNam = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNamVaDoanhThu(dtpTuNgay.Value.Year);
                var tongDoanhThuThuocTheoNam = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoNamVaDoanhThu(dtpTuNgay.Value.Year);
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
                    reportParameters[1] = new ReportParameter("Nam", dtpTuNgay.Value.Year.ToString());
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
            if (radTheoKhoangTG.Checked)
            {
                if (dtpDenNgay.Value.Date >= dtpTuNgay.Value.Date)
                {
                    rptThongKeDoanhThu.Visible = false;
                    rptThongKeDoanhThuTheoThang.Visible = false;
                    rptThongKeDoanhThuTheoNam.Visible = false;
                    rptThongKeDoanhThuTheoKhoangTG.Visible = true;
                    var tongDoanhThuTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);
                    var tongDoanhThuThucTuBNTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);
                    var chiTietDSSuDungDVTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoKhoangTG(dtpTuNgay.Value, dtpDenNgay.Value);
                    var thongKeDSThuocTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoKhoangTGVaDoanhThu(dtpTuNgay.Value, dtpDenNgay.Value);
                    var tongDoanhThuThuocTheoKhoangTG = BUS_TraCuuDoanhThu.Instance.TongTienThuocTheoKhoangTGVaDoanhThu(dtpTuNgay.Value, dtpDenNgay.Value);
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
                        reportParameters[1] = new ReportParameter("TuNgay", dtpTuNgay.Value.Date.ToShortDateString());
                        reportParameters[2] = new ReportParameter("DenNgay", dtpDenNgay.Value.Date.ToShortDateString());
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

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void radTheoNam_CheckedChanged(object sender, EventArgs e)
        {
            dtpDenNgay.Enabled = false;
        }
        private bool isChiTietDTClicked = false;

        private void dgvTongHop_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (isChiTietDTClicked)
            {
                //dgvTongHop.Columns[2].Visible = false;
                if (dgvTongHop.Columns.Contains("ThanhTien") &&
                    e.ColumnIndex == dgvTongHop.Columns["ThanhTien"].Index)
                {
                    // Kiểm tra giá trị null hoặc rỗng
                    if (e.Value == null || string.IsNullOrWhiteSpace(e.Value.ToString()))
                    {
                        e.Value = "0"; // Gán giá trị mặc định
                        e.FormattingApplied = true;
                        //dgvTongHop.Columns[2].Visible = false;
                    }
                    else
                    {
                        //dgvTongHop.Columns[2].Visible = false;
                        // Thử parse giá trị thành decimal
                        if (decimal.TryParse(e.Value.ToString(), System.Globalization.NumberStyles.Any, null, out decimal thanhTien))
                        {
                            e.Value = thanhTien.ToString("F0"); // Định dạng không có phần thập phân
                            e.FormattingApplied = true;

                        }
                        else
                        {
                            e.FormattingApplied = false; // Không định dạng được
                        }
                    }
                }
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc muốn thoát", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}

