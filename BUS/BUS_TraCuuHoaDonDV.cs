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
            return DAL_TraCuuHoaDonDV.Instance.TinhTienSuDungDVGiaNiemYetTheoPhieuVaBenhNhan(maPhieuKB);
        }
        public float TinhTienSuDungDVThucTuBNTheoPhieuVaBenhNhan(string maPhieuKB)
        {
            return DAL_TraCuuHoaDonDV.Instance.TinhTienSuDungDVThucTuBNTheoPhieuVaBenhNhan(maPhieuKB);
        }
        public void ChiTietDSSDVTheoTenHoacPhieu(string maPKB, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuHoaDonDV.Instance.ChiTietDSSDVTheoTenHoacPhieu(maPKB);
            dgv.DataSource = usageRecords;
            dgv.Columns[0].Visible = false;
            dgv.Columns[1].Visible = false;
        }
        public void ChiTietDSSDVTheoTen(string maPKB, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuHoaDonDV.Instance.ChiTietDSSDVTheoTen(maPKB);
            dgv.DataSource = usageRecords;
        }
        public void LayDanhSachPhieuKhamBenhTheoTenBN(string maBN, DataGridView dgv)
        {
            dgv.DataSource = DAL_TraCuuHoaDonDV.Instance.LayDanhSachPhieuKhamBenhTheoTenBN(maBN);
        }
        public List<ET_ThongKeSuDungDV> ThongKeHoaDonSuDungDV(string maPKB)
        {
            return DAL_TraCuuHoaDonDV.Instance.ThongKeHoaDonSuDungDV(maPKB);
        }
        public List<ET_ThongKeDSDuDungDV> ChiTietDSSDVTheoTenHoacPhieu(string maPKB)
        {
            return DAL_TraCuuHoaDonDV.Instance.ChiTietDSSDVTheoTenHoacPhieu(maPKB);
        }
    }
}
