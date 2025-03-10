using BUS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project_Nhom8
{
    public partial class frmKetNoi : Form
    {
        public frmKetNoi()
        {
            InitializeComponent();
        }
        Connection_BUS busData = new Connection_BUS();
        private void frmKetNoi_Load(object sender, EventArgs e)
        {
            this.BackgroundImageLayout = ImageLayout.Stretch;
            //pnlOverlay.BackColor = Color.FromArgb(150, 0, 0, 0);
            pnlOverlay.BackColor = Color.FromArgb(150, pnlOverlay.BackColor);
            //pnlOverlay.BackColor = Color.FromArgb(170, 255, 255, 255);
            ////pnlLogin.BackColor = Color.FromArgb(255, 255, 255);
            //pnlLogin.BackColor = Color.FromArgb(150, 0, 0, 0);
            //pnlLogin.BackColor = Color.FromArgb(200, 255, 255, 255);
            pnlLogin.BackColor = Color.FromArgb(200, pnlLogin.BackColor);
            btnThoat.FillColor = Color.FromArgb(255, 69, 0);
            btnKetNoi.FillColor = System.Drawing.ColorTranslator.FromHtml("#0080FF");
            //btnKetNoi.Enabled = false;
            LoadConnectionInfo();
        }

        private void btnKetNoi_Click(object sender, EventArgs e)
        {
            string sql = "Data Source=" + txtServerName.Text + ";Initial Catalog=" + cboDSDatabase.Text + ";Integrated Security=True;Encrypt=True;TrustServerCertificate=True";

            if (cboDSDatabase.Text != "" && txtServerName.Text != "")
            {
                try
                {
                    var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
                    var connectionStringsSection = (ConnectionStringsSection)config.GetSection("connectionStrings");
                    connectionStringsSection.ConnectionStrings["Project_Nhom8.Properties.Settings.QLBVConnectionString"].ConnectionString = sql;
                    config.Save();
                    ConfigurationManager.RefreshSection("connectionStrings");
                    using (SqlConnection conn = new SqlConnection(sql))
                    {
                        try
                        {
                            conn.Open();


                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Có lỗi xảy ra khi cố gắng mở kết nối: " + ex.Message);
                        }
                    }
                    SaveConnectionInfo(txtServerName.Text, cboDSDatabase.Text);
                    busData.setSeverName(txtServerName.Text);
                    busData.setdataName(cboDSDatabase.Text);
                    if (busData.ktDuongDan(txtServerName.Text, cboDSDatabase.Text))
                    {
                        busData.setDataBase();
                        frm_Login menu = new frm_Login();
                        MessageBox.Show("Kết nối thành công!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.Hide();
                        menu.ShowDialog();
                        this.Close();
                    }
                    else
                    {
                        MessageBox.Show("Tên sever không đúng hoặc database không tồn tại!");
                    }

                }
                catch (Exception ex)
                {

                    MessageBox.Show("Xảy ra lỗi: " + ex.Message + "Lỗi kết nối database!!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult a = MessageBox.Show("Hãy chắc chắn rằng bạn muốn thoát chương trình !", "THÔNG BÁO", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (a == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void txtServerName_TextChanged(object sender, EventArgs e)
        {
            // Xác định chuỗi kết nối đến máy chủ
            string serverName = txtServerName.Text; // Lấy tên máy chủ từ textbox
            string connectionString = $"Data Source={serverName};Integrated Security=True;";

            // Tạo kết nối tới máy chủ
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    // Mở kết nối
                    connection.Open();

                    // Tạo và thực thi truy vấn để lấy danh sách cơ sở dữ liệu
                    string query = "SELECT name FROM sys.databases WHERE database_id > 4"; // Lấy danh sách cơ sở dữ liệu không phải là các hệ thống
                    SqlCommand command = new SqlCommand(query, connection);
                    SqlDataReader reader = command.ExecuteReader();

                    // Tạo danh sách để lưu trữ tên cơ sở dữ liệu
                    List<string> databases = new List<string>();

                    // Đọc từng dòng dữ liệu và thêm tên cơ sở dữ liệu vào danh sách
                    while (reader.Read())
                    {
                        string dbName = reader["name"].ToString();
                        databases.Add(dbName);
                    }

                    // Gán danh sách cơ sở dữ liệu vào combobox
                    cboDSDatabase.DataSource = databases;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Có lỗi xảy ra khi lấy danh sách cơ sở dữ liệu: " + ex.Message);
                }
            }
        }
        private void SaveConnectionInfo(string serverName, string databaseName)
        {
            // Lưu thông tin kết nối vào app.config
            var config = ConfigurationManager.OpenExeConfiguration(ConfigurationUserLevel.None);
            var settings = config.AppSettings.Settings;

            if (settings["ServerName"] == null)
            {
                settings.Add("ServerName", serverName);
            }
            else
            {
                settings["ServerName"].Value = serverName;
            }

            if (settings["DatabaseName"] == null)
            {
                settings.Add("DatabaseName", databaseName);
            }
            else
            {
                settings["DatabaseName"].Value = databaseName;
            }

            config.Save(ConfigurationSaveMode.Modified);
            ConfigurationManager.RefreshSection("appSettings");
        }

        private void LoadConnectionInfo()
        {
            // Đọc thông tin từ app.config
            var settings = ConfigurationManager.AppSettings;

            if (settings["ServerName"] != null)
            {
                txtServerName.Text = settings["ServerName"];
            }

            if (settings["DatabaseName"] != null)
            {
                cboDSDatabase.Text = settings["DatabaseName"];
            }
        }

    }
}
