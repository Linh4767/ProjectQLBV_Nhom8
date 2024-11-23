using DAL;
using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace BUS
{
    public class BUS_TraCuuDoanhThu
    {
        private static BUS_TraCuuDoanhThu instance;
        private DAL_TraCuuDoanhThu dal_tracuudoanhthu = new DAL_TraCuuDoanhThu();
        public static BUS_TraCuuDoanhThu Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TraCuuDoanhThu();
                }
                return instance;
            }
        }
        public float TinhTienSuDungDVTheoNgay(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTheoNgay(tuNgay);
        }
        public float TinhTienSuDungDVTTTheoNgay(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTTTheoNgay(tuNgay);
        }
        public float TinhTongTienDonThuocTheoNgay(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoNgay(tuNgay);
        }
        public float TinhTienSuDungDVTheoThang(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTheoThang(tuNgay);
        }
        public float TinhTienSuDungDVTTTheoThang(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTTTheoThang(tuNgay);
        }
        public float TinhTongTienDonThuocTheoThang(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoThang(tuNgay);
        }
        public float TinhTienSuDungDVTheoNam(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTheoNam(tuNgay);
        }
        public float TinhTienSuDungDVTTTheoNam(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTTTheoNam(tuNgay);
        }
        public float TinhTongTienDonThuocTheoNam(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoNam(tuNgay);
        }
        public float TinhTienSuDungDVTrongKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTrongKhoangTG(tuNgay, denNgay);
        }
        public float TinhTienSuDungDVTTTrongKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TinhTienSuDungDVTTTrongKhoangTG(tuNgay, denNgay);
        }
        public float TinhTongTienDonThuocTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoKhoangTG(tuNgay, denNgay);
        }
        public void TinhChiTietTienSuDungDVTheoNgay(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.TinhChiTietTienSuDungDVTheoNgay(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public void TinhChiTietTienSuDungDVTheoThang(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.TinhChiTietTienSuDungDVTheoThang(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public void TinhChiTietTienSuDungDVTheoNam(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.TinhChiTietTienSuDungDVTheoNam(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public void TinhChiTietTienSuDungDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.TinhChiTietTienSuDungDVTheoKhoangTG(tuNgay, denNgay);
            dgv.DataSource = usageRecords;
            //dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoKhoangTG(DateTime tuNgay, DateTime denNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.ThongKeDSThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoNgay(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.ThongKeDSThuocTheoNgayVaDoanhThu(tuNgay);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoThang(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.ThongKeDSThuocTheoThangVaDoanhThu(tuNgay.Month, tuNgay.Year);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoNam(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = dal_tracuudoanhthu.ThongKeDSThuocTheoNamVaDoanhThu(tuNgay.Year);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }


        public float TinhTongTienDonThuocTheoNgayCoGiamBHYT(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoNgayCoGiamBHYT(tuNgay);
        }
        public float TinhTongTienDonThuocTheoThangCoGiamBHYT(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoThangCoGiamBHYT(tuNgay);
        }
        public float TinhTongTienDonThuocTheoNamCoGiamBHYT(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoNamCoGiamBHYT(tuNgay);
        }
        public float TinhTongTienDonThuocTheoKhoangTGCoGiamBHYT(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TinhTongTienDonThuocTheoKhoangTGCoGiamBHYT(tuNgay, denNgay);
        }
        //Hiển thị doanh thu tổng trong báo
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoNgay(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhDoanhThuTongSuDungDVTheoNgay(tuNgay);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoNgay(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TinhDoanhThuThucTuBNTheoNgay(tuNgay);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoNgay(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.ChiTietDSSDVTheoNgay(tuNgay);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoNgayVaDoanhThu(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.TongTienThuocTheoNgayVaDoanhThu(tuNgay);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoNgayVaDoanhThu(DateTime tuNgay)
        {
            return dal_tracuudoanhthu.ThongKeDSThuocTheoNgayVaDoanhThu(tuNgay);
        }

        //Theo tháng
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoThang(int thang, int nam)
        {
            return dal_tracuudoanhthu.TinhDoanhThuTongSuDungDVTheoThang(thang, nam);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoThang(int thang, int nam)
        {
            return dal_tracuudoanhthu.TinhDoanhThuThucTuBNTheoThang(thang, nam);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoThang(int thang, int nam)
        {
            return dal_tracuudoanhthu.ChiTietDSSDVTheoThang(thang, nam);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoThangVaDoanhThu(int thang, int nam)
        {
            return dal_tracuudoanhthu.TongTienThuocTheoThangVaDoanhThu(thang, nam);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoThangVaDoanhThu(int thang, int nam)
        {
            return dal_tracuudoanhthu.ThongKeDSThuocTheoThangVaDoanhThu(thang, nam);
        }
        //Theo năm
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoNam(int nam)
        {
            return dal_tracuudoanhthu.TinhDoanhThuTongSuDungDVTheoNam(nam);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoNam(int nam)
        {
            return dal_tracuudoanhthu.TinhDoanhThuThucTuBNTheoNam(nam);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoNam(int nam)
        {
            return dal_tracuudoanhthu.ChiTietDSSDVTheoNam(nam);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoNamVaDoanhThu(int nam)
        {
            return dal_tracuudoanhthu.TongTienThuocTheoNamVaDoanhThu(nam);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoNamVaDoanhThu(int nam)
        {
            return dal_tracuudoanhthu.ThongKeDSThuocTheoNamVaDoanhThu(nam);
        }
        //Theo khoảng thời gian
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TinhDoanhThuTongSuDungDVTheoKhoangTG(tuNgay, denNgay);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TinhDoanhThuThucTuBNTheoKhoangTG(tuNgay, denNgay);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.ChiTietDSSDVTheoKhoangTG(tuNgay, denNgay);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoKhoangTGVaDoanhThu(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.TongTienThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoKhoangTGVaDoanhThu(DateTime tuNgay, DateTime denNgay)
        {
            return dal_tracuudoanhthu.ThongKeDSThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
        }
    }
}
