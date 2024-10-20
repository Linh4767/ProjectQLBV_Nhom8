using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_Phong
    {
        public ET_Phong(string mSPhong, string tenPhong, string maKhoa, int soGiuong, string loai)
        {
            MSPhong = mSPhong;
            TenPhong = tenPhong;
            MaKhoa = maKhoa;
            SoGiuong = soGiuong;
            Loai = loai;
        }
        public string MSPhong { get; set; }
        public string TenPhong { get; set; }
        public string MaKhoa { get; set; }
        public int SoGiuong { get; set; }
        public string Loai { get; set; }
    }
}
