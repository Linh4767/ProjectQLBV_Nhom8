namespace Project_Nhom8
{
    partial class frmInDSBNNoiTruTheoNgay
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
            this.rptDSBNNoiTruTheoNgay = new Microsoft.Reporting.WinForms.ReportViewer();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.SuspendLayout();
            // 
            // rptDSBNNoiTruTheoNgay
            // 
            this.rptDSBNNoiTruTheoNgay.Dock = System.Windows.Forms.DockStyle.Top;
            this.rptDSBNNoiTruTheoNgay.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptDSBNNoiTruTheoNgay.rdlc";
            this.rptDSBNNoiTruTheoNgay.Location = new System.Drawing.Point(0, 0);
            this.rptDSBNNoiTruTheoNgay.Name = "rptDSBNNoiTruTheoNgay";
            this.rptDSBNNoiTruTheoNgay.ServerReport.BearerToken = null;
            this.rptDSBNNoiTruTheoNgay.Size = new System.Drawing.Size(1678, 973);
            this.rptDSBNNoiTruTheoNgay.TabIndex = 0;
            // 
            // btnThoat
            // 
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(1469, 986);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(180, 45);
            this.btnThoat.TabIndex = 1;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmInDSBNNoiTruTheoNgay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1678, 1043);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.rptDSBNNoiTruTheoNgay);
            this.Name = "frmInDSBNNoiTruTheoNgay";
            this.Text = "frmInDSBNNoiTruTheoNgay";
            this.Load += new System.EventHandler(this.frmInDSBNNoiTruTheoNgay_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private Microsoft.Reporting.WinForms.ReportViewer rptDSBNNoiTruTheoNgay;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
    }
}