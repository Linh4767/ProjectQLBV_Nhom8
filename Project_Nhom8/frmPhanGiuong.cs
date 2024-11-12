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
    public partial class frmPhanGiuong : Form
    {
        public frmPhanGiuong()
        {
            InitializeComponent();
        }

        public frmPhanGiuong(string maBN, string maNVYC, string maNVTH, string khoa, string phong, DateTime ngayNhan, DateTime thoiGianNhan)
        {
            InitializeComponent();

            //Lấy mã bệnh nhân
            txtBenhNhan.Text = maBN;
            txtNhanVienYC.Text = maNVYC;
            txtNhanVienTH.Text = maNVTH;
            txtKhoa.Text = khoa;
            txtPhongBenh.Text = phong;
            dtpNgayNhanGiuong.Value = ngayNhan;
            dtpThoiGianNhan.Value = thoiGianNhan;           
        }

        private void frmPhanGiuong_Load(object sender, EventArgs e)
        {

        }
    }
}
