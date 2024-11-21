using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_DonThuoc
    {
        private string maDT;
        private DateTime ngayKeDon;
        private string maNV;
        private string maPKB;

        public ET_DonThuoc(string maDT, DateTime ngayKeDon, string maNV, string maPKB)
        {
            this.maDT = maDT;
            this.ngayKeDon = ngayKeDon;
            this.maNV = maNV;
            this.maPKB = maPKB;
        }

        public string MaDT { get => maDT; set => maDT = value; }
        public DateTime NgayKeDon { get => ngayKeDon; set => ngayKeDon = value; }
        public string MaNV { get => maNV; set => maNV = value; }
        public string MaPKB { get => maPKB; set => maPKB = value; }
    }
}
