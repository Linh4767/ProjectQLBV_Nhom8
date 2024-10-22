using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_CaTruc
    {
        private static DAL_CaTruc instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_CaTruc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_CaTruc();
                }
                return instance;
            }
        }

        public DAL_CaTruc() { }

        //lấy danh sách ca trực
        public IQueryable LayDanhSachCaTruc()
        {
            IQueryable caTruc = from ct in db.CaTrucs
                                orderby ct.NgayTruc descending
                                select ct;
            return caTruc;
        }

        //Lấy danh sách khoa
        public IQueryable LayDanhSachKhoa()
        {
            IQueryable khoa = from kh in db.Khoas
                              select kh;
            return khoa;
        }

        //lấy danh sách phòng theo khoa
        public IQueryable LayDanhSachPhong(string maKhoa)
        {
            IQueryable dsPK = from phong in db.Phongs
                              where phong.MaKhoa == maKhoa
                              select phong;
            return dsPK;
        }

        //Lấy danh sách nhân viên theo khoa
        public IQueryable LayDanhSachNhanVien(string maKhoa)
        {
            IQueryable dsNV = from nv in db.NhanViens
                              join cn in db.ChuyenNganhs
                              on nv.MaChuyenNganh equals cn.MaChuyenNganh
                              where cn.MaKhoa == maKhoa && nv.MaCV != "CV5"
                              select new { nv.MaNV, nv.TenNV };
            return dsNV;
        }


        //Thêm ca trực mới
        public bool ThemCaTruc(ET_CaTruc eT_CaTruc)
        {
            try
            {
                CaTruc caTruc = new CaTruc
                {
                    MaPhong = eT_CaTruc.MaPhong,
                    MaNV = eT_CaTruc.MaNV,
                    CaTruc1 = eT_CaTruc.CaTruc,
                    NgayTruc = eT_CaTruc.NgayTruc
                };
                db.CaTrucs.InsertOnSubmit(caTruc);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message);
                return false;
            }
        }

        //Sửa thông tin ca trực


        //Kiểm tra có tồn tại nhân viên không
        public bool KiemTraTonTai(string maNV)
        {
            //ktra trung ma
            if (db.NhanViens.Any(e => e.MaNV == maNV))
            {
                return true;
            }
            return false;
        }

        //Tìm ca trực của nhân viên
        public IQueryable TimNhanVien(string key)
        {
            IQueryable nhanVien = from nv in db.CaTrucs
                                  where nv.MaNV == key
                                  select nv;
            return nhanVien;
        }
    }
}
