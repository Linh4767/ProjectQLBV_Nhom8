﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ET
{
    public class ET_Thuoc
    {
        private string maThuoc;
        private string tenThuoc;
        private string xuatXu;
        private string nhaCungCap;
        private string trangThai;
        private string loaiThuoc;
        private string donViTinh;
        private string quyCachDongGoi;
        private int? soLuongDVT;
        private int? soLuongQCDG;
        private string hamLuong;
        private float gia;
        private DateTime ngaySanXuat;
        private DateTime hanSD;
        private string maLo;
        private int soLuongNhap;
        private int soLuongHop;

        public ET_Thuoc()
        {
        }

        public ET_Thuoc(string maThuoc, string tenThuoc, string xuatXu, string nhaCungCap, string trangThai, string loaiThuoc, string donViTinh, string quyCachDongGoi, int? soLuongDVT, int? soLuongQCDG, string hamLuong, float gia, DateTime ngaySanXuat, DateTime hanSD, string maLo, int soLuongNhap, int soLuongHop)
        {
            this.MaThuoc = maThuoc;
            this.TenThuoc = tenThuoc;
            this.XuatXu = xuatXu;
            this.NhaCungCap = nhaCungCap;
            this.TrangThai = trangThai;
            this.LoaiThuoc = loaiThuoc;
            this.DonViTinh = donViTinh;
            this.QuyCachDongGoi = quyCachDongGoi;
            this.SoLuongDVT = soLuongDVT;
            this.SoLuongQCDG = soLuongQCDG;
            this.HamLuong = hamLuong;
            this.Gia = gia;
            this.NgaySanXuat = ngaySanXuat;
            this.HanSD = hanSD;
            this.MaLo = maLo;
            this.SoLuongNhap = soLuongNhap;
            this.SoLuongHop = soLuongHop;
        }

        public string MaThuoc { get => maThuoc; set => maThuoc = value; }
        public string TenThuoc { get => tenThuoc; set => tenThuoc = value; }
        public string XuatXu { get => xuatXu; set => xuatXu = value; }
        public string NhaCungCap { get => nhaCungCap; set => nhaCungCap = value; }
        public string TrangThai { get => trangThai; set => trangThai = value; }
        public string LoaiThuoc { get => loaiThuoc; set => loaiThuoc = value; }
        public string DonViTinh { get => donViTinh; set => donViTinh = value; }
        public string QuyCachDongGoi { get => quyCachDongGoi; set => quyCachDongGoi = value; }
        public int? SoLuongDVT { get => soLuongDVT; set => soLuongDVT = value; }
        public int? SoLuongQCDG { get => soLuongQCDG; set => soLuongQCDG = value; }
        public string HamLuong { get => hamLuong; set => hamLuong = value; }
        public float Gia { get => gia; set => gia = value; }
        public DateTime NgaySanXuat { get => ngaySanXuat; set => ngaySanXuat = value; }
        public DateTime HanSD { get => hanSD; set => hanSD = value; }
        public string MaLo { get => maLo; set => maLo = value; }
        public int SoLuongNhap { get => soLuongNhap; set => soLuongNhap = value; }
        public int SoLuongHop { get => soLuongHop; set => soLuongHop = value; }
    }
}
