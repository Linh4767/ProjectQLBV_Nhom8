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
    public class BUS_ThuocTheoKhoa
    {
        private static BUS_ThuocTheoKhoa instance;
        public static BUS_ThuocTheoKhoa Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_ThuocTheoKhoa();
                }
                return instance;
            }
        }

        public void XemDSThuocTheoKhoa(DataGridView dgv, string maKhoa)
        {
            dgv.DataSource = DAL_ThuocTheoKhoa.Instance.XemDSThuocTheoKhoa(maKhoa);
        }
        public void TimKiemThuocTheoKhoa(DataGridView dgv, string tenThuoc, string maKhoa)
        {
            dgv.DataSource = DAL_ThuocTheoKhoa.Instance.TimKiemThuocTheoKhoa(tenThuoc, maKhoa);
        }
        public string LayTenDuaVaoMaThuoc(string maThuoc)
        {
            return DAL_ThuocTheoKhoa.Instance.LayTenDuaVaoMaThuoc(maThuoc);
        }
        public void LayLoDuaVaoMaThuoc(ComboBox cboLo, string maThuoc)
        {
            cboLo.DataSource = DAL_ThuocTheoKhoa.Instance.LayLoDuaVaoMaThuoc(maThuoc);
            cboLo.ValueMember = "MaLo";
            cboLo.DisplayMember = "MaLo";
        }
        public void ThemThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            if (!DAL_ThuocTheoKhoa.Instance.KiemTraGiaTriNhap(etThuocTheoKhoa.MaLo, soLuong))
            {
                if (DAL_ThuocTheoKhoa.Instance.ThemThuocChoKhoa(etThuocTheoKhoa, soLuong) == true)
                {
                    MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Thêm không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Giá trị nhập vào đã quá số lượng của thùng hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public int TinhVienThuoc(string maThuoc)
        {
            return DAL_ThuocTheoKhoa.Instance.TinhVienThuoc(maThuoc);
        }
        public double TinhTienMotHop(string maLo)
        {
            return DAL_ThuocTheoKhoa.Instance.TinhTienMotHop(maLo);
        }
        public int LaySoLuongTrongKhoa(int soLuongNhap, string maLo, string maThuoc)
        {
            return DAL_ThuocTheoKhoa.Instance.LaySoLuongTrongKhoa(soLuongNhap, maLo, maThuoc);
        }

        public void ThemSLThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            if (!DAL_ThuocTheoKhoa.Instance.KiemTraGiaTriNhap(etThuocTheoKhoa.MaLo, soLuong))
            {
                if (DAL_ThuocTheoKhoa.Instance.ThemSLThuocChoKhoa(etThuocTheoKhoa, soLuong) == true)
                {
                    MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            else
            {
                MessageBox.Show("Giá trị nhập vào đã quá số lượng của thùng hàng", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void XoaSLThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            if (DAL_ThuocTheoKhoa.Instance.XoaSLThuocChoKhoa(etThuocTheoKhoa, soLuong) == true)
            {
                MessageBox.Show("Xóa số lượng thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa số lượng không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
