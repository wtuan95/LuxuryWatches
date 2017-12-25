using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LuxuryWatches.Data;
namespace LuxuryWatches.Data
{
    public class SanPhamBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        public IEnumerable<sanPham> LayDanhSach()
        {
            return db.sanPhams.OrderByDescending(m => m.maSP).ToList();
        }
        public void Edit(int maSP, string tenSP,  string maLoai, string maHangSX, string ndTomTat, int giaBan, int daGiamGia, int soLuong,
            string biDanh, string ndSanPham, string mauSac, string kichCo, int danhGia, string hinhDaiDienMoi)
        {
            sanPham sp = db.sanPhams.Find(maSP);
            sp.tenSP = tenSP;
            sp.maLoai = maLoai;
            if(!string.IsNullOrEmpty(hinhDaiDienMoi))
            {
                sp.hinhDaiDien = hinhDaiDienMoi;
            }
            sp.maHangSX = maHangSX;
            sp.ndTomTat = ndTomTat;
            sp.giaBan = giaBan;
            sp.daGiamGia = daGiamGia;
            sp.soLuong = soLuong;
            sp.biDanh = biDanh;
            sp.ndSanPham = ndSanPham;
            sp.mauSac = mauSac;
            sp.kichCo = sp.kichCo;
            sp.danhGia = sp.danhGia;
            db.Entry(sp).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();

        }

        public void Create(string tenSP, string hinhDaiDien, string maLoai, string maHangSX, string ndTomTat, int giaBan, int daGiamGia, int soLuong,
           string biDanh, string ndSanPham, string mauSac, string kichCo, string tkThanhVien)
        {
            sanPham sp = new sanPham();
            sp.tenSP = tenSP;
            sp.hinhDaiDien = hinhDaiDien;
            sp.maLoai = maLoai;
            sp.maHangSX = maHangSX;
            sp.ndTomTat = ndTomTat;
            sp.giaBan = giaBan;
            sp.daGiamGia = daGiamGia;
            sp.soLuong = soLuong;
            sp.biDanh = biDanh;
            sp.ndSanPham = ndSanPham;
            sp.mauSac = mauSac;
            sp.kichCo = sp.kichCo;
            sp.ngayDangSP = DateTime.Now;
            sp.soLanGD = 0;
            sp.soLanQT = 0;
            sp.danhGia = 0;
            sp.tkThanhVien = tkThanhVien;
            db.sanPhams.Add(sp);
            db.SaveChanges();

        }

        public void Delete(int maSP)
        {
            sanPham spXoa = db.sanPhams.Find(maSP);
            db.sanPhams.Remove(spXoa);
            db.SaveChanges();
        }
        public IQueryable<sanPham> LaySanPhamMoiNhat()
        {
            return db.sanPhams.OrderByDescending(m => m.maSP).Take(8);
        }
        public sanPham LaySanPhamTheoMa(int masp)
        {
            return db.sanPhams.Find(masp);
        }
        public IEnumerable<sanPham> LaySanPhamTheoLoai(string bidanhLoai)
        {
            return db.sanPhams.Where(m => m.loaiSP.biDanh == bidanhLoai).AsEnumerable();
        }
        public IEnumerable<sanPham> LaySanPhamTheoHang(string mahangsx)
        {
            return db.sanPhams.Where(m => m.maHangSX == mahangsx).AsEnumerable();
        }
        public IEnumerable<string> LayDsHinhKem(int masp)
        {
            sanPham sp = db.sanPhams.Find(masp);
            List<string> result = new List<string>();
            string hinh = sp.hinhDaiDien;
            for (int i = 1; i <= sp.soHinhKem; i++)
            {
                result.Add(hinh.Insert(sp.hinhDaiDien.IndexOf('.'), "-" + i.ToString()));
            }
            return result;
        }
        public IEnumerable<int> LayMangDanhGia(int masp)
        {
            sanPham sp = db.sanPhams.Find(masp);
            int[] result = new int[sp.danhGia ?? 0];
            for (int i = 0; i < sp.danhGia; i++)
            {
                result[i] = i;
            }
            return result;
        }
        public List<string> LayDsMauSac(int masp)
        {
            sanPham sp = db.sanPhams.Find(masp);
            List<string> result = sp.mauSac.Split('-').ToList();
            result.ForEach(item => item.Trim());
            return result;
        }
        public List<string> LayDsKichCo(int masp)
        {
            sanPham sp = db.sanPhams.Find(masp);
            List<string> result = sp.kichCo.Split('-').ToList();
            result.ForEach(item => item.Trim());
            return result;
        }
    }
}