using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_DichVu
    {
        private static DAL_DichVu instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_DichVu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_DichVu();
                }
                return instance;
            }
        }


        //Hiển thị danh sách dịch vụ
        public IQueryable HienThiDanhSachDichVu()
        {
            IQueryable dichVu = from dv in db.DichVus
                                select dv;
            return dichVu;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong()
        {
            //Lấy tất cả mã dưới dạng chuỗi
            var dsDichVu = db.DichVus.Select(dv => dv.MaDV).ToList();
            //Tìm mã lớn nhất và lấy phần số
            int maLonNhat = dsDichVu.Select(maDV => int.Parse(maDV.Substring(2))).Max();
            //Lấy mã hiện tại
            int maHienTai = maLonNhat + 1;
            //Tạo mã mới
            string maMoi = "DV" + maHienTai.ToString("D3");//Lấy 3 số phía sau 
            return maMoi;
        }

        //Hiển thị combobox Khoa
        public IQueryable HienThiComboboxKhoa()
        {
            IQueryable khoa = from k in db.Khoas
                              select new { k.MaKhoa, k.TenKhoa }; ;
            return khoa;
        }

        //Tìm dịch vụ
        public IQueryable TimKiemDichVu(string searchTerm)
        {
            IQueryable ds = from dl in db.DichVus
                            where dl.TenDV.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm dịch vụ
        public bool ThemDichVu(ET_DichVu et_dichvu)
        {
            if (db.DichVus.Any(dichVu => dichVu.TenDV == et_dichvu.TenDV || dichVu.MaDV == et_dichvu.MaDV))
            {
                return false;
            }
            try
            {
                DichVu dichVu = new DichVu
                {
                    MaDV = et_dichvu.MaDV,
                    TenDV = et_dichvu.TenDV,
                    Gia = et_dichvu.Gia,
                    MaKhoa = et_dichvu.MaKhoa
                };
                db.DichVus.InsertOnSubmit(dichVu);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa dịch vụ
        public bool XoaDichVu(string maDV)
        {
            try
            {
                var delete = from dv in db.DichVus
                             where dv.MaDV == maDV
                             select dv;
                foreach (var i in delete)
                {
                    db.DichVus.DeleteOnSubmit(i);
                    db.SubmitChanges();
                }
                return true;
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                if (ex.Number == 547)
                {
                    return false;
                }
            }
            return false;
        }

        //Sửa dịch vụ
        public bool SuaDichVu(ET_DichVu et_dichvu)
        {
            DichVu dichVu = db.DichVus.SingleOrDefault(dv => dv.MaDV == et_dichvu.MaDV);
            if (dichVu != null)
            {
                try
                {
                    dichVu.TenDV = et_dichvu.TenDV;
                    dichVu.Gia = et_dichvu.Gia;
                    dichVu.MaKhoa = et_dichvu.MaKhoa;
                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    throw new Exception("Lỗi " + ex.Message);
                }
            }
            return false;
        }
    }
}
