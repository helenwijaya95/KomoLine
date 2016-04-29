<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="SalesHistory.aspx.cs" Inherits="KomoLine.WebForm.Pages.historyPurchasing" %>

<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div class="padding100" id="blog">
        <div class="container">
            <div class="section-header">
                <div class="row section-title text-center">
                    <div class="col-sm-8 col-sm-offset-2">
                        <h1 class="wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                            <span>List History Penjualan</span></h1>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <asp:Repeater runat="server" ID="HistRepeater">
                    <ItemTemplate>
                        <div class="col-md-7">
                            <a href="#portfolioModal1" data-toggle="modal">
                                <img src= "<%# ResolveUrl("~/Image/profpic/"+(Container.DataItem as Transaction).Buyer.Photo) %>" class="img-responsive animated wow fadeInUp" data-wow-delay="0.2s"
                                    alt="">
                            </a>
                        </div>
                        <div class="col-md-5 animated wow fadeInRight" data-wow-delay="0.4s">
                            <h3>
                                <strong><%# (Container.DataItem as Transaction).Status %> </strong></h3>
                            <h4><%# (Container.DataItem as Transaction).Buyer.Name %> </h4>
                            <p><%# (Container.DataItem as Transaction).Product.Name %> </p>
                              <p><%# (Container.DataItem as Transaction).Quantity %> </p>
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
     <asp:Repeater runat="server" ID="DetailHistRepeater" OnItemDataBound="DetailHistRepeater_ItemDataBound" OnItemCommand="DetailHistRepeater_ItemCommand">
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
                                                                        <asp:TextBox ID="rating" class="form-control" placeholder="Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
                                                                    </div>
                                                                </div>
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
                                                                        <asp:TextBox ID="review" class="form-control" placeholder="" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
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
                                            <asp:Button runat="server" ID="ConfirmButton" CommandName="Konfirmasi" CommandArgument="<%# (Container.DataItem as Transaction).Code %>" Text="Konfirmasi Transaksi" CssClass="btn btn-primary" UseSubmitBehavior="false"/>
                                            <asp:Button runat="server" ID="CancelButton" CommandName="Batal" CommandArgument="<%# (Container.DataItem as Transaction).Code %>" Text="Batalkan Transaksi" CssClass="btn btn-danger" UseSubmitBehavior="false"/>
                                           
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
