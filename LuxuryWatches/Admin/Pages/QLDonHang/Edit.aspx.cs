using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuxuryWatches.Data;
namespace LuxuryWatches.Admin.Pages.QLDonHang
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int maDH = int.Parse(Request.QueryString["maDH"].ToString());
            donHangBLL dhBLL = new donHangBLL();
            dhBLL.Edit(maDH);
            Response.Redirect(Request.UrlReferrer.ToString(), false);
        }
    }
}