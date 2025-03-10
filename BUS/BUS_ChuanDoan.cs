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
    public class BUS_ChuanDoan
    {
        private static BUS_ChuanDoan instance;
        private DAL_ChuanDoan dal_chuandoan = new DAL_ChuanDoan();
        public static BUS_ChuanDoan Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_ChuanDoan();
                }
                return instance;
            }
        }
        public void XemDSChuanDoanTheoNgay(DataGridView dgvDS, DateTime dtp)
        {
            dgvDS.DataSource = dal_chuandoan.XemDSChuanDoanTheoNgay(dtp);
        }

        //Thêm thông tin chẩn đoán
        public void ThemTTChuanDoan(ET_ChuanDoan et_CD)
        {
            if (dal_chuandoan.ThemThongTinCD(et_CD) == true)
            {
                MessageBox.Show("Thêm thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Dữ liệu đã có trong hệ thống", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        //Cập nhật thông tin chẩn đoán
        public void CapNhatTTChuanDoan(ET_ChuanDoan et_CD)
        {
            if (dal_chuandoan.SuaThongTinCD(et_CD) == true)
            {
                MessageBox.Show("Cập nhật thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("Cập nhật không thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        //Lấy thông tin bệnh nhân
        public string LayTTBN(string maPKB)
        {
            return dal_chuandoan.LayBNDuaTrenPKB(maPKB);
        }

        public void TimKiemDuaVaoTenBN(DataGridView dgv, string tuKhoa, DateTime dtp)
        {
            dgv.DataSource = dal_chuandoan.TimKiemDuaVaoTenBN(tuKhoa, dtp);
        }
    }
}
