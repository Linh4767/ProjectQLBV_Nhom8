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
        private DAL_Phong dal_phong = new DAL_Phong();
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
        public void HienThiDSPhong(DataGridView dgvDSPhong, string maKhoa, string loaiPhong)
        {
            dgvDSPhong.DataSource = dal_phong.HienThiDSPhong(maKhoa, loaiPhong);
        }
        //Đổ dữ liệu khoa lên combobox
        public void DoDLKhoaLenComboBox(ComboBox cboKhoa)
        {
            // Gán DataSource cho ComboBox
            cboKhoa.DataSource = dal_phong.DoDuLieuLenCB();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "HienThi";
        }
        //Thêm phòng
        public void ThemPhong(ET_Phong etPhong)
        {
            if (dal_phong.ThemPhong(etPhong) == false)
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
            if (dal_phong.XoaPhong(dgvDSPhong.CurrentRow.Cells[0].Value.ToString()) == true)
            {
                // Hiện lên thông báo khi xóa thành công
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Hiện lên thông báo khi xóa không thành công
                MessageBox.Show("Xóa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        //Sửa phòng
        public void SuaPhong(ET_Phong etPhong)
        {
            if (dal_phong.SuaPhong(etPhong) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        //Lay ten khoa nho ma khoa
        public string LayTenKhoaNhoMaKhoa(string maKhoa)
        {
            return dal_phong.LayTenKhoaNhoMaKhoa(maKhoa);
        }
        //Tạo mã tự động
        public string TaoMaPhongTuDong(string tenKhoa)
        {
            return dal_phong.TaoMaPhongTuDong(tenKhoa);
        }
        public void TimKiemPhong(string keyword,string loaiPhong,string khoa, DataGridView dgv)
        {
            dgv.DataSource = dal_phong.TimKiemPhong(keyword,loaiPhong,khoa) ;
        }
    }
}

