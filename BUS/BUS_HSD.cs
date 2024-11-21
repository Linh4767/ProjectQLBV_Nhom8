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
    public class BUS_HSD
    {
        private static BUS_HSD instance;
        public static BUS_HSD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_HSD();
                }
                return instance;
            }
        }

        public void LayDSThuocGanHH(DataGridView dgv, int tuNgay = 60)
        {
            var usageRecords = DAL_HSD.Instance.LayDSThuocGanHH(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public List<ET_HSDThuoc> LayDSThuocGanHH(int tuNgay = 60)
        {
            return DAL_HSD.Instance.LayDSThuocGanHH(tuNgay);
        }

        public void LayDSThuocHH(DataGridView dgv)
        {
            var usageRecords = DAL_HSD.Instance.LayDSThuocHH();
            dgv.DataSource = usageRecords;
        }
        public List<ET_HSDThuoc> LayDSThuocHH()
        {
            return DAL_HSD.Instance.LayDSThuocHH();
        }
    }
}
