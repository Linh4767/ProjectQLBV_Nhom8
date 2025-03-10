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
    public class BUS_DSBenhNhanNoiTru
    {
        private static BUS_DSBenhNhanNoiTru instance;
        private DAL_DSBenhNhanNoiTru dal_dsbnnoitru = new DAL_DSBenhNhanNoiTru();
        public static BUS_DSBenhNhanNoiTru Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_DSBenhNhanNoiTru();
                }
                return instance;
            }
        }

        public void LayDSBNNoiTruTheoNgay(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_dsbnnoitru.LayDSBNNoiTruTheoNgay(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoNgay(DateTime tuNgay)
        {
            return dal_dsbnnoitru.LayDSBNNoiTruTheoNgay(tuNgay);
        }
        public void LayDSBNNoiTruTheoThang(int thang, int nam, DataGridView dgv)
        {
            var usageRecords = dal_dsbnnoitru.LayDSBNNoiTruTheoThang(thang, nam);
            dgv.DataSource = usageRecords;
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoThang(int thang, int nam)
        {
            return dal_dsbnnoitru.LayDSBNNoiTruTheoThang(thang, nam);
        }
        public void LayDSBNNoiTruTheoNam(int nam, DataGridView dgv)
        {
            var usageRecords = dal_dsbnnoitru.LayDSBNNoiTruTheoNam(nam);
            dgv.DataSource = usageRecords;
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoNam(int nam)
        {
            return dal_dsbnnoitru.LayDSBNNoiTruTheoNam(nam);
        }
        public void LayDSBNNoiTruTheoKhoangTG(DateTime tuNgay, DateTime denNgay, DataGridView dgv)
        {
            var usageRecords = dal_dsbnnoitru.LayDSBNNoiTruTheoKhoangTG(tuNgay, denNgay);
            dgv.DataSource = usageRecords;
        }
        public List<ET_DSBenhNhanNoiTru> LayDSBNNoiTruTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_dsbnnoitru.LayDSBNNoiTruTheoKhoangTG(tuNgay, denNgay);
        }
    }
}
