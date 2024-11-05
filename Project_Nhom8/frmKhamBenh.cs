using BUS;
using ET;
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
    public partial class frmKhamBenh : Form
    {
        public frmKhamBenh()
        {
            InitializeComponent();
        }
        private frmMain mainForm;
        public frmKhamBenh(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
        }
        private void frmKhamBenh_Load(object sender, EventArgs e)
        {
            dtpNgay.Value = DateTime.Now;
            cboKhoa.Items.Clear();
            btnChuanDoan.Enabled = false;
            BUS_KhamBenh.Instance.LayPKBTheoNgayKham(cboPKB, dtpNgay.Value);
            if (cboPKB.SelectedValue != null)
            {
                txtTrieuChung.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(cboPKB.SelectedValue.ToString());
            }
            else
            {
                txtTrieuChung.Text = null;
            }
            BUS_KhamBenh.Instance.LayDSKhoaLoadVaoCombobox(cboKhoa);
            cboKhoa.SelectedIndex = 0;
            if (cboKhoa.SelectedValue != null && cboPKB.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayPhongTheoPhanCong(cboPhong, dtpNgay.Value, cboKhoa.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());
                txtMaKham.Text = BUS_KhamBenh.Instance.TaoMaKBTuDong(cboPKB.SelectedValue.ToString());
                if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == true)
                {
                    btnChuanDoan.Enabled = false;
                }
                else
                {
                    btnChuanDoan.Enabled = true;
                }
                if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == false)
                {
                    btnThemKB.Enabled = false;
                }
                else
                {
                    btnThemKB.Enabled = true;
                }

            }
            if (cboPhong.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayDanhSachNhanVienTheoPhongVaCa(cboNVKhamBenh, dtpNgay.Value, cboPhong.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());
                BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                dgvDSKhamBenhTheoNgay.ColumnHeadersHeight = 40;
                bool isEmpty = dgvDSKhamBenhTheoNgay.Rows.Count == 0;
                if(isEmpty == false)
                {
                    dgvDSKhamBenhTheoNgay.Enabled = false;
                }
            }
            else
            {
                cboNVKhamBenh.DataSource = null;
            }
            cboPKB.DropDownHeight = 300;
            cboKhoa.DropDownHeight = 300;
            btnSuaKB.Enabled = false;

            btnLamMoi.Enabled = false;
        }

        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            BUS_KhamBenh.Instance.LayPKBTheoNgayKham(cboPKB, dtpNgay.Value);
            if (cboPKB.SelectedValue != null)
            {
                if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == true)
                {
                    btnChuanDoan.Enabled = false;
                }
                else
                {
                    btnChuanDoan.Enabled = true;
                }
                if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == false)
                {
                    btnThemKB.Enabled = false;
                }
                else
                {
                    btnThemKB.Enabled = true;
                }
                txtTrieuChung.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(cboPKB.SelectedValue.ToString());
            }
            else
            {
                cboPhong.DataSource = null;
                cboNVKhamBenh.DataSource = null;
            }
            if (cboPhong.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                bool isEmpty = dgvDSKhamBenhTheoNgay.Rows.Count == 0;
                dgvDSKhamBenhTheoNgay.Enabled = isEmpty;
            }
            else
            {
                dgvDSKhamBenhTheoNgay.DataSource = null;
            }
            if (cboPKB.SelectedValue == null)
            {
                txtTrieuChung.Text = null;
            }
            else
            {
                txtTrieuChung.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(cboPKB.SelectedValue.ToString());
            }
            if (cboKhoa.SelectedValue != null && cboPKB.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayPhongTheoPhanCong(cboPhong, dtpNgay.Value, cboKhoa.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());

            }
            if (cboPhong.SelectedValue != null && cboPKB.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayDanhSachNhanVienTheoPhongVaCa(cboNVKhamBenh, dtpNgay.Value, cboPhong.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());
                BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                bool isEmpty = dgvDSKhamBenhTheoNgay.Rows.Count == 0;
                dgvDSKhamBenhTheoNgay.Enabled = !isEmpty;
            }
        }

        private void cboKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboKhoa.SelectedValue != null && cboPKB.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayPhongTheoPhanCong(cboPhong, dtpNgay.Value, cboKhoa.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());

            }
            else if (cboPKB.DataSource == null)
            {
                cboPhong.DataSource = null;
            }
            if (cboPKB.SelectedValue == null)
            {
                txtTrieuChung.Text = null;
            }
            else
            {
                txtTrieuChung.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(cboPKB.SelectedValue.ToString());
            }
        }

        private void cboPKB_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboPhong != null && dtpNgay != null && cboKhoa != null && cboPKB != null)
            {
                var maKhoa = cboKhoa.SelectedValue?.ToString();
                var maPKBValue = cboPKB.SelectedValue?.ToString();
                string phongValue = cboPhong.SelectedValue != null ? cboPhong.SelectedValue.ToString() : string.Empty;
                if (!string.IsNullOrEmpty(maKhoa) && !string.IsNullOrEmpty(maPKBValue))
                {
                    BUS_KhamBenh.Instance.LayPhongTheoPhanCong(cboPhong, dtpNgay.Value, maKhoa, maPKBValue);

                    if (!string.IsNullOrEmpty(phongValue))
                    {
                        BUS_KhamBenh.Instance.LayDanhSachNhanVienTheoPhongVaCa(cboNVKhamBenh, dtpNgay.Value, phongValue, maPKBValue);
                    }

                    txtMaKham.Text = BUS_KhamBenh.Instance.TaoMaKBTuDong(maPKBValue);
                    if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == true)
                    {
                        btnChuanDoan.Enabled = false;
                    }
                    else
                    {
                        btnChuanDoan.Enabled = true;
                    }
                    if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == false)
                    {
                        btnThemKB.Enabled = false;
                    }
                    else
                    {
                        btnThemKB.Enabled = true;
                    }
                }
            }
            if (cboPKB.SelectedValue == null)
            {
                txtTrieuChung.Text = null;
            }
            else
            {
                txtTrieuChung.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(cboPKB.SelectedValue.ToString());
            }
        }

        private void cboPhong_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboPhong.SelectedValue != null && cboPKB.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayDanhSachNhanVienTheoPhongVaCa(cboNVKhamBenh, dtpNgay.Value, cboPhong.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());
                BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                bool isEmpty = dgvDSKhamBenhTheoNgay.Rows.Count == 0;
                dgvDSKhamBenhTheoNgay.Enabled = !isEmpty;
            }
            else
            {
                cboNVKhamBenh.DataSource = null;
            }
            dgvDSKhamBenhTheoNgay.ColumnHeadersHeight = 40;
            if (cboPKB.SelectedValue == null)
            {
                txtTrieuChung.Text = null;
            }
            else
            {
                txtTrieuChung.Text = BUS_KhamBenh.Instance.LayTrieuChungCuaPKB(cboPKB.SelectedValue.ToString());
            }
        }

        private void btnThemKB_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cboPKB.SelectedValue?.ToString()) &&
               !string.IsNullOrEmpty(cboPhong.SelectedValue?.ToString()) &&
               !string.IsNullOrEmpty(cboNVKhamBenh.SelectedValue?.ToString()))
            {
                DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    BUS_KhamBenh.Instance.ThemThongTinKB(new ET_KhamBenh(cboPhong.SelectedValue.ToString(), cboNVKhamBenh.SelectedValue.ToString(), cboPKB.SelectedValue.ToString(), txtMaKham.Text));
                    BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                    bool isEmpty = dgvDSKhamBenhTheoNgay.Rows.Count == 0;
                    dgvDSKhamBenhTheoNgay.Enabled = !isEmpty;
                    txtMaKham.Text = BUS_KhamBenh.Instance.TaoMaKBTuDong(cboPKB.SelectedValue.ToString());
                    if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == true)
                    {
                        btnChuanDoan.Enabled = false;
                    }
                    else
                    {
                        btnChuanDoan.Enabled = true;
                    }
                    if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == false)
                    {
                        btnThemKB.Enabled = false;
                    }
                    else
                    {
                        btnThemKB.Enabled = true;
                    }
                }
            }
            else
            {
                MessageBox.Show("Không đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnSuaKB_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cboPKB.SelectedValue?.ToString()) &&
               !string.IsNullOrEmpty(cboPhong.SelectedValue?.ToString()) &&
               !string.IsNullOrEmpty(cboNVKhamBenh.SelectedValue?.ToString()))
            {
                DialogResult ret = MessageBox.Show("Bạn muốn lưu thông tin thay đổi không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    BUS_KhamBenh.Instance.SuaThongTinKB(new ET_KhamBenh(cboPhong.SelectedValue.ToString(), cboNVKhamBenh.SelectedValue.ToString(), cboPKB.SelectedValue.ToString(), txtMaKham.Text));
                    BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                    btnSuaKB.Enabled = false;
                    btnThemKB.Enabled = true;
                    bool isEmpty = dgvDSKhamBenhTheoNgay.Rows.Count == 0;
                    dgvDSKhamBenhTheoNgay.Enabled = !isEmpty;
                    cboPKB.SelectedIndexChanged += cboPKB_SelectedIndexChanged;
                    txtMaKham.Text = BUS_KhamBenh.Instance.TaoMaKBTuDong(cboPKB.SelectedValue.ToString());
                    if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == true)
                    {
                        btnChuanDoan.Enabled = false;
                    }
                    else
                    {
                        btnChuanDoan.Enabled = true;
                    }
                    if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == false)
                    {
                        btnThemKB.Enabled = false;
                    }
                    else
                    {
                        btnThemKB.Enabled = true;
                    }
                    btnLamMoi.Enabled = false;
                    btnSuaKB.Enabled = false;
                    cboPKB.Enabled = true;
                    txtMaKham.Text = BUS_KhamBenh.Instance.TaoMaKBTuDong(cboPKB.SelectedValue.ToString());
                }
            }
            else
            {
                MessageBox.Show("Không đủ thông tin", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvDSKhamBenhTheoNgay_Click(object sender, EventArgs e)
        {
            if (dgvDSKhamBenhTheoNgay.CurrentRow != null && dgvDSKhamBenhTheoNgay.CurrentCell != null && dgvDSKhamBenhTheoNgay.Rows.Count > 0 && !dgvDSKhamBenhTheoNgay.Rows[dgvDSKhamBenhTheoNgay.CurrentRow.Index].IsNewRow)
            {
                dgvDSKhamBenhTheoNgay.ClearSelection();
                int dong = dgvDSKhamBenhTheoNgay.CurrentCell.RowIndex;
                txtMaKham.Text = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[1].Value.ToString();
                cboPKB.SelectedIndexChanged -= cboPKB_SelectedIndexChanged;
                cboPKB.SelectedValue = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[3].Value.ToString();

                cboKhoa.SelectedValue = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[4].Value.ToString();
                //cboNVKhamBenh.SelectedIndex = -1;
                //cboNVKhamBenh.SelectedValue = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[2].Value.ToString();
                cboPhong.Enabled = true;
                cboPKB.Enabled = false;
                cboNVKhamBenh.Enabled = true;
                cboKhoa.Enabled = true;
                btnSuaKB.Enabled = true;
                btnThemKB.Enabled = false;
                // Kiểm tra xem các ComboBox và DateTimePicker có giá trị hợp lệ hay không
                if (cboPhong != null && dtpNgay != null && cboKhoa != null && cboPKB != null)
                {
                    var maKhoa = cboKhoa.SelectedValue?.ToString();
                    var maPKBValue = cboPKB.SelectedValue?.ToString();
                    string phongValue = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[0].Value?.ToString();
                    // Kiểm tra nếu maKhoa và maPKBValue không null trước khi gọi phương thức
                    if (!string.IsNullOrEmpty(maKhoa) && !string.IsNullOrEmpty(maPKBValue))
                    {
                        // Call methods with validated parameters
                        BUS_KhamBenh.Instance.LayPhongTheoPhanCong(cboPhong, dtpNgay.Value, maKhoa, maPKBValue);
                        cboPhong.SelectedValue = phongValue;
                        if (!string.IsNullOrEmpty(phongValue))
                        {
                            BUS_KhamBenh.Instance.LayDanhSachNhanVienTheoPhongVaCa(cboNVKhamBenh, dtpNgay.Value, phongValue, maPKBValue);
                            cboNVKhamBenh.SelectedValue = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[2].Value.ToString(); ;
                        }
                    }
                }
                // Refresh DataGridView display to ensure selected row is highlighted
                if (dgvDSKhamBenhTheoNgay.Rows[dong].Selected == false)
                {
                    dgvDSKhamBenhTheoNgay.ClearSelection();
                    dgvDSKhamBenhTheoNgay.Rows[dong].Selected = true;
                    dgvDSKhamBenhTheoNgay.CurrentCell = dgvDSKhamBenhTheoNgay.Rows[dong].Cells[0];
                }
                btnLamMoi.Enabled = true;
            }
            else
            {
                cboPhong.Enabled = false;
                cboPKB.Enabled = false;
                cboNVKhamBenh.Enabled = false;
                cboKhoa.Enabled = false;
                btnLamMoi.Enabled = false;

            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            // Thực hiện thao tác làm mới
            dgvDSKhamBenhTheoNgay.Rows.Clear();

            btnSuaKB.Enabled = false;
            //dgvDSKhamBenhTheoNgay.Enabled = dgvDSKhamBenhTheoNgay.Rows.Count > 0;
            cboPKB.Enabled = true;
            cboPhong.Enabled = true;
            cboKhoa.Enabled = true;
            cboNVKhamBenh.Enabled = true;
            btnThemKB.Enabled = true;
            btnSuaKB.Enabled = false;
            btnLamMoi.Enabled = false;
            cboPKB.SelectedIndexChanged += cboPKB_SelectedIndexChanged;

            if (cboPhong.SelectedValue != null && cboPKB.SelectedValue != null)
            {
                BUS_KhamBenh.Instance.LayDanhSachNhanVienTheoPhongVaCa(cboNVKhamBenh, dtpNgay.Value, cboPhong.SelectedValue.ToString(), cboPKB.SelectedValue.ToString());
                BUS_KhamBenh.Instance.HienThiDSKhamBenhTheoNgay(dgvDSKhamBenhTheoNgay, dtpNgay.Value, cboPhong.SelectedValue.ToString());
                dgvDSKhamBenhTheoNgay.ColumnHeadersHeight = 40;
            }
            if (cboPKB.SelectedValue != null)
            {
                txtMaKham.Text = BUS_KhamBenh.Instance.TaoMaKBTuDong(cboPKB.SelectedValue.ToString());
                if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == true)
                {
                    btnChuanDoan.Enabled = false;
                }
                else
                {
                    btnChuanDoan.Enabled = true;
                }
                if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == false)
                {
                    btnThemKB.Enabled = false;
                }
                else
                {
                    btnThemKB.Enabled = true;
                }
            }
        }

        private void btnDKySDDichVu_Click(object sender, EventArgs e)
        {
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmSuDungDichVu());
        }

        private void btnChuanDoan_Click(object sender, EventArgs e)
        {
            if (BUS_PhieuKB.Instance.KiemTraPhieuKBThucHienKhamChua(cboPKB.SelectedValue.ToString()) == false)
            {
                if (BUS_KhamBenh.Instance.KiemTraCoChuanDoanChua(cboPKB.SelectedValue.ToString()) == true)
                {
                    string dataToSend = cboPKB.SelectedValue.ToString();
                    frmMain frmMain = (frmMain)this.ParentForm;
                    frmMain.openChildForm(new frmChuanDoan(dataToSend));
                }
                else
                {
                    DialogResult ret = MessageBox.Show("Đã có chuẩn đoán vẫn muốn qua giao diện chuẩn đoán chứ ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ret == DialogResult.Yes)
                    {
                        frmMain frmMain = (frmMain)this.ParentForm;
                        frmMain.openChildForm(new frmChuanDoan());
                    }
                }
            }
        }

        private void btnTaiKham_Click(object sender, EventArgs e)
        {
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmTaiKham());
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn muốn thoát khỏi giao diện quản lý khám bệnh không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
