using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ChiTietSDDV
    {
        public ET_ChiTietSDDV(string tenDichVu, string totalCost, int soLanSDDV, string giaDV)
        {
            TenDichVu = tenDichVu;
            TotalCost = totalCost;
            SoLanSDDV = soLanSDDV;
            GiaDV = giaDV;
        }

        public ET_ChiTietSDDV(string maDV, string tenDichVu, string totalCost, int soLanSDDV, string giaDV)
        {
            MaDV = maDV;
            TenDichVu = tenDichVu;
            TotalCost = totalCost;
            SoLanSDDV = soLanSDDV;
            GiaDV = giaDV;
        }

        public string MaDV { get; set; }
        public string TenDichVu { get; set; }
        public string TotalCost { get; set; }
        public int SoLanSDDV { get; set; }
        public string GiaDV { get; set; }
    }
}
