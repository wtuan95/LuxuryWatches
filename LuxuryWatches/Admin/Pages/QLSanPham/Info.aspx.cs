using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuxuryWatches.Admin.Pages.QLSanPham
{
    public partial class Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmViewSanPham_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FileUpload f = frmViewSanPham.FindControl("fileHinhDaiDien") as FileUpload;
            if(f.HasFile && f.FileContent.Length > 0)
            {
                FileInfo fInfole = new FileInfo(f.FileName);
                string extend = fInfole.Extension;
                string biDanh = e.NewValues["biDanh"].ToString();
                string hinhDaiDienMoi = biDanh + "-" + DateTime.Now.Ticks.ToString() +   extend;
                objSourceSanPham.UpdateParameters["hinhDaiDienMoi"].DefaultValue = hinhDaiDienMoi;
                f.SaveAs(Server.MapPath("~/photos/" + hinhDaiDienMoi));
            }
            else
            {
                objSourceSanPham.UpdateParameters["hinhDaiDienMoi"].DefaultValue = null;
            }
        }
    }
}