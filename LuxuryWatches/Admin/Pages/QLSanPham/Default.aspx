<%@ Page Title="Danh sách sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuxuryWatches.Admin.Pages.QLSanPham.Default" %>

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
                    <table id="dataTable" class="table table-bordered table-condensed table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Mã sp</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Số lượng tồn</th>
                                <th>Ngày đăng</th>
                                <th>Thành viên đăng</th>
                                <th class="sorting_asc_disabled sorting_desc_disabled"></th>
                                <th class="sorting_asc_disabled sorting_desc_disabled"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="repeaterSanPham" runat="server" DataSourceID="objSourceSanPham" ItemType="LuxuryWatches.Data.sanPham">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                           <%# Eval("maSP") %>
                                        </td>
                                        <td>
                                            <a href="<%# GetRouteUrl("chitietsp",new { masp = Eval("maSP"), bidanh = Eval("biDanh") }) %>" target="_blank"><%# Eval("tenSP") %></a>
                                        </td>
                                        <td>
                                            <%# Eval("giaBan","{0:#,##0}").Replace(',','.') %> đ
                                        </td>
                                        <td>
                                            <%# Eval("soLuong") %> 
                                        </td>
                                        <td>
                                            <%# Eval("ngayDangSP","{0:dd/MM/yyyy}") %> 
                                        </td>
                                         <td>
                                            <%# Eval("tkThanhVien") %> 
                                        </td>
                                        <td>
                                            <a href="Info.aspx?maSP=<%# Eval("maSP") %>" class="btn btn-primary btn-sm">Thông tin</a>
                                        </td>
                                          <td>
                                            <a onclick="return confirm('Xác nhận xóa <%# Eval("tenSP") %> ?');" href="Delete.aspx?maSP=<%# Eval("maSP") %>" class="btn btn-default btn-sm">Xóa</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>

                        </tbody>
                    </table>
                    <asp:ObjectDataSource ID="objSourceSanPham" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.SanPhamBLL"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/datatables/1.10.12/js/dataTables.bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.26.6/js/jquery.tablesorter.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js"></script>
    <script>
        $(function () {
            Metis.MetisTable();
            Metis.metisSortable();
        });
    </script>
</asp:Content>
