using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LuxuryWatches.Data
{
    public class taiKhoanBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        public taiKhoan Login(string tkThanhVien, string matkhau)
        {
            return db.taiKhoans.SingleOrDefault(m => m.tkThanhVien == tkThanhVien && m.matKhau == matkhau);
        }
    }
}