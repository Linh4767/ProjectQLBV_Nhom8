using ET;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DAL
{
    public class DAL_TheBHYT
    {
        private static DAL_TheBHYT instance;
        QLBVDataContext db = new QLBVDataContext();

        public static DAL_TheBHYT Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new DAL_TheBHYT();
                }
                return instance;
            }
        }

        public DAL_TheBHYT() { }

        //Thêm BHYT
        public bool ThemBHYT(ET_TheBHYT eT_TheBHYT)
        {
            //Kiểm tra trùng mã
            if (db.BHYTs.Any(e => e.MaSoBHYT == eT_TheBHYT.MaBHYT))
            {
                return false;
            }

            try
            {
                BHYT bhyt = new BHYT
                {
                    MaSoBHYT = eT_TheBHYT.MaBHYT,
                    NgayCap = eT_TheBHYT.NgayCap,
                    NgayHetHan = eT_TheBHYT.NgayHetHan,
                    MSBN = eT_TheBHYT.MaBN
                };
                db.BHYTs.InsertOnSubmit(bhyt);
                db.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi " + ex.Message);
                return false;
            }

        }

        //Cập nhật thẻ BHYT
        public bool SuaBHYT(ET_TheBHYT eT_TheBHYT)
        {
            BHYT sua = db.BHYTs.SingleOrDefault(e => e.MSBN == eT_TheBHYT.MaBN);
            if (sua != null)
            {
                try
                {
                    sua.MaSoBHYT = eT_TheBHYT.MaBHYT;
                    sua.NgayCap = eT_TheBHYT.NgayCap;
                    sua.NgayHetHan = eT_TheBHYT.NgayHetHan;

                    db.SubmitChanges();
                    return true;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi " + ex.Message);
                    return false;
                }

            }
            return false;
        }
    }
}
