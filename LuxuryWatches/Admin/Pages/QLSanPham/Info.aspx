<%@ Page Title="Thông tin sản phẩm" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="LuxuryWatches.Admin.Pages.QLSanPham.Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/validationEngine.jquery.min.css">
    <style>
        .form-control.col-lg-6 {
            width: 50% !important;
        }

        .labelInfo {
            padding-top: 7px;
        }
    </style>
    <style>
        /* Style the Image Used to Trigger the Modal */

        .popupImage {
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

            .popupImage:hover {
                opacity: 0.7;
            }
        /* The Modal (background) */

        .modal-Image {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 9999; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
        }
            /* Modal Content (Image) */

            .modal-Image .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 300px;
                height: auto;
            }
            /* Caption of Modal Image (Image Text) - Same Width as the Image */

            .modal-Image #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }
            /* Add Animation - Zoom in the Modal */

            .modal-Image .modal-content, .modal-Image #caption {
                -webkit-animation-name: zoom;
                -webkit-animation-duration: 0.6s;
                animation-name: zoom;
                animation-duration: 0.6s;
            }

        @-webkit-keyframes zoom {

            from {
                -webkit-transform: scale(0);
            }

            to {
                -webkit-transform: scale(1);
            }
        }

        @keyframes zoom {

            from {
                transform: scale(0);
            }

            to {
                transform: scale(1);
            }
        }
        /* The Close Button */

        .modal-Image .close {
            position: absolute;
            top: 15px;
            right: 35px;
            color: #f1f1f1;
            font-size: 40px;
            font-weight: bold;
            transition: 0.3s;
        }

            .modal-Image .close:hover,
            .modal-Image .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
        /* 100% Image Width on Smaller Screens */

        @media only screen and (max-width: 700px) {

            .modal-Image .modal-content {
                width: 100%;
            }
        }
    </style>
    <link rel="stylesheet" href="/css/popupimage/popupImage.css" type="text/css" />

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
                    </div>
                    <!-- /.toolbar -->

                </header>
                <asp:FormView ValidateRequestMode="Disabled" ID="frmViewSanPham" runat="server" RenderOuterTable="false" ItemType="LuxuryWatches.Data.sanPham" DataSourceID="objSourceSanPham" OnItemUpdating="frmViewSanPham_ItemUpdating">
                    <EditItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">

                                <asp:HiddenField ID="maSPHidden" Value='<%# Bind("maSP") %>' runat="server" />

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên sản phẩm</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="tenSPTextBox" CssClass="validate[required] form-control" runat="server" Text='<%# Bind("tenSP") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Sửa hình (không bắt buộc)</label>
                                    <div class="col-lg-4">
                                        <asp:FileUpload ID="fileHinhDaiDien" CssClass="form-control" runat="server" />
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
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giảm giá</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox TextMode="Number" CssClass="validate[custom[number]] form-control" ID="daGiamGiaTextBox" runat="server" Text='<%# Bind("daGiamGia") %>' />
                                        <asp:RangeValidator ID="RangeValidator1" MinimumValue="0" MaximumValue="100" ControlToValidate="daGiamGiaTextBox" ValidationGroup="suaSanPham" CssClass="text-danger" Display="Dynamic" runat="server" ErrorMessage="Giám giả phải từ 0% đến 100%"></asp:RangeValidator>
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
                                    <label class="control-label col-lg-4">Đánh giá</label>
                                    <div class="col-lg-4">
                                        <asp:TextBox ID="danhGiaTextBox" CssClass="validate[custom[number]] form-control" TextMode="Number" runat="server" Text='<%# Bind("danhGia") %>' />
                                        <asp:RangeValidator ID="RangeValidator2" MinimumValue="0" MaximumValue="5" ControlToValidate="danhGiaTextBox" ValidationGroup="suaSanPham" CssClass="text-danger" Display="Dynamic" runat="server" ErrorMessage="Đánh giá nhập từ 0 đến 5"></asp:RangeValidator>
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
                                        <asp:LinkButton CssClass="btn btn-primary" ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Cập nhật" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div id="collapse2" class="body">
                            <div class="form-horizontal" id="popup-validation">

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Mã SP</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="maSPLabel" runat="server" Text='<%# Bind("maSP") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Tên SP</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="tenSPLabel" runat="server" Text='<%# Bind("tenSP") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Hình đại diện</label>
                                    <div class="col-lg-4 labelInfo">
                                        <img class="popupImage hidden" alt="<%# Eval("tenSP") %>" id="popupImage" src="/photos/<%# Eval("hinhDaiDien") %>" />
                                        <a href="javascript:document.getElementById('popupImage').click()">Xem hình</a>
                                        <!-- The Modal -->
                                        <div id="modalShowImage" class="modal-Image">
                                            <!-- The Close Button -->
                                            <span class="close">&times;</span>
                                            <!-- Modal Content (The Image) -->
                                            <img class="modal-content" id="img01" src="#" />
                                            <!-- Modal Caption (Image Text) -->
                                            <div id="caption"></div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Phân Loại</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="maLoaiLabel" runat="server" Text='<%# Bind("maLoai") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Hãng sản xuất</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="maHangSXLabel" runat="server" Text='<%# Bind("maHangSX") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung tóm tắt</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="ndTomTatLabel" runat="server" Text='<%# Bind("ndTomTat") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Thành viên đăng</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="tkThanhVienLabel" runat="server" Text='<%# Bind("tkThanhVien") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giá bán</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="giaBanLabel" runat="server" Text='<%# Bind("giaBan") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Giảm giá</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("daGiamGia")%>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số lượng</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="soLuongLabel" runat="server" Text='<%# Bind("soLuong") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Bí danh</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="biDanhLabel" runat="server" Text='<%# Bind("biDanh") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số hình kèm</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="soHinhKemLabel" runat="server" Text='<%# Bind("soHinhKem") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Màu sắc</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="mauSacLabel" runat="server" Text='<%# Bind("mauSac") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Kích cỡ</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="kichCoLabel" runat="server" Text='<%# Bind("kichCo") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Đánh giá</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("danhGia") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số lần quan tâm</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="soLanQTLabel" runat="server" Text='<%# Bind("soLanQT") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Số lần giao dịch</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="soLanGDLabel" runat="server" Text='<%# Bind("soLanGD") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Ngày đăng</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="ngayDangSPLabel" runat="server" Text='<%# Bind("ngayDangSP") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-4">Nội dung</label>
                                    <div class="col-lg-4 labelInfo">
                                        <asp:Label ID="ndSanPhamLabel" runat="server" Text='<%# Bind("ndSanPham") %>' />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-lg-4 col-lg-offset-4">
                                        <asp:Button ID="btnSua" CssClass="btn btn-primary" runat="server" Text="Sửa" CommandName="Edit" />
                                        <a href="Default.aspx" class="btn btn-default">Trở về</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <asp:ObjectDataSource ID="objSourceSanPham" runat="server" SelectMethod="LaySanPhamTheoMa" TypeName="LuxuryWatches.Data.SanPhamBLL" UpdateMethod="Edit">
        <SelectParameters>
            <asp:QueryStringParameter Name="masp" QueryStringField="maSP" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:FormParameter DbType="Int32" FormField="maSP" Name="maSP" />
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
            <asp:FormParameter FormField="kichCo" Name="kichCo" />
            <asp:FormParameter FormField="danhGia" Name="danhGia" />
            <asp:Parameter DbType="String" Name="hinhDaiDienMoi" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objSourcePhanLoai" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.loaiSPBLL"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="objSourceHangSX" runat="server" SelectMethod="LayDanhSach" TypeName="LuxuryWatches.Data.HSXBLL"></asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Scripts" runat="server">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/jquery.validationEngine.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jQuery-Validation-Engine/2.6.4/languages/jquery.validationEngine-en.min.js"></script>
    <script src="/assets/lib/jquery-validation/jquery.validate.js"></script>
    <script>
        $(function () {
            Metis.formValidation();
        });
    </script>
    <script>
        $(function () {
            // Event khi người dùng click vào hình ảnh có class popupImage
            $(".popupImage").click(function () {
                var modal = document.getElementById("modalShowImage");  // Tạo biến modal lấy ra element có Id  modalShowImage
                var captionText = document.getElementById("caption");  // Tạo biến captionText lấy ra từ element có Id caption
                var modalImg = document.getElementById("img01");   // Tạo biến modalImg lấy ra từ element có Id img01
                modal.style.display = "block";    // Hiển thị  popup
                modalImg.src = $(this).attr("src");  // Gán thuộc tính src của hình ảnh trong popup
                captionText.innerHTML = $(this).attr("alt");   // Gán giá trị cho caption theo thuộc tính alt của hình
            });
            // Event khi người dùng click nút Close popup
            $(".modal-Image .close").click(function () {
                var modal = document.getElementById("modalShowImage");
                modal.style.display = 'none';  // Ẩn popup
            });
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
