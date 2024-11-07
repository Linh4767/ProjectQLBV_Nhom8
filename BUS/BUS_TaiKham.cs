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
    public class BUS_TaiKham
    {
        private static BUS_TaiKham instance;

        public static BUS_TaiKham Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_TaiKham();
                }
                return instance;
            }
        }

        public BUS_TaiKham() { }

        //lấy danh sách tái khám
        public void LayDSTaiKham(DataGridView data)
        {
            data.DataSource = DAL_TaiKham.Instance.LayDSTaiKham();
        }

        //Tạo mã
        public string TaoMa(string maPKB)
        {
            return DAL_TaiKham.Instance.TaoMaTuDong(maPKB);
        }

        //Thêm cuộc hẹn tái khám mới
        public string ThemTaiKham(ET_TaiKham eT_TaiKham)
        {
            if (DAL_TaiKham.Instance.ThemTaiKham(eT_TaiKham))
            {
                return "Thêm thành công";
            }
            else
            {
                return "Thêm không thành công";
            }
        }

        //Cập nhật cuộc hẹn
        public string CapNhatTaiKham(ET_TaiKham eT_TaiKham)
        {
            if (DAL_TaiKham.Instance.CapNhatCuocHen(eT_TaiKham))
            {
                return "Cập nhật thành công";
            }
            else
            {
                return "Cập nhật không thành công";
            }
        }

        //Tìm kiếm
        public void TimKiemBenhNhan(string key, DataGridView dgv)
        {
            dgv.DataSource = DAL_TaiKham.Instance.TimKiemBenhNhan(key);
        }

        //lấy mã bệnh nhân từ PKB
        public string LayMaBN(string pkb)
        {
            return DAL_TaiKham.Instance.LayMaBN(pkb);
        }

        public bool KiemTraKoDatLichTaiKhamNhieuLan(string maPKB)
        {
            if (DAL_TaiKham.Instance.KiemTraKoDatLichTaiKhamNhieuLan(maPKB))
            {
                return true;
            }
            return false;
        }
    }
}
