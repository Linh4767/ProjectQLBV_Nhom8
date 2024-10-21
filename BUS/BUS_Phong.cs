using DAL;
using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BUS
{
    public class BUS_Phong
    {
        private static BUS_Phong instance;
        public static BUS_Phong Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_Phong();
                }
                return instance;
            }
        }
        // Hiển thị danh sách lên DataGridView
        public void HienThiDSPhong(DataGridView dgvDSPhong, string maKhoa)
        {
            dgvDSPhong.DataSource = DAL_Phong.Instance.HienThiDSPhong(maKhoa);
        }
        //Đổ dữ liệu khoa lên combobox
        public void DoDLKhoaLenComboBox(ComboBox cboKhoa)
        {
            // Gán DataSource cho ComboBox
            cboKhoa.DataSource = DAL_Phong.Instance.DoDuLieuLenCB();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "HienThi";
        }
        //Thêm phòng
        public void ThemPhong(ET_Phong etPhong)
        {
            if (DAL_Phong.Instance.ThemPhong(etPhong) == false)
            {
                // Khi mã hoặc tên trùng sẽ hiển thị thông báo 
                MessageBox.Show("Dữ liệu đã có trong hệ thống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                // Khi thêm thành công sẽ hiển thị thông báo này
                MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa phòng
        public void XoaPhong(DataGridView dgvDSPhong)
        {
            if (DAL_Phong.Instance.XoaPhong(dgvDSPhong.CurrentRow.Cells[0].Value.ToString()) == true)
            {
                // Hiện lên thông báo khi xóa thành công
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Hiện lên thông báo khi xóa không thành công
                MessageBox.Show("Dữ liệu đang được đối chiếu !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        //Sửa phòng
        public void SuaPhong(ET_Phong etPhong)
        {
            if (DAL_Phong.Instance.SuaPhong(etPhong) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        //Tạo mã tự động
        public string TaoMaPhongTuDong()
        {
            return DAL_Phong.Instance.TaoMaPhongTuDong();
        }
        public void TimKiemPhong(string keyword, DataGridView dgv)
        {
            dgv.DataSource = DAL_Phong.Instance.TimKiemPhong(keyword);
        }
    }
}
