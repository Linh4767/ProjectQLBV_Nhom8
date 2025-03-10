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
    public class BUS_PhieuKB
    {
        private static BUS_PhieuKB instance;
        private DAL_PhieuKhamBenh dal_phieukb = new DAL_PhieuKhamBenh();
        public static BUS_PhieuKB Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_PhieuKB();
                }
                return instance;
            }
        }

        // Hiển thị danh sách phiếu khám bệnh nhờ mã bệnh nhân
        public void HienThiDSPhieuKB(DataGridView dgvDSPhieuKB, string maBN)
        {
            dgvDSPhieuKB.DataSource = dal_phieukb.XemDSPhieuKhamBenhTheoMaBN(maBN);
        }

        //Thêm phiếu khám bệnh
        public void ThemPhieuKB(ET_PhieuKhamBenh etPKB)
        {
            if (dal_phieukb.ThemPhieuKB(etPKB) == false)
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

        //Xóa phiếu khám bệnh
        public void XoaPhieuKham(DataGridView dgvDSPhieuKB)
        {
            if (dal_phieukb.XoaPhieuKB(dgvDSPhieuKB.CurrentRow.Cells[0].Value.ToString()) == true)
            {
                // Hiện lên thông báo khi xóa thành công
                MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                // Hiện lên thông báo khi xóa không thành công
                MessageBox.Show("Dữ liệu đang được đối chiếu !", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //Sửa phiếu khám bệnh
        public void SuaPhieuKB(ET_PhieuKhamBenh etPhieuKB)
        {
            if (dal_phieukb.SuaPhieuKB(etPhieuKB) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        //Tạo mã phiếu khám bệnh tự động
        public string TaoMaPhieuKBTuDong(string maBN)
        {
            return dal_phieukb.TaoTuDongMaPhieuKB(maBN);
        }

        //Kiểm tra bệnh nhân đi khám chưa(chưa thì cho xóa)
        public bool KiemTraPhieuKBThucHienKhamChua(string maPhieuKB)
        {
            if (dal_phieukb.KiemTraPhieuKBTHKhamChua(maPhieuKB) == true)
            {
                return false;
            }
            return true;
        }

        //Tạo tự động số phiếu và reset lại từ đầu khi qua ngày mới
        public string TaoTuDongSoPhieu()
        {
            return dal_phieukb.TaoTuDongSoPhieu();
        }
    }
}
