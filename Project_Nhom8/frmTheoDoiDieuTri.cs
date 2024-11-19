using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BUS;
using ET;

namespace Project_Nhom8
{
    public partial class frmTheoDoiDieuTri : Form
    {
        public frmTheoDoiDieuTri()
        {
            InitializeComponent();
        }

        private void btnSuaTD_Click(object sender, EventArgs e)
        {
            string pkb = cboBN.SelectedValue.ToString();
            DateTime ngayTheoDoi = dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay;

            DialogResult ret = MessageBox.Show("Bạn có muốn sửa không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                if(cboNhanVien.SelectedValue != null)
                {
                    //Lấy tên mã nhân viên
                    string input = cboNhanVien.SelectedValue.ToString();

                    BUS_TheoDoiDieuTri.Instance.SuaTheoDoi(new ET_TheoDoiDieuTri(pkb, ngayTheoDoi, int.Parse(txtCanNang.Text), int.Parse(txtHuyetAp.Text), int.Parse(txtNhipTho.Text), int.Parse(txtNhietDo.Text), int.Parse(txtMachDap.Text), int.Parse(txtDuongHuyet.Text), txtYLenh.Text, input, cboGiuong.SelectedValue.ToString(), txtMaTheoDoi.Text));
                    BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
                }
                else
                {
                    MessageBox.Show("Phải có mã nhân viên mới cập nhật được !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                }
              
            }
        }

    


        private void frmTheoDoiDieuTri_Load(object sender, EventArgs e)
        {
            dgvTheoDoiDT.ColumnHeadersHeight = 40;
            BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
            
            dtpThoiGianTheoDoi.Value = DateTime.Now;
            cboBN.TextChanged += cboBN_TextChanged;
            cboBN.DropDownWidth = 150;
            cboBN.DropDownHeight = 300;
            dtpThoiGianTheoDoi.ShowUpDown = true;

            cboBN.DropDownStyle = ComboBoxStyle.DropDown;  // Cho phép vừa nhập vừa chọn từ danh sách
            cboBN.AutoCompleteMode = AutoCompleteMode.SuggestAppend;  // Đề xuất và tự động hoàn tất
            cboBN.AutoCompleteSource = AutoCompleteSource.CustomSource;  // Nguồn tự động hoàn tất từ dữ liệu tùy chỉnh

            // Đảm bảo AutoCompleteCustomSource được cập nhật trong HienThiComboboxPKB
            BUS_TheoDoiDieuTri.Instance.HienThiComboboxPKB(cboBN);
            if (cboBN.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.HienThiComboboxGiuong(cboGiuong, cboBN.SelectedValue.ToString());
            }
            if (cboBN.SelectedValue != null && cboGiuong.SelectedValue != null)
            {

                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
                txtChuanDoan.Text = BUS_TheoDoiDieuTri.Instance.HienThiChuanDoan(cboBN.SelectedValue.ToString());
                txtPhongBenh.Text = BUS_TheoDoiDieuTri.Instance.HienThiPhong(cboGiuong.SelectedValue.ToString());
                txtMaTheoDoi.Text = BUS_TheoDoiDieuTri.Instance.TaoMaTheoDoi(cboBN.SelectedValue.ToString(), cboGiuong.SelectedValue.ToString());
            }

        }

        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
        }


        private void cboGiuong_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboGiuong.SelectedValue != null)
            {               
                txtPhongBenh.Text = BUS_TheoDoiDieuTri.Instance.HienThiPhong(cboGiuong.SelectedValue.ToString());
                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
                txtMaTheoDoi.Text = BUS_TheoDoiDieuTri.Instance.TaoMaTheoDoi(cboBN.SelectedValue.ToString(), cboGiuong.SelectedValue.ToString());
            }
            
        }

        private void dtpNgayTheoDoi_ValueChanged(object sender, EventArgs e)
        {
            if(cboGiuong.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
            }
            
        }

        private void dtpThoiGianTheoDoi_ValueChanged(object sender, EventArgs e)
        {
            if (cboGiuong.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.LayNhanVienTheoPhanCongVaPhong(cboNhanVien, dtpNgayTheoDoi.Value, dtpThoiGianTheoDoi.Value, cboGiuong.SelectedValue.ToString());
            }
        }

