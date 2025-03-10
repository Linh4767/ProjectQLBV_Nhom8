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
    public class BUS_TaiKham
    {
        private static BUS_TaiKham instance;
        private DAL_TaiKham dal_taikham = new DAL_TaiKham();
        public static BUS_TaiKham Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TaiKham();
                }
                return instance;
            }
        }

        public BUS_TaiKham() { }

        //lấy danh sách tái khám
        public void LayDSTaiKham(DataGridView data, DateTime ngayTK)
        {
            data.DataSource = dal_taikham.LayDSTaiKham(ngayTK);
        }

        //Tạo mã
        public string TaoMa()
        {
            return dal_taikham.TaoMaTuDong();
        }

        //Thêm cuộc hẹn tái khám mới
        public string ThemTaiKham(ET_TaiKham eT_TaiKham)
        {
            if (dal_taikham.ThemTaiKham(eT_TaiKham))
            {
                return "Thêm thành công";
            }
            else
            {
                return "Thêm không thành công. Vui lòng chọn ngày tái khám khác";
            }

        }

        //Cập nhật cuộc hẹn
        public string CapNhatTaiKham(ET_TaiKham eT_TaiKham)
        {
            if (dal_taikham.CapNhatCuocHen(eT_TaiKham))
            {
                return "Cập nhật thành công";
            }
            else
            {
                return "Cập nhật không thành công: Cuộc hẹn không tồn tại.";
            }
        }

        //Tìm kiếm cuộc hẹn tái khám của bệnh nhân
        public void TimKiemCuocHenBenhNhan(string key, DataGridView dgv, DateTime ngayTK)
        {
            dgv.DataSource = dal_taikham.TimKiemCuocHenBenhNhan(key, ngayTK);
        }

        //Lịch sử tái khám
        public void TimKiemDSTaiKhamBenhNhan(string key, DataGridView dgv)
        {
            dgv.DataSource = dal_taikham.TimKiemDSTaiKhamBenhNhan(key);
        }

        //lấy tên bệnh nhân từ PKB
        public string LayTenBN(string maPKB)
        {
            return dal_taikham.LayTenBN(maPKB);
        }

        //Lấy mã sổ bệnh án theo PKB
        public void LaySoBATheoPKB(string maPKB, ComboBox cbo)
        {
            cbo.DataSource = dal_taikham.LaySoBATheoPKB(maPKB);
            cbo.DisplayMember = "HienThi";
            cbo.ValueMember = "MaSoBenhAn";
        }

        //Lấy mã sổ bệnh án theo PKB
        public void LaySoBA(string maSoBA, ComboBox cbo)
        {
            cbo.DataSource = dal_taikham.LaySoBA(maSoBA);
            cbo.DisplayMember = "HienThi";
            cbo.ValueMember = "MaSoBenhAn";
        }

        //Lấy phòng
        public void LayPhongTheoPKB(string maPKB, ComboBox cboPhong)
        {
            cboPhong.DataSource = dal_taikham.LayPhongTheoPKB(maPKB);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "HienThi";
        }
        public bool KiemTraKoDatLichTaiKhamNhieuLan(string maPKB)
        {
            if (dal_taikham.KiemTraKoDatLichTaiKhamNhieuLan(maPKB))
            {
                return true;
            }
            return false;
        }
        //Lấy Nhân viên
        public void LayNhanVienTheoMa(string maNV, ComboBox cboNV)
        {
            cboNV.DataSource = dal_taikham.LayNhanVienTheoMa(maNV);
            cboNV.ValueMember = "MaNV";
            cboNV.DisplayMember = "HienThi";
        }

        //Lấy khoa
        public void LayKhoa(string maK, ComboBox cbo)
        {
            var khoa = dal_taikham.LayKhoa(maK);

            cbo.Text = khoa.TenKhoa;
            cbo.SelectedValue = khoa.MaKhoa;
        }

        //Lấy khoa theo phòng
        public void LayKhoaTheoPhong(string maP, ComboBox cboKhoa)
        {
            string khoa = dal_taikham.LayKhoaTheoPhong(maP);

            if (!string.IsNullOrEmpty(khoa))
            {
                cboKhoa.Items.Clear();
                cboKhoa.Items.Add(khoa);
                cboKhoa.SelectedIndex = 0;
            }
            else
            {
                cboKhoa.Items.Clear();
            }
        }

        //lấy danh sách khoa
        public void LayDSKhoa(ComboBox cbo)
        {
            cbo.DataSource = dal_taikham.LayDSKhoa();
            cbo.DisplayMember = "TenKhoa";
            cbo.ValueMember = "MaKhoa";
        }

        //Lấy phòng theo khoa
        public void LayDSPhongTheoKhoa(string maKhoa, ComboBox cboPhong)
        {
            cboPhong.DataSource = dal_taikham.LayDSPhongTheoKhoa(maKhoa);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "HienThi";
        }
        //Lấy danh sách phòng có nhân viên trực
        public void LayPhongTheoPhanCong(ComboBox cboPhong, DateTime dtpNgayTK, DateTime dtpTGTK, string maKhoa)
        {
            cboPhong.DataSource = dal_taikham.LayPhongTheoPhanCong(dtpTGTK, dtpNgayTK, maKhoa);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "HienThi";
        }

        //Lấy danh sách sổ bệnh án
        public void LayDSSoBA(DateTime ngayTK, ComboBox cbo)
        {
            cbo.DataSource = dal_taikham.LayDSSoBA(ngayTK);
            cbo.DisplayMember = "HienThi";
            cbo.ValueMember = "MaSoBenhAn";
        }

        //Lấy nhân viên theo ca
        public void LayNhanVienTheoPhanCongVaPhong(ComboBox cboNVTK, DateTime dtpNgayTK, DateTime dtpThoiGianTK, string maPhong)
        {
            cboNVTK.DataSource = dal_taikham.LayNhanVienTheoPhanCongVaPhong(dtpNgayTK, dtpThoiGianTK, maPhong);
            cboNVTK.ValueMember = "MaNV";
            cboNVTK.DisplayMember = "HienThi";
        }
    }
}
