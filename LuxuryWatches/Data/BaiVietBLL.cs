using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LuxuryWatches.Data
{
    public class BaiVietBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        public List<baiViet> LayDanhSach()
        {
            return db.baiViets.Where(m=>m.daDuyet == true).OrderByDescending(m => m.maBV).ToList();
        }
        public baiViet LayTheoBiDanh(string bidanh)
        {
            return db.baiViets.SingleOrDefault(m => m.biDanh == bidanh);
        }
    }
}