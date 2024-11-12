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
        private int? soLuongTrongKho;

        public ET_KhoThuoc(string maThuoc, int? soLuongTrongKho)
        {
            this.MaThuoc = maThuoc;
            this.SoLuongTrongKho = soLuongTrongKho;
        }

        public string MaThuoc { get => maThuoc; set => maThuoc = value; }
        public int? SoLuongTrongKho { get => soLuongTrongKho; set => soLuongTrongKho = value; }
    }
}
