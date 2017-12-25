<%@ Page Title="Danh sách đơn hàng" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuxuryWatches.Admin.Pages.QLDonHang.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/css/dataTables.bootstrap.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!--Begin Datatables-->
    <div class="row">
        <div class="col-lg-12">
            <div class="box">
                <header>
                    <div class="icons"><i class="fa fa-table"></i></div>
                    <h5><%: Page.Title %></h5>
                </header>
                <div id="collapse4" class="body">
                    <table id="dataTable" class="table table-bordered table-condensed table-hover">
                        <thead>
                            <tr>
                                <th>Mã số</th>
                                <th>Tên khách hàng</th>
                                <th>SĐT</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th>Ngày đặt</th>
                                <th>Đã giao?</th>
                                <th>Ngày giao</th>
                                <th class="sorting_asc_disabled sorting_desc_disabled"></th>
                                <th class="sorting_asc_disabled sorting_desc_disabled"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repeater" runat="server" DataSourceID="ObjectDataSource1" ItemType="LuxuryWatches.Data.donHang">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                           <%# Eval("maDH") %>
                                        </td>
                                        <td>
                                            <b><%# Eval("tenKH") %></b>
                                        </td>
                                        <td>
                                            <%# Eval("soDT") %>
                                        </td>
                                        <td>
                                            <%# Eval("email") %>
                                        </td>
                                        <td>
                                            <%# Eval("diaChi") %>
                                        </td>                     
                                        <td>
                                            <%# Eval("tdDatHang","{0:dd/MM/yyyy hh:mm tt}") %> 
                                        </td>
                                        <td>
                                           <%# (bool)Eval("daGiaoHang") == false ? "<a title='Click để xác nhận đã giao hàng' href='Edit?maDH="+Eval("maDH")+"&tt=dagiao' class='btn btn-default btn-xs'>Chưa giao</a>" : "<a href='Edit?maDH="+Eval("maDH")+"' class='btn btn-success btn-xs'>Đã giao</a>" %>  
                                        </td>
                                        <td><%# Eval("tdGiaoHang") %></td>
                                        <td>
                                            <button type="button" data-toggle="modal" data-target="#chitietDHSo<%# Eval("maDH") %>" class="btn btn-danger btn-xs">Chi tiết</button>
                                             <!-- Modal -->
                                            <div id="chitietDHSo<%# Eval("maDH") %>" class="modal fade" role="dialog">
                                                <div class="modal-dialog modal-lg">

                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header bg-primary">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            <h4 class="modal-title">Chi tiết đơn hàng số <%# Eval("maDH") %></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table class="table table-bordered">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Sản phẩm</th>
                                                                        <th>Kích cỡ</th>
                                                                        <th>Màu sắc</th>
                                                                        <th>Đơn giá</th>
                                                                        <th>Số lượng</th>
                                                                        <th>Thành tiền</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <asp:Repeater ID="repeaterChiTietDH" runat="server" ItemType="LuxuryWatches.Data.chiTietDH" DataSource='<%# Eval("chiTietDHs") %>'>
                                                                        <ItemTemplate>
                                                                            <tr>
                                                                                <td>
                                                                                    <a href="<%# GetRouteUrl("chitietsp",new { masp = Eval("maSP"), bidanh = Eval("sanPham.biDanh") }) %>" target="_blank"><%# Eval("sanPham.tenSP") %></a>
                                                                                </td>
                                                                                <td>
                                                                                    <%# Eval("KichCo") %>
                                                                                </td>
                                                                                <td>
                                                                                    <%# Eval("MauSac") %>
                                                                                </td>
                                                                                <td>
                                                                                    <%# Eval("sanPham.giaBan","{0:#,##0}").Replace(',','.') %> đ
                                                                                </td>
                                                                                <td>
                                                                                    <%# Eval("soLuong") %>
                                                                                </td>
                                                                                <td>
                                                                                    <%# ((int)Eval("soLuong") * (int)Eval("sanPham.giaBan")).ToString("#,##0").Replace(',','.') %> đ
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                    <tr>
                                                                        <td colspan="6"><b>Tổng số lượng: <%# Eval("tongSoLuong") %></b></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="6"><b>Tổng thành tiền: <%# Eval("tongThanhTien","{0:#,##0}").Replace(',','.') %> đ</b></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a onclick="return confirm('Xác nhận xóa đơn hàng mã số <%# Eval("maDH") %> ?');" href="Delete.aspx?maDH=<%# Eval("maDH") %>" class="btn btn-default btn-xs">Xóa</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.donHangBLL"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
</asp:Content>
