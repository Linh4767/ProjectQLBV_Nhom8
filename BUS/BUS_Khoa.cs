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
            dgv.DataSource = DAL_Khoa.Instance.HienThiDanhSachKhoa();
        }

        //Tạo mã tự động
        public string TaoMaTuDong()
        {
            return DAL_Khoa.Instance.TaoMaTuDong();
        }

        //Thêm Khoa
        public void ThemKhoa(ET_Khoa et_khoa)
        {
            if (DAL_Khoa.Instance.ThemKhoa(et_khoa) == true)
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
            if (DAL_Khoa.Instance.XoaKhoa(maKhoa) == true)
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
            if (DAL_Khoa.Instance.SuaKhoa(et_khoa) == true)
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
