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
    public partial class frmSuDungDichVu : Form
    {
        public frmSuDungDichVu()
        {
            InitializeComponent();
        }
        private frmMain mainForm;
        public frmSuDungDichVu(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
        }
        private void frmSuDungDichVu_Load(object sender, EventArgs e)
        {

        }
    }
}
