<%@ Page Title="Hộp thư website" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuxuryWatches.Admin.Pages.QLHopThu.Default" %>

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
                                <th class="text-center">
                                    <input id="checkall" type="checkbox" /></th>
                                <th>Mã số</th>
                                <th>Tên khách hàng</th>
                                <th>SĐT</th>
                                <th>Email</th>
                                <th>Nội dung gửi</th>
                                <th>Ngày gửi</th>
                                <th>Trạng thái</th>
                                <th>Tài khoản duyệt</th>
                            </tr>
                        </thead>
                        <tbody id="tbody">
                            <asp:Repeater ID="repeater" runat="server" DataSourceID="LinqDataSource1" ItemType="LuxuryWatches.Data.hopThu">
                                <ItemTemplate>
                                    <tr>
                                        <td class="text-center">
                                            <input class="check" type="checkbox" name="check" value="<%# Eval("hopThuID") %>" />
                                        </td>
                                        <td>
                                            <%# Eval("hopThuID") %>
                                        </td>
                                        <td>
                                            <b><%# Eval("hoTen") %></b>
                                        </td>
                                        <td>
                                            <%# Eval("sdt") %>
                                        </td>
                                        <td>
                                            <%# Eval("email") %>
                                        </td>
                                        <td>
                                            <%# Eval("noiDung") %>
                                        </td>
                                        <td>
                                            <%# Eval("ngayGui","{0:dd/MM/yyyy hh:mm tt}") %> 
                                        </td>
                                        <td>
                                            <%# (bool)Eval("daDuyet") == false ? "<a title='Click để xác nhận đã duyệt thư' href='Edit?hopThuID="+Eval("hopThuID")+"' class='btn btn-default btn-xs'>Chưa duyệt</a>" : "<a href='#' class='btn btn-success btn-xs'>Đã duyệt</a>" %>  
                                        </td>
                                        <td><%# Eval("tkDuyet") %></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td class="text-center">
                                    <button id="btnXoaThu" type="button" class="btn btn-danger btn-sm">Xóa thư</button>
                                </td>
                                <td colspan="8"></td>
                            </tr>
                        </tfoot>
                    </table>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="LuxuryWatches.Data.LuxuryWatchesEntities" EntityTypeName="" OrderBy="daDuyet desc, hopThuID desc" TableName="hopThus"></asp:LinqDataSource>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!--End Datatables-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script>
        $(function () {
            $("#checkall").change(function () {
                if($(this).prop("checked") == true)
                {
                    $("input[name=check]").prop("checked", true);
                }
                else 
                {
                    $("input[name=check]").prop("checked", false);
                }
            });
            $(document).on("click", "#btnXoaThu", function() {
                if (confirm('Xác nhận xóa các thư được chọn?') == true) {
                    var dsXoa = Array();
                    var check = $(".check:checkbox:checked");
                    if (check.size() > 0) {
                        $.each(check, function (index, element) {
                            dsXoa.push(element.value);
                        })
                        $.ajax({
                            url: "/Admin/Pages/QLHopThu/Delete",
                            method: "Post",
                            data: { "dsXoa": dsXoa },
                            success: function (html) {
                                $("#tbody").html(html);
                            },
                            error: function () {
                                console.log("error ajax!");
                            }
                        });
                    }
                }
            });
        });
    </script>
</asp:Content>
