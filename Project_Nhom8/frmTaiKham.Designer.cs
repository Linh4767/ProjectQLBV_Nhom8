namespace Project_Nhom8
{
    partial class frmTaiKham
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
            this.label6 = new System.Windows.Forms.Label();
            this.cboMaNV = new Guna.UI2.WinForms.Guna2ComboBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.radCuocHen = new System.Windows.Forms.RadioButton();
            this.radLichSu = new System.Windows.Forms.RadioButton();
            this.btnLamMoi = new Guna.UI2.WinForms.Guna2Button();
            this.cboChonKhoa = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.cboPhong = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label9 = new System.Windows.Forms.Label();
            this.dtpTGCa = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.dtpChonNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.btnTimKiem = new Guna.UI2.WinForms.Guna2Button();
            this.txtTimKiem = new Guna.UI2.WinForms.Guna2TextBox();
            this.bntThoat = new Guna.UI2.WinForms.Guna2Button();
            this.dgvDSTaiKham = new Guna.UI2.WinForms.Guna2DataGridView();
            this.label2 = new System.Windows.Forms.Label();
            this.txtKQ = new Guna.UI2.WinForms.Guna2TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label38 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label39 = new System.Windows.Forms.Label();
            this.txtMaCH = new Guna.UI2.WinForms.Guna2TextBox();
            this.txtBN = new Guna.UI2.WinForms.Guna2TextBox();
            this.dtpNgayTaiKham = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.cboSoBA = new Guna.UI2.WinForms.Guna2ComboBox();
            this.cboTrangThai = new Guna.UI2.WinForms.Guna2ComboBox();
            this.btnThemTK = new Guna.UI2.WinForms.Guna2Button();
            this.btnSuaTK = new Guna.UI2.WinForms.Guna2Button();
            this.label40 = new System.Windows.Forms.Label();
            this.label41 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSTaiKham)).BeginInit();
            this.SuspendLayout();
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(937, 188);
            this.label6.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(32, 20);
            this.label6.TabIndex = 167;
            this.label6.Text = "Ca";
            // 
            // cboMaNV
            // 
            this.cboMaNV.BackColor = System.Drawing.Color.Transparent;
            this.cboMaNV.BorderColor = System.Drawing.Color.Black;
            this.cboMaNV.BorderRadius = 7;
            this.cboMaNV.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboMaNV.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboMaNV.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboMaNV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboMaNV.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboMaNV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboMaNV.ItemHeight = 30;
            this.cboMaNV.Location = new System.Drawing.Point(219, 373);
            this.cboMaNV.Name = "cboMaNV";
            this.cboMaNV.Size = new System.Drawing.Size(393, 36);
            this.cboMaNV.TabIndex = 166;
            this.cboMaNV.SelectedIndexChanged += new System.EventHandler(this.cboMaNV_SelectedIndexChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.radCuocHen);
            this.groupBox1.Controls.Add(this.radLichSu);
            this.groupBox1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox1.Location = new System.Drawing.Point(412, 616);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(321, 75);
            this.groupBox1.TabIndex = 165;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin tìm kiếm";
            // 
            // radCuocHen
            // 
            this.radCuocHen.AutoSize = true;
            this.radCuocHen.Checked = true;
            this.radCuocHen.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radCuocHen.Location = new System.Drawing.Point(6, 31);
            this.radCuocHen.Name = "radCuocHen";
            this.radCuocHen.Size = new System.Drawing.Size(109, 24);
            this.radCuocHen.TabIndex = 133;
            this.radCuocHen.TabStop = true;
            this.radCuocHen.Text = "Cuộc hẹn";
            this.radCuocHen.UseVisualStyleBackColor = true;
            // 
            // radLichSu
            // 
            this.radLichSu.AutoSize = true;
            this.radLichSu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radLichSu.Location = new System.Drawing.Point(133, 31);
            this.radLichSu.Name = "radLichSu";
            this.radLichSu.Size = new System.Drawing.Size(169, 24);
            this.radLichSu.TabIndex = 133;
            this.radLichSu.Text = "Lịch sử tái khám";
            this.radLichSu.UseVisualStyleBackColor = true;
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.BorderRadius = 4;
            this.btnLamMoi.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnLamMoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnLamMoi.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLamMoi.ForeColor = System.Drawing.Color.White;
            this.btnLamMoi.Location = new System.Drawing.Point(676, 528);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(157, 50);
            this.btnLamMoi.TabIndex = 164;
            this.btnLamMoi.Text = "Làm mới";
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // cboChonKhoa
            // 
            this.cboChonKhoa.BackColor = System.Drawing.Color.Transparent;
            this.cboChonKhoa.BorderColor = System.Drawing.Color.Black;
            this.cboChonKhoa.BorderRadius = 7;
            this.cboChonKhoa.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboChonKhoa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboChonKhoa.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboChonKhoa.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboChonKhoa.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboChonKhoa.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboChonKhoa.ItemHeight = 30;
            this.cboChonKhoa.Location = new System.Drawing.Point(219, 216);
            this.cboChonKhoa.Margin = new System.Windows.Forms.Padding(4);
            this.cboChonKhoa.Name = "cboChonKhoa";
            this.cboChonKhoa.Size = new System.Drawing.Size(393, 36);
            this.cboChonKhoa.TabIndex = 163;
            this.cboChonKhoa.SelectedIndexChanged += new System.EventHandler(this.cboChonKhoa_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(215, 188);
            this.label5.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(51, 20);
            this.label5.TabIndex = 162;
            this.label5.Text = "Khoa";
            // 
            // cboPhong
            // 
            this.cboPhong.BackColor = System.Drawing.Color.Transparent;
            this.cboPhong.BorderColor = System.Drawing.Color.Black;
            this.cboPhong.BorderRadius = 7;
            this.cboPhong.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboPhong.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPhong.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhong.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhong.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboPhong.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboPhong.ItemHeight = 30;
            this.cboPhong.Location = new System.Drawing.Point(219, 290);
            this.cboPhong.Margin = new System.Windows.Forms.Padding(4);
            this.cboPhong.Name = "cboPhong";
            this.cboPhong.Size = new System.Drawing.Size(393, 36);
            this.cboPhong.TabIndex = 161;
            this.cboPhong.SelectedIndexChanged += new System.EventHandler(this.cboPhong_SelectedIndexChanged);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(215, 262);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(61, 20);
            this.label9.TabIndex = 160;
            this.label9.Text = "Phòng";
            // 
            // dtpTGCa
            // 
            this.dtpTGCa.BorderRadius = 3;
            this.dtpTGCa.BorderThickness = 1;
            this.dtpTGCa.Checked = true;
            this.dtpTGCa.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpTGCa.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpTGCa.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpTGCa.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpTGCa.Location = new System.Drawing.Point(935, 214);
            this.dtpTGCa.Margin = new System.Windows.Forms.Padding(4);
            this.dtpTGCa.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpTGCa.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpTGCa.Name = "dtpTGCa";
            this.dtpTGCa.Size = new System.Drawing.Size(126, 34);
            this.dtpTGCa.TabIndex = 159;
            this.dtpTGCa.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            this.dtpTGCa.ValueChanged += new System.EventHandler(this.dtpTGCa_ValueChanged);
            // 
            // dtpChonNgay
            // 
            this.dtpChonNgay.BackColor = System.Drawing.SystemColors.Control;
            this.dtpChonNgay.BorderRadius = 3;
            this.dtpChonNgay.BorderThickness = 1;
            this.dtpChonNgay.Checked = true;
            this.dtpChonNgay.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpChonNgay.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpChonNgay.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpChonNgay.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpChonNgay.Location = new System.Drawing.Point(165, 647);
            this.dtpChonNgay.Margin = new System.Windows.Forms.Padding(4);
            this.dtpChonNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpChonNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpChonNgay.Name = "dtpChonNgay";
            this.dtpChonNgay.Size = new System.Drawing.Size(190, 34);
            this.dtpChonNgay.TabIndex = 158;
            this.dtpChonNgay.Value = new System.DateTime(2024, 11, 13, 0, 0, 0, 0);
            this.dtpChonNgay.ValueChanged += new System.EventHandler(this.dtpChonNgay_ValueChanged);
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.BackColor = System.Drawing.Color.Transparent;
            this.btnTimKiem.BorderRadius = 3;
            this.btnTimKiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTimKiem.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnTimKiem.ForeColor = System.Drawing.Color.White;
            this.btnTimKiem.Location = new System.Drawing.Point(1228, 647);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(118, 36);
            this.btnTimKiem.TabIndex = 156;
            this.btnTimKiem.Text = "Tìm Kiếm";
            this.btnTimKiem.Click += new System.EventHandler(this.btnTimKiem_Click);
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtTimKiem.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.txtTimKiem.BorderRadius = 3;
            this.txtTimKiem.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTimKiem.DefaultText = "";
            this.txtTimKiem.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTimKiem.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTimKiem.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTimKiem.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.txtTimKiem.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(122)))));
            this.txtTimKiem.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTimKiem.Location = new System.Drawing.Point(835, 647);
            this.txtTimKiem.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.PasswordChar = '\0';
            this.txtTimKiem.PlaceholderForeColor = System.Drawing.Color.Gray;
            this.txtTimKiem.PlaceholderText = "";
            this.txtTimKiem.SelectedText = "";
            this.txtTimKiem.Size = new System.Drawing.Size(368, 36);
            this.txtTimKiem.TabIndex = 157;
            // 
            // bntThoat
            // 
            this.bntThoat.BorderRadius = 4;
            this.bntThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.bntThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.bntThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.bntThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.bntThoat.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.bntThoat.ForeColor = System.Drawing.Color.White;
            this.bntThoat.Location = new System.Drawing.Point(908, 528);
            this.bntThoat.Margin = new System.Windows.Forms.Padding(4);
            this.bntThoat.Name = "bntThoat";
            this.bntThoat.Size = new System.Drawing.Size(157, 50);
            this.bntThoat.TabIndex = 155;
            this.bntThoat.Text = "Thoát";
            this.bntThoat.Click += new System.EventHandler(this.bntThoat_Click);
            // 
            // dgvDSTaiKham
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvDSTaiKham.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvDSTaiKham.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDSTaiKham.ColumnHeadersHeight = 4;
            this.dgvDSTaiKham.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvDSTaiKham.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvDSTaiKham.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSTaiKham.Location = new System.Drawing.Point(48, 707);
            this.dgvDSTaiKham.Name = "dgvDSTaiKham";
            this.dgvDSTaiKham.RowHeadersVisible = false;
            this.dgvDSTaiKham.RowHeadersWidth = 51;
            this.dgvDSTaiKham.RowTemplate.Height = 24;
            this.dgvDSTaiKham.Size = new System.Drawing.Size(1291, 318);
            this.dgvDSTaiKham.TabIndex = 154;
            this.dgvDSTaiKham.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSTaiKham.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvDSTaiKham.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvDSTaiKham.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvDSTaiKham.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvDSTaiKham.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSTaiKham.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSTaiKham.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvDSTaiKham.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvDSTaiKham.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvDSTaiKham.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvDSTaiKham.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvDSTaiKham.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvDSTaiKham.ThemeStyle.ReadOnly = false;
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.Height = 24;
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSTaiKham.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvDSTaiKham.Click += new System.EventHandler(this.dgvDSTaiKham_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(493, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(262, 38);
            this.label2.TabIndex = 153;
            this.label2.Text = "Quản lý tái khám";
            // 
            // txtKQ
            // 
            this.txtKQ.BorderColor = System.Drawing.Color.Black;
            this.txtKQ.BorderRadius = 3;
            this.txtKQ.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtKQ.DefaultText = "";
            this.txtKQ.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtKQ.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtKQ.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtKQ.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtKQ.Enabled = false;
            this.txtKQ.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtKQ.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtKQ.ForeColor = System.Drawing.Color.Black;
            this.txtKQ.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtKQ.Location = new System.Drawing.Point(663, 370);
            this.txtKQ.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtKQ.Multiline = true;
            this.txtKQ.Name = "txtKQ";
            this.txtKQ.PasswordChar = '\0';
            this.txtKQ.PlaceholderText = "";
            this.txtKQ.SelectedText = "";
            this.txtKQ.Size = new System.Drawing.Size(402, 90);
            this.txtKQ.TabIndex = 152;
            this.txtKQ.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtKQ_KeyPress);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(661, 344);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(73, 20);
            this.label1.TabIndex = 148;
            this.label1.Text = "Kết quả";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(215, 108);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(116, 20);
            this.label4.TabIndex = 151;
            this.label4.Text = "Mã cuộc hẹn";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(657, 114);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(98, 20);
            this.label3.TabIndex = 150;
            this.label3.Text = "Bệnh nhân";
            // 
            // label38
            // 
            this.label38.AutoSize = true;
            this.label38.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label38.Location = new System.Drawing.Point(54, 647);
            this.label38.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label38.Name = "label38";
            this.label38.Size = new System.Drawing.Size(103, 20);
            this.label38.TabIndex = 149;
            this.label38.Text = "Chọn ngày:";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(215, 426);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(103, 20);
            this.label7.TabIndex = 147;
            this.label7.Text = "Sổ bệnh án";
            // 
            // label39
            // 
            this.label39.AutoSize = true;
            this.label39.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label39.Location = new System.Drawing.Point(215, 342);
            this.label39.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label39.Name = "label39";
            this.label39.Size = new System.Drawing.Size(177, 20);
            this.label39.TabIndex = 146;
            this.label39.Text = "Nhân viên phụ trách";
            // 
            // txtMaCH
            // 
            this.txtMaCH.BorderColor = System.Drawing.Color.Black;
            this.txtMaCH.BorderRadius = 3;
            this.txtMaCH.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaCH.DefaultText = "";
            this.txtMaCH.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaCH.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaCH.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaCH.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaCH.Enabled = false;
            this.txtMaCH.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaCH.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMaCH.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaCH.Location = new System.Drawing.Point(219, 139);
            this.txtMaCH.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtMaCH.Name = "txtMaCH";
            this.txtMaCH.PasswordChar = '\0';
            this.txtMaCH.PlaceholderText = "";
            this.txtMaCH.ReadOnly = true;
            this.txtMaCH.SelectedText = "";
            this.txtMaCH.Size = new System.Drawing.Size(400, 34);
            this.txtMaCH.TabIndex = 145;
            // 
            // txtBN
            // 
            this.txtBN.BorderColor = System.Drawing.Color.Black;
            this.txtBN.BorderRadius = 3;
            this.txtBN.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtBN.DefaultText = "";
            this.txtBN.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtBN.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtBN.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtBN.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtBN.Enabled = false;
            this.txtBN.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBN.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtBN.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBN.Location = new System.Drawing.Point(661, 139);
            this.txtBN.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtBN.Name = "txtBN";
            this.txtBN.PasswordChar = '\0';
            this.txtBN.PlaceholderText = "";
            this.txtBN.ReadOnly = true;
            this.txtBN.SelectedText = "";
            this.txtBN.Size = new System.Drawing.Size(400, 34);
            this.txtBN.TabIndex = 144;
            // 
            // dtpNgayTaiKham
            // 
            this.dtpNgayTaiKham.BackColor = System.Drawing.SystemColors.Control;
            this.dtpNgayTaiKham.BorderRadius = 3;
            this.dtpNgayTaiKham.BorderThickness = 1;
            this.dtpNgayTaiKham.Checked = true;
            this.dtpNgayTaiKham.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayTaiKham.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayTaiKham.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayTaiKham.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgayTaiKham.Location = new System.Drawing.Point(661, 214);
            this.dtpNgayTaiKham.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgayTaiKham.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayTaiKham.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayTaiKham.Name = "dtpNgayTaiKham";
            this.dtpNgayTaiKham.Size = new System.Drawing.Size(218, 34);
            this.dtpNgayTaiKham.TabIndex = 143;
            this.dtpNgayTaiKham.Value = new System.DateTime(2024, 9, 27, 0, 0, 0, 0);
            // 
            // cboSoBA
            // 
            this.cboSoBA.BackColor = System.Drawing.Color.Transparent;
            this.cboSoBA.BorderColor = System.Drawing.Color.Black;
            this.cboSoBA.BorderRadius = 7;
            this.cboSoBA.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboSoBA.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboSoBA.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboSoBA.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboSoBA.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboSoBA.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboSoBA.ItemHeight = 30;
            this.cboSoBA.Location = new System.Drawing.Point(219, 451);
            this.cboSoBA.Margin = new System.Windows.Forms.Padding(4);
            this.cboSoBA.Name = "cboSoBA";
            this.cboSoBA.Size = new System.Drawing.Size(400, 36);
            this.cboSoBA.TabIndex = 142;
            this.cboSoBA.SelectedIndexChanged += new System.EventHandler(this.cboSoBA_SelectedIndexChanged);
            // 
            // cboTrangThai
            // 
            this.cboTrangThai.BackColor = System.Drawing.Color.Transparent;
            this.cboTrangThai.BorderColor = System.Drawing.Color.Black;
            this.cboTrangThai.BorderRadius = 7;
            this.cboTrangThai.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboTrangThai.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboTrangThai.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboTrangThai.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboTrangThai.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboTrangThai.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboTrangThai.ItemHeight = 30;
            this.cboTrangThai.Items.AddRange(new object[] {
            "Chưa hoàn thành",
            "Đã hoàn thành",
            "Đã hủy"});
            this.cboTrangThai.Location = new System.Drawing.Point(663, 291);
            this.cboTrangThai.Margin = new System.Windows.Forms.Padding(4);
            this.cboTrangThai.Name = "cboTrangThai";
            this.cboTrangThai.Size = new System.Drawing.Size(400, 36);
            this.cboTrangThai.TabIndex = 141;
            this.cboTrangThai.SelectedIndexChanged += new System.EventHandler(this.cboTrangThai_SelectedIndexChanged);
            // 
            // btnThemTK
            // 
            this.btnThemTK.BorderRadius = 4;
            this.btnThemTK.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemTK.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemTK.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemTK.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemTK.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemTK.ForeColor = System.Drawing.Color.White;
            this.btnThemTK.Location = new System.Drawing.Point(219, 528);
            this.btnThemTK.Margin = new System.Windows.Forms.Padding(4);
            this.btnThemTK.Name = "btnThemTK";
            this.btnThemTK.Size = new System.Drawing.Size(157, 50);
            this.btnThemTK.TabIndex = 140;
            this.btnThemTK.Text = "Thêm";
            this.btnThemTK.Click += new System.EventHandler(this.btnThemTK_Click);
            // 
            // btnSuaTK
            // 
            this.btnSuaTK.BorderRadius = 4;
            this.btnSuaTK.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaTK.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaTK.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSuaTK.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSuaTK.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnSuaTK.ForeColor = System.Drawing.Color.White;
            this.btnSuaTK.Location = new System.Drawing.Point(442, 528);
            this.btnSuaTK.Margin = new System.Windows.Forms.Padding(4);
            this.btnSuaTK.Name = "btnSuaTK";
            this.btnSuaTK.Size = new System.Drawing.Size(157, 50);
            this.btnSuaTK.TabIndex = 139;
            this.btnSuaTK.Text = "Cập nhật";
            this.btnSuaTK.Click += new System.EventHandler(this.btnSuaTK_Click);
            // 
            // label40
            // 
            this.label40.AutoSize = true;
            this.label40.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label40.Location = new System.Drawing.Point(657, 262);
            this.label40.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label40.Name = "label40";
            this.label40.Size = new System.Drawing.Size(94, 20);
            this.label40.TabIndex = 138;
            this.label40.Text = "Trạng thái";
            // 
            // label41
            // 
            this.label41.AutoSize = true;
            this.label41.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label41.Location = new System.Drawing.Point(657, 185);
            this.label41.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label41.Name = "label41";
            this.label41.Size = new System.Drawing.Size(128, 20);
            this.label41.TabIndex = 137;
            this.label41.Text = "Ngày tái khám";
            // 
            // frmTaiKham
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1395, 1049);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.cboMaNV);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btnLamMoi);
            this.Controls.Add(this.cboChonKhoa);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.cboPhong);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.dtpTGCa);
            this.Controls.Add(this.dtpChonNgay);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.bntThoat);
            this.Controls.Add(this.dgvDSTaiKham);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.txtKQ);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label38);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label39);
            this.Controls.Add(this.txtMaCH);
            this.Controls.Add(this.txtBN);
            this.Controls.Add(this.dtpNgayTaiKham);
            this.Controls.Add(this.cboSoBA);
            this.Controls.Add(this.cboTrangThai);
            this.Controls.Add(this.btnThemTK);
            this.Controls.Add(this.btnSuaTK);
            this.Controls.Add(this.label40);
            this.Controls.Add(this.label41);
            this.Name = "frmTaiKham";
            this.Text = "Tái Khám";
            this.Load += new System.EventHandler(this.frmTaiKham_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSTaiKham)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label6;
        private Guna.UI2.WinForms.Guna2ComboBox cboMaNV;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton radCuocHen;
        private System.Windows.Forms.RadioButton radLichSu;
        private Guna.UI2.WinForms.Guna2Button btnLamMoi;
        private Guna.UI2.WinForms.Guna2ComboBox cboChonKhoa;
        private System.Windows.Forms.Label label5;
        private Guna.UI2.WinForms.Guna2ComboBox cboPhong;
        private System.Windows.Forms.Label label9;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpTGCa;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpChonNgay;
        private Guna.UI2.WinForms.Guna2Button btnTimKiem;
        private Guna.UI2.WinForms.Guna2TextBox txtTimKiem;
        private Guna.UI2.WinForms.Guna2Button bntThoat;
        private Guna.UI2.WinForms.Guna2DataGridView dgvDSTaiKham;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2TextBox txtKQ;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label38;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label39;
        private Guna.UI2.WinForms.Guna2TextBox txtMaCH;
        private Guna.UI2.WinForms.Guna2TextBox txtBN;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayTaiKham;
        private Guna.UI2.WinForms.Guna2ComboBox cboSoBA;
        private Guna.UI2.WinForms.Guna2ComboBox cboTrangThai;
        private Guna.UI2.WinForms.Guna2Button btnThemTK;
        private Guna.UI2.WinForms.Guna2Button btnSuaTK;
        private System.Windows.Forms.Label label40;
        private System.Windows.Forms.Label label41;
    }
}