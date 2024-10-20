using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_ChuyenNganh
    {
        private string maChuyenNganh;
        private string tenChuyenNganh;
        private string maKhoa;

        public ET_ChuyenNganh(string maChuyenNganh, string tenChuyenNganh, string maKhoa)
        {
            this.MaChuyenNganh = maChuyenNganh;
            this.TenChuyenNganh = tenChuyenNganh;
            this.MaKhoa = maKhoa;
        }

        public string MaChuyenNganh { get => maChuyenNganh; set => maChuyenNganh = value; }
        public string TenChuyenNganh { get => tenChuyenNganh; set => tenChuyenNganh = value; }
        public string MaKhoa { get => maKhoa; set => maKhoa = value; }

    }
}
