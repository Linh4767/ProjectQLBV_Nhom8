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
        private DAL_ThuocTheoKhoa dal_thuoctheokhoa = new DAL_ThuocTheoKhoa();
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
            dgv.DataSource = dal_thuoctheokhoa.XemDSThuocTheoKhoa(maKhoa);
        }
        public void TimKiemThuocTheoKhoa(DataGridView dgv, string tenThuoc, string maKhoa)
        {
            dgv.DataSource = dal_thuoctheokhoa.TimKiemThuocTheoKhoa(tenThuoc, maKhoa);
        }
        public string LayTenDuaVaoMaThuoc(string maThuoc)
        {
            return dal_thuoctheokhoa.LayTenDuaVaoMaThuoc(maThuoc);
        }
        public void LayLoDuaVaoMaThuoc(ComboBox cboLo, string maThuoc)
        {
            cboLo.DataSource = dal_thuoctheokhoa.LayLoDuaVaoMaThuoc(maThuoc);
            cboLo.ValueMember = "MaLo";
            cboLo.DisplayMember = "MaLo";
        }
        public void ThemThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            if (!dal_thuoctheokhoa.KiemTraGiaTriNhap(etThuocTheoKhoa.MaLo, soLuong))
            {
                if (dal_thuoctheokhoa.ThemThuocChoKhoa(etThuocTheoKhoa, soLuong) == true)
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
            return dal_thuoctheokhoa.TinhVienThuoc(maThuoc);
        }
        public double TinhTienMotHop(string maLo)
        {
            return dal_thuoctheokhoa.TinhTienMotHop(maLo);
        }
        public int LaySoLuongTrongKhoa(int soLuongNhap, string maLo, string maThuoc)
        {
            return dal_thuoctheokhoa.LaySoLuongTrongKhoa(soLuongNhap, maLo, maThuoc);
        }

        public void ThemSLThuocChoKhoa(ET_ThuocTheoKhoa etThuocTheoKhoa, int soLuong)
        {
            if (!dal_thuoctheokhoa.KiemTraGiaTriNhap(etThuocTheoKhoa.MaLo, soLuong))
            {
                if (dal_thuoctheokhoa.ThemSLThuocChoKhoa(etThuocTheoKhoa, soLuong) == true)
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
            if (dal_thuoctheokhoa.XoaSLThuocChoKhoa(etThuocTheoKhoa, soLuong) == true)
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
