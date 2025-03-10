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
        private DAL_SuDungDV dal_sudungdv = new DAL_SuDungDV();

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
            return dal_sudungdv.TaoMaDVTuDong(maPhieuKB);
        }
        public void LayDSPhieuKhamBenhDaKham(ComboBox cboPKB, DateTime dtp)
        {
            cboPKB.DataSource = dal_sudungdv.LayDSPhieuKhamBenhDaKham(dtp);
            cboPKB.ValueMember = "MaPhieuKB";
            cboPKB.DisplayMember = "HienThi";
        }

        public void LayNhanVienThucHienKhamChoPhieuKhamBenh(ComboBox cboNVYC, string maPKB)
        {
            cboNVYC.DataSource = dal_sudungdv.LayNhanVienThucHienKhamChoPhieuKhamBenh(maPKB);
            cboNVYC.ValueMember = "MaNV";
            cboNVYC.DisplayMember = "HienThi";
        }

        public void LayDSKhoaLoadVaoCombobox(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = dal_sudungdv.LayDSKhoaLoadVaoCombobox();
            cboKhoa.ValueMember = "MaKhoa";
            cboKhoa.DisplayMember = "HienThi";
        }

        public void LayPhongTheoPhanCong(ComboBox cboPhong, DateTime dtpNgayTH, DateTime dtpTGTH, string maKhoa)
        {
            cboPhong.DataSource = dal_sudungdv.LayPhongTheoPhanCong(dtpTGTH, dtpNgayTH, maKhoa);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "HienThi";
        }

        public void LayNhanVienTheoPhanCongVaPhong(ComboBox cboNVTH, DateTime dtpNgayTH, DateTime dtpThoiGianTH, string maPhong)
        {
            cboNVTH.DataSource = dal_sudungdv.LayNhanVienTheoPhanCongVaPhong(dtpNgayTH, dtpThoiGianTH, maPhong);
            cboNVTH.ValueMember = "MaNV";
            cboNVTH.DisplayMember = "HienThi";
        }

        public void HienThiDSSuDungDVTheoNgay(DataGridView dgvDS, DateTime dtpNgay)
        {
            dgvDS.DataSource = dal_sudungdv.HienThiDSSuDungDVTheoNgay(dtpNgay);
        }
        public void HienThiDSDVTheoKhoa(ComboBox cboNVTH, string maKhoa)
        {
            cboNVTH.DataSource = dal_sudungdv.HienThiDSDVTheoKhoa(maKhoa);
            cboNVTH.ValueMember = "MaDV";
            cboNVTH.DisplayMember = "HienThi";
        }
        public bool KiemTraXemThucHienDVChua(string maSuDungDV, string maNVThucHien)
        {
            if (dal_sudungdv.KiemTraXemThucHienDVChua(maSuDungDV, maNVThucHien) == true)
            {
                return false;
            }
            return true;
        }
        public bool KiemTraXemNgayThucHienCoLonHonBangNgayYeuCau(DateTime ngayYeuCau, DateTime ngayThucHien)
        {
            if (dal_sudungdv.KiemTraXemNgayThucHienCoLonHonBangNgayYeuCau(ngayYeuCau, ngayThucHien) == true)
            {
                return true;
            }
            return false;
        }

        public bool KiemTraXemTGThucHienCoLonHonTGYeuCau(DateTime TGYeuCau, DateTime TGThucHien)
        {
            if (dal_sudungdv.KiemTraXemTGThucHienCoLonHonTGYeuCau(TGYeuCau, TGThucHien) == true)
            {
                return true;
            }
            return false;
        }

        public void ThemThongTinSuDungDV(ET_SuDungDV etSDDV)
        {
            if (dal_sudungdv.ThemThongTinSuDungDV(etSDDV) == false)
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
            if (dal_sudungdv.XoaTTSuDungDV(maSDDV) == true)
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
            if (dal_sudungdv.SuaThongTinSuDungDV(etSuDungDV) == true)
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
            return dal_sudungdv.TinhTienSuDungDV(maPKB);
        }
        public DateTime LayNgayKhamCuaPKB(string maPKB)
        {
            return dal_sudungdv.LayNgayKhamCuaPKB(maPKB);
        }
        public DateTime LayTGCD(string maPKB)
        {
            return dal_sudungdv.LayTGCD(maPKB);
        }

        public void TimKiemSDDVTheoTen(DataGridView dgv, string tenBN, DateTime dtp)
        {
            dgv.DataSource = dal_sudungdv.TimKiemSDDVTheoTen(tenBN, dtp);
        }

        public bool KiemTraXemPhaiDVPT(string maDV)
        {
            if (dal_sudungdv.KiemTraXemPhaiDVPT(maDV) == true)
            {
                return true;
            }
            return false;
        }

        public bool KiemTraPKBMoiNhat(string maPKB)
        {
            if (dal_sudungdv.KiemTraPKBMoiNhat(maPKB) == true)
            {
                return true;
            }
            return false;
        }

        public bool KiemTraPKBMoi(string maPKB)
        {
            if (dal_sudungdv.KiemTraPKBMoiNhat(maPKB))
            {
                return true;
            }
            return false;
        }
        public bool KiemTraPhongConGiuongTrongNgay(string maPhong, DateTime ngayThucHien)
        {
            if (dal_sudungdv.KiemTraPhongConGiuongTrongNgay(maPhong,ngayThucHien))
            {
                return true;
            }
            return false;
        }
    }
}
