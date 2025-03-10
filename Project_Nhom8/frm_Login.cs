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
    public partial class frm_Login : Form
    {
        public frm_Login()
        {
            InitializeComponent();
        }

        private void frm_Login_Load(object sender, EventArgs e)
        {
            this.BackgroundImageLayout = ImageLayout.Stretch;
            //pnlOverlay.BackColor = Color.FromArgb(150, 0, 0, 0);
            pnlOverlay.BackColor = Color.FromArgb(150, pnlOverlay.BackColor);
            //pnlOverlay.BackColor = Color.FromArgb(170, 255, 255, 255);
            ////pnlLogin.BackColor = Color.FromArgb(255, 255, 255);
            //pnlLogin.BackColor = Color.FromArgb(150, 0, 0, 0);
            //pnlLogin.BackColor = Color.FromArgb(200, 255, 255, 255);
            pnlLogin.BackColor = Color.FromArgb(200, pnlLogin.BackColor);
            btnThoat.FillColor = Color.FromArgb(255, 69, 0);
            txtMatKhau.PasswordChar = '•';
            btnLogin.FillColor = System.Drawing.ColorTranslator.FromHtml("#0080FF");
            btnLogin.Enabled = false; 
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn thực hiện đăng nhập không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                if (BUS_TaiKhoan.Instance.KiemTraNhanVienCoThongTinKhong(txtTaiKhoan.Text.ToUpper()) == false)
                {
                    MessageBox.Show("Nhân viên không có trong danh sách", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {
                    if (BUS_TaiKhoan.Instance.KiemTraNhapMKDungSai(txtTaiKhoan.Text.ToUpper(), txtMatKhau.Text.ToUpper()) == false)
                    {
                        MessageBox.Show("Bạn đã nhập sai mật khẩu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        string tenTaiKhoan = txtTaiKhoan.Text.ToUpper();
                        CurrentUser.EmployeeId = txtTaiKhoan.Text.ToUpper();
                        CurrentUser.UserName = BUS_TaiKhoan.Instance.LayTenNVNhoTK(txtTaiKhoan.Text.ToUpper());
                        MessageBox.Show("Đăng nhập thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        frmMain formMenu = new frmMain(tenTaiKhoan);
                        this.Hide();
                        formMenu.ShowDialog();
                        this.Close();
                    }
                }
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ret = MessageBox.Show("Bạn có muốn rời khỏi trang đăng nhập không ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ret == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void txtTaiKhoan_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtTaiKhoan.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                var textbox_1 = new List<string> { txtMatKhau.Text };
                if (BUS_BatLoi.Instance.KiemTraTrong(textbox_1))
                {
                    btnLogin.Enabled = true;
                }
            }
            else
            {
                btnLogin.Enabled = false;
            }
        }

        private void txtMatKhau_TextChanged(object sender, EventArgs e)
        {
            var textbox = new List<string> { txtMatKhau.Text };
            if (BUS_BatLoi.Instance.KiemTraTrong(textbox))
            {
                var textbox_1 = new List<string> { txtTaiKhoan.Text };
                if (BUS_BatLoi.Instance.KiemTraTrong(textbox_1))
                {
                    btnLogin.Enabled = true;
                }
            }
            else
            {
                btnLogin.Enabled = false;
            }
        }

        private void txtTaiKhoan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
            if (txtTaiKhoan.Text.Length > 23 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Tên tài khoản đang nhập quá ký tự cho phép là 24", "THÔNG BÁO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtTaiKhoan.Clear();
            }
        }

        private void txtMatKhau_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
            }
            if (txtMatKhau.Text.Length > 11 && !char.IsControl(e.KeyChar))
            {
                e.Handled = true;
                MessageBox.Show("Mật khẩu đang nhập quá ký tự cho phép là 12", "THÔNG BÁO", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtMatKhau.Clear();
            }
        }

        private void pnlOverlay_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2CirclePictureBox3_Click(object sender, EventArgs e)
        {

        }

        private void guna2CirclePictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void guna2CirclePictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pnlLogin_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
