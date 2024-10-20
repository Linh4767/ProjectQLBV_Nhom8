namespace Project_Nhom8
{
    partial class frmSuDungDichVu
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
            this.dgvDSSuDungDichVu = new System.Windows.Forms.DataGridView();
            this.txtBenhNhan = new Guna.UI2.WinForms.Guna2TextBox();
            this.guna2GroupBox6 = new Guna.UI2.WinForms.Guna2GroupBox();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.btnPhanGiuong = new Guna.UI2.WinForms.Guna2Button();
            this.btnInSuDungDV = new Guna.UI2.WinForms.Guna2Button();
            this.btnSuaSD = new Guna.UI2.WinForms.Guna2Button();
            this.btnThemSuDung = new Guna.UI2.WinForms.Guna2Button();
            this.dtpNgayThucHienDV = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label29 = new System.Windows.Forms.Label();
            this.dtpNgayYeuCauSuDungDV = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.txtKetQuaDichVu = new Guna.UI2.WinForms.Guna2TextBox();
            this.label28 = new System.Windows.Forms.Label();
            this.cboNhanVienThucHienDichVu = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label31 = new System.Windows.Forms.Label();
            this.label32 = new System.Windows.Forms.Label();
            this.cboNVYeuCauDV = new Guna.UI2.WinForms.Guna2ComboBox();
            this.label33 = new System.Windows.Forms.Label();
            this.label34 = new System.Windows.Forms.Label();
            this.cboPhieuKhamBenhSuDungDV = new Guna.UI2.WinForms.Guna2ComboBox();
            this.cboPhongDichVu = new Guna.UI2.WinForms.Guna2ComboBox();
            this.dtpDSNgaySuDungDV = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label35 = new System.Windows.Forms.Label();
            this.label36 = new System.Windows.Forms.Label();
            this.label37 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSSuDungDichVu)).BeginInit();
            this.guna2GroupBox6.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvDSSuDungDichVu
            // 
            this.dgvDSSuDungDichVu.BackgroundColor = System.Drawing.Color.White;
            this.dgvDSSuDungDichVu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDSSuDungDichVu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvDSSuDungDichVu.GridColor = System.Drawing.Color.DarkGray;
            this.dgvDSSuDungDichVu.Location = new System.Drawing.Point(0, 40);
            this.dgvDSSuDungDichVu.Margin = new System.Windows.Forms.Padding(4);
            this.dgvDSSuDungDichVu.Name = "dgvDSSuDungDichVu";
            this.dgvDSSuDungDichVu.RowHeadersWidth = 62;
            this.dgvDSSuDungDichVu.Size = new System.Drawing.Size(1035, 234);
            this.dgvDSSuDungDichVu.TabIndex = 0;
            // 
            // txtBenhNhan
            // 
            this.txtBenhNhan.BorderColor = System.Drawing.Color.Black;
            this.txtBenhNhan.BorderRadius = 3;
            this.txtBenhNhan.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtBenhNhan.DefaultText = "";
            this.txtBenhNhan.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtBenhNhan.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtBenhNhan.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtBenhNhan.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtBenhNhan.Enabled = false;
            this.txtBenhNhan.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBenhNhan.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtBenhNhan.ForeColor = System.Drawing.Color.Black;
            this.txtBenhNhan.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBenhNhan.Location = new System.Drawing.Point(740, 176);
            this.txtBenhNhan.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtBenhNhan.Name = "txtBenhNhan";
            this.txtBenhNhan.PasswordChar = '\0';
            this.txtBenhNhan.PlaceholderText = "";
            this.txtBenhNhan.SelectedText = "";
            this.txtBenhNhan.Size = new System.Drawing.Size(405, 44);
            this.txtBenhNhan.TabIndex = 107;
            // 
            // guna2GroupBox6
            // 
            this.guna2GroupBox6.Controls.Add(this.dgvDSSuDungDichVu);
            this.guna2GroupBox6.CustomBorderColor = System.Drawing.Color.SteelBlue;
            this.guna2GroupBox6.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.guna2GroupBox6.ForeColor = System.Drawing.Color.White;
            this.guna2GroupBox6.Location = new System.Drawing.Point(203, 604);
            this.guna2GroupBox6.Margin = new System.Windows.Forms.Padding(4);
            this.guna2GroupBox6.Name = "guna2GroupBox6";
            this.guna2GroupBox6.Size = new System.Drawing.Size(1035, 274);
            this.guna2GroupBox6.TabIndex = 106;
            this.guna2GroupBox6.Text = "Danh sách bệnh nhân sử dụng dịch vụ";
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.btnPhanGiuong);
            this.groupBox6.Controls.Add(this.btnInSuDungDV);
            this.groupBox6.Controls.Add(this.btnSuaSD);
            this.groupBox6.Controls.Add(this.btnThemSuDung);
            this.groupBox6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox6.Location = new System.Drawing.Point(731, 384);
            this.groupBox6.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox6.Size = new System.Drawing.Size(434, 178);
            this.groupBox6.TabIndex = 105;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Thanh công cụ";
            // 
            // btnPhanGiuong
            // 
            this.btnPhanGiuong.BorderRadius = 5;
            this.btnPhanGiuong.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnPhanGiuong.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnPhanGiuong.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnPhanGiuong.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnPhanGiuong.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnPhanGiuong.ForeColor = System.Drawing.Color.White;
            this.btnPhanGiuong.Location = new System.Drawing.Point(259, 110);
            this.btnPhanGiuong.Margin = new System.Windows.Forms.Padding(4);
            this.btnPhanGiuong.Name = "btnPhanGiuong";
            this.btnPhanGiuong.Size = new System.Drawing.Size(139, 53);
            this.btnPhanGiuong.TabIndex = 4;
            this.btnPhanGiuong.Text = "Phân giường";
            // 
            // btnInSuDungDV
            // 
            this.btnInSuDungDV.BorderRadius = 5;
            this.btnInSuDungDV.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnInSuDungDV.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnInSuDungDV.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnInSuDungDV.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnInSuDungDV.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInSuDungDV.ForeColor = System.Drawing.Color.White;
            this.btnInSuDungDV.Location = new System.Drawing.Point(60, 110);
            this.btnInSuDungDV.Margin = new System.Windows.Forms.Padding(4);
            this.btnInSuDungDV.Name = "btnInSuDungDV";
            this.btnInSuDungDV.Size = new System.Drawing.Size(139, 53);
            this.btnInSuDungDV.TabIndex = 3;
            this.btnInSuDungDV.Text = "In";
            // 
            // btnSuaSD
            // 
            this.btnSuaSD.BorderRadius = 5;
            this.btnSuaSD.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaSD.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaSD.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSuaSD.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSuaSD.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSuaSD.ForeColor = System.Drawing.Color.White;
            this.btnSuaSD.Location = new System.Drawing.Point(259, 30);
            this.btnSuaSD.Margin = new System.Windows.Forms.Padding(4);
            this.btnSuaSD.Name = "btnSuaSD";
            this.btnSuaSD.Size = new System.Drawing.Size(139, 53);
            this.btnSuaSD.TabIndex = 2;
            this.btnSuaSD.Text = "Cập nhật";
            // 
            // btnThemSuDung
            // 
            this.btnThemSuDung.BorderRadius = 5;
            this.btnThemSuDung.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemSuDung.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemSuDung.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemSuDung.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemSuDung.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemSuDung.ForeColor = System.Drawing.Color.White;
            this.btnThemSuDung.Location = new System.Drawing.Point(60, 30);
            this.btnThemSuDung.Margin = new System.Windows.Forms.Padding(4);
            this.btnThemSuDung.Name = "btnThemSuDung";
            this.btnThemSuDung.Size = new System.Drawing.Size(139, 53);
            this.btnThemSuDung.TabIndex = 0;
            this.btnThemSuDung.Text = "Thêm";
            // 
            // dtpNgayThucHienDV
            // 
            this.dtpNgayThucHienDV.BorderRadius = 3;
            this.dtpNgayThucHienDV.BorderThickness = 1;
            this.dtpNgayThucHienDV.Checked = true;
            this.dtpNgayThucHienDV.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayThucHienDV.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayThucHienDV.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayThucHienDV.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgayThucHienDV.Location = new System.Drawing.Point(740, 348);
            this.dtpNgayThucHienDV.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgayThucHienDV.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayThucHienDV.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayThucHienDV.Name = "dtpNgayThucHienDV";
            this.dtpNgayThucHienDV.Size = new System.Drawing.Size(407, 30);
            this.dtpNgayThucHienDV.TabIndex = 104;
            this.dtpNgayThucHienDV.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label29
            // 
            this.label29.AutoSize = true;
            this.label29.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label29.Location = new System.Drawing.Point(734, 320);
            this.label29.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label29.Name = "label29";
            this.label29.Size = new System.Drawing.Size(134, 20);
            this.label29.TabIndex = 103;
            this.label29.Text = "Ngày thực hiện";
            // 
            // dtpNgayYeuCauSuDungDV
            // 
            this.dtpNgayYeuCauSuDungDV.BorderRadius = 3;
            this.dtpNgayYeuCauSuDungDV.BorderThickness = 1;
            this.dtpNgayYeuCauSuDungDV.Checked = true;
            this.dtpNgayYeuCauSuDungDV.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayYeuCauSuDungDV.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayYeuCauSuDungDV.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayYeuCauSuDungDV.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgayYeuCauSuDungDV.Location = new System.Drawing.Point(740, 264);
            this.dtpNgayYeuCauSuDungDV.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgayYeuCauSuDungDV.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayYeuCauSuDungDV.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayYeuCauSuDungDV.Name = "dtpNgayYeuCauSuDungDV";
            this.dtpNgayYeuCauSuDungDV.Size = new System.Drawing.Size(407, 30);
            this.dtpNgayYeuCauSuDungDV.TabIndex = 102;
            this.dtpNgayYeuCauSuDungDV.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // txtKetQuaDichVu
            // 
            this.txtKetQuaDichVu.BorderColor = System.Drawing.Color.Black;
            this.txtKetQuaDichVu.BorderRadius = 3;
            this.txtKetQuaDichVu.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtKetQuaDichVu.DefaultText = "";
            this.txtKetQuaDichVu.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtKetQuaDichVu.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtKetQuaDichVu.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtKetQuaDichVu.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtKetQuaDichVu.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtKetQuaDichVu.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtKetQuaDichVu.ForeColor = System.Drawing.Color.Black;
            this.txtKetQuaDichVu.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtKetQuaDichVu.Location = new System.Drawing.Point(276, 348);
            this.txtKetQuaDichVu.Margin = new System.Windows.Forms.Padding(5, 6, 5, 6);
            this.txtKetQuaDichVu.Multiline = true;
            this.txtKetQuaDichVu.Name = "txtKetQuaDichVu";
            this.txtKetQuaDichVu.PasswordChar = '\0';
            this.txtKetQuaDichVu.PlaceholderText = "";
            this.txtKetQuaDichVu.SelectedText = "";
            this.txtKetQuaDichVu.Size = new System.Drawing.Size(405, 199);
            this.txtKetQuaDichVu.TabIndex = 101;
            // 
            // label28
            // 
            this.label28.AutoSize = true;
            this.label28.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label28.Location = new System.Drawing.Point(269, 320);
            this.label28.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label28.Name = "label28";
            this.label28.Size = new System.Drawing.Size(73, 20);
            this.label28.TabIndex = 100;
            this.label28.Text = "Kết quả";
            // 
            // cboNhanVienThucHienDichVu
            // 
            this.cboNhanVienThucHienDichVu.BackColor = System.Drawing.Color.Transparent;
            this.cboNhanVienThucHienDichVu.BorderColor = System.Drawing.Color.Black;
            this.cboNhanVienThucHienDichVu.BorderRadius = 3;
            this.cboNhanVienThucHienDichVu.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboNhanVienThucHienDichVu.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNhanVienThucHienDichVu.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNhanVienThucHienDichVu.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNhanVienThucHienDichVu.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboNhanVienThucHienDichVu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboNhanVienThucHienDichVu.ItemHeight = 30;
            this.cboNhanVienThucHienDichVu.Location = new System.Drawing.Point(273, 264);
            this.cboNhanVienThucHienDichVu.Margin = new System.Windows.Forms.Padding(4);
            this.cboNhanVienThucHienDichVu.Name = "cboNhanVienThucHienDichVu";
            this.cboNhanVienThucHienDichVu.Size = new System.Drawing.Size(408, 36);
            this.cboNhanVienThucHienDichVu.TabIndex = 99;
            // 
            // label31
            // 
            this.label31.AutoSize = true;
            this.label31.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label31.Location = new System.Drawing.Point(737, 232);
            this.label31.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label31.Name = "label31";
            this.label31.Size = new System.Drawing.Size(122, 20);
            this.label31.TabIndex = 98;
            this.label31.Text = "Ngày yêu cầu";
            // 
            // label32
            // 
            this.label32.AutoSize = true;
            this.label32.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label32.Location = new System.Drawing.Point(734, 147);
            this.label32.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label32.Name = "label32";
            this.label32.Size = new System.Drawing.Size(98, 20);
            this.label32.TabIndex = 97;
            this.label32.Text = "Bệnh nhân";
            // 
            // cboNVYeuCauDV
            // 
            this.cboNVYeuCauDV.BackColor = System.Drawing.Color.Transparent;
            this.cboNVYeuCauDV.BorderColor = System.Drawing.Color.Black;
            this.cboNVYeuCauDV.BorderRadius = 3;
            this.cboNVYeuCauDV.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboNVYeuCauDV.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboNVYeuCauDV.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNVYeuCauDV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboNVYeuCauDV.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboNVYeuCauDV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboNVYeuCauDV.ItemHeight = 30;
            this.cboNVYeuCauDV.Location = new System.Drawing.Point(273, 96);
            this.cboNVYeuCauDV.Margin = new System.Windows.Forms.Padding(4);
            this.cboNVYeuCauDV.Name = "cboNVYeuCauDV";
            this.cboNVYeuCauDV.Size = new System.Drawing.Size(408, 36);
            this.cboNVYeuCauDV.TabIndex = 96;
            // 
            // label33
            // 
            this.label33.AutoSize = true;
            this.label33.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label33.Location = new System.Drawing.Point(269, 60);
            this.label33.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label33.Name = "label33";
            this.label33.Size = new System.Drawing.Size(163, 20);
            this.label33.TabIndex = 95;
            this.label33.Text = "Nhân viên yêu cầu";
            // 
            // label34
            // 
            this.label34.AutoSize = true;
            this.label34.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label34.Location = new System.Drawing.Point(902, 25);
            this.label34.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label34.Name = "label34";
            this.label34.Size = new System.Drawing.Size(51, 20);
            this.label34.TabIndex = 94;
            this.label34.Text = "Ngày";
            // 
            // cboPhieuKhamBenhSuDungDV
            // 
            this.cboPhieuKhamBenhSuDungDV.BackColor = System.Drawing.Color.Transparent;
            this.cboPhieuKhamBenhSuDungDV.BorderColor = System.Drawing.Color.Black;
            this.cboPhieuKhamBenhSuDungDV.BorderRadius = 3;
            this.cboPhieuKhamBenhSuDungDV.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboPhieuKhamBenhSuDungDV.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPhieuKhamBenhSuDungDV.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhieuKhamBenhSuDungDV.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhieuKhamBenhSuDungDV.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboPhieuKhamBenhSuDungDV.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboPhieuKhamBenhSuDungDV.ItemHeight = 30;
            this.cboPhieuKhamBenhSuDungDV.Location = new System.Drawing.Point(740, 96);
            this.cboPhieuKhamBenhSuDungDV.Margin = new System.Windows.Forms.Padding(4);
            this.cboPhieuKhamBenhSuDungDV.Name = "cboPhieuKhamBenhSuDungDV";
            this.cboPhieuKhamBenhSuDungDV.Size = new System.Drawing.Size(408, 36);
            this.cboPhieuKhamBenhSuDungDV.TabIndex = 93;
            // 
            // cboPhongDichVu
            // 
            this.cboPhongDichVu.BackColor = System.Drawing.Color.Transparent;
            this.cboPhongDichVu.BorderColor = System.Drawing.Color.Black;
            this.cboPhongDichVu.BorderRadius = 3;
            this.cboPhongDichVu.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.cboPhongDichVu.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboPhongDichVu.FocusedColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhongDichVu.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.cboPhongDichVu.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cboPhongDichVu.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(68)))), ((int)(((byte)(88)))), ((int)(((byte)(112)))));
            this.cboPhongDichVu.ItemHeight = 30;
            this.cboPhongDichVu.Location = new System.Drawing.Point(270, 176);
            this.cboPhongDichVu.Margin = new System.Windows.Forms.Padding(4);
            this.cboPhongDichVu.Name = "cboPhongDichVu";
            this.cboPhongDichVu.Size = new System.Drawing.Size(408, 36);
            this.cboPhongDichVu.TabIndex = 92;
            // 
            // dtpDSNgaySuDungDV
            // 
            this.dtpDSNgaySuDungDV.BorderRadius = 3;
            this.dtpDSNgaySuDungDV.Checked = true;
            this.dtpDSNgaySuDungDV.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpDSNgaySuDungDV.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpDSNgaySuDungDV.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpDSNgaySuDungDV.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpDSNgaySuDungDV.Location = new System.Drawing.Point(966, 20);
            this.dtpDSNgaySuDungDV.Margin = new System.Windows.Forms.Padding(4);
            this.dtpDSNgaySuDungDV.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpDSNgaySuDungDV.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpDSNgaySuDungDV.Name = "dtpDSNgaySuDungDV";
            this.dtpDSNgaySuDungDV.Size = new System.Drawing.Size(251, 30);
            this.dtpDSNgaySuDungDV.TabIndex = 91;
            this.dtpDSNgaySuDungDV.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label35
            // 
            this.label35.AutoSize = true;
            this.label35.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label35.Location = new System.Drawing.Point(269, 232);
            this.label35.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label35.Name = "label35";
            this.label35.Size = new System.Drawing.Size(142, 20);
            this.label35.TabIndex = 90;
            this.label35.Text = "Nhân viên khám";
            // 
            // label36
            // 
            this.label36.AutoSize = true;
            this.label36.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label36.Location = new System.Drawing.Point(734, 62);
            this.label36.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label36.Name = "label36";
            this.label36.Size = new System.Drawing.Size(152, 20);
            this.label36.TabIndex = 89;
            this.label36.Text = "Phiếu khám bệnh";
            // 
            // label37
            // 
            this.label37.AutoSize = true;
            this.label37.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label37.Location = new System.Drawing.Point(269, 146);
            this.label37.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label37.Name = "label37";
            this.label37.Size = new System.Drawing.Size(61, 20);
            this.label37.TabIndex = 88;
            this.label37.Text = "Phòng";
            // 
            // frmSuDungDichVu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1440, 893);
            this.Controls.Add(this.txtBenhNhan);
            this.Controls.Add(this.guna2GroupBox6);
            this.Controls.Add(this.groupBox6);
            this.Controls.Add(this.dtpNgayThucHienDV);
            this.Controls.Add(this.label29);
            this.Controls.Add(this.dtpNgayYeuCauSuDungDV);
            this.Controls.Add(this.txtKetQuaDichVu);
            this.Controls.Add(this.label28);
            this.Controls.Add(this.cboNhanVienThucHienDichVu);
            this.Controls.Add(this.label31);
            this.Controls.Add(this.label32);
            this.Controls.Add(this.cboNVYeuCauDV);
            this.Controls.Add(this.label33);
            this.Controls.Add(this.label34);
            this.Controls.Add(this.cboPhieuKhamBenhSuDungDV);
            this.Controls.Add(this.cboPhongDichVu);
            this.Controls.Add(this.dtpDSNgaySuDungDV);
            this.Controls.Add(this.label35);
            this.Controls.Add(this.label36);
            this.Controls.Add(this.label37);
            this.Name = "frmSuDungDichVu";
            this.Text = "Sử Dụng Dịch Vụ";
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSSuDungDichVu)).EndInit();
            this.guna2GroupBox6.ResumeLayout(false);
            this.groupBox6.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDSSuDungDichVu;
        private Guna.UI2.WinForms.Guna2TextBox txtBenhNhan;
        private Guna.UI2.WinForms.Guna2GroupBox guna2GroupBox6;
        private System.Windows.Forms.GroupBox groupBox6;
        private Guna.UI2.WinForms.Guna2Button btnPhanGiuong;
        private Guna.UI2.WinForms.Guna2Button btnInSuDungDV;
        private Guna.UI2.WinForms.Guna2Button btnSuaSD;
        private Guna.UI2.WinForms.Guna2Button btnThemSuDung;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayThucHienDV;
        private System.Windows.Forms.Label label29;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayYeuCauSuDungDV;
        private Guna.UI2.WinForms.Guna2TextBox txtKetQuaDichVu;
        private System.Windows.Forms.Label label28;
        private Guna.UI2.WinForms.Guna2ComboBox cboNhanVienThucHienDichVu;
        private System.Windows.Forms.Label label31;
        private System.Windows.Forms.Label label32;
        private Guna.UI2.WinForms.Guna2ComboBox cboNVYeuCauDV;
        private System.Windows.Forms.Label label33;
        private System.Windows.Forms.Label label34;
        private Guna.UI2.WinForms.Guna2ComboBox cboPhieuKhamBenhSuDungDV;
        private Guna.UI2.WinForms.Guna2ComboBox cboPhongDichVu;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpDSNgaySuDungDV;
        private System.Windows.Forms.Label label35;
        private System.Windows.Forms.Label label36;
        private System.Windows.Forms.Label label37;
    }
}