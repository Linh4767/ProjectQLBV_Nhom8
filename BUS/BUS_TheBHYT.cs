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
            if (DAL_TheBHYT.Instance.ThemBHYT(eT_TheBHYT))
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
            if (DAL_TheBHYT.Instance.SuaBHYT(eT_TheBHYT))
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
