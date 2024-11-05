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
    public class BUS_SuDungDV
    {
        private static BUS_SuDungDV instance;

        public static BUS_SuDungDV Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_SuDungDV();
                }
                return instance;
            }
        }
        public string TaoMaDVTuDong(string maPhieuKB)
        {
            return DAL_SuDungDV.Instance.TaoMaDVTuDong(maPhieuKB);
        }
        public void LayDSPhieuKhamBenhDaKham(ComboBox cboPKB, DateTime dtp)
        {
            cboPKB.DataSource = DAL_SuDungDV.Instance.LayDSPhieuKhamBenhDaKham(dtp);
            cboPKB.ValueMember = "MaPhieuKB";
            cboPKB.DisplayMember = "HienThi";
        }

        public void LayNhanVienThucHienKhamChoPhieuKhamBenh(ComboBox cboNVYC, string maPKB)
        {
            cboNVYC.DataSource = DAL_SuDungDV.Instance.LayNhanVienThucHienKhamChoPhieuKhamBenh(maPKB);
            cboNVYC.ValueMember = "MaNV";
            cboNVYC.DisplayMember = "HienThi";
        }

        public void LayDSKhoaLoadVaoCombobox(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = DAL_SuDungDV.Instance.LayDSKhoaLoadVaoCombobox();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "HienThi";
        }

        public void LayPhongTheoPhanCong(ComboBox cboPhong, DateTime dtpNgayTH, DateTime dtpTGTH, string maKhoa)
        {
            cboPhong.DataSource = DAL_SuDungDV.Instance.LayPhongTheoPhanCong(dtpTGTH, dtpNgayTH, maKhoa);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "HienThi";
        }

        public void LayNhanVienTheoPhanCongVaPhong(ComboBox cboNVTH, DateTime dtpNgayTH, DateTime dtpThoiGianTH, string maPhong)
        {
            cboNVTH.DataSource = DAL_SuDungDV.Instance.LayNhanVienTheoPhanCongVaPhong(dtpNgayTH, dtpThoiGianTH, maPhong);
            cboNVTH.ValueMember = "MaNV";
            cboNVTH.DisplayMember = "HienThi";
        }

        public void HienThiDSSuDungDVTheoNgay(DataGridView dgvDS, DateTime dtpNgay)
        {
            dgvDS.DataSource = DAL_SuDungDV.Instance.HienThiDSSuDungDVTheoNgay(dtpNgay);
        }
        public void HienThiDSDVTheoKhoa(ComboBox cboNVTH, string maKhoa)
        {
            cboNVTH.DataSource = DAL_SuDungDV.Instance.HienThiDSDVTheoKhoa(maKhoa);
            cboNVTH.ValueMember = "MaDV";
            cboNVTH.DisplayMember = "HienThi";
        }
        public bool KiemTraXemThucHienDVChua(string maSuDungDV, string maNVThucHien)
        {
            if (DAL_SuDungDV.Instance.KiemTraXemThucHienDVChua(maSuDungDV, maNVThucHien) == true)
            {
                return false;
            }
            return true;
        }
        public bool KiemTraXemNgayThucHienCoLonHonBangNgayYeuCau(DateTime ngayYeuCau, DateTime ngayThucHien)
        {
            if (DAL_SuDungDV.Instance.KiemTraXemNgayThucHienCoLonHonBangNgayYeuCau(ngayYeuCau, ngayThucHien) == true)
            {
                return true;
            }
            return false;
        }

        public bool KiemTraXemTGThucHienCoLonHonTGYeuCau(DateTime TGYeuCau, DateTime TGThucHien)
        {
            if (DAL_SuDungDV.Instance.KiemTraXemTGThucHienCoLonHonTGYeuCau(TGYeuCau, TGThucHien) == true)
            {
                return true;
            }
            return false;
        }

        public void ThemThongTinSuDungDV(ET_SuDungDV etSDDV)
        {
            if (DAL_SuDungDV.Instance.ThemThongTinSuDungDV(etSDDV) == false)
            {
                // Khi mã hoặc tên trùng sẽ hiển thị thông báo 
                MessageBox.Show("Dữ liệu đã có trong hệ thống !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            else
            {
                // Khi thêm thành công sẽ hiển thị thông báo này
                MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        public void XoaTTSuDungDV(string maSDDV)
        {
            if (DAL_SuDungDV.Instance.XoaTTSuDungDV(maSDDV) == true)
            {
                // Hiện lên thông báo khi xóa thành công
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Hiện lên thông báo khi xóa không thành công
                MessageBox.Show("Dữ liệu đang được đối chiếu !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        public void SuaThongTinSuDungDV(ET_SuDungDV etSuDungDV)
        {
            if (DAL_SuDungDV.Instance.SuaThongTinSuDungDV(etSuDungDV) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        public float TinhTienSuDungDV(string maPKB)
        {
            return DAL_SuDungDV.Instance.TinhTienSuDungDV(maPKB);
        }
        public DateTime LayNgayKhamCuaPKB(string maPKB)
        {
            return DAL_SuDungDV.Instance.LayNgayKhamCuaPKB(maPKB);
        }

        public void TimKiemSDDVTheoTen(DataGridView dgv, string tenBN, DateTime dtp)
        {
            dgv.DataSource = DAL_SuDungDV.Instance.TimKiemSDDVTheoTen(tenBN, dtp);
        }

        public bool KiemTraXemPhaiDVPT(string maDV)
        {
            if (DAL_SuDungDV.Instance.KiemTraXemPhaiDVPT(maDV) == true)
            {
                return true;
            }
            return false;
        }
    }
}
