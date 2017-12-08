using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuxuryWatches.Data;
namespace LuxuryWatches.Pages.ShoppingCart
{
    public partial class Default : System.Web.UI.Page
    {
        LuxuryWatchesEntities db = new LuxuryWatchesEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public List<CartItem> GetShoppingCart()
        {
            return Session["shoppingcart"] as List<CartItem>;
        }
    }
}