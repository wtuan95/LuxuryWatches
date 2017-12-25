using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LuxuryWatches.Data
{
    public class donHangBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        public List<donHang> LayDanhSach()
        {
            return db.donHangs.ToList();
        }
        public void Insert(string tenKH, string soDT, string diaChi, string email, List<CartItem> shoppingcart)
        {
            donHang dh = new donHang()
            {
                tenKH = tenKH,
                daGiaoHang = false,
                soDT = soDT,
                diaChi = diaChi,
                email = email,
                tdDatHang = DateTime.Now,
                tdGiaoHang = null,
                tongSoLuong = shoppingcart.Sum(m => m.soLuong),
                tongThanhTien = shoppingcart.Sum(m => m.soLuong * m.giaBan)
            };
            db.donHangs.Add(dh);
            db.SaveChanges();

            foreach(CartItem item in shoppingcart)
            {
                chiTietDH ctdh = new chiTietDH()
                {
                    maSP = item.maSP,
                    maDH = dh.maDH,
                    soLuong = item.soLuong,
                    giaBan = item.giaBan,
                    KichCo = item.kichCo,
                    MauSac = item.mauSac
                };
                db.chiTietDHs.Add(ctdh);
            }
            db.SaveChanges();
        }
        public void Edit(int maDH)
        {
            donHang dh = db.donHangs.Find(maDH);
            dh.daGiaoHang = true;
            dh.tdGiaoHang = DateTime.Now;
            db.Entry(dh).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        public void Delete(int maDH)
        {
            donHang dh = db.donHangs.Find(maDH);
            if (dh != null)
            {
                db.donHangs.Remove(dh);
                db.SaveChanges();
            }
        }
    }
}