using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BUS
{
    public class BUS_BatLoi
    {
        private static BUS_BatLoi instance;
        public static BUS_BatLoi Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new BUS_BatLoi();
                }
                return instance;
            }
        }
        //Kiểm tra trống
        public bool KiemTraTrong(IEnumerable<string> textBoxes)
        {
            // Duyệt qua từng TextBox trong danh sách
            foreach (var textBox in textBoxes)
            {
                // Kiểm tra nếu TextBox hiện tại bị trống
                if (string.IsNullOrWhiteSpace(textBox))
                {
                    return false;
                }
            }
            return true;
        }

        //Nhập ký tự đầu viết hoa và bỏ khoảng trắng thừa
        public string GiupKyTuVietHoaVaBoKhoangTrangThua(string input)
        {
            // Bước 1: Loại bỏ khoảng trắng thừa (chỉ giữ lại 1 khoảng trắng giữa các từ)
            string chuanHoaKhoangTrang = System.Text.RegularExpressions.Regex.Replace(input, @"\s+", " ");

            // Bước 2: Viết hoa ký tự đầu tiên của mỗi từ và loại bỏ khoảng trắng ở đầu và cuối
            return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(chuanHoaKhoangTrang.ToLower()).Trim();
        }
    }
}
