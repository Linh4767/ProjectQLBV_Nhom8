﻿using BUS;
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
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
            customizeDesing();
        }
        public string Data { get; set; }
        public string tenTaiKhoan;
        public frmMain(string taiKhoan)
        {
            InitializeComponent();
            Data = taiKhoan;
            // Bạn có thể thao tác với dữ liệu ở đây, ví dụ hiển thị lên một control nào đó
            tenTaiKhoan = Data;
        }
        private void customizeDesing()
        {
            pnlBenhNhan.Visible = false;
            pnlKhambenh.Visible = false;
            pnlNoiTru.Visible = false;
            pnlTraCu.Visible = false;
            pnlQuanTri.Visible = false;

        }

        //ẩn menu con
        private void hideSubMenu()
        {
            if (pnlBenhNhan.Visible)
            {
                pnlBenhNhan.Visible = false;
            }
            if (pnlKhambenh.Visible)
            {
                pnlKhambenh.Visible = false;
            }
            if (pnlNoiTru.Visible)
            {
                pnlNoiTru.Visible = false;
            }
            if (pnlTraCu.Visible)
            {
                pnlTraCu.Visible = false;
            }
            if (pnlQuanTri.Visible)
            {
                pnlQuanTri.Visible = false;
            }
        }

        //hiển thị menu con
        private void showSubMenu(Panel subMenu)
        {
            if (subMenu.Visible == false)
            {
                hideSubMenu();
                subMenu.Visible = true;
            }
            else
            {
                subMenu.Visible = false;
            }
        }

        //mở form con
        private Form activeForm = null;
        public void openChildForm(Form childForm)
        {
            if (activeForm != null)
            {
                activeForm.Close();
            }
            activeForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            pnlContainer.Controls.Add(childForm);
            pnlContainer.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();

        }

        private void btnBN_Click(object sender, EventArgs e)
        {
            showSubMenu(pnlBenhNhan);
        }

        private void btnKhamBenh_Click(object sender, EventArgs e)
        {
            showSubMenu(pnlKhambenh);
        }

        private void btnNoiTru_Click(object sender, EventArgs e)
        {
            showSubMenu(pnlNoiTru);
        }

        private void btnBaoCao_Click(object sender, EventArgs e)
        {
        }

        private void btnQuanTri_Click(object sender, EventArgs e)
        {
            showSubMenu(pnlQuanTri);
        }

        private void btnTraCuu_Click(object sender, EventArgs e)
        {
            showSubMenu(pnlTraCu);
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult kq = MessageBox.Show("Bạn có đăng xuất không", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (kq == DialogResult.OK)
            {
                // Mở lại form đăng nhập
                frm_Login formLogin = new frm_Login(); // Khởi tạo lại form đăng nhập
                this.Hide(); // Ẩn form hiện tại (form chính)
                formLogin.ShowDialog(); // Mở form đăng nhập dưới dạng dialog

                // Đóng form chính sau khi đăng xuất
                this.Close(); // Đóng form hiện tại (form chính)
            }
        }
        private frmTTBenhNhan ttbn;
        private void btnTTBenhNhan_Click(object sender, EventArgs e)
        {
            if (ttbn == null || ttbn.IsDisposed)
            {
                openChildForm(new frmTTBenhNhan(this));
                hideSubMenu();
            }
            else
            {
                ttbn.BringToFront();
            }
        }
        private frmSoBenhAn sba;
        private void btnSBA_Click(object sender, EventArgs e)
        {
            if (sba == null || sba.IsDisposed)
            {
                sba = new frmSoBenhAn(this);
                openChildForm(sba);
                hideSubMenu();
            }
            else
            {
                sba.BringToFront();
            }
        }
        private frmPhieuKhamBenh pkb;
        private void btnPKB_Click(object sender, EventArgs e)
        {
            if (pkb == null || pkb.IsDisposed)
            {
                pkb = new frmPhieuKhamBenh(this);
                openChildForm(pkb);
                hideSubMenu();
            }
            else
            {
                pkb.BringToFront();
            }
        }
        private frmKhamBenh kb;
        private void btnKB_Click(object sender, EventArgs e)
        {
            if (kb == null || kb.IsDisposed)
            {
                kb = new frmKhamBenh(this);
                openChildForm(kb);
                hideSubMenu();
            }
            else
            {
                kb.BringToFront();
            }
        }

        private void btnDonThuoc_Click(object sender, EventArgs e)
        {
            openChildForm(new frmDonThuoc());
            hideSubMenu();
        }
        private frmChuanDoan cd;
        private void btnChuanDoan_Click(object sender, EventArgs e)
        {
            if (cd == null || cd.IsDisposed)
            {
                cd = new frmChuanDoan(this);
                openChildForm(cd);
                hideSubMenu();
            }
            else
            {
                cd.BringToFront();
            }
        }
        private frmSuDungDichVu sddv;
        private void btnSuDungDichVu_Click(object sender, EventArgs e)
        {
            if (sddv == null || sddv.IsDisposed)
            {
                sddv = new frmSuDungDichVu(this);
                openChildForm(sddv);
                hideSubMenu();
            }
            else
            {
                sddv.BringToFront();
            }
        }

        private void btnTaiKham_Click(object sender, EventArgs e)
        {
            openChildForm(new frmTaiKham());
            hideSubMenu();
        }

        private void btnPhanGiuong_Click(object sender, EventArgs e)
        {
            openChildForm(new frmPhanGiuong());
            hideSubMenu();
        }

        private void btnTDDT_Click(object sender, EventArgs e)
        {
            openChildForm(new frmTheoDoiDieuTri());
            hideSubMenu();
        }

        private void btnNhanVien_Click(object sender, EventArgs e)
        {
            openChildForm(new frmNhanVien());
            hideSubMenu();
        }

        private void btnChucVu_Click(object sender, EventArgs e)
        {
            openChildForm(new frmChucVu());
            hideSubMenu();
        }

        private void btnKhoa_Click(object sender, EventArgs e)
        {
            openChildForm(new frmKhoa());
            hideSubMenu();
        }

        private void btnChuyenNganh_Click(object sender, EventArgs e)
        {
            openChildForm(new frmChuyenNganh());
            hideSubMenu();
        }

        private void btnCaTruc_Click(object sender, EventArgs e)
        {
            openChildForm(new frmCaTruc());
            hideSubMenu();
        }

        private void tnPhong_Click(object sender, EventArgs e)
        {
            openChildForm(new frmPhong());
            hideSubMenu();
        }

        private void btnGiuongBenh_Click(object sender, EventArgs e)
        {
            openChildForm(new frmGiuongBenh());
            hideSubMenu();
        }

        private void btnKhoThuoc_Click(object sender, EventArgs e)
        {
            openChildForm(new frmKhoThuoc());
            hideSubMenu();
        }

        private void btnDichVu_Click(object sender, EventArgs e)
        {
            openChildForm(new frmDichVu());
            hideSubMenu();
        }
        private void frmMain_Load(object sender, EventArgs e)
        {
            hideSubMenu();
            // Tắt nút thu nhỏ (nếu cần)
            this.MinimizeBox = false;

            // Tắt nút phóng to
            this.MaximizeBox = false;
            if (BUS_TaiKhoan.Instance.KiemTraPhanQuyen(tenTaiKhoan) == true)
            {
                btnQuanTri.Visible = true;
                btnNoiTru.Visible = false;
                btnBN.Visible = false;
                btnKhamBenh.Visible = false;
                btnTraCuu.Visible = true;
            }
            else
            {
                btnQuanTri.Visible = false;
                btnNoiTru.Visible = true;
                btnBN.Visible = true;
                btnKhamBenh.Visible = true;
                btnTraCuu.Visible = true;
            }
        }

        private void btnPhatThuocTheoKhoa_Click(object sender, EventArgs e)
        {
            openChildForm(new frmPhatThuocTheoKhoa());
            hideSubMenu();
        }

        private void btnThongKeDoanhThu_Click(object sender, EventArgs e)
        {
            openChildForm(new frmTraCuuDoanhThu());
            hideSubMenu();
        }

        private void btnHoaDonDV_Click(object sender, EventArgs e)
        {
            openChildForm(new frmTraCuuHoaDonDV());
            hideSubMenu();
        }

        private void btnTraCuuBNNoiTru_Click(object sender, EventArgs e)
        {
            openChildForm(new frmDSBenhNhanNoiTru());
            hideSubMenu();
        }

        private void btnTraCuuDonThuoc_Click(object sender, EventArgs e)
        {
            openChildForm(new frmInDonThuoc());
            hideSubMenu();
        }

        private void btnDSBNTheoKhoa_Click(object sender, EventArgs e)
        {
            openChildForm(new frmBaoCaoTheoDoiDieuTri());
            hideSubMenu();
        }
    }
}
