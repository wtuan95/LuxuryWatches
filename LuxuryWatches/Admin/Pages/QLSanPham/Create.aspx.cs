using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuxuryWatches.Admin.Pages.QLSanPham
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void frmCreateSanPham_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            if (Page.IsValid)
            {
                FileUpload f = frmCreateSanPham.FindControl("fileHinhDaiDien") as FileUpload;
                if (f.HasFile && f.FileContent.Length > 0)
                {
                    FileInfo fInfole = new FileInfo(f.FileName);
                    string extend = fInfole.Extension;
                    string biDanh = e.Values["biDanh"].ToString();
                    string hinhDaiDienMoi = biDanh + extend;
                    objSourceSanPham.InsertParameters["hinhDaiDien"].DefaultValue = hinhDaiDienMoi;
                    f.SaveAs(Server.MapPath("~/photos/" + hinhDaiDienMoi));
                }
            }
            Response.Redirect("/Admin/Pages/QLSanPham", false);
        }

        protected void frmCreateSanPham_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            
        }
    }
}