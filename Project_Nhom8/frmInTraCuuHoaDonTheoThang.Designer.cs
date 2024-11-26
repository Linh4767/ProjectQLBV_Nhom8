namespace Project_Nhom8
{
    partial class frmInTraCuuHoaDonTheoThang
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.rptThongKeDoanhThuTheoThang = new Microsoft.Reporting.WinForms.ReportViewer();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // rptThongKeDoanhThuTheoThang
            // 
            this.rptThongKeDoanhThuTheoThang.Dock = System.Windows.Forms.DockStyle.Top;
            this.rptThongKeDoanhThuTheoThang.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptTraCuuHoaDonTheoThang.rdlc";
            this.rptThongKeDoanhThuTheoThang.Location = new System.Drawing.Point(0, 0);
            this.rptThongKeDoanhThuTheoThang.Name = "rptThongKeDoanhThuTheoThang";
            this.rptThongKeDoanhThuTheoThang.ServerReport.BearerToken = null;
            this.rptThongKeDoanhThuTheoThang.Size = new System.Drawing.Size(1678, 981);
            this.rptThongKeDoanhThuTheoThang.TabIndex = 0;
            // 
            // btnThoat
            // 
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(1486, 987);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(180, 45);
            this.btnThoat.TabIndex = 1;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmInTraCuuHoaDonTheoThang
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1678, 1043);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.rptThongKeDoanhThuTheoThang);
            this.Name = "frmInTraCuuHoaDonTheoThang";
            this.Text = "frmInTraCuuHoaDonTheoThang";
            this.Load += new System.EventHandler(this.frmInTraCuuHoaDonTheoThang_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer rptThongKeDoanhThuTheoThang;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
    }
}