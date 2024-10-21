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
    public class BUS_GiuongBenh
    {
        public static BUS_GiuongBenh instance;

        public static BUS_GiuongBenh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_GiuongBenh();
                }
                return instance;
            }
        }

        //Hiển thị danh sách giường bênh
        public void HienThiGiuongBenh(DataGridView dgv)
        {
            dgv.DataSource = DAL_GiuongBenh.Instance.HienThiDanhSachGiuongBenh();
        }

        //Hiển thị combobox Phòng
        public void HienThiComboboxPhong(ComboBox cboPhong)
        {
            cboPhong.DataSource = DAL_GiuongBenh.Instance.HienThiComboboxPhong();
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "TenPhong";
        }

        //Tìm kiếm giường bệnh
        public void TimKiemGiuongBenh(string keyword, DataGridView dgv)
        {
            dgv.DataSource = DAL_GiuongBenh.Instance.TimKiemPhong(keyword);
        }

        //Tạo mã tự động
        public string TaoMaTuDong()
        {
            return DAL_GiuongBenh.Instance.TaoMaTuDong();
        }

        //Thêm Giường Bệnh
        public void ThemGiuongBenh(ET_GiuongBenh et_giuongbenh)
        {
            if (DAL_GiuongBenh.Instance.ThemGiuongBenh(et_giuongbenh) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa Giường Bệnh
        public void XoaGiuongBenh(string maGiuong)
        {
            if (DAL_GiuongBenh.Instance.XoaGiuongBenh(maGiuong) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Sửa Giường Bệnh
        public void SuaGiuongBenh(ET_GiuongBenh et_giuongbenh)
        {
            if (DAL_GiuongBenh.Instance.SuaGiuongBenh(et_giuongbenh) == true)
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
