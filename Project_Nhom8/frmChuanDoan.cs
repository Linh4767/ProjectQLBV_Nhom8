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
    public partial class frmChuanDoan : Form
    {
        public frmChuanDoan()
        {
            InitializeComponent();
        }
        public string Data { get; set; }
        private frmMain mainForm;
        public frmChuanDoan(frmMain mainForm)
        {
            InitializeComponent();
            this.mainForm = mainForm;
            if (this.mainForm == null)
            {
                MessageBox.Show("mainForm is null inside TTBN constructor.");
            }

        }
        public frmChuanDoan(string data)
        {
            InitializeComponent();
            Data = data;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
            txtPhieuKhamBenh.Text = Data;
        }
        private void frmChuanDoan_Load(object sender, EventArgs e)
        {

        }
    }
}
