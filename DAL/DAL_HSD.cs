using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_HSD
    {
        private static DAL_HSD instance;
        private QLBVDataContext db = new QLBVDataContext();

        public static DAL_HSD Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_HSD();
                }
                return instance;
            }
        }

        public List<ET_HSDThuoc> LayDSThuocGanHH(int soNgay = 60)
        {
            var results = db.LayDSThuocGanHetHan(soNgay);
            return results.Select(r => new ET_HSDThuoc(
             r.MaThuoc,
             r.TenThuoc,
             r.XuatXu,
             r.NhaCungCap,
             r.LoaiThuoc,
             r.DonViTinh,
             r.QuyCachDongGoi,
             (int)r.SoLuongDVT,
             r.HamLuong,
             (float)r.Gia,
             (DateTime)r.NgaySanXuat,
             (DateTime)r.HSD,
             r.MaLo,
             (int)r.SoLuongTrongKho)).ToList();
        }

        public List<ET_HSDThuoc> LayDSThuocHH()
        {
            var results = db.LayDSThuocHetHan();
            return results.Select(r => new ET_HSDThuoc(
                r.MaThuoc,
                r.TenThuoc,
                r.XuatXu,
                r.NhaCungCap,
                r.LoaiThuoc,
                r.DonViTinh,
                r.QuyCachDongGoi,
                r.SoLuongDVT ?? 0, // Giá trị mặc định nếu null
                r.HamLuong,
                r.Gia.HasValue ? (float)r.Gia : 0f, // Xử lý nullable float
                r.NgaySanXuat ?? DateTime.MinValue, // Giá trị mặc định nếu null
                r.HSD ?? DateTime.MinValue, // Giá trị mặc định nếu null
                r.MaLo,
                r.SoLuongTrongKho ?? 0 // Giá trị mặc định nếu null
            )).ToList();
        }

    }
}
