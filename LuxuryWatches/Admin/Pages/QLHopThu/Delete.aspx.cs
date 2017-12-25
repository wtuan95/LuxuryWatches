using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuxuryWatches.Data;
namespace LuxuryWatches.Admin.Pages.QLHopThu
{
    public partial class Delete : System.Web.UI.Page
    {
        hopThuBLL hopthuBLL = new hopThuBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            var dsXoa = Request.Params["dsXoa[]"];
            List<int> hopthuIDs = new List<int>();
            dsXoa.ToString().Split(',').ToList().ForEach(item=> hopthuIDs.Add(int.Parse(item.Trim())));
            hopthuBLL.Delete(hopthuIDs);
        }
    }
}