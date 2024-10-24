namespace Project_Nhom8
{
    partial class frmCaTruc
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
            this.cboChonKhoa = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label40 = new System.Windows.Forms.Label();
            this.dgvCaTruc = new Guna.UI2.WinForms.Guna2DataGridView();
            this.label37 = new System.Windows.Forms.Label();
            this.cboCaTruc = new Guna.UI2.WinForms.Guna2ComboBox();
            this.cboMaNV = new Guna.UI2.WinForms.Guna2ComboBox();
            this.btnThemCaTruc = new Guna.UI2.WinForms.Guna2Button();
            this.btnSuaCaTruc = new Guna.UI2.WinForms.Guna2Button();
            this.dtpNgayTruc = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.cboPhong = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.btnTimNV = new Guna.UI2.WinForms.Guna2Button();
            this.txtTimNV = new Guna.UI2.WinForms.Guna2TextBox();
            this.bntThoat = new Guna.UI2.WinForms.Guna2Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txtMaCT = new Guna.UI2.WinForms.Guna2TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnLamMoi = new Guna.UI2.WinForms.Guna2Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCaTruc)).BeginInit();
            this.SuspendLayout();
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
            this.cboChonKhoa.Location = new System.Drawing.Point(252, 168);
            this.cboChonKhoa.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cboChonKhoa.Name = "cboChonKhoa";
            this.cboChonKhoa.Size = new System.Drawing.Size(442, 36);
            this.cboChonKhoa.TabIndex = 85;
            this.cboChonKhoa.SelectedIndexChanged += new System.EventHandler(this.cboChonKhoa_SelectedIndexChanged);
            // 
            // label40
            // 
            this.label40.AutoSize = true;
            this.label40.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label40.Location = new System.Drawing.Point(252, 133);
            this.label40.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label40.Name = "label40";
            this.label40.Size = new System.Drawing.Size(66, 25);
            this.label40.TabIndex = 84;
            this.label40.Text = "Khoa";
            // 
            // dgvCaTruc
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvCaTruc.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCaTruc.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvCaTruc.ColumnHeadersHeight = 4;
            this.dgvCaTruc.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvCaTruc.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvCaTruc.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvCaTruc.Location = new System.Drawing.Point(862, 200);
            this.dgvCaTruc.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.dgvCaTruc.Name = "dgvCaTruc";
            this.dgvCaTruc.RowHeadersVisible = false;
            this.dgvCaTruc.RowHeadersWidth = 51;
            this.dgvCaTruc.RowTemplate.Height = 24;
            this.dgvCaTruc.Size = new System.Drawing.Size(519, 525);
            this.dgvCaTruc.TabIndex = 83;
            this.dgvCaTruc.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvCaTruc.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvCaTruc.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvCaTruc.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvCaTruc.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvCaTruc.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvCaTruc.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvCaTruc.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvCaTruc.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvCaTruc.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvCaTruc.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvCaTruc.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvCaTruc.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvCaTruc.ThemeStyle.ReadOnly = false;
            this.dgvCaTruc.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvCaTruc.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvCaTruc.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvCaTruc.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvCaTruc.ThemeStyle.RowsStyle.Height = 24;
            this.dgvCaTruc.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvCaTruc.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvCaTruc.Click += new System.EventHandler(this.dgvCaTruc_Click);
            // 
            // label37
            // 
            this.label37.AutoSize = true;
            this.label37.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label37.Location = new System.Drawing.Point(253, 659);
            this.label37.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label37.Name = "label37";
            this.label37.Size = new System.Drawing.Size(104, 25);
            this.label37.TabIndex = 82;
            this.label37.Text = "Ngày trực";
            // 
            // cboCaTruc
            // 
            this.cboCaTruc.BackColor = System.Drawing.Color.Transparent;
            this.cboCaTruc.BorderColor = System.Drawing.Color.Black;
            this.cboCaTruc.BorderRadius = 7;
            this.cboCaTruc.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboCaTruc.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboCaTruc.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboCaTruc.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboCaTruc.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboCaTruc.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboCaTruc.ItemHeight = 30;
            this.cboCaTruc.Items.AddRange(new object[] {
            "6h-14h",
            "14h-22h",
            "22h-6h"});
            this.cboCaTruc.Location = new System.Drawing.Point(254, 586);
            this.cboCaTruc.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cboCaTruc.Name = "cboCaTruc";
            this.cboCaTruc.Size = new System.Drawing.Size(442, 36);
            this.cboCaTruc.TabIndex = 81;
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
            this.cboMaNV.Location = new System.Drawing.Point(254, 484);
            this.cboMaNV.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cboMaNV.Name = "cboMaNV";
            this.cboMaNV.Size = new System.Drawing.Size(442, 36);
            this.cboMaNV.TabIndex = 77;
            // 
            // btnThemCaTruc
            // 
            this.btnThemCaTruc.BorderRadius = 4;
            this.btnThemCaTruc.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemCaTruc.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemCaTruc.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemCaTruc.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemCaTruc.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemCaTruc.ForeColor = System.Drawing.Color.White;
            this.btnThemCaTruc.Location = new System.Drawing.Point(241, 792);
            this.btnThemCaTruc.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnThemCaTruc.Name = "btnThemCaTruc";
            this.btnThemCaTruc.Size = new System.Drawing.Size(144, 61);
            this.btnThemCaTruc.TabIndex = 80;
            this.btnThemCaTruc.Text = "Thêm";
            this.btnThemCaTruc.Click += new System.EventHandler(this.btnThemCaTruc_Click);
            // 
            // btnSuaCaTruc
            // 
            this.btnSuaCaTruc.BorderRadius = 4;
            this.btnSuaCaTruc.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaCaTruc.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaCaTruc.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSuaCaTruc.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSuaCaTruc.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnSuaCaTruc.ForeColor = System.Drawing.Color.White;
            this.btnSuaCaTruc.Location = new System.Drawing.Point(407, 792);
            this.btnSuaCaTruc.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.btnSuaCaTruc.Name = "btnSuaCaTruc";
            this.btnSuaCaTruc.Size = new System.Drawing.Size(144, 61);
            this.btnSuaCaTruc.TabIndex = 79;
            this.btnSuaCaTruc.Text = "Cập nhật";
            this.btnSuaCaTruc.Click += new System.EventHandler(this.btnSuaCaTruc_Click);
            // 
            // dtpNgayTruc
            // 
            this.dtpNgayTruc.BackColor = System.Drawing.SystemColors.Control;
            this.dtpNgayTruc.BorderRadius = 3;
            this.dtpNgayTruc.BorderThickness = 2;
            this.dtpNgayTruc.Checked = true;
            this.dtpNgayTruc.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayTruc.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayTruc.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayTruc.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgayTruc.Location = new System.Drawing.Point(253, 693);
            this.dtpNgayTruc.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.dtpNgayTruc.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayTruc.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayTruc.Name = "dtpNgayTruc";
            this.dtpNgayTruc.Size = new System.Drawing.Size(441, 41);
            this.dtpNgayTruc.TabIndex = 78;
            this.dtpNgayTruc.Value = new System.DateTime(2024, 10, 19, 0, 0, 0, 0);
            this.dtpNgayTruc.ValueChanged += new System.EventHandler(this.dtpNgayTruc_ValueChanged);
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
            this.cboPhong.Location = new System.Drawing.Point(253, 384);
            this.cboPhong.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.cboPhong.Name = "cboPhong";
            this.cboPhong.Size = new System.Drawing.Size(442, 36);
            this.cboPhong.TabIndex = 76;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(249, 557);
            this.label7.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(82, 25);
            this.label7.TabIndex = 75;
            this.label7.Text = "Ca trực";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(250, 456);
            this.label8.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(142, 25);
            this.label8.TabIndex = 74;
            this.label8.Text = "Mã nhân viên";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(253, 349);
            this.label9.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(79, 25);
            this.label9.TabIndex = 73;
            this.label9.Text = "Phòng";
            // 
            // btnTimNV
            // 
            this.btnTimNV.BorderRadius = 4;
            this.btnTimNV.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTimNV.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTimNV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTimNV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTimNV.Font = new System.Drawing.Font("Segoe UI", 10.2F);
            this.btnTimNV.ForeColor = System.Drawing.Color.White;
            this.btnTimNV.Location = new System.Drawing.Point(1224, 147);
            this.btnTimNV.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnTimNV.Name = "btnTimNV";
            this.btnTimNV.Size = new System.Drawing.Size(119, 42);
            this.btnTimNV.TabIndex = 87;
            this.btnTimNV.Text = "Tìm";
            this.btnTimNV.Click += new System.EventHandler(this.btnTimNV_Click);
            // 
            // txtTimNV
            // 
            this.txtTimNV.BorderColor = System.Drawing.Color.Black;
            this.txtTimNV.BorderRadius = 3;
            this.txtTimNV.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTimNV.DefaultText = "";
            this.txtTimNV.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTimNV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTimNV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTimNV.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTimNV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTimNV.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtTimNV.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTimNV.Location = new System.Drawing.Point(862, 147);
            this.txtTimNV.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.txtTimNV.Name = "txtTimNV";
            this.txtTimNV.PasswordChar = '\0';
            this.txtTimNV.PlaceholderText = "Mã Nhân Viên";
            this.txtTimNV.SelectedText = "";
            this.txtTimNV.Size = new System.Drawing.Size(354, 42);
            this.txtTimNV.TabIndex = 86;
            this.txtTimNV.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtTimNV_KeyPress);
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
            this.bntThoat.Location = new System.Drawing.Point(1195, 792);
            this.bntThoat.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.bntThoat.Name = "bntThoat";
            this.bntThoat.Size = new System.Drawing.Size(186, 61);
            this.bntThoat.TabIndex = 79;
            this.bntThoat.Text = "Thoát";
            this.bntThoat.Click += new System.EventHandler(this.bntThoat_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(258, 242);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(113, 25);
            this.label1.TabIndex = 88;
            this.label1.Text = "Mã ca trực";
            // 
            // txtMaCT
            // 
            this.txtMaCT.BorderColor = System.Drawing.Color.Black;
            this.txtMaCT.BorderRadius = 3;
            this.txtMaCT.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaCT.DefaultText = "";
            this.txtMaCT.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaCT.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaCT.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaCT.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaCT.Enabled = false;
            this.txtMaCT.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaCT.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMaCT.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaCT.Location = new System.Drawing.Point(255, 279);
            this.txtMaCT.Margin = new System.Windows.Forms.Padding(4, 6, 4, 6);
            this.txtMaCT.Name = "txtMaCT";
            this.txtMaCT.PasswordChar = '\0';
            this.txtMaCT.PlaceholderText = "";
            this.txtMaCT.ReadOnly = true;
            this.txtMaCT.SelectedText = "";
            this.txtMaCT.Size = new System.Drawing.Size(439, 41);
            this.txtMaCT.TabIndex = 89;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(632, 26);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(289, 46);
            this.label2.TabIndex = 90;
            this.label2.Text = "Quản lý ca trực";
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
            this.btnLamMoi.Location = new System.Drawing.Point(574, 792);
            this.btnLamMoi.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnLamMoi.Name = "btnLamMoi";
            this.btnLamMoi.Size = new System.Drawing.Size(144, 61);
            this.btnLamMoi.TabIndex = 91;
            this.btnLamMoi.Text = "Làm mới";
            this.btnLamMoi.Click += new System.EventHandler(this.btnLamMoi_Click);
            // 
            // frmCaTruc
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1678, 874);
            this.Controls.Add(this.btnLamMoi);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtMaCT);
            this.Controls.Add(this.btnTimNV);
            this.Controls.Add(this.txtTimNV);
            this.Controls.Add(this.cboChonKhoa);
            this.Controls.Add(this.label40);
            this.Controls.Add(this.dgvCaTruc);
            this.Controls.Add(this.label37);
            this.Controls.Add(this.cboCaTruc);
            this.Controls.Add(this.cboMaNV);
            this.Controls.Add(this.btnThemCaTruc);
            this.Controls.Add(this.bntThoat);
            this.Controls.Add(this.btnSuaCaTruc);
            this.Controls.Add(this.dtpNgayTruc);
            this.Controls.Add(this.cboPhong);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label9);
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "frmCaTruc";
            this.Text = "Ca Trực";
            this.Load += new System.EventHandler(this.frmCaTruc_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvCaTruc)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2ComboBox cboChonKhoa;
        private System.Windows.Forms.Label label40;
        private Guna.UI2.WinForms.Guna2DataGridView dgvCaTruc;
        private System.Windows.Forms.Label label37;
        private Guna.UI2.WinForms.Guna2ComboBox cboCaTruc;
        private Guna.UI2.WinForms.Guna2ComboBox cboMaNV;
        private Guna.UI2.WinForms.Guna2Button btnThemCaTruc;
        private Guna.UI2.WinForms.Guna2Button btnSuaCaTruc;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayTruc;
        private Guna.UI2.WinForms.Guna2ComboBox cboPhong;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label9;
        private Guna.UI2.WinForms.Guna2Button btnTimNV;
        private Guna.UI2.WinForms.Guna2TextBox txtTimNV;
        private Guna.UI2.WinForms.Guna2Button bntThoat;
        private System.Windows.Forms.Label label1;
        private Guna.UI2.WinForms.Guna2TextBox txtMaCT;
        private System.Windows.Forms.Label label2;
        private Guna.UI2.WinForms.Guna2Button btnLamMoi;
    }
}