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
    public class BUS_PhanGiuong
    {
        public static BUS_PhanGiuong instance;

        public static BUS_PhanGiuong Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_PhanGiuong();
                }
                return instance;
            }
        }

        //Hiển thị danh sách phân giường
        public void HienThiPhanGiuong(DataGridView dgv, DateTime ngayNhan)
        {
            dgv.DataSource = DAL_PhanGiuong.Instance.HienThiDanhSachPhanGiuong(ngayNhan);
        }

        //Hiển thị tên khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            return DAL_PhanGiuong.Instance.HienThiTenKhoa(maKhoa);
        }

        //Hiển thị tên phòng
        public string HienThiTenPhong(string maPhong)
        {
            return DAL_PhanGiuong.Instance.HienThiTenPhong(maPhong);
        }

        //Hiển thị tên phòng
        public void HienThiGiuong(string maPhong, ComboBox cboGiuongBenh)
        {
            cboGiuongBenh.DataSource = DAL_PhanGiuong.Instance.HienThiGiuong(maPhong);
            cboGiuongBenh.ValueMember = "MaGiuong";
            cboGiuongBenh.DisplayMember = "MaGiuong";
        }

        //Hiển thị tên nhân viên
        public string HienThiTenNV(string maNV)
        {
            return DAL_PhanGiuong.Instance.HienThiTenNV(maNV);
        }

        //Hiển thị tên bệnh nhân
        public string HienThiTenBN(string maBN)
        {
            return DAL_PhanGiuong.Instance.HienThiTenBN(maBN);
        }

        //Thêm phân giường
        public void ThemPhanGiuong(ET_PhanGiuong et_phangiuong)
        {
            if (DAL_PhanGiuong.Instance.KiemTraTrangThaiGiuong(et_phangiuong.MaGiuong, et_phangiuong.NgayNhan, et_phangiuong.NgayTra, et_phangiuong.MaPhieuKB))
            {
                if (DAL_PhanGiuong.Instance.ThemPhanGiuong(et_phangiuong) == true)
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
                MessageBox.Show("Giường đã có người !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }

        }

        //Cập nhật
        public void SuaPhanGiuong(ET_PhanGiuong et_phangiuong)
        {
            if (DAL_PhanGiuong.Instance.KiemTraTrangThaiGiuong(et_phangiuong.MaGiuong, et_phangiuong.NgayNhan, et_phangiuong.NgayTra, et_phangiuong.MaPhieuKB))
            {
                if (DAL_PhanGiuong.Instance.SuaPhanGiuong(et_phangiuong) == true)
                {
                    MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }
                else
                {
                    MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Giường đã có người !", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        public bool KiemTraHoanThienTraGiuong(string maPhieuKB)
        {
            // Gọi phương thức KiemTraHoanThienTraGiuong từ lớp DAL
            return DAL_PhanGiuong.Instance.KiemTraHoanThienTraGiuong(maPhieuKB);
        }

        //public bool KiemTraNgayTraGiuongCu(string maPhieuKB, string maPhong, string maGiuongMoi)
        //{
        //    return DAL_PhanGiuong.Instance.KiemTraNgayTraGiuongCu(maPhieuKB, maPhong, maGiuongMoi);
        //}
    }
}
