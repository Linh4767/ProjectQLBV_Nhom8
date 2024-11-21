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
    public class BUS_InDonThuoc
    {
        private static BUS_InDonThuoc instance;

        public static BUS_InDonThuoc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_InDonThuoc();
                }
                return instance;
            }
        }

        public List<ET_InDonThuoc> InDonThuoc(string maDT)
        {
            return DAL_InDonThuoc.Instance.InDonThuoc(maDT);
        }
        public void InDonThuoc(string maDT,DataGridView dgv)
        {
            dgv.DataSource = DAL_InDonThuoc.Instance.InDonThuoc(maDT);
        }
        public void LayDanhSachDonThuocTheoTenBN(string tenBN, DataGridView dgv)
        {
            dgv.DataSource = DAL_InDonThuoc.Instance.LayDanhSachDonThuocTheoTenBN(tenBN);
        }
    }
}
