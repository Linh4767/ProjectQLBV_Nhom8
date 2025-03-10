using DAL;
using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class BUS_TheBHYT
    {
        private static BUS_TheBHYT instance;
        private DAL_TheBHYT dal_thebhyt = new DAL_TheBHYT();
        public static BUS_TheBHYT Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TheBHYT();
                }
                return instance;
            }
        }

        private BUS_TheBHYT() { }

        //Thêm thẻ BHYT
        public bool ThemBHYT(ET_TheBHYT eT_TheBHYT)
        {
            if (dal_thebhyt.ThemBHYT(eT_TheBHYT))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //Sửa BHYT
        public bool SuaBHYT(ET_TheBHYT eT_TheBHYT)
        {
            if (dal_thebhyt.SuaBHYT(eT_TheBHYT))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
