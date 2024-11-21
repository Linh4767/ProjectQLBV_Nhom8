using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_BaoCaoTDDT
    {
        private static DAL_BaoCaoTDDT instance;
        private QLBVDataContext db = new QLBVDataContext();

        public static DAL_BaoCaoTDDT Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_BaoCaoTDDT();
                }
                return instance;
            }
        }

        public List<ET_BaoCaoTDDT> LayDSTDDTTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.LayDSTheoDoiDieuTri(tuNgay, denNgay);
            return results.Select(r => new ET_BaoCaoTDDT(
             r.MaPhieuKB,
             (DateTime)r.NgayTheoDoi,
             r.ChiSoCanNang,
             r.ChiSoHuyetAp,
             r.ChiSoNhipTho,
             r.NhietDo,
             r.MachDap,
             r.DuongHuyet,
             r.YLenh,
             r.MaNhanVien,
             r.MaGiuong,
             r.MaTheoDoi,
             r.MaPhong,
             r.MaKhoa)).ToList();
        }
    }
}
