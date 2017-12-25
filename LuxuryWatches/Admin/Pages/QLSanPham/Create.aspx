<%@ Page Title="Thêm sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="LuxuryWatches.Admin.Pages.QLSanPham.Create" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.theme.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/validationEngine.jquery.min.css">
    <style>
        .form-control.col-lg-6 {
            width: 50% !important;
        }
        .labelInfo{
            padding-top:7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div class="row">
    <div class="col-lg-12">
        <div class="box">
            <header class="dark">
                <div class="icons"><i class="fa fa-info"></i></div>
                <h5><%: Page.Title %></h5>
                <!-- .toolbar -->
            <div class="toolbar">
              <nav style="padding: 8px;">
                  <a href="javascript:;" class="btn btn-default btn-xs collapse-box">
                      <i class="fa fa-minus"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-default btn-xs full-box">
                      <i class="fa fa-expand"></i>
                  </a>
                  <a href="javascript:;" class="btn btn-danger btn-xs close-box">
                      <i class="fa fa-times"></i>
                  </a>
              </nav>
            </div>            <!-- /.toolbar -->

            </header>
                <asp:FormView ValidateRequestMode="Disabled" ID="frmCreateSanPham" DefaultMode="Insert" runat="server" RenderOuterTable="false" ItemType="LuxuryWatches.Data.sanPham"  DataSourceID="objSourceSanPham" OnItemInserting="frmCreateSanPham_ItemInserting" OnItemInserted="frmCreateSanPham_ItemInserted" >
                    <InsertItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">


                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên sản phẩm</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="tenSPTextBox" CssClass="validate[required] form-control" runat="server" Text='<%# Bind("tenSP") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ValidationGroup="themsp" ControlToValidate="tenSPTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tên sản phẩm không được bỏ trống!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Chọn hình đại diện</label>
                                    <div class="col-lg-4">
                                        <asp:FileUpload ID="fileHinhDaiDien" CssClass="form-control" runat="server" />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ValidationGroup="themsp" ControlToValidate="fileHinhDaiDien" ErrorMessage="Bạn chưa chọn hình đại diện!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phân loại</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="lstPhanLoai" CssClass="validate[required] form-control" DataSourceID="objSourcePhanLoai" DataValueField="maLoai" DataTextField="tenLoai" SelectedValue='<%# Bind("maLoai") %>' runat="server"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Hãng SX</label>
                                    <div class="col-lg-4">
                                        <asp:DropDownList ID="lstHSX" CssClass="validate[required] form-control" DataSourceID="objSourceHangSX" DataValueField="maHangSX" DataTextField="tenHangSX" SelectedValue='<%# Bind("maHangSX") %>' runat="server"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung tóm tắt</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="ndTomTatTextBox" CssClass="form-control" TextMode="MultiLine" Rows="5" runat="server" Text='<%# Bind("ndTomTat") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giá bán</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox TextMode="Number" CssClass="validate[custom[number]] form-control" ID="giaBanTextBox" runat="server" Text='<%# Bind("giaBan") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ValidationGroup="themsp" ControlToValidate="giaBanTextBox" ErrorMessage="Bạn chưa nhập giá bán của sản phẩm!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giảm giá</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox TextMode="Number" CssClass="validate[custom[number]] form-control" ID="daGiamGiaTextBox" runat="server" Text='<%# Bind("daGiamGia") %>' />
                                        <asp:RangeValidator ID="RangeValidator1" MinimumValue="0" MaximumValue="100" ControlToValidate="daGiamGiaTextBox" ValidationGroup="suaSanPham" CssClass="text-danger" Display="Dynamic" runat="server" Type="Integer" ErrorMessage="Giám giả phải từ 0% đến 100%"></asp:RangeValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số lượng</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox TextMode="Number" CssClass="validate[custom[number]] form-control" ID="soLuongTextBox" runat="server" Text='<%# Bind("soLuong") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Bí danh</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox CssClass="validate[required] form-control" ID="BiDanhTextBox" runat="server" Text='<%# Bind("biDanh") %>' />
                                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ValidationGroup="themsp" ControlToValidate="BiDanhTextBox" ErrorMessage="Bạn chưa nhập bí danh của sản phẩm!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Màu sắc</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="mauSacTextBox" runat="server" CssClass="form-control" Text='<%# Bind("mauSac") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Kích cỡ</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="kichCoTextBox" runat="server" CssClass="form-control" Text='<%# Bind("kichCo") %>' />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung</label>
                                    <div class="col-lg-8">
                                        <asp:TextBox TextMode="MultiLine" ClientIDMode="Static" ID="ndSanPhamTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ndSanPham") %>' />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <asp:LinkButton CssClass="btn btn-danger" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Tạo mới" />
                                        &nbsp;<a href="Default.aspx" class="btn btn-default">Trở về</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </InsertItemTemplate>
                </asp:FormView>
        </div>
    </div>
    <asp:ObjectDataSource ID="objSourceSanPham" runat="server" SelectMethod="LaySanPhamTheoMa" TypeName="LuxuryWatches.Data.SanPhamBLL" InsertMethod="Create">
            <SelectParameters>
                <asp:QueryStringParameter Name="masp" QueryStringField="maSP" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:FormParameter DbType="String" FormField="tenSP" Name="tenSP" />
                <asp:FormParameter DbType="String" FormField="maLoai" Name="maLoai" />
                <asp:FormParameter DbType="String" FormField="maHangSX" Name="maHangSX" />
                <asp:FormParameter DbType="String" FormField="ndTomTat" Name="ndTomTat" />
                <asp:FormParameter DbType="Int32" FormField="giaBan" Name="giaBan" />
                <asp:FormParameter DbType="Int32" FormField="daGiamGia" Name="daGiamGia" />
                <asp:FormParameter DbType="Int32" FormField="soLuong" Name="soLuong" />
                <asp:FormParameter DbType="String" FormField="biDanh" Name="biDanh" />
                <asp:FormParameter FormField="ndSanPham" Name="ndSanPham" />
                <asp:FormParameter FormField="mauSac" Name="mauSac" />
                <asp:FormParameter DbType="String" FormField="kichCo" Name="kichCo" />
                <asp:Parameter DbType="String" Name="hinhDaiDien"   />
                <asp:SessionParameter DbType="String" SessionField="tkThanhVien" Name="tkThanhVien" />
            </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objSourcePhanLoai" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.loaiSPBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objSourceHangSX" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.HSXBLL"></asp:ObjectDataSource>
    <!-- /.col-lg-12 -->
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery.validationEngine.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/languages/jquery.validationEngine-en.min.js"></script>
    <script src="/assets/lib/jquery-validation/jquery.validate.js"></script>
    <script>
        $(function ()
        {
           Metis.formValidation();
        });
    </script>
    <script src="/ckeditor/ckeditor.js"></script>
    <script src="/ckeditor/config.js"></script>
    <script src="/ckfinder/ckfinder.js"></script>
    <script>
        var editor = CKEDITOR.replace('ndSanPhamTextBox');
        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>
</asp:Content>
