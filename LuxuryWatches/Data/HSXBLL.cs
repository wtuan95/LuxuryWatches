using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LuxuryWatches.Data;
namespace LuxuryWatches.Data
{
    public class HSXBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        public IEnumerable<HangSanXuat> LayDanhSach()
        {
            return db.HangSanXuats.AsEnumerable();
        }
    }
}