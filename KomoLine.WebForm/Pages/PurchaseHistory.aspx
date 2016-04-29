<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="KomoLine.WebForm.Pages.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <%@ Import Namespace="KomoLine.Data.Model" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="padding100" id="blog">
        <div class="container">
            <div class="section-header">
                <div class="row section-title text-center">
                    <div class="col-sm-8 col-sm-offset-2">
                        <h1 class="wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                            <span>List History Pembelian</span></h1>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <asp:Repeater runat="server" ID="PurchRepeater">
                    <ItemTemplate>
                        <div class="col-md-7">
                            <a href="#portfolioModal1" data-toggle="modal">
                                <img src="<%# ResolveUrl("~/Image/product/"+(Container.DataItem as Transaction).Product.PhotoPath) %>" class="img-responsive animated wow fadeInUp" data-wow-delay="0.2s"
                                    alt="">
                            </a>
                        </div>
                        <div class="col-md-5 animated wow fadeInRight" data-wow-delay="0.4s">
                            <h3>
                                <strong><%# (Container.DataItem as Transaction).Status %> </strong></h3>
                            <h4>Nama Penjual: <%# (Container.DataItem as Transaction).Product.Owner.Name %> </h4>
                            <p><%# (Container.DataItem as Transaction).Product.Name %> </p>
                            <p>Jumlah: <%# (Container.DataItem as Transaction).Quantity %> </p>
                            <p>Tanggal Transaksi: <%# (Container.DataItem as Transaction).StartOn %> </p>
                            
                            <a class="btn btn-success" href="#portfolioModal1" data-toggle="modal">Lihat Detail <span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <hr>


            <!-- /.row -->
        </div>
    </div>
    <!-- Use the modals below to showcase DETAIL USER ! -->
    <asp:Repeater runat="server" ID="DetailPurchRepeater" OnItemDataBound="DetailPurchRepeater_ItemDataBound" OnItemCommand="DetailPurchRepeater_ItemCommand">
        <ItemTemplate>
            <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog"
                aria-hidden="true">
                <div class="modal-content">
                    <div class="section-header">
                        <div class="row section-title text-center">
                            <div class="col-sm-8 col-sm-offset-2">
                                <h1 class="wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                                    <span>Detail Pembelian</span>ID Transaksi</h1>
                            </div>
                        </div>
                    </div>
                    <div class="close-modal" data-dismiss="modal">
                        <div class="lr">
                            <div class="rl">
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="modal-body">
                                    <!-- Project Details Go Here -->
                                    <p class="item-intro text-muted">
                                        <asp:Label runat="server" ID="lblStatus" ForeColor="Green" Font-Bold="true"></asp:Label>
                                    </p>
                                    <div class="col-lg-4">
                                        <asp:Image runat="server" ID="ProdImg" CssClass="img-responsive img-centered" AlternateText="Profile Picture" />
                                    </div>
                                    <div class="col-lg-6">

                                        <!--Review & Rating-->

                                        <div class="container">
                                            <!-- ./end row -->
                                            <div class="row">
                                                <div class="faq-wrap">
                                                    <div class="col-md-6">
                                                        <div class="panel-group" id="accordion">
                                                            <div class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <h4 class="panel-title">
                                                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><i class="fa fa-comments-o"></i>1. What is Lorem Ipsum? </a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapseOne" class="panel-collapse collapse in">

                                                                    <div class="input-group">
                                                                        <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2">Rating</span>

                                                                        <div id="stars" style="margin-left: 10%;">

                                                                            <input type="submit" style="position: absolute; left: -100px; top: -100px; width: 0px; height: 0px;" onclick="javascript: return false;" />

                                                                            <asp:Button ID="rate1" Text="Rate 1" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" UseSubmitBehavior="false" CommandArgument='<%# String.Format("1,{0}", (Container.DataItem as Transaction).Code )%>' />
                                                                            <asp:Button ID="rate2" Text="Rate 2" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" UseSubmitBehavior="false" CommandArgument='<%# String.Format("2,{0}", (Container.DataItem as Transaction).Code )%>' />
                                                                            <asp:Button ID="rate3"  Text="Rate 3" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" UseSubmitBehavior="false" CommandArgument='<%# String.Format("3,{0}", (Container.DataItem as Transaction).Code )%>' />
                                                                            <asp:Button ID="rate4" Text="Rate 4" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" UseSubmitBehavior="false" CommandArgument='<%# String.Format("4,{0}", (Container.DataItem as Transaction).Code )%>' />
                                                                            <asp:Button ID="rate5" Text="Rate 5" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" UseSubmitBehavior="false" CommandArgument='<%# String.Format("5,{0}", (Container.DataItem as Transaction).Code )%>' />

                                                                        </div>

                                                                    </div>
                                                                    <%--</div>--%>
                                                                </div>
                                                                <div class="panel panel-default">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><i class="fa fa-comments-o"></i>Review </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapseTwo" class="panel-collapse collapse">
                                                                        <div class="input-group">
                                                                            <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2">Review</span>
                                                                            <div class="input-group">
                                                                                <asp:TextBox ID="tbReview" TextMode="MultiLine" Columns="50" Rows="5" runat="server" Style="margin-left: 10%;" class="form-control" aria-describedby="basic-addon1">hahaahah</asp:TextBox>
                                                                            </div>
                                                                            <div class="input-group">
                                                                                <asp:Button ID="btnKirim" CssClass="btn btn-default" Style="margin-left: 50%;" runat="server" Text="Kirim" CommandArgument='<%# String.Format("{0}", (Container.DataItem as Transaction).Code )%>' class="form-control" aria-describedby="basic-addon1" />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Faq wrap content end -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="input-group col-lg-8">
                                                <span class="glyphicons glyphicons-home input-group-addon">Produk</span>
                                                <asp:Label runat="server" ID="lblNamaProduk" CssClass="form-control"></asp:Label>
                                            </div>
                                            <div class="input-group col-lg-8">
                                                <span class="glyphicons glyphicons-home input-group-addon">User</span>
                                                <asp:Label runat="server" ID="lblNamaUser" CssClass="form-control"></asp:Label>
                                            </div>
                                            <div class="input-group col-lg-8">
                                                <span class="glyphicons glyphicons-home input-group-addon">Jumlah</span>
                                                <asp:Label runat="server" ID="lblQty" CssClass="form-control"></asp:Label>
                                            </div>

                                        </div>
                                        <div class="input-group col-lg-8">
                                            <ul class="list-inline">
                                                <li>
                                                    <span class="glyphicons glyphicons-home input-group-addon">Tanggal Pembelian</span>
                                                    <asp:Label runat="server" ID="lblStart" CssClass="form-control"></asp:Label>
                                                </li>
                                                <li>
                                                    <span class="glyphicons glyphicons-home input-group-addon">Tanggal Selesai</span>
                                                    <asp:Label runat="server" ID="lblFinish" CssClass="form-control"></asp:Label>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="input-group col-lg-8">
                                            <span class="glyphicons glyphicons-home input-group-addon">Kode Pembelian</span>
                                            <asp:Label runat="server" ID="lblCode" CssClass="form-control"></asp:Label>
                                        </div>


                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
