using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_ChuyenNganh
    {
        private static DAL_ChuyenNganh instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_ChuyenNganh Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_ChuyenNganh();
                }
                return instance;
            }
        }

        //Hiển thị danh sách chuyên ngành
        public IQueryable HienThiDanhSachChuyenNganh()
        {
            IQueryable chuyenNganh = from cn in db.ChuyenNganhs
                                     select cn;
            return chuyenNganh;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong()
        {
            //Lấy tất cả mã dưới dạng chuỗi
            var dsChuyenNganh = db.ChuyenNganhs.Select(cn => cn.MaChuyenNganh).ToList();
            //Tìm mã lớn nhất và lấy phần số
            int maLonNhat = dsChuyenNganh.Select(maCN => int.Parse(maCN.Substring(2))).Max();
            //Lấy mã hiện tại
            int maHienTai = maLonNhat + 1;
            //Tạo mã mới
            string maMoi = "CN" + maHienTai.ToString("D3");//Lấy 3 số phía sau 
            return maMoi;
        }

        //Hiển thị combobox Khoa
        public IQueryable HienThiComboboxKhoa()
        {
            IQueryable khoa = from k in db.Khoas
                              select new { k.MaKhoa, k.TenKhoa }; ;
            return khoa;
        }

        //Tìm chuyên ngành
        public IQueryable TimKiemChuyenNganh(string searchTerm)
        {
            IQueryable ds = from dl in db.ChuyenNganhs
                            where dl.TenChuyenNganh.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm chuyên ngành
        public bool ThemChuyenNganh(ET_ChuyenNganh eT_ChuyenNganh)
        {
            if (db.ChuyenNganhs.Any(chuyenNganh => chuyenNganh.TenChuyenNganh == eT_ChuyenNganh.TenChuyenNganh || chuyenNganh.MaChuyenNganh == eT_ChuyenNganh.MaChuyenNganh))
            {
                return false;
            }
            try
            {
                ChuyenNganh chuyenNganh = new ChuyenNganh
                {
                    MaChuyenNganh = eT_ChuyenNganh.MaChuyenNganh,
                    TenChuyenNganh = eT_ChuyenNganh.TenChuyenNganh,
                    MaKhoa = eT_ChuyenNganh.MaKhoa
                };
                db.ChuyenNganhs.InsertOnSubmit(chuyenNganh);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa chuyên ngành
        public bool XoaChuyenNganh(string maCN)
        {
            try
            {
                var delete = from cn in db.ChuyenNganhs
                             where cn.MaChuyenNganh == maCN
                             select cn;
                foreach (var i in delete)
                {
                    db.ChuyenNganhs.DeleteOnSubmit(i);
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

        //Sửa chuyên ngành 
        public bool SuaChuyenNganh(ET_ChuyenNganh et_ChuyenNganh)
        {
            ChuyenNganh chuyenNganh = db.ChuyenNganhs.SingleOrDefault(cn => cn.MaChuyenNganh == et_ChuyenNganh.MaChuyenNganh);
            if (chuyenNganh != null)
            {
                try
                {
                    chuyenNganh.TenChuyenNganh = et_ChuyenNganh.TenChuyenNganh;
                    chuyenNganh.MaKhoa = et_ChuyenNganh.MaKhoa;
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
