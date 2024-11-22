namespace Project_Nhom8
{
    partial class frmTraCuuDoanhThu
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.txtDoanhThuTTThuoc = new System.Windows.Forms.TextBox();
            this.label9 = new System.Windows.Forms.Label();
            this.txtDoanhThuThucTe = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.radTheoThang = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.radTheoNgay = new System.Windows.Forms.RadioButton();
            this.dtpTuNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.dtpDenNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.txtTongTien = new System.Windows.Forms.TextBox();
            this.radTheoKhoangTG = new System.Windows.Forms.RadioButton();
            this.btnChiTietDT = new Guna.UI2.WinForms.Guna2Button();
            this.btnChiTietSDDV = new Guna.UI2.WinForms.Guna2Button();
            this.btnIn = new Guna.UI2.WinForms.Guna2Button();
            this.btnTraCuu = new Guna.UI2.WinForms.Guna2Button();
            this.label6 = new System.Windows.Forms.Label();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.txtTongTienThuoc = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txtTongTienSDDV = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.dgvTongHop = new Guna.UI2.WinForms.Guna2DataGridView();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.radTheoNam = new System.Windows.Forms.RadioButton();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.rptThongKeDoanhThu = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptThongKeDoanhThuTheoThang = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptThongKeDoanhThuTheoNam = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rptThongKeDoanhThuTheoKhoangTG = new Microsoft.Reporting.WinForms.ReportViewer();
            ((System.ComponentModel.ISupportInitialize)(this.dgvTongHop)).BeginInit();
            this.groupBox6.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtDoanhThuTTThuoc
            // 
            this.txtDoanhThuTTThuoc.Enabled = false;
            this.txtDoanhThuTTThuoc.Location = new System.Drawing.Point(1034, 148);
            this.txtDoanhThuTTThuoc.Name = "txtDoanhThuTTThuoc";
            this.txtDoanhThuTTThuoc.Size = new System.Drawing.Size(237, 26);
            this.txtDoanhThuTTThuoc.TabIndex = 198;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(1029, 103);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(259, 25);
            this.label9.TabIndex = 197;
            this.label9.Text = "Doanh thu thực tế(Thuốc)";
            // 
            // txtDoanhThuThucTe
            // 
            this.txtDoanhThuThucTe.Enabled = false;
            this.txtDoanhThuThucTe.Location = new System.Drawing.Point(402, 148);
            this.txtDoanhThuThucTe.Name = "txtDoanhThuThucTe";
            this.txtDoanhThuThucTe.Size = new System.Drawing.Size(256, 26);
            this.txtDoanhThuThucTe.TabIndex = 196;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(397, 103);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(228, 25);
            this.label8.TabIndex = 195;
            this.label8.Text = "Doanh thu thực tế(DV)";
            // 
            // radTheoThang
            // 
            this.radTheoThang.AutoSize = true;
            this.radTheoThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoThang.Location = new System.Drawing.Point(217, 164);
            this.radTheoThang.Name = "radTheoThang";
            this.radTheoThang.Size = new System.Drawing.Size(119, 24);
            this.radTheoThang.TabIndex = 153;
            this.radTheoThang.Text = "Theo Tháng";
            this.radTheoThang.UseVisualStyleBackColor = true;
            this.radTheoThang.CheckedChanged += new System.EventHandler(this.radTheoThang_CheckedChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(30, 45);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(91, 25);
            this.label1.TabIndex = 149;
            this.label1.Text = "Từ ngày";
            // 
            // radTheoNgay
            // 
            this.radTheoNgay.AutoSize = true;
            this.radTheoNgay.Checked = true;
            this.radTheoNgay.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoNgay.Location = new System.Drawing.Point(44, 164);
            this.radTheoNgay.Name = "radTheoNgay";
            this.radTheoNgay.Size = new System.Drawing.Size(110, 24);
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
            this.dtpTuNgay.Location = new System.Drawing.Point(186, 45);
            this.dtpTuNgay.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dtpTuNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpTuNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpTuNgay.Name = "dtpTuNgay";
            this.dtpTuNgay.Size = new System.Drawing.Size(272, 38);
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
            this.dtpDenNgay.Location = new System.Drawing.Point(186, 103);
            this.dtpDenNgay.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dtpDenNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpDenNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpDenNgay.Name = "dtpDenNgay";
            this.dtpDenNgay.Size = new System.Drawing.Size(272, 38);
            this.dtpDenNgay.TabIndex = 151;
            this.dtpDenNgay.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(30, 111);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(104, 25);
            this.label3.TabIndex = 150;
            this.label3.Text = "Đến ngày";
            // 
            // txtTongTien
            // 
            this.txtTongTien.Enabled = false;
            this.txtTongTien.Location = new System.Drawing.Point(1333, 148);
            this.txtTongTien.Name = "txtTongTien";
            this.txtTongTien.Size = new System.Drawing.Size(232, 26);
            this.txtTongTien.TabIndex = 194;
            // 
            // radTheoKhoangTG
            // 
            this.radTheoKhoangTG.AutoSize = true;
            this.radTheoKhoangTG.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoKhoangTG.Location = new System.Drawing.Point(186, 208);
            this.radTheoKhoangTG.Name = "radTheoKhoangTG";
            this.radTheoKhoangTG.Size = new System.Drawing.Size(193, 24);
            this.radTheoKhoangTG.TabIndex = 155;
            this.radTheoKhoangTG.Text = "Theo Khoảng thời gian";
            this.radTheoKhoangTG.UseVisualStyleBackColor = true;
            this.radTheoKhoangTG.CheckedChanged += new System.EventHandler(this.radTheoKhoangTG_CheckedChanged);
            // 
            // btnChiTietDT
            // 
            this.btnChiTietDT.BorderRadius = 5;
            this.btnChiTietDT.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnChiTietDT.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnChiTietDT.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnChiTietDT.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnChiTietDT.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnChiTietDT.ForeColor = System.Drawing.Color.White;
            this.btnChiTietDT.Location = new System.Drawing.Point(346, 164);
            this.btnChiTietDT.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnChiTietDT.Name = "btnChiTietDT";
            this.btnChiTietDT.Size = new System.Drawing.Size(156, 66);
            this.btnChiTietDT.TabIndex = 5;
            this.btnChiTietDT.Text = "Chi Tiết Tiền Thuốc";
            this.btnChiTietDT.Click += new System.EventHandler(this.btnChiTietDT_Click);
            // 
            // btnChiTietSDDV
            // 
            this.btnChiTietSDDV.BorderRadius = 5;
            this.btnChiTietSDDV.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnChiTietSDDV.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnChiTietSDDV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnChiTietSDDV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnChiTietSDDV.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnChiTietSDDV.ForeColor = System.Drawing.Color.White;
            this.btnChiTietSDDV.Location = new System.Drawing.Point(35, 165);
            this.btnChiTietSDDV.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnChiTietSDDV.Name = "btnChiTietSDDV";
            this.btnChiTietSDDV.Size = new System.Drawing.Size(156, 66);
            this.btnChiTietSDDV.TabIndex = 4;
            this.btnChiTietSDDV.Text = "Chi Tiết Sử Dụng DV";
            this.btnChiTietSDDV.Click += new System.EventHandler(this.btnChiTietSDDV_Click);
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
            this.btnIn.Location = new System.Drawing.Point(350, 38);
            this.btnIn.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnIn.Name = "btnIn";
            this.btnIn.Size = new System.Drawing.Size(156, 66);
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
            this.btnTraCuu.Location = new System.Drawing.Point(35, 38);
            this.btnTraCuu.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnTraCuu.Name = "btnTraCuu";
            this.btnTraCuu.Size = new System.Drawing.Size(156, 66);
            this.btnTraCuu.TabIndex = 0;
            this.btnTraCuu.Text = "Tra cứu";
            this.btnTraCuu.Click += new System.EventHandler(this.btnTraCuu_Click);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(1328, 103);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(103, 25);
            this.label6.TabIndex = 193;
            this.label6.Text = "Tổng tiền";
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
            this.btnThoat.Location = new System.Drawing.Point(1446, 961);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(156, 50);
            this.btnThoat.TabIndex = 184;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // txtTongTienThuoc
            // 
            this.txtTongTienThuoc.Enabled = false;
            this.txtTongTienThuoc.Location = new System.Drawing.Point(712, 148);
            this.txtTongTienThuoc.Name = "txtTongTienThuoc";
            this.txtTongTienThuoc.Size = new System.Drawing.Size(256, 26);
            this.txtTongTienThuoc.TabIndex = 192;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(707, 103);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(310, 25);
            this.label5.TabIndex = 191;
            this.label5.Text = "Doanh thu giá niêm yết(Thuốc)";
            // 
            // txtTongTienSDDV
            // 
            this.txtTongTienSDDV.Enabled = false;
            this.txtTongTienSDDV.Location = new System.Drawing.Point(99, 148);
            this.txtTongTienSDDV.Name = "txtTongTienSDDV";
            this.txtTongTienSDDV.Size = new System.Drawing.Size(256, 26);
            this.txtTongTienSDDV.TabIndex = 190;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(94, 103);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(279, 25);
            this.label4.TabIndex = 189;
            this.label4.Text = "Doanh thu giá niêm yết(DV)";
            // 
            // dgvTongHop
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvTongHop.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvTongHop.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvTongHop.ColumnHeadersHeight = 4;
            this.dgvTongHop.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvTongHop.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvTongHop.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvTongHop.Location = new System.Drawing.Point(74, 501);
            this.dgvTongHop.Name = "dgvTongHop";
            this.dgvTongHop.RowHeadersVisible = false;
            this.dgvTongHop.RowHeadersWidth = 62;
            this.dgvTongHop.RowTemplate.Height = 28;
            this.dgvTongHop.Size = new System.Drawing.Size(1528, 448);
            this.dgvTongHop.TabIndex = 188;
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
            this.dgvTongHop.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvTongHop_CellFormatting);
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.btnChiTietDT);
            this.groupBox6.Controls.Add(this.btnChiTietSDDV);
            this.groupBox6.Controls.Add(this.btnIn);
            this.groupBox6.Controls.Add(this.btnTraCuu);
            this.groupBox6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox6.Location = new System.Drawing.Point(892, 205);
            this.groupBox6.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Padding = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.groupBox6.Size = new System.Drawing.Size(567, 256);
            this.groupBox6.TabIndex = 187;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Thanh công cụ";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(626, 31);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(326, 40);
            this.label2.TabIndex = 185;
            this.label2.Text = "Tra cứu doanh thu";
            // 
            // radTheoNam
            // 
            this.radTheoNam.AutoSize = true;
            this.radTheoNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radTheoNam.Location = new System.Drawing.Point(399, 164);
            this.radTheoNam.Name = "radTheoNam";
            this.radTheoNam.Size = new System.Drawing.Size(107, 24);
            this.radTheoNam.TabIndex = 154;
            this.radTheoNam.Text = "Theo Năm";
            this.radTheoNam.UseVisualStyleBackColor = true;
            this.radTheoNam.CheckedChanged += new System.EventHandler(this.radTheoNam_CheckedChanged);
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
            this.groupBox1.Location = new System.Drawing.Point(276, 207);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.groupBox1.Size = new System.Drawing.Size(557, 254);
            this.groupBox1.TabIndex = 186;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin thời gian thống kê";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // rptThongKeDoanhThu
            // 
            this.rptThongKeDoanhThu.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptTraCuuHoaDonTheoNgay.rdlc";
            this.rptThongKeDoanhThu.Location = new System.Drawing.Point(74, 501);
            this.rptThongKeDoanhThu.Name = "rptThongKeDoanhThu";
            this.rptThongKeDoanhThu.ServerReport.BearerToken = null;
            this.rptThongKeDoanhThu.Size = new System.Drawing.Size(1528, 448);
            this.rptThongKeDoanhThu.TabIndex = 199;
            // 
            // rptThongKeDoanhThuTheoThang
            // 
            this.rptThongKeDoanhThuTheoThang.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptTraCuuHoaDonTheoThang.rdlc";
            this.rptThongKeDoanhThuTheoThang.Location = new System.Drawing.Point(74, 501);
            this.rptThongKeDoanhThuTheoThang.Name = "rptThongKeDoanhThuTheoThang";
            this.rptThongKeDoanhThuTheoThang.ServerReport.BearerToken = null;
            this.rptThongKeDoanhThuTheoThang.Size = new System.Drawing.Size(1528, 448);
            this.rptThongKeDoanhThuTheoThang.TabIndex = 200;
            // 
            // rptThongKeDoanhThuTheoNam
            // 
            this.rptThongKeDoanhThuTheoNam.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptTraCuuHoaDonTheoNam.rdlc";
            this.rptThongKeDoanhThuTheoNam.Location = new System.Drawing.Point(74, 501);
            this.rptThongKeDoanhThuTheoNam.Name = "rptThongKeDoanhThuTheoNam";
            this.rptThongKeDoanhThuTheoNam.ServerReport.BearerToken = null;
            this.rptThongKeDoanhThuTheoNam.Size = new System.Drawing.Size(1528, 448);
            this.rptThongKeDoanhThuTheoNam.TabIndex = 201;
            // 
            // rptThongKeDoanhThuTheoKhoangTG
            // 
            this.rptThongKeDoanhThuTheoKhoangTG.LocalReport.ReportEmbeddedResource = "Project_Nhom8.rptTraCuuHoaDonTheoKhoangTG.rdlc";
            this.rptThongKeDoanhThuTheoKhoangTG.Location = new System.Drawing.Point(74, 501);
            this.rptThongKeDoanhThuTheoKhoangTG.Name = "rptThongKeDoanhThuTheoKhoangTG";
            this.rptThongKeDoanhThuTheoKhoangTG.ServerReport.BearerToken = null;
            this.rptThongKeDoanhThuTheoKhoangTG.Size = new System.Drawing.Size(1528, 448);
            this.rptThongKeDoanhThuTheoKhoangTG.TabIndex = 202;
            // 
            // frmTraCuuDoanhThu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1678, 1043);
            this.Controls.Add(this.rptThongKeDoanhThuTheoKhoangTG);
            this.Controls.Add(this.rptThongKeDoanhThuTheoNam);
            this.Controls.Add(this.rptThongKeDoanhThuTheoThang);
            this.Controls.Add(this.rptThongKeDoanhThu);
            this.Controls.Add(this.txtDoanhThuTTThuoc);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.txtDoanhThuThucTe);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.txtTongTien);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.txtTongTienThuoc);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.txtTongTienSDDV);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.dgvTongHop);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmTraCuuDoanhThu";
            this.Text = "frmTraCuuDoanhThu";
            this.Load += new System.EventHandler(this.frmTraCuuDoanhThu_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvTongHop)).EndInit();
            this.groupBox6.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtDoanhThuTTThuoc;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtDoanhThuThucTe;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.RadioButton radTheoThang;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RadioButton radTheoNgay;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpTuNgay;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpDenNgay;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txtTongTien;
        private System.Windows.Forms.RadioButton radTheoKhoangTG;
        private Guna.UI2.WinForms.Guna2Button btnChiTietDT;
        private Guna.UI2.WinForms.Guna2Button btnChiTietSDDV;
        private Guna.UI2.WinForms.Guna2Button btnIn;
        private Guna.UI2.WinForms.Guna2Button btnTraCuu;
        private System.Windows.Forms.Label label6;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
        private System.Windows.Forms.TextBox txtTongTienThuoc;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtTongTienSDDV;
        private System.Windows.Forms.Label label4;
        private Guna.UI2.WinForms.Guna2DataGridView dgvTongHop;
        private System.Windows.Forms.GroupBox groupBox6;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RadioButton radTheoNam;
        private System.Windows.Forms.GroupBox groupBox1;
        private Microsoft.Reporting.WinForms.ReportViewer rptThongKeDoanhThu;
        private Microsoft.Reporting.WinForms.ReportViewer rptThongKeDoanhThuTheoThang;
        private Microsoft.Reporting.WinForms.ReportViewer rptThongKeDoanhThuTheoNam;
        private Microsoft.Reporting.WinForms.ReportViewer rptThongKeDoanhThuTheoKhoangTG;
    }
}