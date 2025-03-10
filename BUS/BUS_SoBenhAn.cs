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
    public class BUS_SoBenhAn
    {
        //Khai báo biến tĩnh
        private static BUS_SoBenhAn instance;
        private DAL_SoBA dal_soba = new DAL_SoBA();    
        public static BUS_SoBenhAn Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_SoBenhAn();
                }
                return instance;
            }
        }

        //Xem danh sách hồ sơ bệnh án
        public void XemDSHoSoBA(DataGridView dgvHSBA)
        {
            // Gán DataSource cho DataGridView
            dgvHSBA.DataSource = dal_soba.XemDSHoSoBA();
        }

        //Thêm sổ bệnh án
        public void ThemSoBA(ET_SoBA etSoBA)
        {
            if (dal_soba.ThemHoSoBA(etSoBA) == false)
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

        //Xóa sổ bệnh án
        public void XoaSoBA(DataGridView dgvDSSoBA)
        {
            if (dal_soba.XoaSoBA(dgvDSSoBA.CurrentRow.Cells[0].Value.ToString()) == true)
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
        //Sửa sổ bệnh án
        public void SuaSoBA(ET_SoBA etSBA)
        {
            if (dal_soba.SuaSoBenhAn(etSBA) == true)
            {
                MessageBox.Show("Sửa thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Sửa không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        //Tạo tự động mã sổ bệnh án
        public string TaoMaSoBATuDong(string maBN)
        {
            return dal_soba.TaoMaSoBATuDong(maBN);
        }

        //Kiểm tra bệnh nhân có sổ bệnh án chưa
        public bool KiemTraBNCoSoBAChua(string maBN)
        {
            if (dal_soba.KiemTraHoSoBACuaBN(maBN) == true)
            {
                return false;
            }
            return true;
        }
        // Lấy tên bệnh nhân nhờ mã bệnh nhân
        public string LayTenBNNhoMaBN(string maBN)
        {
            return dal_soba.LayTenBNNhoMaBN(maBN);
        }

        //Lấy danh sách bệnh nhân trong sổ bệnh án
        public void DoDLBenhNhanVaoComboBox(ComboBox cboDSBN)
        {
            cboDSBN.DataSource = dal_soba.DoDLBenhNhanVaoComboBox();
            cboDSBN.ValueMember = "MaBN";
            cboDSBN.DisplayMember = "HienThi";
        }
    }
}
