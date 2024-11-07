namespace Project_Nhom8
{
    partial class frmKhamBenh
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
            this.txtTrieuChung = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtMaKham = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cboKhoa = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.dgvDSKhamBenhTheoNgay = new Guna.UI2.WinForms.Guna2DataGridView();
            this.cboPhong = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label19 = new System.Windows.Forms.Label();
            this.label15 = new System.Windows.Forms.Label();
            this.btnSuaKB = new Guna.UI2.WinForms.Guna2Button();
            this.cboNVKhamBenh = new Guna.UI2.WinForms.Guna2ComboBox();
            this.dtpNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.btnThoat = new Guna.UI2.WinForms.Guna2Button();
            this.btnLamMoi = new Guna.UI2.WinForms.Guna2Button();
            this.btnTaiKham = new Guna.UI2.WinForms.Guna2Button();
            this.btnChuanDoan = new Guna.UI2.WinForms.Guna2Button();
            this.btnDKySDDichVu = new Guna.UI2.WinForms.Guna2Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.btnDatLich = new Guna.UI2.WinForms.Guna2Button();
            this.btnThemKB = new Guna.UI2.WinForms.Guna2Button();
            this.cboPKB = new Guna.UI2.WinForms.Guna2ComboBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSKhamBenhTheoNgay)).BeginInit();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtTrieuChung
            // 
            this.txtTrieuChung.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtTrieuChung.Enabled = false;
            this.txtTrieuChung.Location = new System.Drawing.Point(308, 256);
            this.txtTrieuChung.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtTrieuChung.Multiline = true;
            this.txtTrieuChung.Name = "txtTrieuChung";
            this.txtTrieuChung.Size = new System.Drawing.Size(406, 56);
            this.txtTrieuChung.TabIndex = 103;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(305, 231);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(108, 20);
            this.label4.TabIndex = 102;
            this.label4.Text = "Triệu chứng";
            // 
            // txtMaKham
            // 
            this.txtMaKham.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtMaKham.Enabled = false;
            this.txtMaKham.Location = new System.Drawing.Point(309, 103);
            this.txtMaKham.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtMaKham.Multiline = true;
            this.txtMaKham.Name = "txtMaKham";
            this.txtMaKham.Size = new System.Drawing.Size(406, 29);
            this.txtMaKham.TabIndex = 101;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(304, 69);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 20);
            this.label3.TabIndex = 100;
            this.label3.Text = "Mã khám";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(636, 17);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(208, 36);
            this.label2.TabIndex = 99;
            this.label2.Text = "Quản lý khám";
            // 
            // cboKhoa
            // 
            this.cboKhoa.BackColor = System.Drawing.Color.Transparent;
            this.cboKhoa.BorderColor = System.Drawing.Color.Black;
            this.cboKhoa.BorderRadius = 3;
            this.cboKhoa.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboKhoa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboKhoa.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboKhoa.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboKhoa.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboKhoa.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboKhoa.ItemHeight = 30;
            this.cboKhoa.Location = new System.Drawing.Point(771, 103);
            this.cboKhoa.Margin = new System.Windows.Forms.Padding(4);
            this.cboKhoa.Name = "cboKhoa";
            this.cboKhoa.Size = new System.Drawing.Size(408, 36);
            this.cboKhoa.TabIndex = 98;
            this.cboKhoa.SelectedIndexChanged += new System.EventHandler(this.cboKhoa_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(767, 69);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(51, 20);
            this.label1.TabIndex = 97;
            this.label1.Text = "Khoa";
            // 
            // dgvDSKhamBenhTheoNgay
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvDSKhamBenhTheoNgay.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvDSKhamBenhTheoNgay.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDSKhamBenhTheoNgay.ColumnHeadersHeight = 4;
            this.dgvDSKhamBenhTheoNgay.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvDSKhamBenhTheoNgay.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvDSKhamBenhTheoNgay.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSKhamBenhTheoNgay.Location = new System.Drawing.Point(162, 488);
            this.dgvDSKhamBenhTheoNgay.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgvDSKhamBenhTheoNgay.Name = "dgvDSKhamBenhTheoNgay";
            this.dgvDSKhamBenhTheoNgay.RowHeadersVisible = false;
            this.dgvDSKhamBenhTheoNgay.RowHeadersWidth = 62;
            this.dgvDSKhamBenhTheoNgay.RowTemplate.Height = 28;
            this.dgvDSKhamBenhTheoNgay.Size = new System.Drawing.Size(1160, 234);
            this.dgvDSKhamBenhTheoNgay.TabIndex = 96;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.ReadOnly = false;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.Height = 28;
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvDSKhamBenhTheoNgay.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvDSKhamBenhTheoNgay.Click += new System.EventHandler(this.dgvDSKhamBenhTheoNgay_Click);
            // 
            // cboPhong
            // 
            this.cboPhong.BackColor = System.Drawing.Color.Transparent;
            this.cboPhong.BorderColor = System.Drawing.Color.Black;
            this.cboPhong.BorderRadius = 3;
            this.cboPhong.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboPhong.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPhong.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhong.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhong.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboPhong.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboPhong.ItemHeight = 30;
            this.cboPhong.Location = new System.Drawing.Point(770, 191);
            this.cboPhong.Margin = new System.Windows.Forms.Padding(4);
            this.cboPhong.Name = "cboPhong";
            this.cboPhong.Size = new System.Drawing.Size(408, 36);
            this.cboPhong.TabIndex = 95;
            this.cboPhong.SelectedIndexChanged += new System.EventHandler(this.cboPhong_SelectedIndexChanged);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.Location = new System.Drawing.Point(766, 157);
            this.label19.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(61, 20);
            this.label19.TabIndex = 94;
            this.label19.Text = "Phòng";
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.Location = new System.Drawing.Point(1021, 450);
            this.label15.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(51, 20);
            this.label15.TabIndex = 92;
            this.label15.Text = "Ngày";
            // 
            // btnSuaKB
            // 
            this.btnSuaKB.BorderRadius = 5;
            this.btnSuaKB.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaKB.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaKB.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSuaKB.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSuaKB.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSuaKB.ForeColor = System.Drawing.Color.White;
            this.btnSuaKB.Location = new System.Drawing.Point(180, 30);
            this.btnSuaKB.Margin = new System.Windows.Forms.Padding(4);
            this.btnSuaKB.Name = "btnSuaKB";
            this.btnSuaKB.Size = new System.Drawing.Size(139, 53);
            this.btnSuaKB.TabIndex = 2;
            this.btnSuaKB.Text = "Cập nhật";
            this.btnSuaKB.Click += new System.EventHandler(this.btnSuaKB_Click);
            // 
            // cboNVKhamBenh
            // 
            this.cboNVKhamBenh.BackColor = System.Drawing.Color.Transparent;
            this.cboNVKhamBenh.BorderColor = System.Drawing.Color.Black;
            this.cboNVKhamBenh.BorderRadius = 3;
            this.cboNVKhamBenh.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboNVKhamBenh.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNVKhamBenh.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNVKhamBenh.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNVKhamBenh.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboNVKhamBenh.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboNVKhamBenh.ItemHeight = 30;
            this.cboNVKhamBenh.Location = new System.Drawing.Point(770, 282);
            this.cboNVKhamBenh.Margin = new System.Windows.Forms.Padding(4);
            this.cboNVKhamBenh.Name = "cboNVKhamBenh";
            this.cboNVKhamBenh.Size = new System.Drawing.Size(408, 36);
            this.cboNVKhamBenh.TabIndex = 90;
            // 
            // dtpNgay
            // 
            this.dtpNgay.BorderRadius = 3;
            this.dtpNgay.Checked = true;
            this.dtpNgay.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgay.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgay.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgay.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgay.Location = new System.Drawing.Point(1080, 444);
            this.dtpNgay.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgay.Name = "dtpNgay";
            this.dtpNgay.Size = new System.Drawing.Size(251, 30);
            this.dtpNgay.TabIndex = 89;
            this.dtpNgay.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            this.dtpNgay.ValueChanged += new System.EventHandler(this.dtpNgay_ValueChanged);
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(767, 244);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(142, 20);
            this.label16.TabIndex = 88;
            this.label16.Text = "Nhân viên khám";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(305, 146);
            this.label17.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(152, 20);
            this.label17.TabIndex = 87;
            this.label17.Text = "Phiếu khám bệnh";
            // 
            // btnThoat
            // 
            this.btnThoat.BorderRadius = 5;
            this.btnThoat.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThoat.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThoat.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThoat.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnThoat.ForeColor = System.Drawing.Color.White;
            this.btnThoat.Location = new System.Drawing.Point(1183, 740);
            this.btnThoat.Margin = new System.Windows.Forms.Padding(4);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(139, 53);
            this.btnThoat.TabIndex = 7;
            this.btnThoat.Text = "Thoát";
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btnLamMoi
            // 
            this.btnLamMoi.BorderRadius = 5;
            this.btnLamMoi.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnLamMoi.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnLamMoi.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnLamMoi.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnLamMoi.ForeColor = System.Drawing.Color.White;
            this.btnLamMoi.Location = new System.Drawing.Point(340, 30);
            this.btnLamMoi.Margin = new System.Windows.Forms.Padding(4);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(139, 53);
            this.btnLamMoi.TabIndex = 6;
            this.btnLamMoi.Text = "Làm mới";
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // btnTaiKham
            // 
            this.btnTaiKham.BorderRadius = 5;
            this.btnTaiKham.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTaiKham.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTaiKham.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTaiKham.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTaiKham.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTaiKham.ForeColor = System.Drawing.Color.White;
            this.btnTaiKham.Location = new System.Drawing.Point(830, 30);
            this.btnTaiKham.Margin = new System.Windows.Forms.Padding(4);
            this.btnTaiKham.Name = "btnTaiKham";
            this.btnTaiKham.Size = new System.Drawing.Size(139, 53);
            this.btnTaiKham.TabIndex = 5;
            this.btnTaiKham.Text = "Tái khám";
            this.btnTaiKham.Click += new System.EventHandler(this.btnTaiKham_Click);
            // 
            // btnChuanDoan
            // 
            this.btnChuanDoan.BorderRadius = 5;
            this.btnChuanDoan.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnChuanDoan.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnChuanDoan.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnChuanDoan.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnChuanDoan.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnChuanDoan.ForeColor = System.Drawing.Color.White;
            this.btnChuanDoan.Location = new System.Drawing.Point(668, 30);
            this.btnChuanDoan.Margin = new System.Windows.Forms.Padding(4);
            this.btnChuanDoan.Name = "btnChuanDoan";
            this.btnChuanDoan.Size = new System.Drawing.Size(139, 53);
            this.btnChuanDoan.TabIndex = 4;
            this.btnChuanDoan.Text = "Chuẩn đoán";
            this.btnChuanDoan.Click += new System.EventHandler(this.btnChuanDoan_Click);
            // 
            // btnDKySDDichVu
            // 
            this.btnDKySDDichVu.BorderRadius = 5;
            this.btnDKySDDichVu.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnDKySDDichVu.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnDKySDDichVu.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnDKySDDichVu.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnDKySDDichVu.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnDKySDDichVu.ForeColor = System.Drawing.Color.White;
            this.btnDKySDDichVu.Location = new System.Drawing.Point(500, 30);
            this.btnDKySDDichVu.Margin = new System.Windows.Forms.Padding(4);
            this.btnDKySDDichVu.Name = "btnDKySDDichVu";
            this.btnDKySDDichVu.Size = new System.Drawing.Size(139, 53);
            this.btnDKySDDichVu.TabIndex = 3;
            this.btnDKySDDichVu.Text = "Sử dụng dịch vụ";
            this.btnDKySDDichVu.Click += new System.EventHandler(this.btnDKySDDichVu_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.btnDatLich);
            this.groupBox5.Controls.Add(this.btnLamMoi);
            this.groupBox5.Controls.Add(this.btnTaiKham);
            this.groupBox5.Controls.Add(this.btnChuanDoan);
            this.groupBox5.Controls.Add(this.btnDKySDDichVu);
            this.groupBox5.Controls.Add(this.btnSuaKB);
            this.groupBox5.Controls.Add(this.btnThemKB);
            this.groupBox5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox5.Location = new System.Drawing.Point(162, 340);
            this.groupBox5.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox5.Size = new System.Drawing.Size(1160, 96);
            this.groupBox5.TabIndex = 93;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Thanh công cụ";
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
            this.btnDatLich.Location = new System.Drawing.Point(1002, 30);
            this.btnDatLich.Name = "btnDatLich";
            this.btnDatLich.Size = new System.Drawing.Size(139, 53);
            this.btnDatLich.TabIndex = 7;
            this.btnDatLich.Text = "Đặt lịch";
            this.btnDatLich.Click += new System.EventHandler(this.btnDatLich_Click);
            // 
            // btnThemKB
            // 
            this.btnThemKB.BorderRadius = 5;
            this.btnThemKB.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemKB.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemKB.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemKB.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemKB.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemKB.ForeColor = System.Drawing.Color.White;
            this.btnThemKB.Location = new System.Drawing.Point(27, 30);
            this.btnThemKB.Margin = new System.Windows.Forms.Padding(4);
            this.btnThemKB.Name = "btnThemKB";
            this.btnThemKB.Size = new System.Drawing.Size(139, 53);
            this.btnThemKB.TabIndex = 0;
            this.btnThemKB.Text = "Thêm";
            this.btnThemKB.Click += new System.EventHandler(this.btnThemKB_Click);
            // 
            // cboPKB
            // 
            this.cboPKB.BackColor = System.Drawing.Color.Transparent;
            this.cboPKB.BorderColor = System.Drawing.Color.Black;
            this.cboPKB.BorderRadius = 3;
            this.cboPKB.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboPKB.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPKB.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPKB.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPKB.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboPKB.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboPKB.ItemHeight = 30;
            this.cboPKB.Location = new System.Drawing.Point(309, 182);
            this.cboPKB.Margin = new System.Windows.Forms.Padding(4);
            this.cboPKB.Name = "cboPKB";
            this.cboPKB.Size = new System.Drawing.Size(408, 36);
            this.cboPKB.TabIndex = 91;
            this.cboPKB.SelectedIndexChanged += new System.EventHandler(this.cboPKB_SelectedIndexChanged);
            // 
            // frmKhamBenh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1492, 845);
            this.Controls.Add(this.btnThoat);
            this.Controls.Add(this.txtTrieuChung);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.txtMaKham);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.cboKhoa);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dgvDSKhamBenhTheoNgay);
            this.Controls.Add(this.cboPhong);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.cboNVKhamBenh);
            this.Controls.Add(this.dtpNgay);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.label17);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.cboPKB);
            this.Name = "frmKhamBenh";
            this.Text = "Khám Bệnh";
            this.Load += new System.EventHandler(this.frmKhamBenh_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSKhamBenhTheoNgay)).EndInit();
            this.groupBox5.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtTrieuChung;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtMaKham;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2ComboBox cboKhoa;
        private System.Windows.Forms.Label label1;
        private Guna.UI2.WinForms.Guna2DataGridView dgvDSKhamBenhTheoNgay;
        private Guna.UI2.WinForms.Guna2ComboBox cboPhong;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label15;
        private Guna.UI2.WinForms.Guna2Button btnSuaKB;
        private Guna.UI2.WinForms.Guna2ComboBox cboNVKhamBenh;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgay;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label17;
        private Guna.UI2.WinForms.Guna2Button btnThoat;
        private Guna.UI2.WinForms.Guna2Button btnLamMoi;
        private Guna.UI2.WinForms.Guna2Button btnTaiKham;
        private Guna.UI2.WinForms.Guna2Button btnChuanDoan;
        private Guna.UI2.WinForms.Guna2Button btnDKySDDichVu;
        private System.Windows.Forms.GroupBox groupBox5;
        private Guna.UI2.WinForms.Guna2Button btnThemKB;
        private Guna.UI2.WinForms.Guna2ComboBox cboPKB;
        private Guna.UI2.WinForms.Guna2Button btnDatLich;
    }
}