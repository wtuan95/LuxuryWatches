using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuxuryWatches.Data;
namespace LuxuryWatches.Admin.Pages.QLHopThu
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int hopThuID = int.Parse(Request.QueryString["hopThuID"].ToString());
            hopThuBLL hopthuBLL = new hopThuBLL();
            hopthuBLL.Edit(hopThuID);
            Response.Redirect("/Admin/Pages/QLHopThu", false);
        }
    }
}