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
            this.cboPhong = new Guna.UI2.WinForms.Guna2ComboBox();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.btnTaiKham = new Guna.UI2.WinForms.Guna2Button();
            this.btnChuanDoan = new Guna.UI2.WinForms.Guna2Button();
            this.btnDKySDDichVu = new Guna.UI2.WinForms.Guna2Button();
            this.btnSuaKB = new Guna.UI2.WinForms.Guna2Button();
            this.btnThemKB = new Guna.UI2.WinForms.Guna2Button();
            this.label19 = new System.Windows.Forms.Label();
            this.label21 = new System.Windows.Forms.Label();
            this.dtpNgayHenTaiKham = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.guna2GroupBox5 = new Guna.UI2.WinForms.Guna2GroupBox();
            this.dgvDSKham = new System.Windows.Forms.DataGridView();
            this.label15 = new System.Windows.Forms.Label();
            this.cboPKB = new Guna.UI2.WinForms.Guna2ComboBox();
            this.cboNVKhamBenh = new Guna.UI2.WinForms.Guna2ComboBox();
            this.dtpNgay = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.groupBox5.SuspendLayout();
            this.guna2GroupBox5.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSKham)).BeginInit();
            this.SuspendLayout();
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
            this.cboPhong.Location = new System.Drawing.Point(646, 99);
            this.cboPhong.Margin = new System.Windows.Forms.Padding(4);
            this.cboPhong.Name = "cboPhong";
            this.cboPhong.Size = new System.Drawing.Size(408, 36);
            this.cboPhong.TabIndex = 78;
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.btnTaiKham);
            this.groupBox5.Controls.Add(this.btnChuanDoan);
            this.groupBox5.Controls.Add(this.btnDKySDDichVu);
            this.groupBox5.Controls.Add(this.btnSuaKB);
            this.groupBox5.Controls.Add(this.btnThemKB);
            this.groupBox5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox5.Location = new System.Drawing.Point(118, 276);
            this.groupBox5.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox5.Size = new System.Drawing.Size(967, 103);
            this.groupBox5.TabIndex = 73;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Thanh công cụ";
            // 
            // btnTaiKham
            // 
            this.btnTaiKham.BorderRadius = 5;
            this.btnTaiKham.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnTaiKham.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnTaiKham.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnTaiKham.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnTaiKham.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnTaiKham.ForeColor = System.Drawing.Color.White;
            this.btnTaiKham.Location = new System.Drawing.Point(821, 30);
            this.btnTaiKham.Margin = new System.Windows.Forms.Padding(4);
            this.btnTaiKham.Name = "btnTaiKham";
            this.btnTaiKham.Size = new System.Drawing.Size(139, 53);
            this.btnTaiKham.TabIndex = 5;
            this.btnTaiKham.Text = "Tái khám";
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
            this.btnChuanDoan.Location = new System.Drawing.Point(625, 30);
            this.btnChuanDoan.Margin = new System.Windows.Forms.Padding(4);
            this.btnChuanDoan.Name = "btnChuanDoan";
            this.btnChuanDoan.Size = new System.Drawing.Size(139, 53);
            this.btnChuanDoan.TabIndex = 4;
            this.btnChuanDoan.Text = "Chuẩn đoán";
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
            this.btnDKySDDichVu.Location = new System.Drawing.Point(433, 30);
            this.btnDKySDDichVu.Margin = new System.Windows.Forms.Padding(4);
            this.btnDKySDDichVu.Name = "btnDKySDDichVu";
            this.btnDKySDDichVu.Size = new System.Drawing.Size(139, 53);
            this.btnDKySDDichVu.TabIndex = 3;
            this.btnDKySDDichVu.Text = "Sử dụng dịch vụ";
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
            this.btnSuaKB.Location = new System.Drawing.Point(231, 30);
            this.btnSuaKB.Margin = new System.Windows.Forms.Padding(4);
            this.btnSuaKB.Name = "btnSuaKB";
            this.btnSuaKB.Size = new System.Drawing.Size(139, 53);
            this.btnSuaKB.TabIndex = 2;
            this.btnSuaKB.Text = "Cập nhật";
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
            this.btnThemKB.Location = new System.Drawing.Point(37, 30);
            this.btnThemKB.Margin = new System.Windows.Forms.Padding(4);
            this.btnThemKB.Name = "btnThemKB";
            this.btnThemKB.Size = new System.Drawing.Size(139, 53);
            this.btnThemKB.TabIndex = 0;
            this.btnThemKB.Text = "Thêm";
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label19.Location = new System.Drawing.Point(643, 65);
            this.label19.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(61, 20);
            this.label19.TabIndex = 77;
            this.label19.Text = "Phòng";
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label21.Location = new System.Drawing.Point(643, 153);
            this.label21.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(164, 20);
            this.label21.TabIndex = 76;
            this.label21.Text = "Ngày hẹn tái khám";
            // 
            // dtpNgayHenTaiKham
            // 
            this.dtpNgayHenTaiKham.BorderRadius = 3;
            this.dtpNgayHenTaiKham.BorderThickness = 1;
            this.dtpNgayHenTaiKham.Checked = true;
            this.dtpNgayHenTaiKham.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayHenTaiKham.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayHenTaiKham.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayHenTaiKham.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgayHenTaiKham.Location = new System.Drawing.Point(647, 187);
            this.dtpNgayHenTaiKham.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgayHenTaiKham.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayHenTaiKham.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayHenTaiKham.Name = "dtpNgayHenTaiKham";
            this.dtpNgayHenTaiKham.Size = new System.Drawing.Size(407, 30);
            this.dtpNgayHenTaiKham.TabIndex = 75;
            this.dtpNgayHenTaiKham.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // guna2GroupBox5
            // 
            this.guna2GroupBox5.Controls.Add(this.dgvDSKham);
            this.guna2GroupBox5.CustomBorderColor = System.Drawing.Color.SteelBlue;
            this.guna2GroupBox5.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.guna2GroupBox5.ForeColor = System.Drawing.Color.White;
            this.guna2GroupBox5.Location = new System.Drawing.Point(94, 433);
            this.guna2GroupBox5.Margin = new System.Windows.Forms.Padding(4);
            this.guna2GroupBox5.Name = "guna2GroupBox5";
            this.guna2GroupBox5.Size = new System.Drawing.Size(1065, 293);
            this.guna2GroupBox5.TabIndex = 74;
            this.guna2GroupBox5.Text = "Danh sách khám";
            // 
            // dgvDSKham
            // 
            this.dgvDSKham.BackgroundColor = System.Drawing.Color.White;
            this.dgvDSKham.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDSKham.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvDSKham.GridColor = System.Drawing.Color.DarkGray;
            this.dgvDSKham.Location = new System.Drawing.Point(0, 40);
            this.dgvDSKham.Margin = new System.Windows.Forms.Padding(4);
            this.dgvDSKham.Name = "dgvDSKham";
            this.dgvDSKham.RowHeadersWidth = 62;
            this.dgvDSKham.Size = new System.Drawing.Size(1065, 253);
            this.dgvDSKham.TabIndex = 0;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label15.Location = new System.Drawing.Point(738, 19);
            this.label15.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(47, 20);
            this.label15.TabIndex = 72;
            this.label15.Text = "Ngày";
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
            this.cboPKB.Location = new System.Drawing.Point(179, 187);
            this.cboPKB.Margin = new System.Windows.Forms.Padding(4);
            this.cboPKB.Name = "cboPKB";
            this.cboPKB.Size = new System.Drawing.Size(408, 36);
            this.cboPKB.TabIndex = 71;
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
            this.cboNVKhamBenh.Location = new System.Drawing.Point(179, 99);
            this.cboNVKhamBenh.Margin = new System.Windows.Forms.Padding(4);
            this.cboNVKhamBenh.Name = "cboNVKhamBenh";
            this.cboNVKhamBenh.Size = new System.Drawing.Size(408, 36);
            this.cboNVKhamBenh.TabIndex = 70;
            // 
            // dtpNgay
            // 
            this.dtpNgay.BorderRadius = 3;
            this.dtpNgay.Checked = true;
            this.dtpNgay.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgay.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgay.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgay.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpNgay.Location = new System.Drawing.Point(803, 13);
            this.dtpNgay.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgay.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgay.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgay.Name = "dtpNgay";
            this.dtpNgay.Size = new System.Drawing.Size(251, 30);
            this.dtpNgay.TabIndex = 69;
            this.dtpNgay.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label16.Location = new System.Drawing.Point(175, 65);
            this.label16.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(142, 20);
            this.label16.TabIndex = 68;
            this.label16.Text = "Nhân viên khám";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label17.Location = new System.Drawing.Point(175, 153);
            this.label17.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(152, 20);
            this.label17.TabIndex = 67;
            this.label17.Text = "Phiếu khám bệnh";
            // 
            // frmKhamBenh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1253, 739);
            this.Controls.Add(this.cboPhong);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.label19);
            this.Controls.Add(this.label21);
            this.Controls.Add(this.dtpNgayHenTaiKham);
            this.Controls.Add(this.guna2GroupBox5);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.cboPKB);
            this.Controls.Add(this.cboNVKhamBenh);
            this.Controls.Add(this.dtpNgay);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.label17);
            this.Name = "frmKhamBenh";
            this.Text = "Khám Bệnh";
            this.groupBox5.ResumeLayout(false);
            this.guna2GroupBox5.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDSKham)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2ComboBox cboPhong;
        private System.Windows.Forms.GroupBox groupBox5;
        private Guna.UI2.WinForms.Guna2Button btnTaiKham;
        private Guna.UI2.WinForms.Guna2Button btnChuanDoan;
        private Guna.UI2.WinForms.Guna2Button btnDKySDDichVu;
        private Guna.UI2.WinForms.Guna2Button btnSuaKB;
        private Guna.UI2.WinForms.Guna2Button btnThemKB;
        private System.Windows.Forms.Label label19;
        private System.Windows.Forms.Label label21;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayHenTaiKham;
        private Guna.UI2.WinForms.Guna2GroupBox guna2GroupBox5;
        private System.Windows.Forms.DataGridView dgvDSKham;
        private System.Windows.Forms.Label label15;
        private Guna.UI2.WinForms.Guna2ComboBox cboPKB;
        private Guna.UI2.WinForms.Guna2ComboBox cboNVKhamBenh;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgay;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Label label17;
    }
}