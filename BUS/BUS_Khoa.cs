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
    public class BUS_Khoa
    {
        public static BUS_Khoa instance;
        private DAL_Khoa dal_khoa = new DAL_Khoa();

        public static BUS_Khoa Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_Khoa();
                }
                return instance;
            }
        }

        //Hiển thị danh sách khoa
        public void HienThiKhoa(DataGridView dgv)
        {
            dgv.DataSource = dal_khoa.HienThiDanhSachKhoa();
        }

        //Tạo mã tự động
        public string TaoMaTuDong()
        {
            return dal_khoa.TaoMaTuDong();
        }

        //Thêm Khoa
        public void ThemKhoa(ET_Khoa et_khoa)
        {
            if (dal_khoa.ThemKhoa(et_khoa) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa Khoa
        public void XoaKhoa(string maKhoa)
        {
            if (dal_khoa.XoaKhoa(maKhoa) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Sửa Khoa
        public void SuaKhoa(ET_Khoa et_khoa)
        {
            if (dal_khoa.SuaKhoa(et_khoa) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
