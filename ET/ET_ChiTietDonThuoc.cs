using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ChiTietDonThuoc
    {
        private string maDT;
        private string maThuoc;
        private string maLo;
        private int soLuong;
        private string cachDung;

        public ET_ChiTietDonThuoc(string maDT, string maThuoc, string maLo, int soLuong, string cachDung)
        {
            this.maDT = maDT;
            this.maThuoc = maThuoc;
            this.maLo = maLo;
            this.soLuong = soLuong;
            this.cachDung = cachDung;
        }

        public string MaDT { get => maDT; set => maDT = value; }
        public string MaThuoc { get => maThuoc; set => maThuoc = value; }
        public string MaLo { get => maLo; set => maLo = value; }
        public int SoLuong { get => soLuong; set => soLuong = value; }
        public string CachDung { get => cachDung; set => cachDung = value; }
    }
}
