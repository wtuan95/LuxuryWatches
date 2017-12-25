<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="LuxuryWatches.Admin.Pages.QLHopThu.Delete" %>


<form id="form1" runat="server">
    <asp:repeater id="repeater" runat="server" datasourceid="LinqDataSource1" itemtype="LuxuryWatches.Data.hopThu">
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
    </asp:repeater>
</form>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="LuxuryWatches.Data.LuxuryWatchesEntities" EntityTypeName="" OrderBy="daDuyet desc, hopThuID desc" TableName="hopThus"></asp:LinqDataSource>
