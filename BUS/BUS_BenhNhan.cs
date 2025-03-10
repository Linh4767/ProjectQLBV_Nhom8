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
    public class BUS_BenhNhan
    {
        private static BUS_BenhNhan instance;
        private DAL_BenhNhan dal_bn = new DAL_BenhNhan();
        public static BUS_BenhNhan Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_BenhNhan();
                }
                return instance;
            }
        }
        private BUS_BenhNhan() { }

        //Tạo mã tự động
        public string TaoMaTuDong()
        {
            return dal_bn.TaoMaTuDong();
        }

        //lấy danh sách bệnh nhân
        public void LayDSBenhNhan(DataGridView data)
        {
            data.DataSource = dal_bn.LayDSBenhNhan();
        }

        //Lấy thông tin thẻ BHYT
        public string[] layTheBHYT(string maBN)
        {
            BHYT bhyt = dal_bn.LayTheBHYT(maBN);

            if (bhyt != null)
            {
                return new string[] { bhyt.MaSoBHYT, bhyt.NgayCap.ToString(), bhyt.NgayHetHan.ToString() };
            }

            return null;
        }

        //Thêm bệnh nhân
        public string ThemBenhNhan(ET_BenhNhan eT_BenhNhan, ET_TheBHYT eT_TheBHYT)
        {
            if (dal_bn.ThemBenhNhan(eT_BenhNhan))
            {
                if (!string.IsNullOrEmpty(eT_TheBHYT.MaBHYT))
                {
                    if (!BUS_TheBHYT.Instance.ThemBHYT(eT_TheBHYT))
                    {
                        return "Thẻ BHYT không được thêm!";
                    }
                    else
                    {
                        return "Thêm bệnh nhân và Thẻ BHYT thành công!";
                    }
                }
                return "Thêm bệnh nhân thành công!";
            }
            else
            {
                return "Thêm không thành công";
            }
        }


        //Sửa thông tin bệnh nhân
        public string SuaTTBenhNhan(ET_BenhNhan eT_BenhNhan, ET_TheBHYT eT_TheBHYT)
        {
            if (dal_bn.SuaBenhNhan(eT_BenhNhan))
            {
                // Kiểm tra xem thẻ BHYT đã tồn tại hay chưa
                BHYT bhyt = dal_bn.LayTheBHYT(eT_BenhNhan.MaBN);

                if (bhyt != null)
                {
                    // Nếu thẻ BHYT đã tồn tại, cập nhật thông tin
                    if (!string.IsNullOrEmpty(eT_TheBHYT.MaBHYT))
                    {
                        if (!BUS_TheBHYT.Instance.SuaBHYT(eT_TheBHYT))
                        {
                            return "Cập nhật thông tin bệnh nhân thành công, nhưng BHYT không được cập nhật!";
                        }
                        else
                        {
                            return "Cập nhật thông tin thành công, BHYT được cập nhật thành công!";
                        }
                    }
                    return "Cập nhật thông tin bệnh nhân thành công.";
                }
                else
                {
                    // Nếu thẻ BHYT chưa tồn tại, thêm thẻ BHYT mới
                    if (!string.IsNullOrEmpty(eT_TheBHYT.MaBHYT))
                    {
                        if (!BUS_TheBHYT.Instance.ThemBHYT(eT_TheBHYT))
                        {
                            return "Cập nhật thông tin bệnh nhân thành công, nhưng không thể thêm thẻ BHYT!";
                        }
                        else
                        {
                            return "Cập nhật thông tin bệnh nhân thành công, và thẻ BHYT đã được thêm thành công!";
                        }
                    }
                    return "Cập nhật thông tin bệnh nhân thành công.";
                }
            }
            else
            {
                return "Cập nhật không thành công";
            }
        }

        //Tìm kiếm bệnh nhân
        public void TimKiemBenhNhan(string keyword, DataGridView dgv)
        {
            if (dal_bn.KiemTraTonTai(keyword))
            {
                dgv.DataSource = dal_bn.TimKiemBenhNhan(keyword);
            }
            else
            {
                MessageBox.Show("Bệnh nhân không tồn tại", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }
    }
}
