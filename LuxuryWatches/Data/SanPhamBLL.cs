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