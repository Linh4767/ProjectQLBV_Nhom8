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
        private DAL_PhanGiuong dal_phangiuong = new DAL_PhanGiuong();
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
            dgv.DataSource = dal_phangiuong.HienThiDanhSachPhanGiuong(ngayNhan);
        }

        //Hiển thị tên khoa
        public string HienThiTenKhoa(string maKhoa)
        {
            return dal_phangiuong.HienThiTenKhoa(maKhoa);
        }

        //Hiển thị tên phòng
        public string HienThiTenPhong(string maPhong)
        {
            return dal_phangiuong.HienThiTenPhong(maPhong);
        }

        //Hiển thị tên phòng
        public void HienThiGiuong(string maPhong, ComboBox cboGiuongBenh)
        {
            cboGiuongBenh.DataSource = dal_phangiuong.HienThiGiuong(maPhong);
            cboGiuongBenh.ValueMember = "MaGiuong";
            cboGiuongBenh.DisplayMember = "MaGiuong";
        }

        //Hiển thị tên nhân viên
        public string HienThiTenNV(string maNV)
        {
            return dal_phangiuong.HienThiTenNV(maNV);
        }

        //Hiển thị tên bệnh nhân
        public string HienThiTenBN(string maBN)
        {
            return dal_phangiuong.HienThiTenBN(maBN);
        }

        //Thêm phân giường
        public void ThemPhanGiuong(ET_PhanGiuong et_phangiuong)
        {
            if (dal_phangiuong.KiemTraTrangThaiGiuong(et_phangiuong.MaGiuong, et_phangiuong.NgayNhan, et_phangiuong.NgayTra, et_phangiuong.MaPhieuKB))
            {
                if (dal_phangiuong.ThemPhanGiuong(et_phangiuong) == true)
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
            if (dal_phangiuong.KiemTraTrangThaiGiuong(et_phangiuong.MaGiuong, et_phangiuong.NgayNhan, et_phangiuong.NgayTra, et_phangiuong.MaPhieuKB))
            {
                if (dal_phangiuong.SuaPhanGiuong(et_phangiuong) == true)
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
            return dal_phangiuong.KiemTraHoanThienTraGiuong(maPhieuKB);
        }

        public bool KiemTraCoPhanGiuongMoiKhong(string maPhieuKB,string maGiuong, DateTime ngayNhan)
        {
            // Gọi phương thức KiemTraHoanThienTraGiuong từ lớp DAL
            return dal_phangiuong.KiemTraCoPhanGiuongMoiKhong(maPhieuKB,maGiuong,ngayNhan);
        }

        public void TimKiemSDDVTheoTen(DataGridView dgv, string tenBN)
        {
            dgv.DataSource = DAL_PhanGiuong.Instance.TimKiemTheoTen(tenBN);
        }
    }
}
