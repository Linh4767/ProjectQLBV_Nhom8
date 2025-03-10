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
    public class BUS_ChiTietDonThuoc
    {
        private static BUS_ChiTietDonThuoc instance;
        private DAL_ChiTietDonThuoc dal_chitietdt = new DAL_ChiTietDonThuoc();

        public static BUS_ChiTietDonThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_ChiTietDonThuoc();
                }
                return instance;
            }
        }

        public void LayDSThuocCuaDonThuoc(string maDT, DataGridView dgvDSThuoc)
        {
            dgvDSThuoc.DataSource = dal_chitietdt.LayDSThuocCuaDonThuoc(maDT);
        }

        //Tên bệnh nhân
        public string LayTenBN(string maPKB)
        {
            return dal_chitietdt.LayTenBN(maPKB);
        }

        //Lấy tên nhân viên
        public string LayTenNV(string maNV)
        {
            return dal_chitietdt.LayTenNhanVien(maNV);
        }

        //lấy tên ma khoa
        public string LayKhoaTuNV(string maNV)
        {
            return dal_chitietdt.LayKhoaTuNV(maNV);
        }

        //danh sách thuốc gợi ý
        public void LayDSThuocGoiY(string tenThuoc, string maKhoa, DataGridView dgvDSThuocGoiY)
        {
            dgvDSThuocGoiY.DataSource = dal_chitietdt.LayDSThuocGoiY(tenThuoc, maKhoa);
        }

        //Thêm thuốc vào đơn
        public string ThemThuoc(ET_ChiTietDonThuoc eT_ChiTiet, string maKhoa, int soLuong)
        {
            if (dal_chitietdt.KtraSoLuong(eT_ChiTiet.MaThuoc, maKhoa, eT_ChiTiet.MaLo, soLuong))
            {
                if (dal_chitietdt.ThemChiTietDonThuoc(eT_ChiTiet, maKhoa, soLuong))
                {
                    return "Thêm thành công";
                }
                else
                {
                    return "Thêm không thành công.";
                }
            }
            else
            {
                return "Số lượng thuốc không đủ!";
            }
        }

        //Xóa thuốc
        public string XoaThuoc(string maDT, string maThuoc, string maLo, string maKhoa)
        {
            if (dal_chitietdt.XoaThuoc(maDT, maThuoc, maLo, maKhoa))
            {
                return "Loại bỏ thành công";
            }
            else
            {
                return "Loại bỏ không thành công.";
            }
        }

        //Cập nhật thuốc
        public string CapNhatThuoc(ET_ChiTietDonThuoc eT_ChiTietDon, int soLuong, string maKhoa)
        {
            if (dal_chitietdt.KtraSoLuong(eT_ChiTietDon.MaThuoc, maKhoa, eT_ChiTietDon.MaLo, soLuong))
            {
                if (dal_chitietdt.CapNhatDonThuoc(eT_ChiTietDon, soLuong, maKhoa))
                {
                    return "Cập nhật thành công";
                }
                else
                {
                    return "Cập nhật không thành công.";
                }

            }
            else
            {
                return "Số lượng thuốc không đủ!";
            }
        }

        //lấy lô thuốc
        public void LayLoDuaVaoMaThuoc(string maThuoc, string maKhoa, ComboBox cboLo)
        {
            cboLo.DataSource = dal_chitietdt.LayLoDuaVaoMaThuoc(maThuoc, maKhoa);
            cboLo.DisplayMember = "MaLo";
            cboLo.ValueMember = "MaLo";
        }

        //Tính tổng tiền thuốc
        public double TongTienThuoc(string maDT)
        {
            return dal_chitietdt.TongTienThuoc(maDT);
        }
    }
}
