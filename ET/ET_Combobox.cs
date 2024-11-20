using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_Combobox
    {
        public string MaPhieuKB { get; set; }
        public string HienThi { get; set; }

        public ET_Combobox(string maPhieuKB, string hienThi)
        {
            MaPhieuKB = maPhieuKB;
            HienThi = hienThi;
        }
    }
}
