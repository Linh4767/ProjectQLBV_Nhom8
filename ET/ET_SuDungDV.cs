using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_SuDungDV
    {
        private string maNV;
        private string maPhieuKB;
        private string maDV;
        private DateTime? ngayThucHien;
        private DateTime ngayYeuCau;
        private string msPhong;
        private string maNVThucHien;
        private string ketQua;
        private string maSuDungDV;

        public ET_SuDungDV(string maNV, string maPhieuKB, string maDV, DateTime ngayThucHien, DateTime ngayYeuCau, string msPhong, string maNVThucHien, string ketQua, string maSuDungDV)
        {
            this.maNV = maNV;
            this.maPhieuKB = maPhieuKB;
            this.maDV = maDV;
            this.ngayThucHien = ngayThucHien;
            this.ngayYeuCau = ngayYeuCau;
            this.msPhong = msPhong;
            this.maNVThucHien = maNVThucHien;
            this.ketQua = ketQua;
            this.maSuDungDV = maSuDungDV;
        }
        public ET_SuDungDV(string maNV, string maPhieuKB, string maDV, DateTime ngayYeuCau, string msPhong, string maNVThucHien, string ketQua, string maSuDungDV)
        {
            this.maNV = maNV;
            this.maPhieuKB = maPhieuKB;
            this.maDV = maDV;
            this.ngayYeuCau = ngayYeuCau;
            this.msPhong = msPhong;
            this.maNVThucHien = maNVThucHien;
            this.ketQua = ketQua;
            this.maSuDungDV = maSuDungDV;
        }

        public string MaNV { get => maNV; set => maNV = value; }
        public string MaPhieuKB { get => maPhieuKB; set => maPhieuKB = value; }
        public string MaDV { get => maDV; set => maDV = value; }
        public DateTime? NgayThucHien { get => ngayThucHien; set => ngayThucHien = value; }
        public DateTime NgayYeuCau { get => ngayYeuCau; set => ngayYeuCau = value; }
        public string MsPhong { get => msPhong; set => msPhong = value; }
        public string MaNVThucHien { get => maNVThucHien; set => maNVThucHien = value; }
        public string KetQua { get => ketQua; set => ketQua = value; }
        public string MaSuDungDV { get => maSuDungDV; set => maSuDungDV = value; }
    }
}

