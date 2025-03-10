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
        private DAL_GiuongBenh dal_giuongbenh = new DAL_GiuongBenh();

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

        //Hiển thị danh sách giường bệnh
        public void HienThiGiuongBenh(DataGridView dgv, string maKhoa)
        {
            dgv.DataSource = dal_giuongbenh.HienThiDanhSachGiuongBenhTheoKhoa(maKhoa);
        }

        //Hiển thị combobox khoa
        public void HienThiComboboxKhoa(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = dal_giuongbenh.HienThiComboboxKhoa();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "TenKhoa";
        }

        //Hiển thị combobox Phòng
        public void HienThiComboboxPhong(ComboBox cboPhong, string maKhoa)
        {
            cboPhong.DataSource = dal_giuongbenh.HienThiPhongTheoKhoa(maKhoa);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "TenPhong";

        }

        //Hiển thị tên khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            return DAL_ChuyenNganh.Instance.HienThiTenKhoa(maKhoa);
        }

        //Tìm kiếm giường bệnh
        public void TimKiemGiuongBenh(string keyword, DataGridView dgv)
        {
            dgv.DataSource = dal_giuongbenh.TimKiemPhong(keyword);
        }


        //Tạo mã tự động
        public string TaoMaTuDong(int numberic, string maPhong, string maKhoa)
        {
            return dal_giuongbenh.TaoMaTuDong(numberic, maPhong, maKhoa);
        }

        //Hiển thị combobox Phòng
        //public string HienThiMaPhong(string tenPhong)
        //{
        //    return dal_giuongbenh.HienThiMaPhong(tenPhong);
        //}

        //Thêm Giường Bệnh
        public void ThemGiuongBenh(ET_GiuongBenh et_giuongbenh)
        {
            if (dal_giuongbenh.KiemTraSoGiuong(et_giuongbenh.MaPhong) == true)
            {
                if (dal_giuongbenh.ThemGiuongBenh(et_giuongbenh) == true)
                {
                    MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
                else
                {
                    MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Số lượng giường trong phòng đã đạt tối đa !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            
        }

        //Xóa Giường Bệnh
        public void XoaGiuongBenh(string maGiuong)
        {
            if (dal_giuongbenh.XoaGiuongBenh(maGiuong) == true)
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
            if (dal_giuongbenh.SuaGiuongBenh(et_giuongbenh) == true)
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
