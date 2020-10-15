using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuxuryWatches.Data;
namespace LuxuryWatches
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangnhap_Click(object sender, EventArgs e)
        {
            taiKhoanBLL tkBLL = new taiKhoanBLL();
            taiKhoan tk = tkBLL.AdminLogin(txtTaikhoan.Value, txtMatkhau.Value);
            if(tk == null)
            {
                lblLoi.InnerText = "Sai tài khoản hoặc mật khẩu!";
            }
            else if(tk.duocSD == false)
            {
                lblLoi.InnerText = "Tài khoản đang bị khóa!";
            }
            else
            {
                
                Session["tk"] = tk;
                Session["tkThanhVien"] = tk.tkThanhVien;
                Response.Redirect("/Admin");
            }
        }
    }
}