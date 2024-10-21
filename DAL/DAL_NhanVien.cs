using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_NhanVien
    {
        private static DAL_NhanVien instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_NhanVien Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_NhanVien();
                }
                return instance;
            }
        }

        //Hiển thị danh sách chuyên ngành
        public IQueryable HienThiDanhSachNhanVien()
        {
            IQueryable nhanVien = from nv in db.NhanViens
                                  orderby nv.MaNV descending
                                  select nv;
            return nhanVien;
        }

        //Tạo mã tự động 
        public string TaoMaTuDong()
        {
            //Lấy tất cả mã dưới dạng chuỗi
            var dsNhanVien = db.NhanViens.Select(nv => nv.MaNV).ToList();
            //Tìm mã lớn nhất và lấy phần số
            int maLonNhat = dsNhanVien.Select(MaNV => int.Parse(MaNV.Substring(2))).Max();
            //Lấy mã hiện tại
            int maHienTai = maLonNhat + 1;
            //Tạo mã mới
            string maMoi = "NV" + maHienTai.ToString("D3");//Lấy 3 số phía sau 
            return maMoi;
        }

        //Hiển thị combobox Chức Vụ
        public IQueryable DoDuLieuLenCBCV()
        {
            IQueryable dsCV = from cv in db.ChucVus
                              select new { cv.MaCV, cv.TenCV };
            return dsCV;
        }


        //Hiển thị combobox Chuyên Ngành
        public IQueryable DoDuLieuLenCBCN()
        {
            IQueryable chuyenNganh = from cn in db.ChuyenNganhs
                                     select new { cn.MaChuyenNganh, cn.TenChuyenNganh };
            return chuyenNganh;
        }

        //Lấy chuyên ngành dựa vào khoa
        public IQueryable LayChuyenNganhDuaVaoKhoa(string maKhoa)
        {
            IQueryable dsCN = from cn in db.ChuyenNganhs
                              join k in db.Khoas
                              on cn.MaKhoa equals k.MaKhoa
                              where cn.MaKhoa == maKhoa
                              select new { cn.MaChuyenNganh, cn.TenChuyenNganh };
            return dsCN;
        }



        //Lấy chuyên ngành dựa vào khoa
        public IQueryable LayKhoaDuaVaoChuyenNganh(string maCN)
        {
            IQueryable dsKhoa = from k in db.Khoas
                                join cn in db.ChuyenNganhs
                                on k.MaKhoa equals cn.MaKhoa
                                where cn.MaChuyenNganh == maCN
                                select new { k.MaKhoa, k.TenKhoa };
            return dsKhoa;
        }

        //Tìm nhân viên
        public IQueryable TimKiemNhanVien(string searchTerm)
        {
            IQueryable ds = from dl in db.NhanViens
                            where dl.TenNV.Contains(searchTerm)
                            select dl;
            return ds;
        }

        //Thêm nhân viên
        public bool ThemNhanVien(ET_NhanVien eT_NhanVien)
        {
            if (db.NhanViens.Any(nhanVien => nhanVien.MaNV == eT_NhanVien.MaNV))
            {
                return false;
            }
            try
            {
                NhanVien nhanVien = new NhanVien
                {
                    MaNV = eT_NhanVien.MaNV,
                    TenNV = eT_NhanVien.TenNV,
                    GioiTinh = eT_NhanVien.GioiTinh,
                    NgSinh = eT_NhanVien.NgaySinh,
                    MaCV = eT_NhanVien.MaCV,
                    MaChuyenNganh = eT_NhanVien.MaChuyenNganh,
                    SDT = eT_NhanVien.SDT
                };
                db.NhanViens.InsertOnSubmit(nhanVien);

                TaiKhoan tk = new TaiKhoan { 
                    TenTaiKhoan = eT_NhanVien.MaNV,
                    MatKhau = eT_NhanVien.MaNV,
                    MaNV = eT_NhanVien.MaNV
                };
                db.TaiKhoans.InsertOnSubmit(tk);
                return true;
            }
            finally
            {
                db.SubmitChanges();
            }
        }

        //Xóa chuyên ngành
        public bool XoaNhanVien(string maNV)
        {
            try
            {
                var delete = from nv in db.NhanViens
                             where nv.MaNV == maNV
                             select nv;
                var deleteTaiKhoan = from tk in db.TaiKhoans
                                     where tk.MaNV == maNV
                                     select tk;
                foreach (var j in deleteTaiKhoan)
                {
                    db.TaiKhoans.DeleteOnSubmit(j);
                    db.SubmitChanges();
                }
                foreach (var i in delete)
                {
                    db.NhanViens.DeleteOnSubmit(i);
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

        //Sửa nhân viên
        public bool SuaNhanVien(ET_NhanVien eT_NhanVien)
        {
            NhanVien nhanVien = db.NhanViens.SingleOrDefault(nv => nv.MaNV == eT_NhanVien.MaNV);
            if (nhanVien != null)
            {
                try
                {
                    nhanVien.TenNV = eT_NhanVien.TenNV;
                    nhanVien.GioiTinh = eT_NhanVien.GioiTinh;
                    nhanVien.NgSinh = eT_NhanVien.NgaySinh;
                    nhanVien.MaCV = eT_NhanVien.MaCV;
                    nhanVien.MaChuyenNganh = eT_NhanVien.MaChuyenNganh;
                    nhanVien.SDT = eT_NhanVien.SDT;
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
