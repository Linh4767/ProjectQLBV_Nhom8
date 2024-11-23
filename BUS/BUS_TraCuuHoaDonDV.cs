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
    public class BUS_TraCuuHoaDonDV
    {
        private static BUS_TraCuuHoaDonDV instance;
        private DAL_TraCuuHoaDonDV dal_tracuuhoadondv = new DAL_TraCuuHoaDonDV();
        public static BUS_TraCuuHoaDonDV Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TraCuuHoaDonDV();
                }
                return instance;
            }
        }

        public float TinhTienSuDungDVGiaNiemYetTheoPhieuVaBenhNhan(string maPhieuKB)
        {
            return dal_tracuuhoadondv.TinhTienSuDungDVGiaNiemYetTheoPhieuVaBenhNhan(maPhieuKB);
        }
        public float TinhTienSuDungDVThucTuBNTheoPhieuVaBenhNhan(string maPhieuKB)
        {
            return dal_tracuuhoadondv.TinhTienSuDungDVThucTuBNTheoPhieuVaBenhNhan(maPhieuKB);
        }
        public void ChiTietDSSDVTheoTenHoacPhieu(string maPKB, DataGridView dgv)
        {
            var usageRecords = dal_tracuuhoadondv.ChiTietDSSDVTheoTenHoacPhieu(maPKB);
            dgv.DataSource = usageRecords;
            dgv.Columns[0].Visible = false;
            dgv.Columns[1].Visible = false;
        }
        public void ChiTietDSSDVTheoTen(string maPKB, DataGridView dgv)
        {
            var usageRecords = dal_tracuuhoadondv.ChiTietDSSDVTheoTen(maPKB);
            dgv.DataSource = usageRecords;
        }
        public void LayDanhSachPhieuKhamBenhTheoTenBN(string maBN, DataGridView dgv)
        {
            dgv.DataSource = dal_tracuuhoadondv.LayDanhSachPhieuKhamBenhTheoTenBN(maBN);
        }
        public List<ET_ThongKeSuDungDV> ThongKeHoaDonSuDungDV(string maPKB)
        {
            return dal_tracuuhoadondv.ThongKeHoaDonSuDungDV(maPKB);
        }
        public List<ET_ThongKeDSDuDungDV> ChiTietDSSDVTheoTenHoacPhieu(string maPKB)
        {
            return dal_tracuuhoadondv.ChiTietDSSDVTheoTenHoacPhieu(maPKB);
        }
    }
}
