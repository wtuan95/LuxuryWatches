using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LuxuryWatches.Data
{
    public class hopThuBLL
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        
        public void Edit(int hopThuID)
        {
            hopThu item = db.hopThus.Find(hopThuID);
            if (item != null)
            {
                item.daDuyet = true;
            }
            db.Entry(item).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
        }
        public void Delete(List<int> hopThuIDs)
        {
            foreach(int hopthuID in hopThuIDs)
            {
                hopThu item = db.hopThus.Find(hopthuID);
                if(item != null)
                {
                    db.hopThus.Remove(item);
                }
            }
            db.SaveChanges();
        }
    }
}