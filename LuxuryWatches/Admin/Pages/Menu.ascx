<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Menu.ascx.cs" Inherits="LuxuryWatches.Admin.Pages.Menu" %>
    <ul id="menu" class="bg-blue dker">
                                  <li class="nav-header">Menu</li>
                                  <li class="nav-divider"></li>
                                
                                  <li class="">
                                    <a href="javascript:;">
                                      <i class="fa fa-products"></i>
                                      <span class="link-title">QL Sản phẩm</span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    <ul class="collapse">
                                      <li>
                                        <a href="/Admin/QLSanPham/Default.aspx">
                                          <i class="fa fa-list"></i>&nbsp; Xem danh sách </a>
                                      </li>
                                      <li>
                                        <a href="fixed-header-boxed.html">
                                          <i class="fa fa-plus"></i>&nbsp; Thêm sản phẩm </a>
                                      </li>
                                    </ul>
                                  </li>
                                  <li class="">
                                        <a href="/Admin/QLDonHang">
                                          <i class="fa fa-book"></i><span class="link-title">&nbsp;QL Đơn hàng</span>
                                        </a>
                                  </li>
                                 <li class="">
                                        <a href="/Admin/QLHopThu">
                                          <i class="fa fa-envelope"></i><span class="link-title">&nbsp;Hộp thư</span>
                                        </a>
                                  </li>
                                </ul>