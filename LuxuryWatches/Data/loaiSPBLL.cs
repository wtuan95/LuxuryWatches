using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using LuxuryWatches.Data;
namespace LuxuryWatches.Data
{
    public class loaiSPBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        public IEnumerable<loaiSP> LayDanhSach()
        {
            return db.loaiSPs.AsEnumerable();
        }
    }
}