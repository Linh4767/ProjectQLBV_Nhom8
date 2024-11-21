using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_TheoDoiDieuTri
    {
        private string maPhieuKB;
        private DateTime ngayTheoDoi;
        private string chiSoCanNang;
        private string chiSoHuyetAp;
        private string chiSoNhipTho;
        private string nhietDo;
        private string machDap;
        private string duongHuyet;
        private string yLenh;
        private string maNV;
        private string maGiuong;
        private string maTheoDoi;

        public ET_TheoDoiDieuTri(string maPhieuKB, DateTime ngayTheoDoi, string chiSoCanNang, string chiSoHuyetAp, string chiSoNhipTho, string nhietDo, string machDap, string duongHuyet, string yLenh, string maNV, string maGiuong, string maTheoDoi)
        {
            this.MaPhieuKB = maPhieuKB;
            this.NgayTheoDoi = ngayTheoDoi;
            this.ChiSoCanNang = chiSoCanNang;
            this.ChiSoHuyetAp = chiSoHuyetAp;
            this.ChiSoNhipTho = chiSoNhipTho;
            this.NhietDo = nhietDo;
            this.MachDap = machDap;
            this.DuongHuyet = duongHuyet;
            this.YLenh = yLenh;
            this.MaNV = maNV;
            this.MaGiuong = maGiuong;
            this.MaTheoDoi = maTheoDoi;
        }

        public string MaPhieuKB { get => maPhieuKB; set => maPhieuKB = value; }
        public DateTime NgayTheoDoi { get => ngayTheoDoi; set => ngayTheoDoi = value; }
        public string ChiSoCanNang { get => chiSoCanNang; set => chiSoCanNang = value; }
        public string ChiSoHuyetAp { get => chiSoHuyetAp; set => chiSoHuyetAp = value; }
        public string ChiSoNhipTho { get => chiSoNhipTho; set => chiSoNhipTho = value; }
        public string NhietDo { get => nhietDo; set => nhietDo = value; }
        public string MachDap { get => machDap; set => machDap = value; }
        public string DuongHuyet { get => duongHuyet; set => duongHuyet = value; }
        public string YLenh { get => yLenh; set => yLenh = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string MaGiuong { get => maGiuong; set => maGiuong = value; }
        public string MaTheoDoi { get => maTheoDoi; set => maTheoDoi = value; }
    }
}
