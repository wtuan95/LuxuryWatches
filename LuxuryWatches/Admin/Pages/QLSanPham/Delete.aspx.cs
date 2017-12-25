using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuxuryWatches.Data;
namespace LuxuryWatches.Admin.Pages.QLSanPham
{
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int maSP = int.Parse(Request.QueryString["maSP"].ToString());
            SanPhamBLL spBLL = new SanPhamBLL();
            spBLL.Delete(maSP);
            Response.Redirect("/Admin/Pages/QLSanPham", false);
        }
    }
}