using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_BaoCaoTDDT
    {
        public ET_BaoCaoTDDT(string maPhieuKB, DateTime ngayTheoDoi, string chiSoCanNang, string chiSoHuyetAp, string chiSoNhipTho, string nhietDo, string machDap, string duongHuyet, string yLenh, string maNV, string maGiuong, string maTheoDoi, string maPhong, string maKhoa)
        {
            MaPhieuKB = maPhieuKB;
            NgayTheoDoi = ngayTheoDoi;
            ChiSoCanNang = chiSoCanNang;
            ChiSoHuyetAp = chiSoHuyetAp;
            ChiSoNhipTho = chiSoNhipTho;
            NhietDo = nhietDo;
            MachDap = machDap;
            DuongHuyet = duongHuyet;
            YLenh = yLenh;
            MaNV = maNV;
            MaGiuong = maGiuong;
            MaTheoDoi = maTheoDoi;
            MaPhong = maPhong;
            MaKhoa = maKhoa;
        }

        public string MaPhieuKB { get; set; }
        public DateTime NgayTheoDoi { get; set; }
        public string ChiSoCanNang { get; set; }
        public string ChiSoHuyetAp { get; set; }
        public string ChiSoNhipTho { get; set; }
        public string NhietDo { get; set; }
        public string MachDap { get; set; }
        public string DuongHuyet { get; set; }
        public string YLenh { get; set; }
        public string MaNV { get; set; }
        public string MaGiuong { get; set; }
        public string MaTheoDoi { get; set; }
        public string MaPhong { get; set; }
        public string MaKhoa { get; set; }
    }
}
