<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LuxuryWatches.Login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Đăng Nhập Trang Quản Trị</title>

    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">

    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/assets/lib/bootstrap/css/bootstrap.css">

    <!-- Font Awesome -->
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="/assets/css/main.css">

    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="/assets/lib/metismenu/metisMenu.css">

    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="/assets/lib/onoffcanvas/onoffcanvas.css">

    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="/assets/lib/animate.css/animate.css">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="login">
    <form id="form1" runat="server">
        <div class="form-signin">
            <div class="text-center">
                <img src="/assets/img/logo.png" alt="Metis Logo">
            </div>
            <hr>
            <div class="tab-content">
                <div id="login" class="tab-pane active">
                        <p class="text-muted text-center">
                            Đăng Nhập Vào Trang Quản Trị
                        </p>
                        <input type="text" id="txtTaikhoan" runat="server" required="required" placeholder="Nhập tài khoản" class="form-control top">
                        <input type="password" id="txtMatkhau" runat="server" required="required" placeholder="Nhập mật khẩu" class="form-control bottom">
                        <asp:Button ID="btnDangnhap" CssClass="btn btn-lg btn-primary btn-block" runat="server" OnClick="btnDangnhap_Click" Text="Đăng nhập" />
                        <label class="text-danger" id="lblLoi" runat="server"></label>
                </div>
            </div>
        </div>


        <!--jQuery -->
        <script src="/assets/lib/jquery/jquery.js"></script>

        <!--Bootstrap -->
        <script src="/assets/lib/bootstrap/js/bootstrap.js"></script>


        <script type="text/javascript">
            (function ($) {
                $(document).ready(function () {
                    $('.list-inline li > a').click(function () {
                        var activeForm = $(this).attr('href') + ' > form';
                        //console.log(activeForm);
                        $(activeForm).addClass('animated fadeIn');
                        //set timer to 1 seconds, after that, unload the animate animation
                        setTimeout(function () {
                            $(activeForm).removeClass('animated fadeIn');
                        }, 1000);
                    });
                });
            })(jQuery);
    </script>
    </form>
</body>

</html>
