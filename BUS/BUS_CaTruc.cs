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
    public class BUS_CaTruc
    {
        private static BUS_CaTruc instance;

        public static BUS_CaTruc Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_CaTruc();
                }
                return instance;
            }
        }

        public BUS_CaTruc() { }

        //lấy danh sách ca trực
        public void LayDSCaTruc(DataGridView data)
        {
            data.DataSource = DAL_CaTruc.Instance.LayDanhSachCaTruc();
        }

        //Lấy danh sách khoa
        public void LayDanhSachKhoa(ComboBox cbo)
        {
            cbo.DataSource = DAL_CaTruc.Instance.LayDanhSachKhoa();
        }

        //lấy danh sách phòng theo khoa
        public void LayDanhSachPhong(string maKhoa, ComboBox cbo)
        {
            cbo.DataSource = DAL_CaTruc.Instance.LayDanhSachPhong(maKhoa);
        }

        //Lấy danh sách nhân viên theo khoa
        public void LayDanhSachNhanVien(string maKhoa, ComboBox cbo)
        {
            cbo.DataSource = DAL_CaTruc.Instance.LayDanhSachNhanVien(maKhoa);
        }

        //Tạo mã
        public string TaoMa(string ca)
        {
            return DAL_CaTruc.Instance.TaoMaTuDong(ca);
        }

        //Thêm ca trực mới
        public string ThemCatruc(ET_CaTruc eT_CaTruc)
        {
            if (DAL_CaTruc.Instance.ThemCaTruc(eT_CaTruc))
            {
                return "Thêm thành công";
            }
            else
            {
                return "Thêm không thành công";
            }
        }

        //Cập nhật ca trực
        public string CapNhatCatruc(ET_CaTruc eT_CaTruc)
        {
            if (DAL_CaTruc.Instance.CapNhatNhatCaTruc(eT_CaTruc))
            {
                return "Cập nhật thành công";
            }
            else
            {
                return "Cập nhật không thành công";
            }
        }

        //Lấy khoa
        public void LayKhoa(string maK, ComboBox cbo)
        {
            var khoa = DAL_CaTruc.Instance.LayKhoa(maK);

            // Gán trực tiếp giá trị của đối tượng khoa vào ComboBox
            cbo.Text = khoa.TenKhoa;
            cbo.SelectedValue = khoa.MaKhoa;
        }

        //Tìm nhân viên
        public void TimNhanVien(string key, DataGridView data)
        {

            if (DAL_CaTruc.Instance.KiemTraTonTai(key))
            {
                data.DataSource = DAL_CaTruc.Instance.TimNhanVien(key);
            }
            else
            {
                MessageBox.Show("Không tìm thấy thông tin nhân viên này!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }
    }
}
