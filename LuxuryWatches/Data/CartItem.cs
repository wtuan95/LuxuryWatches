using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LuxuryWatches.Data
{
    public class CartItem
    {
        public int maSP { get; set; }
        public string tenSP { get; set; }
        public string hinhDaiDien { get; set; }
        public string kichCo { get; set; }
        public string mauSac { get; set; }
        public short soLuong { get; set; }
        public int giaBan { get; set; }
        public int thanhTien
        {
            get
            {
                return soLuong * giaBan;
            }
        }
        public string biDanh { get; set; }
    }
}