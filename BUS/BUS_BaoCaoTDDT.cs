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
    public class BUS_BaoCaoTDDT
    {
        private static BUS_BaoCaoTDDT instance;
        public static BUS_BaoCaoTDDT Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_BaoCaoTDDT();
                }
                return instance;
            }
        }

        public void LayDSTheoDoiDieuTri(DateTime tuNgay, DateTime denNgay, DataGridView dgv)
        {
            var usageRecords = DAL_BaoCaoTDDT.Instance.LayDSTDDTTheoKhoangTG(tuNgay, denNgay);
            dgv.DataSource = usageRecords;
        }
        public List<ET_BaoCaoTDDT> LayDSTheoDoiDieuTri(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_BaoCaoTDDT.Instance.LayDSTDDTTheoKhoangTG(tuNgay, denNgay);
        }
    }
}
