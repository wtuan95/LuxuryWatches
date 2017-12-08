<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BottomHeader.ascx.cs" Inherits="LuxuryWatches.U_Controls.BottomHeader" %>
	<div class="header-bottom">
		<div class="container">
			<div class="header">
				<div class="col-md-9 header-left">
				<div class="top-nav">
					<ul class="memenu skyblue"><li class="active"><a href="/">Trang chủ</a></li>
						
                       
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                            <ItemTemplate>
                                <li class="grid" runat="server"><a href='<%# GetRouteUrl("theoloai",new { bidanh = Eval("biDanh") }) %>'> <%# Eval("tenLoai") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
					    <li class="grid">
                            <a href="<%: GetRouteUrl("gioithieu",null) %>">Thông tin shop</a>
						</li>
                        <li class="grid">
                            <a href="<%: GetRouteUrl("blog",null) %>">Blog</a>
						</li>
                        <li class="grid">
                            <a href="<%: GetRouteUrl("lienhe",null) %>">Liên hệ</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.loaiSPBLL"></asp:ObjectDataSource>
			<div class="col-md-3 header-right"> 
				<div class="search-bar">
                        <input type="text" id="txtTuKhoa" runat="server" placeholder="Tìm kiếm" name="tukhoa" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTuKhoa" CssClass="text-danger" Display="Dynamic" ErrorMessage="Bạn chưa nhập tên sản phẩm cần tìm" ValidationGroup="timkiem"></asp:RequiredFieldValidator>
&nbsp;<asp:Button ID="btnTimKiem" OnClick="btnTimKiem_Click" ValidationGroup="timkiem" runat="server"  />
                        
				</div>
			</div>
			<div class="clearfix"> </div>
			</div>
		</div>
	</div>