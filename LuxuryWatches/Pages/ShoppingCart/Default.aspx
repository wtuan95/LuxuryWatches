<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuxuryWatches.Pages.ShoppingCart.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--start-breadcrumbs-->
	<div class="breadcrumbs">
		<div class="container">
			<div class="breadcrumbs-main">
				<ol class="breadcrumb">
					<li><a href="/">Trang chủ</a></li>
					<li class="active">Giỏ hàng</li>
				</ol>
			</div>
		</div>
	</div>
	<!--end-breadcrumbs-->
	<!--start-ckeckout-->
	<div class="ckeckout">
		<div class="container">
            <% if (Session["shoppingcart"] == null || (Session["shoppingcart"] as List<LuxuryWatches.Data.CartItem>).Count == 0)
                {%>
                <h4 class="text-center">Giỏ hàng rỗng.</h4>
            <% }
            else
            { %>
			<div class="ckeck-top heading">
				<h2>Giỏ hàng của bạn</h2>
			</div>
			<div class="ckeckout-top">
			<div class="cart-items">
				<script>$(document).ready(function(c) {
    $('.cart-header .close1').on('click', function (c) {
        var element = $(this);
                            var maSP = $(this).parent().children("input[name=maSP]").val();
                            var mauSac = $(this).parent().children("input[name=mauSac]").val();
                            var kichCo = $(this).parent().children("input[name=kichCo]").val();
                            $.get("/xoa-khoi-gio", { maSP: maSP, mauSac: mauSac, kichCo: kichCo }, function (result) {
                                console.log(result);
                                if (result.status == 1)
                                {
                                    element.parent().fadeOut('slow');
                                    $("#tongsoluong").text(result.tongSoLuong);
                                    $("#tongthanhtien").text(result.tongThanhTien);
                                }
                                else 
                                {
                                    console.log("Lỗi ajax!");
                                }
                            });
						});	  
					});
			   </script>

                <div class="in-check" >
				<ul class="unit">
					<li><span>Hình ảnh</span></li>
					<li><span>Tên sản phẩm</span></li>
                    <li><span>Màu sắc</span></li>	
                    <li><span>Kích cỡ</span></li>	
                    <li><span>Số lượng</span></li>		
					<li><span>Đơn giá</span></li>
					<li><span>Thành tiền</span></li>
					<li> </li>
					<div class="clearfix"> </div>
				</ul>
                <asp:Repeater ID="repeaterGioHang" runat="server" SelectMethod="GetShoppingCart" ItemType="LuxuryWatches.Data.CartItem">
                    <ItemTemplate>
                        <ul class="cart-header">
                            <input type="hidden" name="maSP" value="<%# Eval("maSP") %>" />
                            <input type="hidden" name="mauSac" value="<%# Eval("mauSac") %>" />
                            <input type="hidden" name="kichCo" value="<%# Eval("kichCo") %>" />
                            <div id="" class="close1" onclick="return confirm('Xác nhận xóa sản phẩm này?')"></div>
                            <li>
                                <img src="/photos/<%# Eval("hinhDaiDien") %>" width="100" height="80" /></li>
                            <li class="ring-in"><a target="_blank" href="<%# GetRouteUrl("chitietsp",new { bidanh = Eval("biDanh"), maSP = Eval("maSP") }) %>"><%# Eval("tenSP") %></a>
                            </li>
                            <li class="text-center"><%# Eval("mauSac") %></li>
                            <li class="text-center"><%# Eval("kichCo") %></li>
                            <li class="text-center"><%# Eval("soLuong") %></li>
                            <li><span class="cost"><%# Eval("giaBan","{0:#,##0}").Replace(',','.') %> đ</span></li>
                            <li><span class="cost"><%# Eval("thanhTien","{0:#,##0}").Replace(',','.') %> đ</span></li>
                            <div class="clearfix"></div>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
				 <ul class="cart-header">
                   
                            <li style="width:25%">
                                <span class="cost">Tổng số lượng: <label id="tongsoluong"><%: (Session["shoppingcart"] as List<LuxuryWatches.Data.CartItem>).Sum(m=>m.soLuong) %></label></span> </li>
                           
                            <li style="width:25%"><span class="cost">Tổng thành tiền: <label id="tongthanhtien"><%: (Session["shoppingcart"] as List<LuxuryWatches.Data.CartItem>).Sum(m=>m.thanhTien).ToString("#,##0").Replace(',','.') %></label> đ</span> </li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <div class="clearfix"></div>
                        </ul>
				
			</div>

			</div>  
		    </div>
            <% } %>
		</div>
	</div>
	<!--end-ckeckout-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Scripts_Content" runat="server">
</asp:Content>
