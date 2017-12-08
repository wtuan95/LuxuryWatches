using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace LuxuryWatches
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("chitietsp", "{bidanh}-{masp}.html", "~/Pages/SanPham/ChiTiet.aspx");
            routes.MapPageRoute("theoloai", "dong-ho-loai/{bidanh}.html", "~/Pages/SanPham/TheoLoai.aspx");
            routes.MapPageRoute("theohangsx", "dong-ho-hang/{mahangsx}.html", "~/Pages/SanPham/TheoHangSX.aspx");
            routes.MapPageRoute("lienhe", "lien-he", "~/Contact.aspx");
            routes.MapPageRoute("shoppingcart", "gio-hang", "~/Pages/ShoppingCart/Default.aspx");
            routes.MapPageRoute("addtocart", "them-vao-gio", "~/Pages/ShoppingCart/AddToCart.aspx");
            routes.MapPageRoute("deletefromcart", "xoa-khoi-gio", "~/Pages/ShoppingCart/DeleteFromCart.aspx");
            routes.MapPageRoute("blog", "blog", "~/Pages/Blog/Default.aspx");
            routes.MapPageRoute("postcontent", "blog/{bidanh}.html", "~/Pages/Blog/PostContent.aspx");
            routes.MapPageRoute("gioithieu", "gioi-thieu", "~/About.aspx");
            routes.MapPageRoute("timkiem", "tim-kiem", "~/Pages/SanPham/SearchResult.aspx");
        }
    }
}
