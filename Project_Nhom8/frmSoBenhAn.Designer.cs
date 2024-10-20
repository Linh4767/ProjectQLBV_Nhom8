namespace Project_Nhom8
{
    partial class frmSoBenhAn
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
            this.txtBenhNhan = new Guna.UI2.WinForms.Guna2TextBox();
            this.tcDanhSachHoSoBA = new System.Windows.Forms.TabControl();
            this.tpDSHoSoBA = new System.Windows.Forms.TabPage();
            this.guna2GroupBox7 = new Guna.UI2.WinForms.Guna2GroupBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.groupBox7 = new System.Windows.Forms.GroupBox();
            this.btnPhieuKB = new Guna.UI2.WinForms.Guna2Button();
            this.btnSuaSBA = new Guna.UI2.WinForms.Guna2Button();
            this.btnThemSBA = new Guna.UI2.WinForms.Guna2Button();
            this.txtBenhNen = new Guna.UI2.WinForms.Guna2TextBox();
            this.txtMaSoBA = new Guna.UI2.WinForms.Guna2TextBox();
            this.label34 = new System.Windows.Forms.Label();
            this.dtpNgayLapSo = new Guna.UI2.WinForms.Guna2DateTimePicker();
            this.label32 = new System.Windows.Forms.Label();
            this.label33 = new System.Windows.Forms.Label();
            this.label37 = new System.Windows.Forms.Label();
            this.tcDanhSachHoSoBA.SuspendLayout();
            this.tpDSHoSoBA.SuspendLayout();
            this.guna2GroupBox7.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox7.SuspendLayout();
            this.SuspendLayout();
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
            this.txtBenhNhan.Location = new System.Drawing.Point(687, 49);
            this.txtBenhNhan.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtBenhNhan.Name = "txtBenhNhan";
            this.txtBenhNhan.PasswordChar = '\0';
            this.txtBenhNhan.PlaceholderText = "";
            this.txtBenhNhan.ReadOnly = true;
            this.txtBenhNhan.SelectedText = "";
            this.txtBenhNhan.Size = new System.Drawing.Size(405, 28);
            this.txtBenhNhan.TabIndex = 109;
            // 
            // tcDanhSachHoSoBA
            // 
            this.tcDanhSachHoSoBA.Controls.Add(this.tpDSHoSoBA);
            this.tcDanhSachHoSoBA.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tcDanhSachHoSoBA.Location = new System.Drawing.Point(147, 385);
            this.tcDanhSachHoSoBA.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.tcDanhSachHoSoBA.Name = "tcDanhSachHoSoBA";
            this.tcDanhSachHoSoBA.SelectedIndex = 0;
            this.tcDanhSachHoSoBA.Size = new System.Drawing.Size(1093, 348);
            this.tcDanhSachHoSoBA.TabIndex = 108;
            // 
            // tpDSHoSoBA
            // 
            this.tpDSHoSoBA.Controls.Add(this.guna2GroupBox7);
            this.tpDSHoSoBA.Location = new System.Drawing.Point(4, 29);
            this.tpDSHoSoBA.Margin = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.tpDSHoSoBA.Name = "tpDSHoSoBA";
            this.tpDSHoSoBA.Padding = new System.Windows.Forms.Padding(3, 1, 3, 1);
            this.tpDSHoSoBA.Size = new System.Drawing.Size(1085, 315);
            this.tpDSHoSoBA.TabIndex = 0;
            this.tpDSHoSoBA.Text = "Danh sách hồ sơ bệnh án";
            this.tpDSHoSoBA.UseVisualStyleBackColor = true;
            // 
            // guna2GroupBox7
            // 
            this.guna2GroupBox7.Controls.Add(this.dataGridView1);
            this.guna2GroupBox7.CustomBorderColor = System.Drawing.Color.SteelBlue;
            this.guna2GroupBox7.Dock = System.Windows.Forms.DockStyle.Fill;
            this.guna2GroupBox7.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.guna2GroupBox7.ForeColor = System.Drawing.Color.White;
            this.guna2GroupBox7.Location = new System.Drawing.Point(3, 1);
            this.guna2GroupBox7.Margin = new System.Windows.Forms.Padding(4);
            this.guna2GroupBox7.Name = "guna2GroupBox7";
            this.guna2GroupBox7.Size = new System.Drawing.Size(1079, 313);
            this.guna2GroupBox7.TabIndex = 84;
            this.guna2GroupBox7.Text = "Danh sách sổ bệnh án";
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.Color.White;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.GridColor = System.Drawing.Color.DarkGray;
            this.dataGridView1.Location = new System.Drawing.Point(0, 40);
            this.dataGridView1.Margin = new System.Windows.Forms.Padding(4);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 62;
            this.dataGridView1.Size = new System.Drawing.Size(1079, 273);
            this.dataGridView1.TabIndex = 0;
            // 
            // groupBox7
            // 
            this.groupBox7.Controls.Add(this.btnPhieuKB);
            this.groupBox7.Controls.Add(this.btnSuaSBA);
            this.groupBox7.Controls.Add(this.btnThemSBA);
            this.groupBox7.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.groupBox7.Location = new System.Drawing.Point(685, 205);
            this.groupBox7.Margin = new System.Windows.Forms.Padding(4);
            this.groupBox7.Name = "groupBox7";
            this.groupBox7.Padding = new System.Windows.Forms.Padding(4);
            this.groupBox7.Size = new System.Drawing.Size(407, 155);
            this.groupBox7.TabIndex = 107;
            this.groupBox7.TabStop = false;
            this.groupBox7.Text = "Thanh công cụ";
            // 
            // btnPhieuKB
            // 
            this.btnPhieuKB.BorderRadius = 5;
            this.btnPhieuKB.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnPhieuKB.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnPhieuKB.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnPhieuKB.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnPhieuKB.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.btnPhieuKB.ForeColor = System.Drawing.Color.White;
            this.btnPhieuKB.Location = new System.Drawing.Point(95, 91);
            this.btnPhieuKB.Margin = new System.Windows.Forms.Padding(4);
            this.btnPhieuKB.Name = "btnPhieuKB";
            this.btnPhieuKB.Size = new System.Drawing.Size(228, 53);
            this.btnPhieuKB.TabIndex = 3;
            this.btnPhieuKB.Text = "Phiếu khám bệnh";
            // 
            // btnSuaSBA
            // 
            this.btnSuaSBA.BorderRadius = 5;
            this.btnSuaSBA.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaSBA.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnSuaSBA.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnSuaSBA.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnSuaSBA.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSuaSBA.ForeColor = System.Drawing.Color.White;
            this.btnSuaSBA.Location = new System.Drawing.Point(244, 31);
            this.btnSuaSBA.Margin = new System.Windows.Forms.Padding(4);
            this.btnSuaSBA.Name = "btnSuaSBA";
            this.btnSuaSBA.Size = new System.Drawing.Size(139, 53);
            this.btnSuaSBA.TabIndex = 2;
            this.btnSuaSBA.Text = "Cập nhật";
            // 
            // btnThemSBA
            // 
            this.btnThemSBA.BorderRadius = 5;
            this.btnThemSBA.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnThemSBA.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnThemSBA.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnThemSBA.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnThemSBA.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThemSBA.ForeColor = System.Drawing.Color.White;
            this.btnThemSBA.Location = new System.Drawing.Point(33, 31);
            this.btnThemSBA.Margin = new System.Windows.Forms.Padding(4);
            this.btnThemSBA.Name = "btnThemSBA";
            this.btnThemSBA.Size = new System.Drawing.Size(139, 53);
            this.btnThemSBA.TabIndex = 0;
            this.btnThemSBA.Text = "Thêm";
            // 
            // txtBenhNen
            // 
            this.txtBenhNen.BorderColor = System.Drawing.Color.Black;
            this.txtBenhNen.BorderRadius = 3;
            this.txtBenhNen.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtBenhNen.DefaultText = "";
            this.txtBenhNen.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtBenhNen.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtBenhNen.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtBenhNen.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtBenhNen.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBenhNen.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtBenhNen.ForeColor = System.Drawing.Color.Black;
            this.txtBenhNen.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtBenhNen.Location = new System.Drawing.Point(230, 133);
            this.txtBenhNen.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtBenhNen.Multiline = true;
            this.txtBenhNen.Name = "txtBenhNen";
            this.txtBenhNen.PasswordChar = '\0';
            this.txtBenhNen.PlaceholderText = "";
            this.txtBenhNen.SelectedText = "";
            this.txtBenhNen.Size = new System.Drawing.Size(405, 228);
            this.txtBenhNen.TabIndex = 106;
            // 
            // txtMaSoBA
            // 
            this.txtMaSoBA.BorderColor = System.Drawing.Color.Black;
            this.txtMaSoBA.BorderRadius = 3;
            this.txtMaSoBA.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.txtMaSoBA.DefaultText = "";
            this.txtMaSoBA.DisabledState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(208)))), ((int)(((byte)(208)))), ((int)(((byte)(208)))));
            this.txtMaSoBA.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(226)))), ((int)(((byte)(226)))), ((int)(((byte)(226)))));
            this.txtMaSoBA.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaSoBA.DisabledState.PlaceholderForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(138)))), ((int)(((byte)(138)))), ((int)(((byte)(138)))));
            this.txtMaSoBA.Enabled = false;
            this.txtMaSoBA.FocusedState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaSoBA.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.txtMaSoBA.ForeColor = System.Drawing.Color.Black;
            this.txtMaSoBA.HoverState.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(94)))), ((int)(((byte)(148)))), ((int)(((byte)(255)))));
            this.txtMaSoBA.Location = new System.Drawing.Point(230, 49);
            this.txtMaSoBA.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtMaSoBA.Name = "txtMaSoBA";
            this.txtMaSoBA.PasswordChar = '\0';
            this.txtMaSoBA.PlaceholderText = "";
            this.txtMaSoBA.ReadOnly = true;
            this.txtMaSoBA.SelectedText = "";
            this.txtMaSoBA.Size = new System.Drawing.Size(405, 28);
            this.txtMaSoBA.TabIndex = 105;
            // 
            // label34
            // 
            this.label34.AutoSize = true;
            this.label34.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label34.Location = new System.Drawing.Point(230, 16);
            this.label34.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label34.Name = "label34";
            this.label34.Size = new System.Drawing.Size(132, 20);
            this.label34.TabIndex = 104;
            this.label34.Text = "Mã sổ bệnh án";
            // 
            // dtpNgayLapSo
            // 
            this.dtpNgayLapSo.BorderRadius = 3;
            this.dtpNgayLapSo.BorderThickness = 1;
            this.dtpNgayLapSo.Checked = true;
            this.dtpNgayLapSo.Enabled = false;
            this.dtpNgayLapSo.FillColor = System.Drawing.Color.SteelBlue;
            this.dtpNgayLapSo.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.dtpNgayLapSo.ForeColor = System.Drawing.SystemColors.InactiveBorder;
            this.dtpNgayLapSo.Format = System.Windows.Forms.DateTimePickerFormat.Long;
            this.dtpNgayLapSo.Location = new System.Drawing.Point(685, 127);
            this.dtpNgayLapSo.Margin = new System.Windows.Forms.Padding(4);
            this.dtpNgayLapSo.MaxDate = new System.DateTime(9998, 12, 31, 0, 0, 0, 0);
            this.dtpNgayLapSo.MinDate = new System.DateTime(1753, 1, 1, 0, 0, 0, 0);
            this.dtpNgayLapSo.Name = "dtpNgayLapSo";
            this.dtpNgayLapSo.Size = new System.Drawing.Size(407, 37);
            this.dtpNgayLapSo.TabIndex = 103;
            this.dtpNgayLapSo.Value = new System.DateTime(2024, 9, 27, 10, 13, 15, 556);
            // 
            // label32
            // 
            this.label32.AutoSize = true;
            this.label32.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label32.Location = new System.Drawing.Point(683, 96);
            this.label32.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label32.Name = "label32";
            this.label32.Size = new System.Drawing.Size(108, 20);
            this.label32.TabIndex = 102;
            this.label32.Text = "Ngày lập sổ";
            // 
            // label33
            // 
            this.label33.AutoSize = true;
            this.label33.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label33.Location = new System.Drawing.Point(681, 13);
            this.label33.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label33.Name = "label33";
            this.label33.Size = new System.Drawing.Size(98, 20);
            this.label33.TabIndex = 101;
            this.label33.Text = "Bệnh nhân";
            // 
            // label37
            // 
            this.label37.AutoSize = true;
            this.label37.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label37.Location = new System.Drawing.Point(230, 98);
            this.label37.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label37.Name = "label37";
            this.label37.Size = new System.Drawing.Size(88, 20);
            this.label37.TabIndex = 100;
            this.label37.Text = "Bệnh nền";
            // 
            // frmSoBenhAn
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1392, 767);
            this.Controls.Add(this.txtBenhNhan);
            this.Controls.Add(this.tcDanhSachHoSoBA);
            this.Controls.Add(this.groupBox7);
            this.Controls.Add(this.txtBenhNen);
            this.Controls.Add(this.txtMaSoBA);
            this.Controls.Add(this.label34);
            this.Controls.Add(this.dtpNgayLapSo);
            this.Controls.Add(this.label32);
            this.Controls.Add(this.label33);
            this.Controls.Add(this.label37);
            this.Name = "frmSoBenhAn";
            this.Text = "Sổ Bệnh Án";
            this.tcDanhSachHoSoBA.ResumeLayout(false);
            this.tpDSHoSoBA.ResumeLayout(false);
            this.guna2GroupBox7.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox7.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Guna.UI2.WinForms.Guna2TextBox txtBenhNhan;
        private System.Windows.Forms.TabControl tcDanhSachHoSoBA;
        private System.Windows.Forms.TabPage tpDSHoSoBA;
        private Guna.UI2.WinForms.Guna2GroupBox guna2GroupBox7;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.GroupBox groupBox7;
        private Guna.UI2.WinForms.Guna2Button btnPhieuKB;
        private Guna.UI2.WinForms.Guna2Button btnSuaSBA;
        private Guna.UI2.WinForms.Guna2Button btnThemSBA;
        private Guna.UI2.WinForms.Guna2TextBox txtBenhNen;
        private Guna.UI2.WinForms.Guna2TextBox txtMaSoBA;
        private System.Windows.Forms.Label label34;
        private Guna.UI2.WinForms.Guna2DateTimePicker dtpNgayLapSo;
        private System.Windows.Forms.Label label32;
        private System.Windows.Forms.Label label33;
        private System.Windows.Forms.Label label37;
    }
}