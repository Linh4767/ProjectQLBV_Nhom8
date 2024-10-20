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
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            frmMain formMenu = new frmMain(); 
            this.Hide();
            formMenu.ShowDialog();
            this.Close();
        }
    }
}
