namespace Project_Nhom8
{
    partial class frmPhong
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
            this.guna2GroupBox6 = new Guna.UI2.WinForms.Guna2GroupBox();
            this.dgvDanhSachPhong = new System.Windows.Forms.DataGridView();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnCapNhap = new Guna.UI2.WinForms.Guna2Button();
            this.btnXoaPhong = new Guna.UI2.WinForms.Guna2Button();
            this.btnThemPhong = new Guna.UI2.WinForms.Guna2Button();
            this.radPhongBenh = new System.Windows.Forms.RadioButton();
            this.radPhongChucNang = new System.Windows.Forms.RadioButton();
            this.radPhongKham = new System.Windows.Forms.RadioButton();
            this.label14 = new System.Windows.Forms.Label();
            this.txtSoLuongGiuong = new Guna.UI2.WinForms.Guna2TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.txtTenPhong = new Guna.UI2.WinForms.Guna2TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.cboKhoa = new Guna.UI2.WinForms.Guna2ComboBox();
            this.txtMaPhong = new Guna.UI2.WinForms.Guna2TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.guna2GroupBox6.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDanhSachPhong)).BeginInit();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // guna2GroupBox6
            // 
            this.guna2GroupBox6.Controls.Add(this.dgvDanhSachPhong);
            this.guna2GroupBox6.CustomBorderColor = System.Drawing.Color.SteelBlue;
            this.guna2GroupBox6.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.guna2GroupBox6.ForeColor = System.Drawing.Color.White;
            this.guna2GroupBox6.Location = new System.Drawing.Point(135, 406);
            this.guna2GroupBox6.Margin = new System.Windows.Forms.Padding(4);
            this.guna2GroupBox6.Name = "guna2GroupBox6";
            this.guna2GroupBox6.Size = new System.Drawing.Size(987, 246);
            this.guna2GroupBox6.TabIndex = 75;
            this.guna2GroupBox6.Text = "Danh sách phòng";
            // 
            // dgvDanhSachPhong
            // 
            this.dgvDanhSachPhong.BackgroundColor = System.Drawing.Color.White;
            this.dgvDanhSachPhong.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDanhSachPhong.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvDanhSachPhong.GridColor = System.Drawing.Color.DarkGray;
            this.dgvDanhSachPhong.Location = new System.Drawing.Point(0, 40);
            this.dgvDanhSachPhong.Margin = new System.Windows.Forms.Padding(4);
            this.dgvDanhSachPhong.Name = "dgvDanhSachPhong";
            this.dgvDanhSachPhong.RowHeadersWidth = 62;
            this.dgvDanhSachPhong.Size = new System.Drawing.Size(987, 206);
            this.dgvDanhSachPhong.TabIndex = 0;
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnCapNhap);
            this.groupBox4.Controls.Add(this.btnXoaPhong);
            this.groupBox4.Controls.Add(this.btnThemPhong);
            this.groupBox4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox4.Location = new System.Drawing.Point(303, 272);
            this.groupBox4.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox4.Size = new System.Drawing.Size(640, 113);
            this.groupBox4.TabIndex = 74;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Thanh công cụ";
            // 
            // btnCapNhap
            // 
            this.btnCapNhap.BorderRadius = 5;
            this.btnCapNhap.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhap.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnCapNhap.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnCapNhap.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnCapNhap.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCapNhap.ForeColor = System.Drawing.Color.White;
            this.btnCapNhap.Location = new System.Drawing.Point(456, 43);
            this.btnCapNhap.Margin = new System.Windows.Forms.Padding(4);
            this.btnCapNhap.Name = "btnCapNhap";
            this.btnCapNhap.Size = new System.Drawing.Size(139, 53);
            this.btnCapNhap.TabIndex = 2;
            this.btnCapNhap.Text = "Cập nhật";
            // 
            // btnXoaPhong
            // 
            this.btnXoaPhong.BorderRadius = 5;
            this.btnXoaPhong.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXoaPhong.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXoaPhong.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXoaPhong.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXoaPhong.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoaPhong.ForeColor = System.Drawing.Color.White;
            this.btnXoaPhong.Location = new System.Drawing.Point(252, 43);
            this.btnXoaPhong.Margin = new System.Windows.Forms.Padding(4);
            this.btnXoaPhong.Name = "btnXoaPhong";
            this.btnXoaPhong.Size = new System.Drawing.Size(139, 53);
            this.btnXoaPhong.TabIndex = 1;
            this.btnXoaPhong.Text = "Xóa";
            // 
            // btnThemPhong
            // 
            this.btnThemPhong.BorderRadius = 5;
            this.btnThemPhong.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemPhong.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemPhong.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemPhong.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemPhong.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemPhong.ForeColor = System.Drawing.Color.White;
            this.btnThemPhong.Location = new System.Drawing.Point(37, 43);
            this.btnThemPhong.Margin = new System.Windows.Forms.Padding(4);
            this.btnThemPhong.Name = "btnThemPhong";
            this.btnThemPhong.Size = new System.Drawing.Size(139, 53);
            this.btnThemPhong.TabIndex = 0;
            this.btnThemPhong.Text = "Thêm";
            // 
            // radPhongBenh
            // 
            this.radPhongBenh.AutoSize = true;
            this.radPhongBenh.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radPhongBenh.Location = new System.Drawing.Point(817, 203);
            this.radPhongBenh.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.radPhongBenh.Name = "radPhongBenh";
            this.radPhongBenh.Size = new System.Drawing.Size(118, 24);
            this.radPhongBenh.TabIndex = 73;
            this.radPhongBenh.Text = "Phòng bệnh";
            this.radPhongBenh.UseVisualStyleBackColor = true;
            // 
            // radPhongChucNang
            // 
            this.radPhongChucNang.AutoSize = true;
            this.radPhongChucNang.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radPhongChucNang.Location = new System.Drawing.Point(619, 203);
            this.radPhongChucNang.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.radPhongChucNang.Name = "radPhongChucNang";
            this.radPhongChucNang.Size = new System.Drawing.Size(159, 24);
            this.radPhongChucNang.TabIndex = 72;
            this.radPhongChucNang.Text = "Phòng chức năng";
            this.radPhongChucNang.UseVisualStyleBackColor = true;
            // 
            // radPhongKham
            // 
            this.radPhongKham.AutoSize = true;
            this.radPhongKham.Checked = true;
            this.radPhongKham.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radPhongKham.Location = new System.Drawing.Point(461, 203);
            this.radPhongKham.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.radPhongKham.Name = "radPhongKham";
            this.radPhongKham.Size = new System.Drawing.Size(122, 24);
            this.radPhongKham.TabIndex = 71;
            this.radPhongKham.TabStop = true;
            this.radPhongKham.Text = "Phòng khám";
            this.radPhongKham.UseVisualStyleBackColor = true;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label14.Location = new System.Drawing.Point(337, 206);
            this.label14.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(101, 20);
            this.label14.TabIndex = 70;
            this.label14.Text = "Loại phòng";
            // 
            // txtSoLuongGiuong
            // 
            this.txtSoLuongGiuong.BorderColor = System.Drawing.Color.Black;
            this.txtSoLuongGiuong.BorderRadius = 3;
            this.txtSoLuongGiuong.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtSoLuongGiuong.DefaultText = "";
            this.txtSoLuongGiuong.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtSoLuongGiuong.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtSoLuongGiuong.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtSoLuongGiuong.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtSoLuongGiuong.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtSoLuongGiuong.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtSoLuongGiuong.ForeColor = System.Drawing.Color.Black;
            this.txtSoLuongGiuong.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtSoLuongGiuong.Location = new System.Drawing.Point(666, 59);
            this.txtSoLuongGiuong.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtSoLuongGiuong.Name = "txtSoLuongGiuong";
            this.txtSoLuongGiuong.PasswordChar = '\0';
            this.txtSoLuongGiuong.PlaceholderText = "";
            this.txtSoLuongGiuong.SelectedText = "";
            this.txtSoLuongGiuong.Size = new System.Drawing.Size(405, 28);
            this.txtSoLuongGiuong.TabIndex = 69;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label13.Location = new System.Drawing.Point(662, 27);
            this.label13.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(143, 20);
            this.label13.TabIndex = 68;
            this.label13.Text = "Số lượng giường";
            // 
            // txtTenPhong
            // 
            this.txtTenPhong.BorderColor = System.Drawing.Color.Black;
            this.txtTenPhong.BorderRadius = 3;
            this.txtTenPhong.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtTenPhong.DefaultText = "";
            this.txtTenPhong.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtTenPhong.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtTenPhong.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTenPhong.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtTenPhong.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTenPhong.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtTenPhong.ForeColor = System.Drawing.Color.Black;
            this.txtTenPhong.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtTenPhong.Location = new System.Drawing.Point(210, 143);
            this.txtTenPhong.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTenPhong.Name = "txtTenPhong";
            this.txtTenPhong.PasswordChar = '\0';
            this.txtTenPhong.PlaceholderText = "";
            this.txtTenPhong.SelectedText = "";
            this.txtTenPhong.Size = new System.Drawing.Size(405, 28);
            this.txtTenPhong.TabIndex = 67;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label10.Location = new System.Drawing.Point(205, 110);
            this.label10.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(96, 20);
            this.label10.TabIndex = 66;
            this.label10.Text = "Tên phòng";
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
            this.cboKhoa.Location = new System.Drawing.Point(666, 143);
            this.cboKhoa.Margin = new System.Windows.Forms.Padding(4);
            this.cboKhoa.Name = "cboKhoa";
            this.cboKhoa.Size = new System.Drawing.Size(408, 36);
            this.cboKhoa.TabIndex = 65;
            // 
            // txtMaPhong
            // 
            this.txtMaPhong.BorderColor = System.Drawing.Color.Black;
            this.txtMaPhong.BorderRadius = 3;
            this.txtMaPhong.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaPhong.DefaultText = "";
            this.txtMaPhong.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaPhong.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaPhong.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaPhong.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaPhong.Enabled = false;
            this.txtMaPhong.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaPhong.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMaPhong.ForeColor = System.Drawing.Color.Black;
            this.txtMaPhong.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaPhong.Location = new System.Drawing.Point(210, 59);
            this.txtMaPhong.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtMaPhong.Name = "txtMaPhong";
            this.txtMaPhong.PasswordChar = '\0';
            this.txtMaPhong.PlaceholderText = "";
            this.txtMaPhong.ReadOnly = true;
            this.txtMaPhong.SelectedText = "";
            this.txtMaPhong.Size = new System.Drawing.Size(405, 28);
            this.txtMaPhong.TabIndex = 64;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label11.Location = new System.Drawing.Point(662, 110);
            this.label11.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(51, 20);
            this.label11.TabIndex = 63;
            this.label11.Text = "Khoa";
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label12.Location = new System.Drawing.Point(206, 27);
            this.label12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(90, 20);
            this.label12.TabIndex = 62;
            this.label12.Text = "Mã phòng";
            // 
            // frmPhong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1257, 679);
            this.Controls.Add(this.guna2GroupBox6);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.radPhongBenh);
            this.Controls.Add(this.radPhongChucNang);
            this.Controls.Add(this.radPhongKham);
            this.Controls.Add(this.label14);
            this.Controls.Add(this.txtSoLuongGiuong);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txtTenPhong);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.cboKhoa);
            this.Controls.Add(this.txtMaPhong);
            this.Controls.Add(this.label11);
            this.Controls.Add(this.label12);
            this.Name = "frmPhong";
            this.Text = "Phòng";
            this.guna2GroupBox6.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDanhSachPhong)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2GroupBox guna2GroupBox6;
        private System.Windows.Forms.DataGridView dgvDanhSachPhong;
        private System.Windows.Forms.GroupBox groupBox4;
        private Guna.UI2.WinForms.Guna2Button btnCapNhap;
        private Guna.UI2.WinForms.Guna2Button btnXoaPhong;
        private Guna.UI2.WinForms.Guna2Button btnThemPhong;
        private System.Windows.Forms.RadioButton radPhongBenh;
        private System.Windows.Forms.RadioButton radPhongChucNang;
        private System.Windows.Forms.RadioButton radPhongKham;
        private System.Windows.Forms.Label label14;
        private Guna.UI2.WinForms.Guna2TextBox txtSoLuongGiuong;
        private System.Windows.Forms.Label label13;
        private Guna.UI2.WinForms.Guna2TextBox txtTenPhong;
        private System.Windows.Forms.Label label10;
        private Guna.UI2.WinForms.Guna2ComboBox cboKhoa;
        private Guna.UI2.WinForms.Guna2TextBox txtMaPhong;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label12;
    }
}