using LuxuryWatches.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuxuryWatches.Pages.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtTaikhoan.Attributes.Add("placeholder", "Tài khoản");
            txtMatkhau.Attributes.Add("placeholder", "Mật khẩu");
        }

        protected void btnLogin2_Click(object sender, EventArgs e)
        {
            taiKhoanBLL tkBLL = new taiKhoanBLL();
            taiKhoan tk = tkBLL.MemberLogin(txtTaikhoan.Text, txtMatkhau.Text);
            if (tk == null)
            {
                lblLoi.Text = "Sai tài khoản hoặc mật khẩu!";
            }
            else if (tk.duocSD == false)
            {
                lblLoi.Text = "Tài khoản đang bị khóa!";
            }
            else
            {
                Session["tkThanhVienMember"] = tk.tkThanhVien;
                Response.Redirect("/");
            }
        }
    }
}