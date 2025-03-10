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
    public partial class frmPhatThuocTheoKhoa : Form
    {
        public frmPhatThuocTheoKhoa()
        {
            InitializeComponent();
        }
        public string thuoc { get; set; }
        public frmPhatThuocTheoKhoa(string thuoc)
        {
            InitializeComponent();
            thuoc = thuoc;
            string tenThuoc = BUS_ThuocTheoKhoa.Instance.LayTenDuaVaoMaThuoc(thuoc);
            txtThuoc.Text = thuoc + "-" + tenThuoc;
        }
        private void frmPhatThuocTheoKhoa_Load(object sender, EventArgs e)
        {
            BUS_KhamBenh.Instance.LayDSKhoaLoadVaoCombobox(cboKhoa);
            if (!string.IsNullOrEmpty(txtThuoc.Text))
            {
                btnThem.Enabled = true;
                string[] ma = (txtThuoc.Text).Split('-');
                string maHoanChinh = ma[0] + "-" + ma[1] + "-" + ma[2] + "-" + ma[3];
                BUS_ThuocTheoKhoa.Instance.LayLoDuaVaoMaThuoc(cboMaLo, maHoanChinh);
                //MessageBox.Show("TB" + BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(maHoanChinh));
                //txtTongSoVien.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(maHoanChinh));
                //txtSLThuocCuaKhoa.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.LaySoLuongTrongKhoa(int.Parse(txtNhapVao.Text), cboMaLo.SelectedValue.ToString(), maHoanChinh)) ?? "0";
            }
            else
            {
                btnThem.Enabled = false;
            }
            btnThemSL.Enabled = false;
            btnXoaSL.Enabled = false;
            btnLamMoi.Enabled = false;
            if (cboKhoa.SelectedValue != null)
            {
                BUS_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(dgvDSThuocTheoKhoa, cboKhoa.SelectedValue.ToString());
            }
            dgvDSThuocTheoKhoa.Columns[5].Visible = false;
            dgvDSThuocTheoKhoa.Columns[6].Visible = false;
            dgvDSThuocTheoKhoa.ColumnHeadersHeight = 40;
        }

        private void cboKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboKhoa.SelectedValue != null)
            {
                BUS_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(dgvDSThuocTheoKhoa, cboKhoa.SelectedValue.ToString());
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNhapVao.Text))
            {
                DialogResult ret = MessageBox.Show("Bạn muốn thực hiện thêm không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    string[] ma = (txtThuoc.Text).Split('-');
                    string maHoanChinh = ma[0] + "-" + ma[1] + "-" + ma[2] + "-" + ma[3];
                    if (cboKhoa.SelectedValue != null && cboMaLo != null)
                    {
                        BUS_ThuocTheoKhoa.Instance.ThemThuocChoKhoa(new ET_ThuocTheoKhoa(maHoanChinh, 0, cboKhoa.SelectedValue.ToString(), 0, cboMaLo.SelectedValue.ToString()), int.Parse(txtNhapVao.Text));
                        if (cboKhoa.SelectedValue != null)
                        {
                            BUS_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(dgvDSThuocTheoKhoa, cboKhoa.SelectedValue.ToString());

                        }
                        //txtTongSoVien.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(maHoanChinh));
                    }
                }
            }
            else
            {
                MessageBox.Show("Bạn phải nhập số lượng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void txtThuoc_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtThuoc.Text))
            {
                string[] ma = (txtThuoc.Text).Split('-');
                string maHoanChinh = ma[0] + "-" + ma[1] + "-" + ma[2] + "-" + ma[3];
                BUS_ThuocTheoKhoa.Instance.LayLoDuaVaoMaThuoc(cboMaLo, maHoanChinh);
                //txtTongSoVien.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(maHoanChinh));
                //if(cboMaLo.SelectedValue != null)
                //{
                //    txtGia.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhTienMotHop(cboMaLo.SelectedValue.ToString()));
                //}
            }
        }

        private void dgvDSThuocTheoKhoa_Click(object sender, EventArgs e)
        {
            if (dgvDSThuocTheoKhoa.CurrentRow != null && !dgvDSThuocTheoKhoa.Rows[dgvDSThuocTheoKhoa.CurrentRow.Index].IsNewRow)
            {
                btnThemSL.Enabled = true;
                btnThem.Enabled = false;
                btnXoaSL.Enabled = true;
                cboMaLo.Enabled = false;
                cboKhoa.Enabled = false;
                btnLamMoi.Enabled = true;
                int dong = dgvDSThuocTheoKhoa.CurrentCell.RowIndex;
                txtThuoc.Text = dgvDSThuocTheoKhoa.Rows[dong].Cells[0].Value.ToString();
                cboKhoa.SelectedValue = dgvDSThuocTheoKhoa.Rows[dong].Cells[2].Value.ToString();
                cboMaLo.SelectedValue = dgvDSThuocTheoKhoa.Rows[dong].Cells[4].Value.ToString();
                //txtTongSoVien.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(txtThuoc.Text));
                if (cboMaLo.SelectedValue != null && !string.IsNullOrEmpty(txtThuoc.Text))
                {
                    txtGia.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhTienMotHop(cboMaLo.SelectedValue.ToString()));
                }
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            btnThemSL.Enabled = false;
            btnThem.Enabled = true;
            cboMaLo.Enabled = true;
            cboKhoa.Enabled = true;
            btnLamMoi.Enabled = false;
            btnXoaSL.Enabled = false;
            if (cboKhoa.SelectedValue != null)
            {
                BUS_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(dgvDSThuocTheoKhoa, cboKhoa.SelectedValue.ToString());
            }
        }

        private void btnXoaSL_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNhapVao.Text))
            {
                DialogResult ret = MessageBox.Show("Bạn muốn thực hiện xóa số lượng không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    string[] ma = (txtThuoc.Text).Split('-');
                    string maHoanChinh = ma[0] + "-" + ma[1] + "-" + ma[2] + "-" + ma[3];
                    if (cboKhoa.SelectedValue != null && cboMaLo != null)
                    {
                        BUS_ThuocTheoKhoa.Instance.XoaSLThuocChoKhoa(new ET_ThuocTheoKhoa(maHoanChinh, 0, cboKhoa.SelectedValue.ToString(), 0, cboMaLo.SelectedValue.ToString()), int.Parse(txtNhapVao.Text));
                        if (cboKhoa.SelectedValue != null)
                        {
                            BUS_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(dgvDSThuocTheoKhoa, cboKhoa.SelectedValue.ToString());
                        }
                        //txtTongSoVien.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(maHoanChinh));
                    }
                }
            }
            else
            {
                MessageBox.Show("Bạn phải nhập số lượng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnThuoc_Click(object sender, EventArgs e)
        {
            frmMain frmMain = (frmMain)this.ParentForm;
            frmMain.openChildForm(new frmKhoThuoc());
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            if (cboKhoa.SelectedValue != null)
            {
                BUS_ThuocTheoKhoa.Instance.TimKiemThuocTheoKhoa(dgvDSThuocTheoKhoa, txtTK.Text, cboKhoa.SelectedValue.ToString());
            }
        }
        private void txtNhapVao_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
        }

        private void btnThemSL_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNhapVao.Text))
            {
                DialogResult ret = MessageBox.Show("Bạn muốn thực hiện thêm số lượng thuốc không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ret == DialogResult.Yes)
                {
                    string[] ma = (txtThuoc.Text).Split('-');
                    string maHoanChinh = ma[0] + "-" + ma[1] + "-" + ma[2] + "-" + ma[3];
                    if (cboKhoa.SelectedValue != null && cboMaLo != null)
                    {
                        BUS_ThuocTheoKhoa.Instance.ThemSLThuocChoKhoa(new ET_ThuocTheoKhoa(maHoanChinh, 0, cboKhoa.SelectedValue.ToString(), 0, cboMaLo.SelectedValue.ToString()), int.Parse(txtNhapVao.Text));
                        BUS_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(dgvDSThuocTheoKhoa, cboKhoa.SelectedValue.ToString());
                        //txtTongSoVien.Text = Convert.ToString(BUS_ThuocTheoKhoa.Instance.TinhVienThuoc(maHoanChinh));
                    }
                }
            }
            else
            {
                MessageBox.Show("Bạn phải nhập số lượng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có chắc chắn muốn thoát?", "Thông báo!", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (kq == DialogResult.Yes)
            {
                this.Close();
            }
        }
    }
}
