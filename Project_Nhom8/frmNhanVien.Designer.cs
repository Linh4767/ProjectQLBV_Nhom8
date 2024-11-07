namespace Project_Nhom8
{
    partial class frmNhanVien
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
            this.label35 = new System.Windows.Forms.Label();
            this.label36 = new System.Windows.Forms.Label();
            this.label24 = new System.Windows.Forms.Label();
            this.label23 = new System.Windows.Forms.Label();
            this.radNu = new System.Windows.Forms.RadioButton();
            this.radNam = new System.Windows.Forms.RadioButton();
            this.cboChuyenNganh = new Guna.UI2.WinForms.Guna2ComboBox();
            this.dtpNgaySinh = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.cboCV = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label17 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.txtHoTenNV = new Guna.UI2.WinForms.Guna2TextBox();
            this.txtMaNV = new Guna.UI2.WinForms.Guna2TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnCapNhat = new Guna.UI2.WinForms.Guna2Button();
            this.btnThem = new Guna.UI2.WinForms.Guna2Button();
            this.btnXoa = new Guna.UI2.WinForms.Guna2Button();
            this.btnLamMoi = new Guna.UI2.WinForms.Guna2Button();
            this.btnTimKiem = new Guna.UI2.WinForms.Guna2Button();
            this.txtTimKiem = new Guna.UI2.WinForms.Guna2TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.txtSDT = new Guna.UI2.WinForms.Guna2TextBox();
            this.dgvNhanVien = new Guna.UI2.WinForms.Guna2DataGridView();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvNhanVien)).BeginInit();
            this.SuspendLayout();
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label35.Location = new System.Drawing.Point(49, 470);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(80, 20);
            this.label35.TabIndex = 99;
            this.label35.Text = "Chức Vụ";
            // 
            // label36
            // 
            this.label36.AutoSize = true;
            this.label36.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label36.Location = new System.Drawing.Point(47, 550);
            this.label36.Name = "label36";
            this.label36.Size = new System.Drawing.Size(130, 20);
            this.label36.TabIndex = 100;
            this.label36.Text = "Chuyên Ngành";
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label24.Location = new System.Drawing.Point(280, 291);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(94, 20);
            this.label24.TabIndex = 102;
            this.label24.Text = "Ngày Sinh";
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label23.Location = new System.Drawing.Point(49, 291);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(85, 20);
            this.label23.TabIndex = 103;
            this.label23.Text = "Giới Tính";
            // 
            // radNu
            // 
            this.radNu.AutoSize = true;
            this.radNu.BackColor = System.Drawing.Color.Transparent;
            this.radNu.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radNu.Location = new System.Drawing.Point(156, 338);
            this.radNu.Margin = new System.Windows.Forms.Padding(4);
            this.radNu.Name = "radNu";
            this.radNu.Size = new System.Drawing.Size(53, 24);
            this.radNu.TabIndex = 94;
            this.radNu.Text = "Nữ";
            this.radNu.UseVisualStyleBackColor = false;
            // 
            // radNam
            // 
            this.radNam.AutoSize = true;
            this.radNam.BackColor = System.Drawing.Color.Transparent;
            this.radNam.Checked = true;
            this.radNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radNam.Location = new System.Drawing.Point(50, 338);
            this.radNam.Margin = new System.Windows.Forms.Padding(4);
            this.radNam.Name = "radNam";
            this.radNam.Size = new System.Drawing.Size(68, 24);
            this.radNam.TabIndex = 93;
            this.radNam.TabStop = true;
            this.radNam.Text = "Nam";
            this.radNam.UseVisualStyleBackColor = false;
            // 
            // cboChuyenNganh
            // 
            this.cboChuyenNganh.BackColor = System.Drawing.Color.Transparent;
            this.cboChuyenNganh.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.cboChuyenNganh.BorderRadius = 3;
            this.cboChuyenNganh.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboChuyenNganh.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboChuyenNganh.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboChuyenNganh.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboChuyenNganh.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.cboChuyenNganh.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboChuyenNganh.ItemHeight = 30;
            this.cboChuyenNganh.Location = new System.Drawing.Point(199, 541);
            this.cboChuyenNganh.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.cboChuyenNganh.Name = "cboChuyenNganh";
            this.cboChuyenNganh.Size = new System.Drawing.Size(470, 36);
            this.cboChuyenNganh.TabIndex = 92;
            this.cboChuyenNganh.SelectedIndexChanged += new System.EventHandler(this.cboChuyenNganh_SelectedIndexChanged);
            // 
            // dtpNgaySinh
            // 
            this.dtpNgaySinh.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.dtpNgaySinh.BorderRadius = 5;
            this.dtpNgaySinh.BorderThickness = 1;
            this.dtpNgaySinh.Checked = true;
            this.dtpNgaySinh.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgaySinh.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.dtpNgaySinh.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgaySinh.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgaySinh.Location = new System.Drawing.Point(282, 331);
            this.dtpNgaySinh.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.dtpNgaySinh.MaxDate = new System.DateTime(2080, 2, 1, 0, 0, 0, 0);
            this.dtpNgaySinh.MinDate = new System.DateTime(1950, 12, 31, 0, 0, 0, 0);
            this.dtpNgaySinh.Name = "dtpNgaySinh";
            this.dtpNgaySinh.Size = new System.Drawing.Size(387, 36);
            this.dtpNgaySinh.TabIndex = 90;
            this.dtpNgaySinh.Value = new System.DateTime(2024, 10, 21, 0, 0, 0, 0);
            // 
            // cboCV
            // 
            this.cboCV.BackColor = System.Drawing.Color.Transparent;
            this.cboCV.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.cboCV.BorderRadius = 3;
            this.cboCV.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboCV.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCV.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboCV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboCV.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.cboCV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboCV.ItemHeight = 30;
            this.cboCV.Items.AddRange(new object[] {
            "Bác Sĩ"});
            this.cboCV.Location = new System.Drawing.Point(199, 470);
            this.cboCV.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.cboCV.Name = "cboCV";
            this.cboCV.Size = new System.Drawing.Size(470, 36);
            this.cboCV.TabIndex = 89;
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(46, 199);
            this.label17.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(162, 20);
            this.label17.TabIndex = 107;
            this.label17.Text = "Họ Tên Nhân Viên";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(46, 102);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(126, 20);
            this.label16.TabIndex = 106;
            this.label16.Text = "Mã Nhân Viên";
            // 
            // txtHoTenNV
            // 
            this.txtHoTenNV.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtHoTenNV.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.txtHoTenNV.BorderRadius = 3;
            this.txtHoTenNV.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtHoTenNV.DefaultText = "";
            this.txtHoTenNV.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtHoTenNV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtHoTenNV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtHoTenNV.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtHoTenNV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtHoTenNV.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.txtHoTenNV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.txtHoTenNV.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtHoTenNV.Location = new System.Drawing.Point(48, 237);
            this.txtHoTenNV.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtHoTenNV.Name = "txtHoTenNV";
            this.txtHoTenNV.PasswordChar = '\0';
            this.txtHoTenNV.PlaceholderForeColor = System.Drawing.Color.Gray;
            this.txtHoTenNV.PlaceholderText = "";
            this.txtHoTenNV.SelectedText = "";
            this.txtHoTenNV.Size = new System.Drawing.Size(621, 33);
            this.txtHoTenNV.TabIndex = 105;
            this.txtHoTenNV.TextChanged += new System.EventHandler(this.txtHoTenNV_TextChanged);
            this.txtHoTenNV.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtHoTenNV_KeyPress);
            // 
            // txtMaNV
            // 
            this.txtMaNV.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtMaNV.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.txtMaNV.BorderRadius = 3;
            this.txtMaNV.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaNV.DefaultText = "";
            this.txtMaNV.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaNV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaNV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaNV.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaNV.Enabled = false;
            this.txtMaNV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaNV.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.txtMaNV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.txtMaNV.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaNV.Location = new System.Drawing.Point(48, 139);
            this.txtMaNV.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtMaNV.Name = "txtMaNV";
            this.txtMaNV.PasswordChar = '\0';
            this.txtMaNV.PlaceholderForeColor = System.Drawing.Color.Gray;
            this.txtMaNV.PlaceholderText = "";
            this.txtMaNV.SelectedText = "";
            this.txtMaNV.Size = new System.Drawing.Size(621, 33);
            this.txtMaNV.TabIndex = 104;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(636, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(293, 36);
            this.label1.TabIndex = 109;
            this.label1.Text = "Quản Lý Nhân Viên";
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.Color.Transparent;
            this.groupBox3.Controls.Add(this.btnCapNhat);
            this.groupBox3.Controls.Add(this.btnThem);
            this.groupBox3.Controls.Add(this.btnXoa);
            this.groupBox3.Controls.Add(this.btnLamMoi);
            this.groupBox3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox3.Location = new System.Drawing.Point(140, 609);
            this.groupBox3.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox3.Size = new System.Drawing.Size(478, 154);
            this.groupBox3.TabIndex = 110;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Thanh Công Cụ";
            // 
            // btnCapNhat
            // 
            this.btnCapNhat.BackColor = System.Drawing.Color.Transparent;
            this.btnCapNhat.BorderRadius = 5;
            this.btnCapNhat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnCapNhat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnCapNhat.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnCapNhat.ForeColor = System.Drawing.Color.White;
            this.btnCapNhat.Location = new System.Drawing.Point(51, 99);
            this.btnCapNhat.Margin = new System.Windows.Forms.Padding(4);
            this.btnCapNhat.Name = "btnCapNhat";
            this.btnCapNhat.Size = new System.Drawing.Size(147, 47);
            this.btnCapNhat.TabIndex = 43;
            this.btnCapNhat.Text = "Cập Nhật";
            this.btnCapNhat.Click += new System.EventHandler(this.btnCapNhat_Click);
            // 
            // btnThem
            // 
            this.btnThem.BackColor = System.Drawing.Color.Transparent;
            this.btnThem.BorderRadius = 5;
            this.btnThem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThem.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnThem.ForeColor = System.Drawing.Color.White;
            this.btnThem.Location = new System.Drawing.Point(51, 32);
            this.btnThem.Margin = new System.Windows.Forms.Padding(4);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(147, 47);
            this.btnThem.TabIndex = 40;
            this.btnThem.Text = "Thêm";
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.BackColor = System.Drawing.Color.Transparent;
            this.btnXoa.BorderRadius = 5;
            this.btnXoa.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXoa.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXoa.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXoa.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXoa.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnXoa.ForeColor = System.Drawing.Color.White;
            this.btnXoa.Location = new System.Drawing.Point(299, 32);
            this.btnXoa.Margin = new System.Windows.Forms.Padding(4);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(147, 47);
            this.btnXoa.TabIndex = 41;
            this.btnXoa.Text = "Xóa";
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.BackColor = System.Drawing.Color.Transparent;
            this.btnLamMoi.BorderRadius = 5;
            this.btnLamMoi.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnLamMoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnLamMoi.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnLamMoi.ForeColor = System.Drawing.Color.White;
            this.btnLamMoi.Location = new System.Drawing.Point(299, 99);
            this.btnLamMoi.Margin = new System.Windows.Forms.Padding(4);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(147, 47);
            this.btnLamMoi.TabIndex = 42;
            this.btnLamMoi.Text = "Làm Mới";
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.BackColor = System.Drawing.Color.Transparent;
            this.btnTimKiem.BorderRadius = 3;
            this.btnTimKiem.BorderThickness = 1;
            this.btnTimKiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTimKiem.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnTimKiem.ForeColor = System.Drawing.Color.White;
            this.btnTimKiem.Location = new System.Drawing.Point(1244, 139);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(136, 36);
            this.btnTimKiem.TabIndex = 111;
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
            this.txtTimKiem.Location = new System.Drawing.Point(891, 139);
            this.txtTimKiem.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.PasswordChar = '\0';
            this.txtTimKiem.PlaceholderForeColor = System.Drawing.Color.Gray;
            this.txtTimKiem.PlaceholderText = "";
            this.txtTimKiem.SelectedText = "";
            this.txtTimKiem.Size = new System.Drawing.Size(332, 36);
            this.txtTimKiem.TabIndex = 112;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(49, 402);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(45, 20);
            this.label2.TabIndex = 113;
            this.label2.Text = "SĐT";
            // 
            // txtSDT
            // 
            this.txtSDT.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.txtSDT.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.txtSDT.BorderRadius = 3;
            this.txtSDT.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtSDT.DefaultText = "";
            this.txtSDT.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtSDT.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtSDT.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtSDT.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtSDT.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtSDT.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold);
            this.txtSDT.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.txtSDT.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtSDT.Location = new System.Drawing.Point(199, 402);
            this.txtSDT.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtSDT.Name = "txtSDT";
            this.txtSDT.PasswordChar = '\0';
            this.txtSDT.PlaceholderForeColor = System.Drawing.Color.Gray;
            this.txtSDT.PlaceholderText = "";
            this.txtSDT.SelectedText = "";
            this.txtSDT.Size = new System.Drawing.Size(470, 33);
            this.txtSDT.TabIndex = 114;
            this.txtSDT.TextChanged += new System.EventHandler(this.txtSDT_TextChanged);
            this.txtSDT.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSDT_KeyPress);
            this.txtSDT.Leave += new System.EventHandler(this.txtSDT_Leave);
            // 
            // dgvNhanVien
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvNhanVien.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvNhanVien.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvNhanVien.ColumnHeadersHeight = 4;
            this.dgvNhanVien.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvNhanVien.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvNhanVien.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvNhanVien.Location = new System.Drawing.Point(710, 199);
            this.dgvNhanVien.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvNhanVien.Name = "dgvNhanVien";
            this.dgvNhanVien.RowHeadersVisible = false;
            this.dgvNhanVien.RowHeadersWidth = 62;
            this.dgvNhanVien.RowTemplate.Height = 28;
            this.dgvNhanVien.Size = new System.Drawing.Size(669, 510);
            this.dgvNhanVien.TabIndex = 115;
            this.dgvNhanVien.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvNhanVien.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvNhanVien.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvNhanVien.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvNhanVien.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvNhanVien.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvNhanVien.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvNhanVien.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvNhanVien.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvNhanVien.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvNhanVien.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvNhanVien.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvNhanVien.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvNhanVien.ThemeStyle.ReadOnly = false;
            this.dgvNhanVien.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvNhanVien.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvNhanVien.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvNhanVien.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvNhanVien.ThemeStyle.RowsStyle.Height = 28;
            this.dgvNhanVien.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvNhanVien.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvNhanVien.Click += new System.EventHandler(this.dgvNhanVien_Click);
            // 
            // btnThoat
            // 
            this.btnThoat.BackColor = System.Drawing.Color.Transparent;
            this.btnThoat.BorderRadius = 5;
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(1244, 716);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(147, 47);
            this.btnThoat.TabIndex = 116;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // frmNhanVien
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1492, 774);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.dgvNhanVien);
            this.Controls.Add(this.txtSDT);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label17);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.txtHoTenNV);
            this.Controls.Add(this.txtMaNV);
            this.Controls.Add(this.label35);
            this.Controls.Add(this.label36);
            this.Controls.Add(this.label24);
            this.Controls.Add(this.label23);
            this.Controls.Add(this.radNu);
            this.Controls.Add(this.radNam);
            this.Controls.Add(this.cboChuyenNganh);
            this.Controls.Add(this.dtpNgaySinh);
            this.Controls.Add(this.cboCV);
            this.Name = "frmNhanVien";
            this.Text = "Nhân Viên";
            this.Load += new System.EventHandler(this.frmNhanVien_Load);
            this.groupBox3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvNhanVien)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label35;
        private System.Windows.Forms.Label label36;
        private System.Windows.Forms.Label label24;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.RadioButton radNu;
        private System.Windows.Forms.RadioButton radNam;
        private Guna.UI2.WinForms.Guna2ComboBox cboChuyenNganh;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgaySinh;
        private Guna.UI2.WinForms.Guna2ComboBox cboCV;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.Label label16;
        private Guna.UI2.WinForms.Guna2TextBox txtHoTenNV;
        private Guna.UI2.WinForms.Guna2TextBox txtMaNV;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox3;
        private Guna.UI2.WinForms.Guna2Button btnCapNhat;
        private Guna.UI2.WinForms.Guna2Button btnThem;
        private Guna.UI2.WinForms.Guna2Button btnXoa;
        private Guna.UI2.WinForms.Guna2Button btnLamMoi;
        private Guna.UI2.WinForms.Guna2Button btnTimKiem;
        private Guna.UI2.WinForms.Guna2TextBox txtTimKiem;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2TextBox txtSDT;
        private Guna.UI2.WinForms.Guna2DataGridView dgvNhanVien;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
    }
}