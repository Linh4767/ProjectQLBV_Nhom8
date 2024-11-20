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
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTheoNgay(tuNgay);
        }
        public float TinhTienSuDungDVTTTheoNgay(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTheoNgay(tuNgay);
        }
        public float TinhTongTienDonThuocTheoNgay(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNgay(tuNgay);
        }
        public float TinhTienSuDungDVTheoThang(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTheoThang(tuNgay);
        }
        public float TinhTienSuDungDVTTTheoThang(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTheoThang(tuNgay);
        }
        public float TinhTongTienDonThuocTheoThang(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoThang(tuNgay);
        }
        public float TinhTienSuDungDVTheoNam(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTheoNam(tuNgay);
        }
        public float TinhTienSuDungDVTTTheoNam(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTheoNam(tuNgay);
        }
        public float TinhTongTienDonThuocTheoNam(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNam(tuNgay);
        }
        public float TinhTienSuDungDVTrongKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTrongKhoangTG(tuNgay, denNgay);
        }
        public float TinhTienSuDungDVTTTrongKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTienSuDungDVTTTrongKhoangTG(tuNgay, denNgay);
        }
        public float TinhTongTienDonThuocTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoKhoangTG(tuNgay, denNgay);
        }
        public void TinhChiTietTienSuDungDVTheoNgay(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoNgay(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public void TinhChiTietTienSuDungDVTheoThang(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoThang(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public void TinhChiTietTienSuDungDVTheoNam(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoNam(tuNgay);
            dgv.DataSource = usageRecords;
        }
        public void TinhChiTietTienSuDungDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.TinhChiTietTienSuDungDVTheoKhoangTG(tuNgay, denNgay);
            dgv.DataSource = usageRecords;
            //dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoKhoangTG(DateTime tuNgay, DateTime denNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoNgay(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNgayVaDoanhThu(tuNgay);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoThang(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoThangVaDoanhThu(tuNgay.Month, tuNgay.Year);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }
        public void TinhChiTietTienTheoThuocTheoNam(DateTime tuNgay, DataGridView dgv)
        {
            var usageRecords = DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNamVaDoanhThu(tuNgay.Year);
            dgv.DataSource = usageRecords;
            dgv.Columns[2].Visible = false;
        }


        public float TinhTongTienDonThuocTheoNgayCoGiamBHYT(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNgayCoGiamBHYT(tuNgay);
        }
        public float TinhTongTienDonThuocTheoThangCoGiamBHYT(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoThangCoGiamBHYT(tuNgay);
        }
        public float TinhTongTienDonThuocTheoNamCoGiamBHYT(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoNamCoGiamBHYT(tuNgay);
        }
        public float TinhTongTienDonThuocTheoKhoangTGCoGiamBHYT(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhTongTienDonThuocTheoKhoangTGCoGiamBHYT(tuNgay, denNgay);
        }
        //Hiển thị doanh thu tổng trong báo
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoNgay(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoNgay(tuNgay);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoNgay(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoNgay(tuNgay);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoNgay(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoNgay(tuNgay);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoNgayVaDoanhThu(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TongTienThuocTheoNgayVaDoanhThu(tuNgay);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoNgayVaDoanhThu(DateTime tuNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNgayVaDoanhThu(tuNgay);
        }

        //Theo tháng
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoThang(int thang, int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoThang(thang, nam);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoThang(int thang, int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoThang(thang, nam);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoThang(int thang, int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoThang(thang, nam);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoThangVaDoanhThu(int thang, int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.TongTienThuocTheoThangVaDoanhThu(thang, nam);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoThangVaDoanhThu(int thang, int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoThangVaDoanhThu(thang, nam);
        }
        //Theo năm
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoNam(int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoNam(nam);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoNam(int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoNam(nam);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoNam(int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoNam(nam);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoNamVaDoanhThu(int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.TongTienThuocTheoNamVaDoanhThu(nam);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoNamVaDoanhThu(int nam)
        {
            return DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoNamVaDoanhThu(nam);
        }
        //Theo khoảng thời gian
        public List<ET_DoanhThuTongDV> TinhDoanhThuTongSuDungDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuTongSuDungDVTheoKhoangTG(tuNgay, denNgay);
        }
        public List<ET_DoanhThuThucTuBN> TinhDoanhThuThucTuBNTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TinhDoanhThuThucTuBNTheoKhoangTG(tuNgay, denNgay);
        }
        public List<ET_ThongKeDSSSDV> ChiTietDSSDVTheoKhoangTG(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.ChiTietDSSDVTheoKhoangTG(tuNgay, denNgay);
        }

        public List<ET_ThongKeThuoc> TongTienThuocTheoKhoangTGVaDoanhThu(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.TongTienThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
        }
        public List<ET_TinhChiTietTienThuoc> ThongKeDSThuocTheoKhoangTGVaDoanhThu(DateTime tuNgay, DateTime denNgay)
        {
            return DAL_TraCuuDoanhThu.Instance.ThongKeDSThuocTheoKhoangTGVaDoanhThu(tuNgay, denNgay);
        }
    }
}
