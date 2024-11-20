using BUS;
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
    public partial class frmHanSuDung : Form
    {
        public frmHanSuDung()
        {
            InitializeComponent();
        }

        private void btnXemThuocGanHH_Click(object sender, EventArgs e)
        {
            BUS_Thuoc.Instance.HienThịThuocSapHetHan(dgvHSD);

        }

        private void frmHanSuDung_Load(object sender, EventArgs e)
        {
            dgvHSD.ColumnHeadersHeight = 40;
        }

        private void btnXemThuocHH_Click(object sender, EventArgs e)
        {
            BUS_Thuoc.Instance.HienThịThuocHetHan(dgvHSD);

        }
    }
}
