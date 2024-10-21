using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_BenhNhan
    {
        private string maBN;
        private string tenBN;
        private string gioiTinh;
        private DateTime ngaySinh;
        private string diaChi;
        private string ngheNghiep;
        private string sDT;
        private string danToc;
        private string tTLienHe;

        public ET_BenhNhan(string maBN, string tenBN, string gioiTinh, DateTime ngaySinh, string diaChi, string ngheNghiep, string sDT, string danToc, string tTLienHe)
        {
            this.maBN = maBN;
            this.tenBN = tenBN;
            this.gioiTinh = gioiTinh;
            this.ngaySinh = ngaySinh;
            this.diaChi = diaChi;
            this.ngheNghiep = ngheNghiep;
            this.sDT = sDT;
            this.danToc = danToc;
            this.tTLienHe = tTLienHe;
        }

        public string MaBN { get => maBN; set => maBN = value; }
        public string TenBN { get => tenBN; set => tenBN = value; }
        public string GioiTinh { get => gioiTinh; set => gioiTinh = value; }
        public DateTime NgaySinh { get => ngaySinh; set => ngaySinh = value; }
        public string DiaChi { get => diaChi; set => diaChi = value; }
        public string NgheNghiep { get => ngheNghiep; set => ngheNghiep = value; }
        public string SDT { get => sDT; set => sDT = value; }
        public string DanToc { get => danToc; set => danToc = value; }
        public string TTLienHe { get => tTLienHe; set => tTLienHe = value; }
    }
}
