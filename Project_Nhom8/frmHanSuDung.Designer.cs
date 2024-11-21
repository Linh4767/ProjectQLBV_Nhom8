namespace Project_Nhom8
{
    partial class frmHanSuDung
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvHSD = new Guna.UI2.WinForms.Guna2DataGridView();
            this.radThuocGanHH = new System.Windows.Forms.RadioButton();
            this.btnTim = new Guna.UI2.WinForms.Guna2Button();
            this.radThuocHH = new System.Windows.Forms.RadioButton();
            this.btnIn = new Guna.UI2.WinForms.Guna2Button();
            this.btnXoaSLThuoc = new Guna.UI2.WinForms.Guna2Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.rptThuocGanHH = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptThuocHH = new Microsoft.Reporting.WinForms.ReportViewer();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHSD)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(582, 38);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(369, 36);
            this.label1.TabIndex = 135;
            this.label1.Text = "Hạn Sử Dụng Của Thuốc";
            // 
            // dgvHSD
            // 
            dataGridViewCellStyle7.BackColor = System.Drawing.Color.White;
            this.dgvHSD.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle7;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvHSD.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle8;
            this.dgvHSD.ColumnHeadersHeight = 4;
            this.dgvHSD.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle9.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle9.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle9.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle9.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvHSD.DefaultCellStyle = dataGridViewCellStyle9;
            this.dgvHSD.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvHSD.Location = new System.Drawing.Point(655, 154);
            this.dgvHSD.Name = "dgvHSD";
            this.dgvHSD.RowHeadersVisible = false;
            this.dgvHSD.RowHeadersWidth = 51;
            this.dgvHSD.RowTemplate.Height = 24;
            this.dgvHSD.Size = new System.Drawing.Size(801, 453);
            this.dgvHSD.TabIndex = 156;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvHSD.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvHSD.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvHSD.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvHSD.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvHSD.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvHSD.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvHSD.ThemeStyle.ReadOnly = false;
            this.dgvHSD.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvHSD.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvHSD.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvHSD.ThemeStyle.RowsStyle.Height = 24;
            this.dgvHSD.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvHSD.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvHSD.Click += new System.EventHandler(this.dgvHSD_Click);
            // 
            // radThuocGanHH
            // 
            this.radThuocGanHH.AutoSize = true;
            this.radThuocGanHH.Checked = true;
            this.radThuocGanHH.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radThuocGanHH.Location = new System.Drawing.Point(64, 92);
            this.radThuocGanHH.Name = "radThuocGanHH";
            this.radThuocGanHH.Size = new System.Drawing.Size(195, 24);
            this.radThuocGanHH.TabIndex = 157;
            this.radThuocGanHH.Text = "Thuốc Sắp Hết Hạn";
            this.radThuocGanHH.UseVisualStyleBackColor = true;
            // 
            // btnTim
            // 
            this.btnTim.BorderRadius = 3;
            this.btnTim.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTim.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTim.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTim.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTim.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.btnTim.ForeColor = System.Drawing.Color.White;
            this.btnTim.Location = new System.Drawing.Point(44, 407);
            this.btnTim.Name = "btnTim";
            this.btnTim.Size = new System.Drawing.Size(144, 45);
            this.btnTim.TabIndex = 158;
            this.btnTim.Text = "Tìm";
            this.btnTim.Click += new System.EventHandler(this.btnTim_Click);
            // 
            // radThuocHH
            // 
            this.radThuocHH.AutoSize = true;
            this.radThuocHH.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radThuocHH.Location = new System.Drawing.Point(339, 92);
            this.radThuocHH.Name = "radThuocHH";
            this.radThuocHH.Size = new System.Drawing.Size(157, 24);
            this.radThuocHH.TabIndex = 159;
            this.radThuocHH.Text = "Thuốc Hết Hạn";
            this.radThuocHH.UseVisualStyleBackColor = true;
            // 
            // btnIn
            // 
            this.btnIn.BorderRadius = 3;
            this.btnIn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnIn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnIn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnIn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnIn.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.btnIn.ForeColor = System.Drawing.Color.White;
            this.btnIn.Location = new System.Drawing.Point(442, 407);
            this.btnIn.Name = "btnIn";
            this.btnIn.Size = new System.Drawing.Size(160, 45);
            this.btnIn.TabIndex = 160;
            this.btnIn.Text = "In";
            this.btnIn.Click += new System.EventHandler(this.btnIn_Click);
            // 
            // btnXoaSLThuoc
            // 
            this.btnXoaSLThuoc.BorderRadius = 3;
            this.btnXoaSLThuoc.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXoaSLThuoc.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXoaSLThuoc.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXoaSLThuoc.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXoaSLThuoc.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.btnXoaSLThuoc.ForeColor = System.Drawing.Color.White;
            this.btnXoaSLThuoc.Location = new System.Drawing.Point(231, 407);
            this.btnXoaSLThuoc.Name = "btnXoaSLThuoc";
            this.btnXoaSLThuoc.Size = new System.Drawing.Size(180, 45);
            this.btnXoaSLThuoc.TabIndex = 161;
            this.btnXoaSLThuoc.Text = "Xóa SL Thuốc";
            this.btnXoaSLThuoc.Click += new System.EventHandler(this.btnXoaSLThuoc_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radThuocHH);
            this.groupBox1.Controls.Add(this.radThuocGanHH);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(44, 154);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(558, 185);
            this.groupBox1.TabIndex = 162;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông Tin";
            // 
            // btnThoat
            // 
            this.btnThoat.BorderRadius = 3;
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(1296, 628);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(160, 45);
            this.btnThoat.TabIndex = 163;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // rptThuocGanHH
            // 
            this.rptThuocGanHH.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptThuocGanHH.rdlc";
            this.rptThuocGanHH.Location = new System.Drawing.Point(655, 154);
            this.rptThuocGanHH.Name = "rptThuocGanHH";
            this.rptThuocGanHH.ServerReport.BearerToken = null;
            this.rptThuocGanHH.Size = new System.Drawing.Size(801, 453);
            this.rptThuocGanHH.TabIndex = 164;
            // 
            // rptThuocHH
            // 
            this.rptThuocHH.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptThuocHH.rdlc";
            this.rptThuocHH.Location = new System.Drawing.Point(655, 154);
            this.rptThuocHH.Name = "rptThuocHH";
            this.rptThuocHH.ServerReport.BearerToken = null;
            this.rptThuocHH.Size = new System.Drawing.Size(801, 453);
            this.rptThuocHH.TabIndex = 165;
            // 
            // frmHanSuDung
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1482, 699);
            this.Controls.Add(this.rptThuocHH);
            this.Controls.Add(this.rptThuocGanHH);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnXoaSLThuoc);
            this.Controls.Add(this.btnIn);
            this.Controls.Add(this.btnTim);
            this.Controls.Add(this.dgvHSD);
            this.Controls.Add(this.label1);
            this.Name = "frmHanSuDung";
            this.Text = "Hạn Sử Dụng";
            this.Load += new System.EventHandler(this.frmHanSuDung_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvHSD)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private Guna.UI2.WinForms.Guna2DataGridView dgvHSD;
        private System.Windows.Forms.RadioButton radThuocGanHH;
        private Guna.UI2.WinForms.Guna2Button btnTim;
        private System.Windows.Forms.RadioButton radThuocHH;
        private Guna.UI2.WinForms.Guna2Button btnIn;
        private Guna.UI2.WinForms.Guna2Button btnXoaSLThuoc;
        private System.Windows.Forms.GroupBox groupBox1;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
        private Microsoft.Reporting.WinForms.ReportViewer rptThuocGanHH;
        private Microsoft.Reporting.WinForms.ReportViewer rptThuocHH;
    }
}