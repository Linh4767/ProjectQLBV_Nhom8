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
    public class BUS_Thuoc
    {
        public static BUS_Thuoc instance;
        private DAL_Thuoc dal_thuoc = new DAL_Thuoc();
        public static BUS_Thuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_Thuoc();
                }
                return instance;
            }
        }

        //Hiển thị danh sách thuốc
        public void HienThiThuoc(DataGridView dgv)
        {
            dgv.DataSource = dal_thuoc.HienThiDanhSachThuoc();
        }

        //Lấy mã thuốc
        public ET_Thuoc LayThuocByMa(string maThuoc)
        {
            return dal_thuoc.LayThuocByMa(maThuoc);
        }


        //Tìm kiếm thuốc
        public void TimKiemThuoc(string keyword, DataGridView dgv)
        {
            dgv.DataSource = dal_thuoc.TimKiemThuoc(keyword);
        }

        //Thêm thuốc
        public void ThemThuoc(ET_Thuoc et_Thuoc)
        {
            if (dal_thuoc.ThemThuoc(et_Thuoc) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Thêm không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Xóa Thuốc
        public void XoaThuoc(string maThuoc, string maLo)
        {
            if (dal_thuoc.XoaThuoc(maThuoc, maLo) == true)
            {
                MessageBox.Show("Xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Xóa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Sửa thuốc
        public void SuaThuoc(string maThuoc, float gia, string trangThai, string donViTinh, string quyCachDongGoi, int soLuongDVT, int? soLuongQCDG, string maLo, DateTime hSD, int soLuongHop, DateTime ngaySX)
        {
            if (dal_thuoc.SuaThuoc(maThuoc, gia, trangThai, donViTinh, quyCachDongGoi, soLuongDVT, soLuongQCDG, maLo,hSD, soLuongHop, ngaySX) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Tạo mã tự động
        public string TaoMaTuDong(string tenThuoc, string xuatXu, string nhaCungCap, string loaiThuoc, string hamLuong)
        {
            return dal_thuoc.TaoMaTuDong(tenThuoc, xuatXu, nhaCungCap, loaiThuoc, hamLuong);
        }

        //Tạo mã lô tự động
        public string TaoMaLoTuDong(string tenThuoc, string xuatXu, string nhaCungCap, string loaiThuoc, string hamLuong, DateTime ngaySanXuat)
        {
            return dal_thuoc.TaoMaLoTuDong(tenThuoc, xuatXu, nhaCungCap, loaiThuoc, hamLuong, ngaySanXuat);
        }

        public void HienThịThuocSapHetHan(DataGridView dgv, int soNgayCanhBao = 60)
        {
            dgv.DataSource = dal_thuoc.HienThiDanhSachThuocSapHetHan(soNgayCanhBao);
        }

        public void HienThịThuocHetHan(DataGridView dgv)
        {
            dgv.DataSource = dal_thuoc.HienThiDanhSachThuocDaHetHan();
        }

    }
}
