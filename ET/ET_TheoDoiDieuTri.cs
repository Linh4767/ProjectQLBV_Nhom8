using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_TheoDoiDieuTri
    {
        private string maPKB;
        private DateTime ngayTheoDoi;
        private int chiSoCanNang;
        private int chiSoHuyetAp;
        private int chiSoNhipTho;
        private int nhietDo;
        private int machDap;
        private int duongHuyet;
        private string yLenh;
        private string maNV;
        private string maGiuong;
        private string maTheoDoi;

        public ET_TheoDoiDieuTri(string maPKB, DateTime ngayTheoDoi, int chiSoCanNang, int chiSoHuyetAp, int chiSoNhipTho, int nhietDo, int machDap, int duongHuyet, string yLenh, string maNV, string maGiuong, string maTheoDoi)
        {
            this.MaPKB = maPKB;
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

        public string MaPKB { get => maPKB; set => maPKB = value; }
        public DateTime NgayTheoDoi { get => ngayTheoDoi; set => ngayTheoDoi = value; }
        public int ChiSoCanNang { get => chiSoCanNang; set => chiSoCanNang = value; }
        public int ChiSoHuyetAp { get => chiSoHuyetAp; set => chiSoHuyetAp = value; }
        public int ChiSoNhipTho { get => chiSoNhipTho; set => chiSoNhipTho = value; }
        public int NhietDo { get => nhietDo; set => nhietDo = value; }
        public int MachDap { get => machDap; set => machDap = value; }
        public int DuongHuyet { get => duongHuyet; set => duongHuyet = value; }
        public string YLenh { get => yLenh; set => yLenh = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string MaGiuong { get => maGiuong; set => maGiuong = value; }
        public string MaTheoDoi { get => maTheoDoi; set => maTheoDoi = value; }
    }
}