        private void btnThemThoiDoi_Click(object sender, EventArgs e)
        {
            string pkb = cboBN.SelectedValue.ToString();    
            DateTime ngayTheoDoi = dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay;
            if (BUS_TheoDoiDieuTri.Instance.KiemTraNgayTheoDoi(pkb, cboGiuong.SelectedValue.ToString(), ngayTheoDoi))
            {
                DialogResult ret = MessageBox.Show("Bạn có muốn thêm không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    //Lấy tên mã nhân viên
                    string input = cboNhanVien.SelectedValue.ToString();
                    BUS_TheoDoiDieuTri.Instance.ThemTheoDoi(new ET_TheoDoiDieuTri(pkb, dtpNgayTheoDoi.Value.Date + dtpThoiGianTheoDoi.Value.TimeOfDay, int.Parse(txtCanNang.Text), int.Parse(txtHuyetAp.Text), int.Parse(txtNhipTho.Text), int.Parse(txtNhietDo.Text), int.Parse(txtMachDap.Text), int.Parse(txtDuongHuyet.Text), txtYLenh.Text, input, cboGiuong.SelectedValue.ToString(), txtMaTheoDoi.Text));
                    BUS_TheoDoiDieuTri.Instance.HienThiTheoDoi(dgvTheoDoiDT, dtpNgay.Value);
                }
            }
            else
            {
                MessageBox.Show("Ngày theo dõi không thể nhỏ hơn ngày nhận giường hoặc Đã trả giường thì không thể theo dõi", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {

        }

        private void btnThoat_Click(object sender, EventArgs e)
        {

        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {

        }

        private void dgvTheoDoiDT_Click(object sender, EventArgs e)
        {
            if (dgvTheoDoiDT.CurrentRow != null && !dgvTheoDoiDT.Rows[dgvTheoDoiDT.CurrentRow.Index].IsNewRow)
            {
                int dong = dgvTheoDoiDT.CurrentCell.RowIndex;
                
                cboBN.SelectedValue = dgvTheoDoiDT.Rows[dong].Cells[0].Value.ToString();


                cboGiuong.SelectedValue = dgvTheoDoiDT.Rows[dong].Cells[1].Value.ToString();

                // Lấy giá trị từ DataGridView (cột thứ 5)
                string ngayNhan = dgvTheoDoiDT.Rows[dong].Cells[2].Value.ToString();

                // Chuyển chuỗi ngày giờ thành kiểu DateTime
                DateTime ngayGio = DateTime.Parse(ngayNhan);

                // Gán phần ngày cho DateTimePicker (chỉ ngày)
                dtpNgayTheoDoi.Value = ngayGio.Date;  // Sử dụng .Date để chỉ lấy phần ngày

                // Gán phần giờ cho DateTimePicker khác (chỉ giờ)
                dtpThoiGianTheoDoi.Value = DateTime.Parse("01/01/2000 " + ngayGio.ToString("HH:mm"));
                txtCanNang.Text = dgvTheoDoiDT.Rows[dong].Cells[3].Value.ToString();
                txtNhietDo.Text = dgvTheoDoiDT.Rows[dong].Cells[4].Value.ToString();
                txtNhipTho.Text = dgvTheoDoiDT.Rows[dong].Cells[5].Value.ToString();
                txtHuyetAp.Text = dgvTheoDoiDT.Rows[dong].Cells[6].Value.ToString();
                txtMachDap.Text = dgvTheoDoiDT.Rows[dong].Cells[7].Value.ToString();
                txtDuongHuyet.Text = dgvTheoDoiDT.Rows[dong].Cells[8].Value.ToString();
                txtYLenh.Text = dgvTheoDoiDT.Rows[dong].Cells[9].Value.ToString();

                //Nhân viên
                cboNhanVien.SelectedValue = dgvTheoDoiDT.Rows[dong].Cells[10].Value.ToString();
                txtMaTheoDoi.Text = dgvTheoDoiDT.Rows[dong].Cells[11].Value.ToString();
                //    dtpNgayTra.Enabled = true;
                //    dtpThoiGianTra.Enabled = true;
                //    btnThem.Enabled = false;
                //    btnSua.Enabled = true;
                //    cboGiuongBenh.Enabled = false;
                //    btnLamMoi.Enabled = true;
            }
            }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void guna2TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtMachDapDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void txtMachDap_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtNhietDoDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void txtNhietDo_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtChuanDoan_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtNhipThoDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtHuyetApDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtCanNangDV_TextChanged(object sender, EventArgs e)
        {

        }

        private void cboNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboBN.SelectedValue != null)
            {
                txtMaTheoDoi.Text = BUS_TheoDoiDieuTri.Instance.TaoMaTheoDoi(cboBN.SelectedValue.ToString(), cboGiuong.SelectedValue.ToString());
            }
        }

        private void label24_Click(object sender, EventArgs e)
        {

        }

        private void txtYLenh_TextChanged(object sender, EventArgs e)
        {

        }

        private void label23_Click(object sender, EventArgs e)
        {

        }

        private void txtNhipTho_TextChanged(object sender, EventArgs e)
        {

        }

        private void label22_Click(object sender, EventArgs e)
        {

        }

        private void txtHuyetAp_TextChanged(object sender, EventArgs e)
        {

        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void txtCanNang_TextChanged(object sender, EventArgs e)
        {

        }

        private void label19_Click(object sender, EventArgs e)
        {

        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label18_Click(object sender, EventArgs e)
        {

        }

        private void cboBN_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cboBN.SelectedValue != null)
            {
                BUS_TheoDoiDieuTri.Instance.HienThiComboboxGiuong(cboGiuong, cboBN.SelectedValue.ToString());
                txtChuanDoan.Text = BUS_TheoDoiDieuTri.Instance.HienThiChuanDoan(cboBN.SelectedValue.ToString());
            }
           
        }

        private void cboBN_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void cboBN_KeyPress(object sender, KeyPressEventArgs e)
        {
           
        }

        private void cboBN_DropDown(object sender, EventArgs e)
        {
            
        }
    }
}
