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
        private string maLo;
        private int? soLuongTrongKho;

        public ET_KhoThuoc(string maThuoc, string maLo, int? soLuongTrongKho)
        {
            this.MaThuoc = maThuoc;
            this.MaLo = maLo;
            this.SoLuongTrongKho = soLuongTrongKho;
        }

        public string MaThuoc { get => maThuoc; set => maThuoc = value; }
        public string MaLo { get => maLo; set => maLo = value; }
        public int? SoLuongTrongKho { get => soLuongTrongKho; set => soLuongTrongKho = value; }
    }
}
