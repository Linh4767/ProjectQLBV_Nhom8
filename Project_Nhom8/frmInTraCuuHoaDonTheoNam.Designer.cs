namespace Project_Nhom8
{
    partial class frmInTraCuuHoaDonTheoNam
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
            this.rptThongKeDoanhThuTheoNam = new Microsoft.Reporting.WinForms.ReportViewer();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // rptThongKeDoanhThuTheoNam
            // 
            this.rptThongKeDoanhThuTheoNam.Dock = System.Windows.Forms.DockStyle.Top;
            this.rptThongKeDoanhThuTheoNam.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptTraCuuHoaDonTheoNam.rdlc";
            this.rptThongKeDoanhThuTheoNam.Location = new System.Drawing.Point(0, 0);
            this.rptThongKeDoanhThuTheoNam.Name = "rptThongKeDoanhThuTheoNam";
            this.rptThongKeDoanhThuTheoNam.ServerReport.BearerToken = null;
            this.rptThongKeDoanhThuTheoNam.Size = new System.Drawing.Size(1678, 977);
            this.rptThongKeDoanhThuTheoNam.TabIndex = 0;
            // 
            // btnThoat
            // 
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(1473, 986);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(180, 45);
            this.btnThoat.TabIndex = 1;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmInTraCuuHoaDonTheoNam
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1678, 1043);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.rptThongKeDoanhThuTheoNam);
            this.Name = "frmInTraCuuHoaDonTheoNam";
            this.Text = "frmInTraCuuHoaDonTheoNam";
            this.Load += new System.EventHandler(this.frmInTraCuuHoaDonTheoNam_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer rptThongKeDoanhThuTheoNam;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
    }
}