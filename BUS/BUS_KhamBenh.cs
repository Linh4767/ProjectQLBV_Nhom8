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
    public class BUS_KhamBenh
    {
        private static BUS_KhamBenh instance;
        public static BUS_KhamBenh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_KhamBenh();
                }
                return instance;
            }
        }

        //Xem danh sách khám bệnh theo ngày
        public void HienThiDSKhamBenhTheoNgay(DataGridView dgvDSKhamBenh, DateTime ngayKham, string maPhong)
        {
            dgvDSKhamBenh.DataSource = DAL_KhamBenh.Instance.XemDSKhamBenhTheoNgay(ngayKham, maPhong);
        }

        //Thêm thông tin khám bệnh
        public void ThemThongTinKB(ET_KhamBenh etKB)
        {
            if (DAL_KhamBenh.Instance.ThemThongTinKB(etKB) == false)
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

        //Sửa thông tin khám bệnh
        public void SuaThongTinKB(ET_KhamBenh etKB)
        {
            if (DAL_KhamBenh.Instance.SuaThongTinKB(etKB) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Tạo mã tự động
        public string TaoMaKBTuDong(string maPKB)
        {
            return DAL_KhamBenh.Instance.TaoMaKBTuDong(maPKB);
        }

        //Lấy danh sách phiếu khám bệnh theo ngày
        public void LayPKBTheoNgayKham(ComboBox cboPKB, DateTime dtp)
        {
            cboPKB.DataSource = DAL_KhamBenh.Instance.LayPKBTheoNgayKham(dtp);
            cboPKB.ValueMember = "MaPhieuKB";
            cboPKB.DisplayMember = "HienThi";
        }
        //Lấy danh sách phòng có phân công nhân viên trong bảng ca trực theo ngày
        public void LayPhongTheoPhanCong(ComboBox cboPhong, DateTime dtp, string maKhoa, string maPKB)
        {
            var danhsachPhong = DAL_KhamBenh.Instance.LayPhongTheoPhanCong(dtp, maKhoa, maPKB);
            cboPhong.DataSource = DAL_KhamBenh.Instance.LayPhongTheoPhanCong(dtp, maKhoa, maPKB);
            cboPhong.ValueMember = "MSPhong";
            cboPhong.DisplayMember = "HienThi";
        }

        //Lấy danh sách nhân viên theo phòng và theo phân công
        public void LayDanhSachNhanVienTheoPhongVaCa(ComboBox cboNV, DateTime dtp, string maPhong, string maPhieuKB)
        {
            cboNV.DataSource = DAL_KhamBenh.Instance.LayNhanVienTheoPhanCongVaPhong(dtp, maPhong, maPhieuKB);
            cboNV.ValueMember = "MaNV";
            cboNV.DisplayMember = "HienThi";
        }

        //Kiểm tra phiếu khám bệnh có chuẩn đoán không
        public bool KiemTraCoChuanDoanChua(string maPhieuKB)
        {
            if (DAL_KhamBenh.Instance.KiemTraCoChuanDoanChua(maPhieuKB) == true)
            {
                return false;
            }
            return true;
        }

        //Kiểm tra xem bệnh nhân đi khám chưa
        public bool KiemTraDiKhamChua(string maPhieuKB)
        {
            if (DAL_KhamBenh.Instance.KiemTraDiKhamChua(maPhieuKB) == true)
            {
                return false;
            }
            return true;
        }

        //Kiểm tra ngày tái khám lớn hơn và bằng ngày khám của phiếu khám bệnh
        //public bool KiemTraTinhHopLeNgayTK(string maPhieuKB)
        //{
        //    if (DAL_KhamBenh.Instance.KiemTraTinhHopLeNgayTK(maPhieuKB) == true)
        //    {
        //        return true;
        //    }
        //    return false;
        //}

        //Lấy danh sách khoa
        public void LayDSKhoaLoadVaoCombobox(ComboBox cboKhoa)
        {
            cboKhoa.DataSource = DAL_KhamBenh.Instance.LayDSKhoaLoadVaoCombobox();
            cboKhoa.DisplayMember = "HienThi";
            cboKhoa.ValueMember = "MaKhoa";
        }

        public void layDSPhong(DataGridView dgv)
        {
            dgv.DataSource = DAL_KhamBenh.Instance.layDSPhong();
        }

        public string LayTrieuChungCuaPKB(string maPKB)
        {
            return DAL_KhamBenh.Instance.LayTrieuChungCuaPhieuKB(maPKB);
        }
    }
}
