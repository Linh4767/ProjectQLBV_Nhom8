using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ChucVu
    {
        public ET_ChucVu(string maCV, string tenCV)
        {
            MaCV = maCV;
            TenCV = tenCV;
        }
        public string MaCV { get; set; }
        public string TenCV { get; set; }
    }
}
