namespace Project_Nhom8
{
    partial class frmDSBenhNhanNoiTru
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle19 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle20 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle21 = new System.Windows.Forms.DataGridViewCellStyle();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.radTheoKhoangTG = new System.Windows.Forms.RadioButton();
            this.radTheoNam = new System.Windows.Forms.RadioButton();
            this.radTheoThang = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.radTheoNgay = new System.Windows.Forms.RadioButton();
            this.dtpTuNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.dtpDenNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.dgvTongHop = new Guna.UI2.WinForms.Guna2DataGridView();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.btnIn = new Guna.UI2.WinForms.Guna2Button();
            this.btnTraCuu = new Guna.UI2.WinForms.Guna2Button();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.label2 = new System.Windows.Forms.Label();
            this.rptDSBNNoiTruTheoNgay = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptDSBNNoiTruTheoThang = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptDSBNNoiTruTheoNam = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptDSBNNoiTruTheoKhoangTG = new Microsoft.Reporting.WinForms.ReportViewer();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTongHop)).BeginInit();
            this.groupBox6.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radTheoKhoangTG);
            this.groupBox1.Controls.Add(this.radTheoNam);
            this.groupBox1.Controls.Add(this.radTheoThang);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.radTheoNgay);
            this.groupBox1.Controls.Add(this.dtpTuNgay);
            this.groupBox1.Controls.Add(this.dtpDenNgay);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(68, 182);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.groupBox1.Size = new System.Drawing.Size(495, 203);
            this.groupBox1.TabIndex = 205;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin thời gian thống kê";
            // 
            // radTheoKhoangTG
            // 
            this.radTheoKhoangTG.AutoSize = true;
            this.radTheoKhoangTG.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoKhoangTG.Location = new System.Drawing.Point(165, 166);
            this.radTheoKhoangTG.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.radTheoKhoangTG.Name = "radTheoKhoangTG";
            this.radTheoKhoangTG.Size = new System.Drawing.Size(173, 21);
            this.radTheoKhoangTG.TabIndex = 155;
            this.radTheoKhoangTG.Text = "Theo Khoảng thời gian";
            this.radTheoKhoangTG.UseVisualStyleBackColor = true;
            this.radTheoKhoangTG.CheckedChanged += new System.EventHandler(this.radTheoKhoangTG_CheckedChanged);
            // 
            // radTheoNam
            // 
            this.radTheoNam.AutoSize = true;
            this.radTheoNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoNam.Location = new System.Drawing.Point(355, 131);
            this.radTheoNam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.radTheoNam.Name = "radTheoNam";
            this.radTheoNam.Size = new System.Drawing.Size(95, 21);
            this.radTheoNam.TabIndex = 154;
            this.radTheoNam.Text = "Theo Năm";
            this.radTheoNam.UseVisualStyleBackColor = true;
            this.radTheoNam.CheckedChanged += new System.EventHandler(this.radTheoNam_CheckedChanged);
            // 
            // radTheoThang
            // 
            this.radTheoThang.AutoSize = true;
            this.radTheoThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoThang.Location = new System.Drawing.Point(193, 131);
            this.radTheoThang.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.radTheoThang.Name = "radTheoThang";
            this.radTheoThang.Size = new System.Drawing.Size(107, 21);
            this.radTheoThang.TabIndex = 153;
            this.radTheoThang.Text = "Theo Tháng";
            this.radTheoThang.UseVisualStyleBackColor = true;
            this.radTheoThang.CheckedChanged += new System.EventHandler(this.radTheoThang_CheckedChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(27, 36);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 20);
            this.label1.TabIndex = 149;
            this.label1.Text = "Từ ngày";
            // 
            // radTheoNgay
            // 
            this.radTheoNgay.AutoSize = true;
            this.radTheoNgay.Checked = true;
            this.radTheoNgay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoNgay.Location = new System.Drawing.Point(39, 131);
            this.radTheoNgay.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.radTheoNgay.Name = "radTheoNgay";
            this.radTheoNgay.Size = new System.Drawing.Size(99, 21);
            this.radTheoNgay.TabIndex = 152;
            this.radTheoNgay.TabStop = true;
            this.radTheoNgay.Text = "Theo Ngày";
            this.radTheoNgay.UseVisualStyleBackColor = true;
            this.radTheoNgay.CheckedChanged += new System.EventHandler(this.radTheoNgay_CheckedChanged);
            // 
            // dtpTuNgay
            // 
            this.dtpTuNgay.BorderRadius = 3;
            this.dtpTuNgay.BorderThickness = 1;
            this.dtpTuNgay.Checked = true;
            this.dtpTuNgay.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpTuNgay.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpTuNgay.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpTuNgay.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpTuNgay.Location = new System.Drawing.Point(165, 36);
            this.dtpTuNgay.Margin = new System.Windows.Forms.Padding(4);
            this.dtpTuNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpTuNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpTuNgay.Name = "dtpTuNgay";
            this.dtpTuNgay.Size = new System.Drawing.Size(242, 30);
            this.dtpTuNgay.TabIndex = 148;
            this.dtpTuNgay.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // dtpDenNgay
            // 
            this.dtpDenNgay.BorderRadius = 3;
            this.dtpDenNgay.BorderThickness = 1;
            this.dtpDenNgay.Checked = true;
            this.dtpDenNgay.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpDenNgay.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpDenNgay.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpDenNgay.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDenNgay.Location = new System.Drawing.Point(165, 82);
            this.dtpDenNgay.Margin = new System.Windows.Forms.Padding(4);
            this.dtpDenNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpDenNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpDenNgay.Name = "dtpDenNgay";
            this.dtpDenNgay.Size = new System.Drawing.Size(242, 30);
            this.dtpDenNgay.TabIndex = 151;
            this.dtpDenNgay.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(27, 89);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(87, 20);
            this.label3.TabIndex = 150;
            this.label3.Text = "Đến ngày";
            // 
            // dgvTongHop
            // 
            dataGridViewCellStyle19.BackColor = System.Drawing.Color.White;
            this.dgvTongHop.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle19;
            dataGridViewCellStyle20.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle20.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle20.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle20.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle20.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle20.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle20.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvTongHop.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle20;
            this.dgvTongHop.ColumnHeadersHeight = 4;
            this.dgvTongHop.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle21.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle21.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle21.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle21.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle21.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle21.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle21.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTongHop.DefaultCellStyle = dataGridViewCellStyle21;
            this.dgvTongHop.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvTongHop.Location = new System.Drawing.Point(633, 182);
            this.dgvTongHop.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvTongHop.Name = "dgvTongHop";
            this.dgvTongHop.RowHeadersVisible = false;
            this.dgvTongHop.RowHeadersWidth = 62;
            this.dgvTongHop.RowTemplate.Height = 28;
            this.dgvTongHop.Size = new System.Drawing.Size(791, 578);
            this.dgvTongHop.TabIndex = 207;
            this.dgvTongHop.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvTongHop.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvTongHop.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvTongHop.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvTongHop.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvTongHop.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvTongHop.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvTongHop.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvTongHop.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvTongHop.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvTongHop.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvTongHop.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvTongHop.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvTongHop.ThemeStyle.ReadOnly = false;
            this.dgvTongHop.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvTongHop.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvTongHop.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvTongHop.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvTongHop.ThemeStyle.RowsStyle.Height = 28;
            this.dgvTongHop.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvTongHop.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.btnIn);
            this.groupBox6.Controls.Add(this.btnTraCuu);
            this.groupBox6.Controls.Add(this.btnThoat);
            this.groupBox6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox6.Location = new System.Drawing.Point(68, 409);
            this.groupBox6.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox6.Size = new System.Drawing.Size(495, 205);
            this.groupBox6.TabIndex = 206;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Thanh công cụ";
            // 
            // btnIn
            // 
            this.btnIn.BorderRadius = 5;
            this.btnIn.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnIn.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnIn.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnIn.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnIn.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnIn.ForeColor = System.Drawing.Color.White;
            this.btnIn.Location = new System.Drawing.Point(332, 41);
            this.btnIn.Margin = new System.Windows.Forms.Padding(4);
            this.btnIn.Name = "btnIn";
            this.btnIn.Size = new System.Drawing.Size(139, 53);
            this.btnIn.TabIndex = 3;
            this.btnIn.Text = "In";
            this.btnIn.Click += new System.EventHandler(this.btnIn_Click);
            // 
            // btnTraCuu
            // 
            this.btnTraCuu.BorderRadius = 5;
            this.btnTraCuu.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTraCuu.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTraCuu.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTraCuu.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTraCuu.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTraCuu.ForeColor = System.Drawing.Color.White;
            this.btnTraCuu.Location = new System.Drawing.Point(31, 41);
            this.btnTraCuu.Margin = new System.Windows.Forms.Padding(4);
            this.btnTraCuu.Name = "btnTraCuu";
            this.btnTraCuu.Size = new System.Drawing.Size(139, 53);
            this.btnTraCuu.TabIndex = 0;
            this.btnTraCuu.Text = "Tra cứu";
            this.btnTraCuu.Click += new System.EventHandler(this.btnTraCuu_Click);
            // 
            // btnThoat
            // 
            this.btnThoat.BorderRadius = 5;
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(156, 121);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(156, 50);
            this.btnThoat.TabIndex = 203;
            this.btnThoat.Text = "Thoát";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(484, 38);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(539, 36);
            this.label2.TabIndex = 204;
            this.label2.Text = "Tra cứu danh sách bệnh nhân nội trú";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // rptDSBNNoiTruTheoNgay
            // 
            this.rptDSBNNoiTruTheoNgay.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptDSBNNoiTruTheoNgay.rdlc";
            this.rptDSBNNoiTruTheoNgay.Location = new System.Drawing.Point(633, 182);
            this.rptDSBNNoiTruTheoNgay.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rptDSBNNoiTruTheoNgay.Name = "rptDSBNNoiTruTheoNgay";
            this.rptDSBNNoiTruTheoNgay.ServerReport.BearerToken = null;
            this.rptDSBNNoiTruTheoNgay.Size = new System.Drawing.Size(791, 578);
            this.rptDSBNNoiTruTheoNgay.TabIndex = 221;
            // 
            // rptDSBNNoiTruTheoThang
            // 
            this.rptDSBNNoiTruTheoThang.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptDSBNNoiTruTheoThang.rdlc";
            this.rptDSBNNoiTruTheoThang.Location = new System.Drawing.Point(633, 182);
            this.rptDSBNNoiTruTheoThang.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rptDSBNNoiTruTheoThang.Name = "rptDSBNNoiTruTheoThang";
            this.rptDSBNNoiTruTheoThang.ServerReport.BearerToken = null;
            this.rptDSBNNoiTruTheoThang.Size = new System.Drawing.Size(791, 578);
            this.rptDSBNNoiTruTheoThang.TabIndex = 222;
            // 
            // rptDSBNNoiTruTheoNam
            // 
            this.rptDSBNNoiTruTheoNam.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptDSBNNoiTruTheoNam.rdlc";
            this.rptDSBNNoiTruTheoNam.Location = new System.Drawing.Point(633, 182);
            this.rptDSBNNoiTruTheoNam.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rptDSBNNoiTruTheoNam.Name = "rptDSBNNoiTruTheoNam";
            this.rptDSBNNoiTruTheoNam.ServerReport.BearerToken = null;
            this.rptDSBNNoiTruTheoNam.Size = new System.Drawing.Size(791, 578);
            this.rptDSBNNoiTruTheoNam.TabIndex = 223;
            // 
            // rptDSBNNoiTruTheoKhoangTG
            // 
            this.rptDSBNNoiTruTheoKhoangTG.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptDSBNNoiTruTheoKhoangTg.rdlc";
            this.rptDSBNNoiTruTheoKhoangTG.Location = new System.Drawing.Point(633, 182);
            this.rptDSBNNoiTruTheoKhoangTG.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.rptDSBNNoiTruTheoKhoangTG.Name = "rptDSBNNoiTruTheoKhoangTG";
            this.rptDSBNNoiTruTheoKhoangTG.ServerReport.BearerToken = null;
            this.rptDSBNNoiTruTheoKhoangTG.Size = new System.Drawing.Size(791, 578);
            this.rptDSBNNoiTruTheoKhoangTG.TabIndex = 224;
            // 
            // frmDSBenhNhanNoiTru
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1492, 834);
            this.Controls.Add(this.rptDSBNNoiTruTheoKhoangTG);
            this.Controls.Add(this.rptDSBNNoiTruTheoNam);
            this.Controls.Add(this.rptDSBNNoiTruTheoThang);
            this.Controls.Add(this.rptDSBNNoiTruTheoNgay);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgvTongHop);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.label2);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "frmDSBenhNhanNoiTru";
            this.Text = "frmDSBenhNhanNoiTru";
            this.Load += new System.EventHandler(this.frmDSBenhNhanNoiTru_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTongHop)).EndInit();
            this.groupBox6.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radTheoKhoangTG;
        private System.Windows.Forms.RadioButton radTheoNam;
        private System.Windows.Forms.RadioButton radTheoThang;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RadioButton radTheoNgay;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpTuNgay;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpDenNgay;
        private System.Windows.Forms.Label label3;
        private Guna.UI2.WinForms.Guna2DataGridView dgvTongHop;
        private System.Windows.Forms.GroupBox groupBox6;
        private Guna.UI2.WinForms.Guna2Button btnIn;
        private Guna.UI2.WinForms.Guna2Button btnTraCuu;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
        private Microsoft.Reporting.WinForms.ReportViewer rptDSBNNoiTruTheoNgay;
        private Microsoft.Reporting.WinForms.ReportViewer rptDSBNNoiTruTheoThang;
        private Microsoft.Reporting.WinForms.ReportViewer rptDSBNNoiTruTheoNam;
        private Microsoft.Reporting.WinForms.ReportViewer rptDSBNNoiTruTheoKhoangTG;
    }
}