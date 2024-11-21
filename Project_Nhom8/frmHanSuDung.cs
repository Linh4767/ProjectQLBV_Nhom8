using BUS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project_Nhom8
{
    public partial class frmHanSuDung : Form
    {
        public frmHanSuDung()
        {
            InitializeComponent();
        }

        private void btnXemThuocGanHH_Click(object sender, EventArgs e)
        {
            BUS_Thuoc.Instance.HienThịThuocSapHetHan(dgvHSD);

        }

        private void frmHanSuDung_Load(object sender, EventArgs e)
        {
            dgvHSD.ColumnHeadersHeight = 40;
        }

        private void btnXemThuocHH_Click(object sender, EventArgs e)
        {
            BUS_Thuoc.Instance.HienThịThuocHetHan(dgvHSD);

        }

        private void btnXoaSLThuoc_Click(object sender, EventArgs e)
        {
            // Danh sách thuốc cần xóa (chứa cặp mã thuốc và mã lô)
            var danhSachThuoc = new List<Tuple<string, string>>();

            // Duyệt qua các dòng đã chọn trong DataGridView
            foreach (DataGridViewRow row in dgvHSD.SelectedRows)
            {
                string maThuoc = row.Cells["MaThuoc"].Value.ToString(); // Lấy mã thuốc từ cột MaThuoc
                string maLo = row.Cells["MaLo"].Value.ToString(); // Lấy mã lô từ cột MaLo

                // Thêm vào danh sách thuốc cần xóa
                danhSachThuoc.Add(new Tuple<string, string>(maThuoc, maLo));
            }

            // Kiểm tra nếu không có dòng nào được chọn
            if (danhSachThuoc.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn ít nhất một thuốc để xóa.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Gọi phương thức XoaNhieuThuocTrongKho từ BUS_KhoThuoc để xóa các thuốc đã chọn
            int soLuongThuocXoa = BUS_KhoThuoc.Instance.XoaNhieuThuocTrongKho(danhSachThuoc);

            // Kiểm tra kết quả trả về
            if (soLuongThuocXoa > 0)
            {
                MessageBox.Show($"Đã xóa thành công {soLuongThuocXoa} thuốc khỏi kho!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // Cập nhật lại giao diện, ví dụ như hiển thị lại danh sách thuốc trong kho
                BUS_Thuoc.Instance.HienThiThuoc(dgvHSD);
            }
            else
            {
                MessageBox.Show("Không thể xóa thuốc!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void dgvHSD_Click(object sender, EventArgs e)
        {
            btnXoaSLThuoc.Enabled = true;
        }
    }
}
