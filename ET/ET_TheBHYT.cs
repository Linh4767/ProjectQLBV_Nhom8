using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_TheBHYT
    {
        private string maBHYT;
        private DateTime ngayCap;
        private DateTime ngayHetHan;
        private string maBN;

        public ET_TheBHYT(string maBHYT, DateTime ngayCap, DateTime ngayHetHan, string maBN)
        {
            this.maBHYT = maBHYT;
            this.ngayCap = ngayCap;
            this.ngayHetHan = ngayHetHan;
            this.maBN = maBN;
        }

        public string MaBHYT { get => maBHYT; set => maBHYT = value; }
        public DateTime NgayCap { get => ngayCap; set => ngayCap = value; }
        public DateTime NgayHetHan { get => ngayHetHan; set => ngayHetHan = value; }
        public string MaBN { get => maBN; set => maBN = value; }
    }
}
