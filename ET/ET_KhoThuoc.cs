using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_KhoThuoc
    {
        private string maThuoc;
        private int soLuongTrongKho;
        private int soLuongDVT;

        public ET_KhoThuoc(string maThuoc, int soLuongTrongKho, int soLuongDVT)
        {
            this.MaThuoc = maThuoc;
            this.SoLuongTrongKho = soLuongTrongKho;
            this.SoLuongDVT = soLuongDVT;
        }

        public string MaThuoc { get => maThuoc; set => maThuoc = value; }
        public int SoLuongTrongKho { get => soLuongTrongKho; set => soLuongTrongKho = value; }
        public int SoLuongDVT { get => soLuongDVT; set => soLuongDVT = value; }
    }
}
