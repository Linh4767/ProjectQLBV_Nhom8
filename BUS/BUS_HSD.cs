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
        private DAL_HSD dal_hsd = new DAL_HSD();
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
            var usageRecords = dal_hsd.LayDSThuocGanHH(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public List<ET_HSDThuoc> LayDSThuocGanHH(int tuNgay = 60)
        {
            return dal_hsd.LayDSThuocGanHH(tuNgay);
        }

        public void LayDSThuocHH(DataGridView dgv)
        {
            var usageRecords = dal_hsd.LayDSThuocHH();
            dgv.DataSource = usageRecords;
        }
        public List<ET_HSDThuoc> LayDSThuocHH()
        {
            return dal_hsd.LayDSThuocHH();
        }
    }
}
