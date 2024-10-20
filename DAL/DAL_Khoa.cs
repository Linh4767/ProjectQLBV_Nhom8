using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_Khoa
    {
        private static DAL_Khoa instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_Khoa Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_Khoa();
                }
                return instance;
            }
        }

    }
}
