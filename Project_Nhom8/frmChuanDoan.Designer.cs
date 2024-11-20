namespace Project_Nhom8
{
    partial class frmChuanDoan
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
            this.btnTimKiem = new Guna.UI2.WinForms.Guna2Button();
            this.txtTK = new Guna.UI2.WinForms.Guna2TextBox();
            this.dtpNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label3 = new System.Windows.Forms.Label();
            this.txtBN = new Guna.UI2.WinForms.Guna2TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.dtpTGCD = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.dgvDSChuanDoan = new Guna.UI2.WinForms.Guna2DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.cboNVCD = new Guna.UI2.WinForms.Guna2ComboBox();
            this.btnThemChuanDoan = new Guna.UI2.WinForms.Guna2Button();
            this.txtChuanDoan = new Guna.UI2.WinForms.Guna2TextBox();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.dtpNgayChuanDoan = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label24 = new System.Windows.Forms.Label();
            this.txtPhieuKhamBenh = new Guna.UI2.WinForms.Guna2TextBox();
            this.btnLamMoi = new Guna.UI2.WinForms.Guna2Button();
            this.btnSuDungDV = new Guna.UI2.WinForms.Guna2Button();
            this.btnDonThuoc = new Guna.UI2.WinForms.Guna2Button();
            this.label22 = new System.Windows.Forms.Label();
            this.txtTC = new Guna.UI2.WinForms.Guna2TextBox();
            this.label43 = new System.Windows.Forms.Label();
            this.label25 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnCapNhapChuanDoan = new Guna.UI2.WinForms.Guna2Button();
            this.label30 = new System.Windows.Forms.Label();
            this.btnDatLich = new Guna.UI2.WinForms.Guna2Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSChuanDoan)).BeginInit();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnTimKiem
            // 
            this.btnTimKiem.BorderRadius = 5;
            this.btnTimKiem.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTimKiem.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTimKiem.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTimKiem.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimKiem.ForeColor = System.Drawing.Color.White;
            this.btnTimKiem.Location = new System.Drawing.Point(324, 524);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(139, 31);
            this.btnTimKiem.TabIndex = 132;
            this.btnTimKiem.Text = "Tìm kiếm";
            this.btnTimKiem.Click += new System.EventHandler(this.btnTimKiem_Click);
            // 
            // txtTK
            // 
            this.txtTK.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTK.DefaultText = "";
            this.txtTK.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTK.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTK.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTK.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTK.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTK.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtTK.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTK.Location = new System.Drawing.Point(60, 524);
            this.txtTK.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.txtTK.Name = "txtTK";
            this.txtTK.PasswordChar = '\0';
            this.txtTK.PlaceholderText = "Nhập từ khóa";
            this.txtTK.SelectedText = "";
            this.txtTK.Size = new System.Drawing.Size(254, 31);
            this.txtTK.TabIndex = 131;
            this.txtTK.TextChanged += new System.EventHandler(this.txtTK_TextChanged);
            // 
            // dtpNgay
            // 
            this.dtpNgay.BorderRadius = 3;
            this.dtpNgay.BorderThickness = 1;
            this.dtpNgay.Checked = true;
            this.dtpNgay.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgay.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgay.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgay.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgay.Location = new System.Drawing.Point(1159, 524);
            this.dtpNgay.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dtpNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgay.Name = "dtpNgay";
            this.dtpNgay.Size = new System.Drawing.Size(250, 34);
            this.dtpNgay.TabIndex = 130;
            this.dtpNgay.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            this.dtpNgay.ValueChanged += new System.EventHandler(this.dtpNgay_ValueChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(1098, 535);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(51, 20);
            this.label3.TabIndex = 129;
            this.label3.Text = "Ngày";
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
            this.txtBN.ForeColor = System.Drawing.Color.Black;
            this.txtBN.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBN.Location = new System.Drawing.Point(787, 375);
            this.txtBN.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtBN.Name = "txtBN";
            this.txtBN.PasswordChar = '\0';
            this.txtBN.PlaceholderText = "";
            this.txtBN.ReadOnly = true;
            this.txtBN.SelectedText = "";
            this.txtBN.Size = new System.Drawing.Size(405, 30);
            this.txtBN.TabIndex = 128;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(784, 340);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(98, 20);
            this.label2.TabIndex = 127;
            this.label2.Text = "Bệnh nhân";
            // 
            // dtpTGCD
            // 
            this.dtpTGCD.BorderRadius = 3;
            this.dtpTGCD.BorderThickness = 1;
            this.dtpTGCD.Checked = true;
            this.dtpTGCD.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpTGCD.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpTGCD.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpTGCD.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpTGCD.Location = new System.Drawing.Point(569, 375);
            this.dtpTGCD.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dtpTGCD.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpTGCD.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpTGCD.Name = "dtpTGCD";
            this.dtpTGCD.Size = new System.Drawing.Size(158, 34);
            this.dtpTGCD.TabIndex = 126;
            this.dtpTGCD.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // dgvDSChuanDoan
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvDSChuanDoan.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvDSChuanDoan.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDSChuanDoan.ColumnHeadersHeight = 4;
            this.dgvDSChuanDoan.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvDSChuanDoan.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvDSChuanDoan.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSChuanDoan.Location = new System.Drawing.Point(58, 564);
            this.dgvDSChuanDoan.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvDSChuanDoan.Name = "dgvDSChuanDoan";
            this.dgvDSChuanDoan.RowHeadersVisible = false;
            this.dgvDSChuanDoan.RowHeadersWidth = 62;
            this.dgvDSChuanDoan.RowTemplate.Height = 28;
            this.dgvDSChuanDoan.Size = new System.Drawing.Size(1377, 223);
            this.dgvDSChuanDoan.TabIndex = 125;
            this.dgvDSChuanDoan.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSChuanDoan.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvDSChuanDoan.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvDSChuanDoan.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvDSChuanDoan.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvDSChuanDoan.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSChuanDoan.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSChuanDoan.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvDSChuanDoan.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvDSChuanDoan.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvDSChuanDoan.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvDSChuanDoan.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvDSChuanDoan.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvDSChuanDoan.ThemeStyle.ReadOnly = false;
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.Height = 28;
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSChuanDoan.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvDSChuanDoan.Click += new System.EventHandler(this.dgvDSChuanDoan_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(626, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(300, 36);
            this.label1.TabIndex = 124;
            this.label1.Text = "Quản lý chuẩn đoán";
            // 
            // cboNVCD
            // 
            this.cboNVCD.BackColor = System.Drawing.Color.Transparent;
            this.cboNVCD.BorderColor = System.Drawing.Color.Black;
            this.cboNVCD.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboNVCD.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNVCD.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNVCD.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNVCD.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboNVCD.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboNVCD.ItemHeight = 30;
            this.cboNVCD.Location = new System.Drawing.Point(322, 133);
            this.cboNVCD.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cboNVCD.Name = "cboNVCD";
            this.cboNVCD.Size = new System.Drawing.Size(406, 36);
            this.cboNVCD.TabIndex = 123;
            // 
            // btnThemChuanDoan
            // 
            this.btnThemChuanDoan.BorderRadius = 5;
            this.btnThemChuanDoan.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemChuanDoan.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemChuanDoan.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemChuanDoan.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemChuanDoan.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemChuanDoan.ForeColor = System.Drawing.Color.White;
            this.btnThemChuanDoan.Location = new System.Drawing.Point(28, 30);
            this.btnThemChuanDoan.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnThemChuanDoan.Name = "btnThemChuanDoan";
            this.btnThemChuanDoan.Size = new System.Drawing.Size(139, 53);
            this.btnThemChuanDoan.TabIndex = 0;
            this.btnThemChuanDoan.Text = "Thêm";
            this.btnThemChuanDoan.Click += new System.EventHandler(this.btnThemChuanDoan_Click);
            // 
            // txtChuanDoan
            // 
            this.txtChuanDoan.BorderColor = System.Drawing.Color.Black;
            this.txtChuanDoan.BorderRadius = 3;
            this.txtChuanDoan.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtChuanDoan.DefaultText = "";
            this.txtChuanDoan.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtChuanDoan.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtChuanDoan.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtChuanDoan.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtChuanDoan.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtChuanDoan.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtChuanDoan.ForeColor = System.Drawing.Color.Black;
            this.txtChuanDoan.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtChuanDoan.Location = new System.Drawing.Point(787, 210);
            this.txtChuanDoan.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtChuanDoan.Multiline = true;
            this.txtChuanDoan.Name = "txtChuanDoan";
            this.txtChuanDoan.PasswordChar = '\0';
            this.txtChuanDoan.PlaceholderText = "";
            this.txtChuanDoan.SelectedText = "";
            this.txtChuanDoan.Size = new System.Drawing.Size(408, 116);
            this.txtChuanDoan.TabIndex = 122;
            this.txtChuanDoan.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtChuanDoan_KeyPress);
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
            this.btnThoat.Location = new System.Drawing.Point(1130, 30);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(139, 53);
            this.btnThoat.TabIndex = 3;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // dtpNgayChuanDoan
            // 
            this.dtpNgayChuanDoan.BorderRadius = 3;
            this.dtpNgayChuanDoan.BorderThickness = 1;
            this.dtpNgayChuanDoan.Checked = true;
            this.dtpNgayChuanDoan.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayChuanDoan.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayChuanDoan.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayChuanDoan.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgayChuanDoan.Location = new System.Drawing.Point(324, 374);
            this.dtpNgayChuanDoan.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.dtpNgayChuanDoan.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayChuanDoan.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayChuanDoan.Name = "dtpNgayChuanDoan";
            this.dtpNgayChuanDoan.Size = new System.Drawing.Size(228, 34);
            this.dtpNgayChuanDoan.TabIndex = 119;
            this.dtpNgayChuanDoan.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label24
            // 
            this.label24.AutoSize = true;
            this.label24.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label24.Location = new System.Drawing.Point(320, 340);
            this.label24.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label24.Name = "label24";
            this.label24.Size = new System.Drawing.Size(153, 20);
            this.label24.TabIndex = 118;
            this.label24.Text = "Ngày chuẩn đoán";
            // 
            // txtPhieuKhamBenh
            // 
            this.txtPhieuKhamBenh.BorderColor = System.Drawing.Color.Black;
            this.txtPhieuKhamBenh.BorderRadius = 3;
            this.txtPhieuKhamBenh.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtPhieuKhamBenh.DefaultText = "";
            this.txtPhieuKhamBenh.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtPhieuKhamBenh.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtPhieuKhamBenh.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtPhieuKhamBenh.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtPhieuKhamBenh.Enabled = false;
            this.txtPhieuKhamBenh.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtPhieuKhamBenh.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtPhieuKhamBenh.ForeColor = System.Drawing.Color.Black;
            this.txtPhieuKhamBenh.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtPhieuKhamBenh.Location = new System.Drawing.Point(787, 133);
            this.txtPhieuKhamBenh.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtPhieuKhamBenh.Name = "txtPhieuKhamBenh";
            this.txtPhieuKhamBenh.PasswordChar = '\0';
            this.txtPhieuKhamBenh.PlaceholderText = "";
            this.txtPhieuKhamBenh.ReadOnly = true;
            this.txtPhieuKhamBenh.SelectedText = "";
            this.txtPhieuKhamBenh.Size = new System.Drawing.Size(405, 30);
            this.txtPhieuKhamBenh.TabIndex = 117;
            this.txtPhieuKhamBenh.TextChanged += new System.EventHandler(this.txtPhieuKhamBenh_TextChanged);
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.BorderRadius = 5;
            this.btnLamMoi.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnLamMoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnLamMoi.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLamMoi.ForeColor = System.Drawing.Color.White;
            this.btnLamMoi.Location = new System.Drawing.Point(402, 30);
            this.btnLamMoi.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(139, 53);
            this.btnLamMoi.TabIndex = 108;
            this.btnLamMoi.Text = "Làm mới";
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // btnSuDungDV
            // 
            this.btnSuDungDV.BorderRadius = 5;
            this.btnSuDungDV.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSuDungDV.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSuDungDV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSuDungDV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSuDungDV.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnSuDungDV.ForeColor = System.Drawing.Color.White;
            this.btnSuDungDV.Location = new System.Drawing.Point(583, 30);
            this.btnSuDungDV.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnSuDungDV.Name = "btnSuDungDV";
            this.btnSuDungDV.Size = new System.Drawing.Size(139, 53);
            this.btnSuDungDV.TabIndex = 106;
            this.btnSuDungDV.Text = "Sử dụng dịch vụ";
            this.btnSuDungDV.Click += new System.EventHandler(this.btnSuDungDV_Click);
            // 
            // btnDonThuoc
            // 
            this.btnDonThuoc.BorderRadius = 5;
            this.btnDonThuoc.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDonThuoc.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDonThuoc.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDonThuoc.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDonThuoc.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnDonThuoc.ForeColor = System.Drawing.Color.White;
            this.btnDonThuoc.Location = new System.Drawing.Point(761, 30);
            this.btnDonThuoc.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnDonThuoc.Name = "btnDonThuoc";
            this.btnDonThuoc.Size = new System.Drawing.Size(139, 53);
            this.btnDonThuoc.TabIndex = 4;
            this.btnDonThuoc.Text = "Đơn thuốc";
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label22.Location = new System.Drawing.Point(784, 184);
            this.label22.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(108, 20);
            this.label22.TabIndex = 121;
            this.label22.Text = "Chuẩn đoán";
            // 
            // txtTC
            // 
            this.txtTC.BorderColor = System.Drawing.Color.Black;
            this.txtTC.BorderRadius = 3;
            this.txtTC.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTC.DefaultText = "";
            this.txtTC.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTC.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTC.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTC.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTC.Enabled = false;
            this.txtTC.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTC.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtTC.ForeColor = System.Drawing.Color.Black;
            this.txtTC.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTC.Location = new System.Drawing.Point(322, 213);
            this.txtTC.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtTC.Multiline = true;
            this.txtTC.Name = "txtTC";
            this.txtTC.PasswordChar = '\0';
            this.txtTC.PlaceholderText = "";
            this.txtTC.ReadOnly = true;
            this.txtTC.SelectedText = "";
            this.txtTC.Size = new System.Drawing.Size(405, 114);
            this.txtTC.TabIndex = 116;
            // 
            // label43
            // 
            this.label43.AutoSize = true;
            this.label43.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label43.Location = new System.Drawing.Point(784, 101);
            this.label43.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label43.Name = "label43";
            this.label43.Size = new System.Drawing.Size(152, 20);
            this.label43.TabIndex = 113;
            this.label43.Text = "Phiếu khám bệnh";
            // 
            // label25
            // 
            this.label25.AutoSize = true;
            this.label25.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label25.Location = new System.Drawing.Point(316, 101);
            this.label25.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label25.Name = "label25";
            this.label25.Size = new System.Drawing.Size(194, 20);
            this.label25.TabIndex = 114;
            this.label25.Text = "Nhân viên chuẩn đoán";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnDatLich);
            this.groupBox4.Controls.Add(this.btnLamMoi);
            this.groupBox4.Controls.Add(this.btnSuDungDV);
            this.groupBox4.Controls.Add(this.btnDonThuoc);
            this.groupBox4.Controls.Add(this.btnThoat);
            this.groupBox4.Controls.Add(this.btnCapNhapChuanDoan);
            this.groupBox4.Controls.Add(this.btnThemChuanDoan);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox4.Location = new System.Drawing.Point(108, 416);
            this.groupBox4.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Padding = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.groupBox4.Size = new System.Drawing.Size(1301, 94);
            this.groupBox4.TabIndex = 120;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Thanh công cụ";
            // 
            // btnCapNhapChuanDoan
            // 
            this.btnCapNhapChuanDoan.BorderRadius = 5;
            this.btnCapNhapChuanDoan.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhapChuanDoan.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhapChuanDoan.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnCapNhapChuanDoan.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnCapNhapChuanDoan.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCapNhapChuanDoan.ForeColor = System.Drawing.Color.White;
            this.btnCapNhapChuanDoan.Location = new System.Drawing.Point(213, 30);
            this.btnCapNhapChuanDoan.Margin = new System.Windows.Forms.Padding(4, 4, 4, 4);
            this.btnCapNhapChuanDoan.Name = "btnCapNhapChuanDoan";
            this.btnCapNhapChuanDoan.Size = new System.Drawing.Size(139, 53);
            this.btnCapNhapChuanDoan.TabIndex = 2;
            this.btnCapNhapChuanDoan.Text = "Cập nhật";
            this.btnCapNhapChuanDoan.Click += new System.EventHandler(this.btnCapNhapChuanDoan_Click);
            // 
            // label30
            // 
            this.label30.AutoSize = true;
            this.label30.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label30.Location = new System.Drawing.Point(316, 184);
            this.label30.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label30.Name = "label30";
            this.label30.Size = new System.Drawing.Size(108, 20);
            this.label30.TabIndex = 115;
            this.label30.Text = "Triệu chứng";
            // 
            // btnDatLich
            // 
            this.btnDatLich.BorderRadius = 5;
            this.btnDatLich.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDatLich.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDatLich.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDatLich.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDatLich.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDatLich.ForeColor = System.Drawing.Color.White;
            this.btnDatLich.Location = new System.Drawing.Point(946, 30);
            this.btnDatLich.Name = "btnDatLich";
            this.btnDatLich.Size = new System.Drawing.Size(139, 53);
            this.btnDatLich.TabIndex = 110;
            this.btnDatLich.Text = "Đặt lịch";
            this.btnDatLich.Click += new System.EventHandler(this.btnDatLich_Click);
            // 
            // frmChuanDoan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1492, 812);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.txtTK);
            this.Controls.Add(this.dtpNgay);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtBN);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dtpTGCD);
            this.Controls.Add(this.dgvDSChuanDoan);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.cboNVCD);
            this.Controls.Add(this.txtChuanDoan);
            this.Controls.Add(this.dtpNgayChuanDoan);
            this.Controls.Add(this.label24);
            this.Controls.Add(this.txtPhieuKhamBenh);
            this.Controls.Add(this.label22);
            this.Controls.Add(this.txtTC);
            this.Controls.Add(this.label43);
            this.Controls.Add(this.label25);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.label30);
            this.Name = "frmChuanDoan";
            this.Text = "Chuẩn Đoán";
            this.Load += new System.EventHandler(this.frmChuanDoan_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSChuanDoan)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2Button btnTimKiem;
        private Guna.UI2.WinForms.Guna2TextBox txtTK;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgay;
        private System.Windows.Forms.Label label3;
        private Guna.UI2.WinForms.Guna2TextBox txtBN;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpTGCD;
        private Guna.UI2.WinForms.Guna2DataGridView dgvDSChuanDoan;
        private System.Windows.Forms.Label label1;
        private Guna.UI2.WinForms.Guna2ComboBox cboNVCD;
        private Guna.UI2.WinForms.Guna2Button btnThemChuanDoan;
        private Guna.UI2.WinForms.Guna2TextBox txtChuanDoan;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayChuanDoan;
        private System.Windows.Forms.Label label24;
        private Guna.UI2.WinForms.Guna2TextBox txtPhieuKhamBenh;
        private Guna.UI2.WinForms.Guna2Button btnLamMoi;
        private Guna.UI2.WinForms.Guna2Button btnSuDungDV;
        private Guna.UI2.WinForms.Guna2Button btnDonThuoc;
        private System.Windows.Forms.Label label22;
        private Guna.UI2.WinForms.Guna2TextBox txtTC;
        private System.Windows.Forms.Label label43;
        private System.Windows.Forms.Label label25;
        private System.Windows.Forms.GroupBox groupBox4;
        private Guna.UI2.WinForms.Guna2Button btnCapNhapChuanDoan;
        private System.Windows.Forms.Label label30;
        private Guna.UI2.WinForms.Guna2Button btnDatLich;
    }
}