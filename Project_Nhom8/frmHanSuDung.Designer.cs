namespace Project_Nhom8
{
    partial class frmHanSuDung
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
            this.label3 = new System.Windows.Forms.Label();
            this.dgvHSD = new Guna.UI2.WinForms.Guna2DataGridView();
            this.btnTimKiem = new Guna.UI2.WinForms.Guna2Button();
            this.txtTimKiem = new Guna.UI2.WinForms.Guna2TextBox();
            this.btnXemThuocGanHH = new Guna.UI2.WinForms.Guna2Button();
            this.btnXemThuocHH = new Guna.UI2.WinForms.Guna2Button();
            this.btnXoaSLThuoc = new Guna.UI2.WinForms.Guna2Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvHSD)).BeginInit();
            this.SuspendLayout();
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(436, 30);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(431, 36);
            this.label3.TabIndex = 193;
            this.label3.Text = "Quản Lý Hạn Sử Dụng Thuốc";
            // 
            // dgvHSD
            // 
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.White;
            this.dgvHSD.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle1;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvHSD.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvHSD.ColumnHeadersHeight = 4;
            this.dgvHSD.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvHSD.DefaultCellStyle = dataGridViewCellStyle3;
            this.dgvHSD.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvHSD.Location = new System.Drawing.Point(52, 235);
            this.dgvHSD.Name = "dgvHSD";
            this.dgvHSD.RowHeadersVisible = false;
            this.dgvHSD.RowHeadersWidth = 51;
            this.dgvHSD.RowTemplate.Height = 24;
            this.dgvHSD.Size = new System.Drawing.Size(1374, 415);
            this.dgvHSD.TabIndex = 194;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.Font = null;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.ForeColor = System.Drawing.Color.Empty;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.SelectionBackColor = System.Drawing.Color.Empty;
            this.dgvHSD.ThemeStyle.AlternatingRowsStyle.SelectionForeColor = System.Drawing.Color.Empty;
            this.dgvHSD.ThemeStyle.BackColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvHSD.ThemeStyle.HeaderStyle.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(100)))), ((int)(((byte)(88)))), ((int)(((byte)(255)))));
            this.dgvHSD.ThemeStyle.HeaderStyle.BorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvHSD.ThemeStyle.HeaderStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvHSD.ThemeStyle.HeaderStyle.ForeColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.HeaderStyle.HeaightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.EnableResizing;
            this.dgvHSD.ThemeStyle.HeaderStyle.Height = 4;
            this.dgvHSD.ThemeStyle.ReadOnly = false;
            this.dgvHSD.ThemeStyle.RowsStyle.BackColor = System.Drawing.Color.White;
            this.dgvHSD.ThemeStyle.RowsStyle.BorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            this.dgvHSD.ThemeStyle.RowsStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvHSD.ThemeStyle.RowsStyle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvHSD.ThemeStyle.RowsStyle.Height = 24;
            this.dgvHSD.ThemeStyle.RowsStyle.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(229)))), ((int)(((byte)(255)))));
            this.dgvHSD.ThemeStyle.RowsStyle.SelectionForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(71)))), ((int)(((byte)(69)))), ((int)(((byte)(94)))));
            this.dgvHSD.Click += new System.EventHandler(this.dgvHSD_Click);
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
            this.btnTimKiem.Location = new System.Drawing.Point(1290, 186);
            this.btnTimKiem.Margin = new System.Windows.Forms.Padding(4);
            this.btnTimKiem.Name = "btnTimKiem";
            this.btnTimKiem.Size = new System.Drawing.Size(136, 33);
            this.btnTimKiem.TabIndex = 195;
            this.btnTimKiem.Text = "Tìm Kiếm";
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
            this.txtTimKiem.Location = new System.Drawing.Point(953, 186);
            this.txtTimKiem.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.PasswordChar = '\0';
            this.txtTimKiem.PlaceholderForeColor = System.Drawing.Color.Gray;
            this.txtTimKiem.PlaceholderText = "Nhập tên thuốc";
            this.txtTimKiem.SelectedText = "";
            this.txtTimKiem.Size = new System.Drawing.Size(332, 33);
            this.txtTimKiem.TabIndex = 196;
            // 
            // btnXemThuocGanHH
            // 
            this.btnXemThuocGanHH.BackColor = System.Drawing.Color.Transparent;
            this.btnXemThuocGanHH.BorderRadius = 5;
            this.btnXemThuocGanHH.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThuocGanHH.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThuocGanHH.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemThuocGanHH.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemThuocGanHH.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnXemThuocGanHH.ForeColor = System.Drawing.Color.White;
            this.btnXemThuocGanHH.Location = new System.Drawing.Point(52, 126);
            this.btnXemThuocGanHH.Margin = new System.Windows.Forms.Padding(4);
            this.btnXemThuocGanHH.Name = "btnXemThuocGanHH";
            this.btnXemThuocGanHH.Size = new System.Drawing.Size(269, 46);
            this.btnXemThuocGanHH.TabIndex = 197;
            this.btnXemThuocGanHH.Text = "Xem Thuốc Gần Hết Hạn";
            this.btnXemThuocGanHH.Click += new System.EventHandler(this.btnXemThuocGanHH_Click);
            // 
            // btnXemThuocHH
            // 
            this.btnXemThuocHH.BackColor = System.Drawing.Color.Transparent;
            this.btnXemThuocHH.BorderRadius = 5;
            this.btnXemThuocHH.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThuocHH.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXemThuocHH.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXemThuocHH.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXemThuocHH.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnXemThuocHH.ForeColor = System.Drawing.Color.White;
            this.btnXemThuocHH.Location = new System.Drawing.Point(52, 180);
            this.btnXemThuocHH.Margin = new System.Windows.Forms.Padding(4);
            this.btnXemThuocHH.Name = "btnXemThuocHH";
            this.btnXemThuocHH.Size = new System.Drawing.Size(269, 46);
            this.btnXemThuocHH.TabIndex = 198;
            this.btnXemThuocHH.Text = "Xem Thuốc Hết Hạn";
            this.btnXemThuocHH.Click += new System.EventHandler(this.btnXemThuocHH_Click);
            // 
            // btnXoaSLThuoc
            // 
            this.btnXoaSLThuoc.BackColor = System.Drawing.Color.Transparent;
            this.btnXoaSLThuoc.BorderRadius = 5;
            this.btnXoaSLThuoc.DisabledState.BorderColor = System.Drawing.Color.DarkGray;
            this.btnXoaSLThuoc.DisabledState.CustomBorderColor = System.Drawing.Color.DarkGray;
            this.btnXoaSLThuoc.DisabledState.FillColor = System.Drawing.Color.FromArgb(((int)(((byte)(169)))), ((int)(((byte)(169)))), ((int)(((byte)(169)))));
            this.btnXoaSLThuoc.DisabledState.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(141)))), ((int)(((byte)(141)))), ((int)(((byte)(141)))));
            this.btnXoaSLThuoc.Enabled = false;
            this.btnXoaSLThuoc.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Bold);
            this.btnXoaSLThuoc.ForeColor = System.Drawing.Color.White;
            this.btnXoaSLThuoc.Location = new System.Drawing.Point(374, 180);
            this.btnXoaSLThuoc.Margin = new System.Windows.Forms.Padding(4);
            this.btnXoaSLThuoc.Name = "btnXoaSLThuoc";
            this.btnXoaSLThuoc.Size = new System.Drawing.Size(178, 46);
            this.btnXoaSLThuoc.TabIndex = 199;
            this.btnXoaSLThuoc.Text = "Xóa SL Thuốc";
            this.btnXoaSLThuoc.Click += new System.EventHandler(this.btnXoaSLThuoc_Click);
            // 
            // frmHanSuDung
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1482, 794);
            this.Controls.Add(this.btnXoaSLThuoc);
            this.Controls.Add(this.btnXemThuocHH);
            this.Controls.Add(this.btnXemThuocGanHH);
            this.Controls.Add(this.btnTimKiem);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.dgvHSD);
            this.Controls.Add(this.label3);
            this.Name = "frmHanSuDung";
            this.Text = "Hạn Sử Dụng";
            this.Load += new System.EventHandler(this.frmHanSuDung_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvHSD)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label3;
        private Guna.UI2.WinForms.Guna2DataGridView dgvHSD;
        private Guna.UI2.WinForms.Guna2Button btnTimKiem;
        private Guna.UI2.WinForms.Guna2TextBox txtTimKiem;
        private Guna.UI2.WinForms.Guna2Button btnXemThuocGanHH;
        private Guna.UI2.WinForms.Guna2Button btnXemThuocHH;
        private Guna.UI2.WinForms.Guna2Button btnXoaSLThuoc;
    }
}