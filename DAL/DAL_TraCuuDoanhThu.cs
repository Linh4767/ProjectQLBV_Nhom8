using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_TraCuuDoanhThu
    {
        private static DAL_TraCuuDoanhThu instance;
        private QLBVDataContext db = new QLBVDataContext(Connection_DAL.ConnectionString);

        public static DAL_TraCuuDoanhThu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TraCuuDoanhThu();
                }
                return instance;
            }
        }

        // Tính tổng tiền đơn thuốc theo ngày
        public float TinhTongTienDonThuocTheoNgay(DateTime tuNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoNgay(tuNgay).SingleOrDefault();

                // Kiểm tra null trước khi lấy giá trị
                return results?.TongTienThuoc != null ? (float)results.TongTienThuoc : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }

        //Tính tổng tiền đơn thuốc theo tháng
        public float TinhTongTienDonThuocTheoThang(DateTime tuNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoThang(tuNgay.Month, tuNgay.Year).SingleOrDefault();

                // Kiểm tra null trước khi lấy giá trị
                return results?.TongTienThuoc != null ? (float)results.TongTienThuoc : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }

        }
        //Tính tổng tiền đơn thuốc theo năm
        public float TinhTongTienDonThuocTheoNam(DateTime tuNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoNam(tuNgay.Year).SingleOrDefault();

                // Kiểm tra null trước khi lấy giá trị
                return results?.TongTienThuoc != null ? (float)results.TongTienThuoc : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }
        //Tính tổng tiền đơn thuốc theo khoảng thời gian
        public float TinhTongTienDonThuocTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoKhoangTG(tuNgay, denNgay).SingleOrDefault();

                // Kiểm tra null trước khi lấy giá trị
                return results?.TongTienThuoc != null ? (float)results.TongTienThuoc : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }

        //Tính tiền sử dụng dịch vụ theo ngày
        public float TinhTienSuDungDVTheoNgay(DateTime tuNgay)
        {
            var dsDichVu = (from dl in db.SuDungDichVus
                            join dv in db.DichVus on dl.MaDV equals dv.MaDV
                            where dl.NgayThucHien.HasValue && dl.NgayThucHien.Value.Date == tuNgay.Date
                            select new
                            {
                                dl.MaPhieuKB,
                                dv.Gia,
                            }).ToList();

            // Kiểm tra nếu không có dữ liệu
            if (dsDichVu.Count == 0)
            {
                return 0f; // Trả về 0 nếu không có dữ liệu
            }

            // Tính tổng tiền dịch vụ theo từng mã phiếu khám
            float totalCost = 0;
            var groupedByPKB = dsDichVu.GroupBy(dv => dv.MaPhieuKB);

            foreach (var group in groupedByPKB)
            {
                string maPKB = group.Key;

                // Tính tổng chi phí cho mã phiếu khám cụ thể, sử dụng toán tử ?? để thay thế null bằng 0
                float cost = (float)group.Sum(dv => dv.Gia ?? 0);  // Nếu Gia là null, sẽ dùng 0

                // Kiểm tra nếu bệnh nhân có BHYT
                var benhNhan = (from pk in db.PhieuKhamBenhs
                                join bn in db.BenhNhans on pk.MaBN equals bn.MSBN
                                join bhyt in db.BHYTs on bn.MSBN equals bhyt.MSBN
                                where pk.MaPhieuKB == maPKB
                                select bhyt.MaSoBHYT).FirstOrDefault();

                // Áp dụng giảm giá nếu có BHYT
                if (!string.IsNullOrEmpty(benhNhan))
                {
                    cost *= 0.8f; // Giảm 20%
                }
                totalCost += cost;
            }

            return totalCost;
        }

        //Tính doanh thu chưa trừ BHYT
        public float TinhTienSuDungDVTTTheoNgay(DateTime tuNgay)
        {
            try
            {
                // Tính tổng tiền dịch vụ cho ngày cụ thể, thay thế giá trị null của Gia bằng 0
                float totalCost = db.SuDungDichVus
                    .Join(db.DichVus,
                          sd => sd.MaDV,
                          dv => dv.MaDV,
                          (sd, dv) => new { sd, dv })
                    .Where(joined => joined.sd.NgayThucHien.HasValue &&
                                     joined.sd.NgayThucHien.Value.Date == tuNgay.Date)
                    .Sum(joined => (float)(joined.dv.Gia ?? 0));  // Nếu Gia là null, sẽ thay thế bằng 0

                // Nếu tổng tiền = 0 (không có dịch vụ hoặc tất cả Gia là null), trả về 0
                if (totalCost == 0)
                {
                    return 0f;
                }

                return totalCost;
            }
            catch (Exception ex)
            {
                // Log lỗi hoặc thông báo cho người dùng
                Console.WriteLine("Có lỗi khi truy vấn cơ sở dữ liệu: " + ex.Message);
                return 0f;  // Trả về 0 trong trường hợp lỗi
            }
        }



        //Tính tiền sử dụng dịch vụ theo tháng
        public float TinhTienSuDungDVTheoThang(DateTime tuNgay)
        {
            var dsDichVu = (from dl in db.SuDungDichVus
                            join dv in db.DichVus on dl.MaDV equals dv.MaDV
                            where dl.NgayThucHien.HasValue && dl.NgayThucHien.Value.Year == tuNgay.Year && dl.NgayThucHien.Value.Month == tuNgay.Month
                            select new
                            {
                                dl.MaPhieuKB,
                                dv.Gia,
                            }).ToList();


            // Tính tổng tiền dịch vụ theo từng mã phiếu khám
            float totalCost = 0;
            var groupedByPKB = dsDichVu.GroupBy(dv => dv.MaPhieuKB);

            foreach (var group in groupedByPKB)
            {
                string maPKB = group.Key;

                // Tính tổng chi phí cho mã phiếu khám cụ thể
                float cost = (float)group.Sum(dv => dv.Gia ?? 0);

                // Kiểm tra nếu bệnh nhân có BHYT
                var benhNhan = (from pk in db.PhieuKhamBenhs
                                join bn in db.BenhNhans on pk.MaBN equals bn.MSBN
                                join bhyt in db.BHYTs on bn.MSBN equals bhyt.MSBN
                                where pk.MaPhieuKB == maPKB
                                select bhyt.MaSoBHYT).FirstOrDefault();

                // Áp dụng giảm giá nếu có BHYT
                if (!string.IsNullOrEmpty(benhNhan))
                {
                    cost *= 0.8f; // Giảm 20%
                }
                totalCost += cost;
            }

            return totalCost;
        }
        public float TinhTienSuDungDVTTTheoThang(DateTime tuNgay)
        {
            try
            {
                // Tính tổng tiền dịch vụ cho tháng cụ thể, thay thế giá trị null của Gia bằng 0
                float totalCost = db.SuDungDichVus
                    .Join(db.DichVus,
                          sd => sd.MaDV,
                          dv => dv.MaDV,
                          (sd, dv) => new { sd, dv })
                    .Where(joined => joined.sd.NgayThucHien.HasValue &&
                                     joined.sd.NgayThucHien.Value.Year == tuNgay.Year &&  // Kiểm tra năm
                                     joined.sd.NgayThucHien.Value.Month == tuNgay.Month)   // Kiểm tra tháng
                    .Sum(joined => (float)(joined.dv.Gia ?? 0));  // Nếu Gia là null, sẽ thay thế bằng 0

                // Nếu tổng tiền = 0 (không có dịch vụ hoặc tất cả Gia là null), trả về 0
                if (totalCost == 0)
                {
                    return 0f;
                }

                return totalCost;
            }
            catch (Exception ex)
            {
                // Log lỗi hoặc thông báo cho người dùng
                Console.WriteLine("Có lỗi khi truy vấn cơ sở dữ liệu: " + ex.Message);
                return 0f;  // Trả về 0 trong trường hợp lỗi
            }
        }
        //Tính tiền sử dụng dịch vụ theo năm
        public float TinhTienSuDungDVTheoNam(DateTime tuNgay)
        {
            var dsDichVu = (from dl in db.SuDungDichVus
                            join dv in db.DichVus on dl.MaDV equals dv.MaDV
                            where dl.NgayThucHien.HasValue && dl.NgayThucHien.Value.Year == tuNgay.Year
                            select new
                            {
                                dl.MaPhieuKB,
                                dv.Gia,
                            }).ToList();

            // Kiểm tra nếu không có dữ liệu
            if (dsDichVu.Count == 0)
            {
                return 0f; // Trả về 0 nếu không có dữ liệu
            }

            // Tính tổng tiền dịch vụ theo từng mã phiếu khám
            float totalCost = 0;
            var groupedByPKB = dsDichVu.GroupBy(dv => dv.MaPhieuKB);

            foreach (var group in groupedByPKB)
            {
                string maPKB = group.Key;

                // Tính tổng chi phí cho mã phiếu khám cụ thể, sử dụng toán tử ?? để thay thế null bằng 0
                float cost = (float)group.Sum(dv => dv.Gia ?? 0);  // Nếu Gia là null, sẽ dùng 0

                // Kiểm tra nếu bệnh nhân có BHYT
                var benhNhan = (from pk in db.PhieuKhamBenhs
                                join bn in db.BenhNhans on pk.MaBN equals bn.MSBN
                                join bhyt in db.BHYTs on bn.MSBN equals bhyt.MSBN
                                where pk.MaPhieuKB == maPKB
                                select bhyt.MaSoBHYT).FirstOrDefault();

                // Áp dụng giảm giá nếu có BHYT
                if (!string.IsNullOrEmpty(benhNhan))
                {
                    cost *= 0.8f; // Giảm 20%
                }
                totalCost += cost;
            }

            return totalCost;
        }
        public float TinhTienSuDungDVTTTheoNam(DateTime tuNgay)
        {
            try
            {
                // Tính tổng tiền dịch vụ cho ngày cụ thể, thay thế giá trị null của Gia bằng 0
                float totalCost = db.SuDungDichVus
                    .Join(db.DichVus,
                          sd => sd.MaDV,
                          dv => dv.MaDV,
                          (sd, dv) => new { sd, dv })
                    .Where(joined => joined.sd.NgayThucHien.HasValue &&
                                     joined.sd.NgayThucHien.Value.Year == tuNgay.Year)
                    .Sum(joined => (float)(joined.dv.Gia ?? 0));  // Nếu Gia là null, sẽ thay thế bằng 0

                // Nếu tổng tiền = 0 (không có dịch vụ hoặc tất cả Gia là null), trả về 0
                if (totalCost == 0)
                {
                    return 0f;
                }

                return totalCost;
            }
            catch (Exception ex)
            {
                // Log lỗi hoặc thông báo cho người dùng
                Console.WriteLine("Có lỗi khi truy vấn cơ sở dữ liệu: " + ex.Message);
                return 0f;  // Trả về 0 trong trường hợp lỗi
            }
        }

        public float TinhTienSuDungDVTrongKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var dsDichVu = (from dl in db.SuDungDichVus
                            join dv in db.DichVus on dl.MaDV equals dv.MaDV
                            where dl.NgayThucHien.HasValue && dl.NgayThucHien.Value.Date >= tuNgay.Date && dl.NgayThucHien.Value.Date <= denNgay.Date
                            select new
                            {
                                dl.MaPhieuKB,
                                dv.Gia,
                            }).ToList();

            // Kiểm tra nếu không có dữ liệu
            if (dsDichVu.Count == 0)
            {
                return 0f; // Trả về 0 nếu không có dữ liệu
            }

            // Tính tổng tiền dịch vụ theo từng mã phiếu khám
            float totalCost = 0;
            var groupedByPKB = dsDichVu.GroupBy(dv => dv.MaPhieuKB);

            foreach (var group in groupedByPKB)
            {
                string maPKB = group.Key;

                // Tính tổng chi phí cho mã phiếu khám cụ thể, sử dụng toán tử ?? để thay thế null bằng 0
                float cost = (float)group.Sum(dv => dv.Gia ?? 0);  // Nếu Gia là null, sẽ dùng 0

                // Kiểm tra nếu bệnh nhân có BHYT
                var benhNhan = (from pk in db.PhieuKhamBenhs
                                join bn in db.BenhNhans on pk.MaBN equals bn.MSBN
                                join bhyt in db.BHYTs on bn.MSBN equals bhyt.MSBN
                                where pk.MaPhieuKB == maPKB
                                select bhyt.MaSoBHYT).FirstOrDefault();

                // Áp dụng giảm giá nếu có BHYT
                if (!string.IsNullOrEmpty(benhNhan))
                {
                    cost *= 0.8f; // Giảm 20%
                }
                totalCost += cost;
            }

            return totalCost;


        }
        public float TinhTienSuDungDVTTTrongKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            try
            {
                // Tính tổng tiền dịch vụ cho ngày cụ thể, thay thế giá trị null của Gia bằng 0
                float totalCost = db.SuDungDichVus
                    .Join(db.DichVus,
                          sd => sd.MaDV,
                          dv => dv.MaDV,
                          (sd, dv) => new { sd, dv })
                    .Where(joined => joined.sd.NgayThucHien.HasValue &&
                                     joined.sd.NgayThucHien.Value.Date >= tuNgay.Date && joined.sd.NgayThucHien.Value.Date <= denNgay.Date)
                    .Sum(joined => (float)(joined.dv.Gia ?? 0));  // Nếu Gia là null, sẽ thay thế bằng 0

                // Nếu tổng tiền = 0 (không có dịch vụ hoặc tất cả Gia là null), trả về 0
                if (totalCost == 0)
                {
                    return 0f;
                }

                return totalCost;
            }
            catch (Exception ex)
            {
                // Log lỗi hoặc thông báo cho người dùng
                Console.WriteLine("Có lỗi khi truy vấn cơ sở dữ liệu: " + ex.Message);
                return 0f;  // Trả về 0 trong trường hợp lỗi
            }
        }
        public IQueryable<SuDungDichVu> LayDanhSachSuDungDichVuTheoNgay(DateTime tuNgay)
        {
            var ds = from dl in db.SuDungDichVus
                     join dv in db.DichVus
                     on dl.MaDV equals dv.MaDV
                     where dl.NgayThucHien.Value.Date == tuNgay.Date
                     select dl;

            return ds;
        }
        public IQueryable<SuDungDichVu> LayDanhSachSuDungDichVuTheoThang(DateTime tuNgay)
        {
            var ds = from dl in db.SuDungDichVus
                     where dl.NgayThucHien.Value.Month == tuNgay.Month && dl.NgayThucHien.Value.Year == tuNgay.Year
                     select dl;

            return ds;
        }
        public IQueryable<SuDungDichVu> LayDanhSachSuDungDichVuTheoNam(DateTime tuNgay)
        {
            var ds = from dl in db.SuDungDichVus
                     where dl.NgayThucHien.Value.Year == tuNgay.Year
                     select dl;

            return ds;
        }
        public IQueryable<SuDungDichVu> LayDanhSachSuDungDichVuTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var ds = from dl in db.SuDungDichVus
                     where dl.NgayThucHien.Value.Date >= tuNgay.Date && dl.NgayThucHien.Value.Date <= denNgay.Date
                     select dl;

            return ds;
        }
        public List<ET_ChiTietSDDV> TinhChiTietTienSuDungDVTheoNgay(DateTime tuNgay)
        {
            var usageRecords = LayDanhSachSuDungDichVuTheoNgay(tuNgay).ToList(); // Lấy danh sách sử dụng dịch vụ trong ngày

            // Nhóm theo mã dịch vụ và tính tổng tiền cho mỗi dịch vụ trong nhóm
            var groupedServiceUsages = usageRecords
                .GroupBy(dl => new { dl.MaDV, dl.DichVu.TenDV, dl.DichVu.Gia })  // Nhóm theo mã dịch vụ và tên dịch vụ
                .Select(serviceGroup => new ET_ChiTietSDDV
                (
                    serviceGroup.Key.MaDV,  // Mã dịch vụ
                    serviceGroup.Key.TenDV,  // Tên dịch vụ
                    string.Format("{0:F0}", serviceGroup.Sum(dl => dl.DichVu.Gia)),
                    serviceGroup.Count(),  // Tổng số lượng dịch vụ sử dụng
                    string.Format("{0:F0}", serviceGroup.Key.Gia)
                // Tính tổng tiền của tất cả các dịch vụ trong nhóm
                ))
                .ToList();  // Chuyển đổi thành danh sách

            return groupedServiceUsages;
        }
        public List<ET_ChiTietSDDV> TinhChiTietTienSuDungDVTheoThang(DateTime tuNgay)
        {
            var usageRecords = LayDanhSachSuDungDichVuTheoThang(tuNgay).ToList();

            var groupedServiceUsages = usageRecords
                 .GroupBy(dl => new { dl.MaDV, dl.DichVu.TenDV, dl.DichVu.Gia })  // Nhóm theo mã dịch vụ và tên dịch vụ
                 .Select(serviceGroup => new ET_ChiTietSDDV
                 (
                     serviceGroup.Key.MaDV,  // Mã dịch vụ
                     serviceGroup.Key.TenDV,  // Tên dịch vụ
                     string.Format("{0:F0}", serviceGroup.Sum(dl => dl.DichVu.Gia)),
                     serviceGroup.Count(),  // Tổng số lượng dịch vụ sử dụng
                     string.Format("{0:F0}", serviceGroup.Key.Gia)
                 // Tính tổng tiền của tất cả các dịch vụ trong nhóm
                 ))
                 .ToList();  // Chuyển đổi thành danh sách

            return groupedServiceUsages;
        }
        public List<ET_ChiTietSDDV> TinhChiTietTienSuDungDVTheoNam(DateTime tuNgay)
        {
            var usageRecords = LayDanhSachSuDungDichVuTheoNam(tuNgay).ToList();

            var groupedServiceUsages = usageRecords
                .GroupBy(dl => new { dl.MaDV, dl.DichVu.TenDV, dl.DichVu.Gia })  // Nhóm theo mã dịch vụ và tên dịch vụ
                .Select(serviceGroup => new ET_ChiTietSDDV
                (
                    serviceGroup.Key.MaDV,  // Mã dịch vụ
                    serviceGroup.Key.TenDV,  // Tên dịch vụ
                    string.Format("{0:F0}", serviceGroup.Sum(dl => dl.DichVu.Gia)),
                    serviceGroup.Count(),  // Tổng số lượng dịch vụ sử dụng
                    string.Format("{0:F0}", serviceGroup.Key.Gia)
                // Tính tổng tiền của tất cả các dịch vụ trong nhóm
                ))
                .ToList();  // Chuyển đổi thành danh sách

            return groupedServiceUsages;
        }
        public List<ET_ChiTietSDDV> TinhChiTietTienSuDungDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var usageRecords = LayDanhSachSuDungDichVuTheoKhoangTG(tuNgay, denNgay).ToList();

            var groupedServiceUsages = usageRecords
                .GroupBy(dl => new { dl.MaDV, dl.DichVu.TenDV, dl.DichVu.Gia })  // Nhóm theo mã dịch vụ và tên dịch vụ
                .Select(serviceGroup => new ET_ChiTietSDDV
                (
                    serviceGroup.Key.MaDV,  // Mã dịch vụ
                    serviceGroup.Key.TenDV,  // Tên dịch vụ
                    string.Format("{0:F0}", serviceGroup.Sum(dl => dl.DichVu.Gia)),
                    serviceGroup.Count(),  // Tổng số lượng dịch vụ sử dụng
                    string.Format("{0:F0}", serviceGroup.Key.Gia)
                // Tính tổng tiền của tất cả các dịch vụ trong nhóm
                ))
                .ToList();  // Chuyển đổi thành danh sách

            return groupedServiceUsages;
        }


        public float TinhTongTienDonThuocTheoNgayCoGiamBHYT(DateTime tuNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoNgay(tuNgay).SingleOrDefault();
                // Kiểm tra null trước khi lấy giá trị
                return results?.TienBenhNhanChiTra != null ? (float)results.TienBenhNhanChiTra : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }

        //Tính tổng tiền đơn thuốc theo tháng
        public float TinhTongTienDonThuocTheoThangCoGiamBHYT(DateTime tuNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoThang(tuNgay.Month, tuNgay.Year).SingleOrDefault();
                // Kiểm tra null trước khi lấy giá trị
                return results?.TienBenhNhanChiTra != null ? (float)results.TienBenhNhanChiTra : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }
        //Tính tổng tiền đơn thuốc theo năm
        public float TinhTongTienDonThuocTheoNamCoGiamBHYT(DateTime tuNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoNam(tuNgay.Year).SingleOrDefault();
                // Kiểm tra null trước khi lấy giá trị
                return results?.TienBenhNhanChiTra != null ? (float)results.TienBenhNhanChiTra : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }
        //Tính tổng tiền đơn thuốc theo khoảng thời gian
        public float TinhTongTienDonThuocTheoKhoangTGCoGiamBHYT(DateTime tuNgay, DateTime denNgay)
        {
            try
            {
                // Gọi Stored Procedure
                var results = db.TinhTongTienThuocTheoKhoangTG(tuNgay, denNgay).SingleOrDefault();
                // Kiểm tra null trước khi lấy giá trị
                return results?.TienBenhNhanChiTra != null ? (float)results.TienBenhNhanChiTra : 0f;
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần
                Console.WriteLine($"Lỗi: {ex.Message}");
                return 0f; // Trả về 0 nếu xảy ra lỗi
            }
        }

        //Hiển thị doanh thu tổng trong báo
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoNgay(DateTime tuNgay)
        {
            var results = db.TinhDoanhThuTongSuDungDVTheoNgay(tuNgay);
            return results.Select(r => new ET_DoanhThuTongDV(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoNgay(DateTime tuNgay)
        {
            var results = db.ChiTietDSSDVTheoNgay(tuNgay);
            return results.Select(r => new ET_ThongKeDSSSDV(
                r.TenDV,
                Convert.ToDouble(r.TongGia ?? 0),  // Chuyển đổi từ string sang double
                (int)(r.SoLanSuDung ?? 0),
                Convert.ToDouble(r.Gia ?? 0)
            )).ToList();
        }

        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoNgay(DateTime tuNgay)
        {
            var results = db.TinhTienSuDungDVTheoNgay(tuNgay);
            return results.Select(r => new ET_DoanhThuThucTuBN(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeThuoc> TongTienThuocTheoNgayVaDoanhThu(DateTime tuNgay)
        {
            var results = db.TinhTongTienThuocTheoNgay(tuNgay);
            return results.Select(r => new ET_ThongKeThuoc(
             (double)(r.TongTienThuoc ?? 0),
             (double)(r.TienBHYTChiTra ?? 0),
             (double)(r.TienBenhNhanChiTra ?? 0))).ToList();
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoNgayVaDoanhThu(DateTime tuNgay)
        {
            var results = db.ThongKeDSThuocTheoNgayVaDoanhThu(tuNgay);
            return results.Select(r => new ET_TinhChiTietTienThuoc(
             r.TenThuoc,
             (int)(r.SoLuong ?? 0),
             (float)(r.DonGia ?? 0),
             (float)(r.ThanhTien ?? 0))).ToList();
        }

        //Hiển thị doanh thu tổng theo tháng
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoThang(int thang, int nam)
        {
            var results = db.TinhDoanhThuTongSuDungDVTheoThang(thang, nam);
            return results.Select(r => new ET_DoanhThuTongDV(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoThang(int thang, int nam)
        {
            var results = db.ChiTietDSSDVTheoThang(thang, nam);
            return results.Select(r => new ET_ThongKeDSSSDV(
                r.TenDV,
                Convert.ToDouble(r.TongGia ?? 0),  // Chuyển đổi từ string sang double
                (int)(r.SoLanSuDung ?? 0),
                Convert.ToDouble(r.Gia ?? 0)
            )).ToList();
        }

        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoThang(int thang, int nam)
        {
            var results = db.TinhTienSuDungDVTheoThang(thang, nam);
            return results.Select(r => new ET_DoanhThuThucTuBN(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeThuoc> TongTienThuocTheoThangVaDoanhThu(int thang, int nam)
        {
            var results = db.TinhTongTienThuocTheoThang(thang, nam);
            return results.Select(r => new ET_ThongKeThuoc(
             (double)(r.TongTienThuoc ?? 0),
             (double)(r.TienBHYTChiTra ?? 0),
             (double)(r.TienBenhNhanChiTra ?? 0))).ToList();
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoThangVaDoanhThu(int thang, int nam)
        {
            var results = db.ThongKeDSThuocTheoThangVaDoanhThu(thang, nam);
            return results.Select(r => new ET_TinhChiTietTienThuoc(
             r.TenThuoc,
             (int)(r.SoLuong ?? 0),
             (float)(r.DonGia ?? 0),
             (float)(r.ThanhTien ?? 0))).ToList();
        }

        //Hiển thị doanh thu tổng theo năm
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoNam(int nam)
        {
            var results = db.TinhDoanhThuTongSuDungDVTheoNam(nam);
            return results.Select(r => new ET_DoanhThuTongDV(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoNam(int nam)
        {
            var results = db.ChiTietDSSDVTheoNam(nam);
            return results.Select(r => new ET_ThongKeDSSSDV(
                r.TenDV,
                Convert.ToDouble(r.TongGia ?? 0),  // Chuyển đổi từ string sang double
                (int)(r.SoLanSuDung ?? 0),
                Convert.ToDouble(r.Gia ?? 0)
            )).ToList();
        }

        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoNam(int nam)
        {
            var results = db.TinhTienSuDungDVTheoNam(nam);
            return results.Select(r => new ET_DoanhThuThucTuBN(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeThuoc> TongTienThuocTheoNamVaDoanhThu(int nam)
        {
            var results = db.TinhTongTienThuocTheoNam(nam);
            return results.Select(r => new ET_ThongKeThuoc(
             (double)(r.TongTienThuoc ?? 0),
             (double)(r.TienBHYTChiTra ?? 0),
             (double)(r.TienBenhNhanChiTra ?? 0))).ToList();
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoNamVaDoanhThu(int nam)
        {
            var results = db.ThongKeDSThuocTheoNamVaDoanhThu(nam);
            return results.Select(r => new ET_TinhChiTietTienThuoc(
             r.TenThuoc,
             (int)(r.SoLuong ?? 0),
             (float)(r.DonGia ?? 0),
             (float)(r.ThanhTien ?? 0))).ToList();
        }
        //Theo khoảng thời gian
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.TinhDoanhThuTongSuDungDVTheoKhoangTG(tuNgay, denNgay);
            return results.Select(r => new ET_DoanhThuTongDV(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.ChiTietDSSDVTheoKhoangTG(tuNgay, denNgay);
            return results.Select(r => new ET_ThongKeDSSSDV(
                r.TenDV,
                Convert.ToDouble(r.TongGia ?? 0),  // Chuyển đổi từ string sang double
                (int)(r.SoLanSuDung ?? 0),
                Convert.ToDouble(r.Gia ?? 0)
            )).ToList();
        }

        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.TinhTienSuDungDVTheoKhoangTG(tuNgay, denNgay);
            return results.Select(r => new ET_DoanhThuThucTuBN(
             (double)(r.TotalCost ?? 0))).ToList();
        }
        public List<ET_ThongKeThuoc> TongTienThuocTheoKhoangTGVaDoanhThu(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.TinhTongTienThuocTheoKhoangTG(tuNgay, denNgay);
            return results.Select(r => new ET_ThongKeThuoc(
             (double)(r.TongTienThuoc ?? 0),
             (double)(r.TienBHYTChiTra ?? 0),
             (double)(r.TienBenhNhanChiTra ?? 0))).ToList();
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoKhoangTGVaDoanhThu(DateTime tuNgay, DateTime denNgay)
        {
            var results = db.ThongKeDSThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
            return results.Select(r => new ET_TinhChiTietTienThuoc(
             r.TenThuoc,
             (int)(r.SoLuong ?? 0),
             (float)(r.DonGia ?? 0),
             (float)(r.ThanhTien ?? 0))).ToList();
        }
    }
}
