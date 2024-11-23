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
    public class BUS_ChucVu
    {
        private static BUS_ChucVu instance;
        private DAL_ChucVu dal_chucvu = new DAL_ChucVu();
        public static BUS_ChucVu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_ChucVu();
                }
                return instance;
            }
        }

        // Hiển thị danh sách lên DataGridView
        public void HienThiDSChucVu(DataGridView dgvDSCV)
        {
            dgvDSCV.DataSource = dal_chucvu.HienThiDSChucVu();
        }
        //Thêm chức vụ
        public void ThemChucVu(ET_ChucVu etChucVu)
        {
            if (dal_chucvu.ThemChucVu(etChucVu) == false)
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
        //Xóa chức vụ
        public void XoaChucVu(DataGridView dgvDSChucVu)
        {
            if (dal_chucvu.XoaChucVu(dgvDSChucVu.CurrentRow.Cells[0].Value.ToString()) == true)
            {
                // Hiện lên thông báo khi xóa thành công
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Hiện lên thông báo khi xóa không thành công
                MessageBox.Show("Dữ liệu đang được đối chiếu !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //Sửa chức vụ
        public void SuaChucVu(ET_ChucVu etChucVu)
        {
            if (dal_chucvu.SuaChucVu(etChucVu))
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "THÔNG BÁO", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        //Tạo mã tự động
        public string TaoMaChucVuTuDong()
        {
            return dal_chucvu.TaoMaChucVuTuDong();
        }
    }
}
