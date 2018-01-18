using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuxuryWatches
{
    public partial class Logoff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["tk"] = null;
            Session["tkThanhVien"] = null;
            Session.Abandon();
            Response.Redirect("/login");
        }
    }
}