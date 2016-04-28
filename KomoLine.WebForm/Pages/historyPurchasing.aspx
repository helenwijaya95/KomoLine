<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="HistoryPurchasing.aspx.cs" Inherits="KomoLine.WebForm.Pages.historyPurchasing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
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
                <div class="col-md-7">
                    <a href="#portfolioModal1" data-toggle="modal">
                        <img class="img-responsive animated wow fadeInUp" data-wow-delay="0.2s" src="img/700x300.jpg"
                            alt="">
                    </a>
                </div>
                <div class="col-md-5 animated wow fadeInRight" data-wow-delay="0.4s">
                    <h3>
                        <strong>ID & Nama Produk</strong></h3>
                    <h4>ID & Nama Pembeli</h4>
                    <a class="btn btn-success" href="#portfolioModal1" data-toggle="modal">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-7">
                    <a href="#portfolioModal1" data-toggle="modal">
                        <img class="img-responsive animated wow fadeInUp" data-wow-delay="0.2s" src="img/700x300.jpg"
                            alt="">
                    </a>
                </div>
                <div class="col-md-5 animated wow fadeInRight" data-wow-delay="0.4s">
                    <h3>
                        <strong>ID & Nama Produk</strong></h3>
                    <h4>ID & Nama Pembeli</h4>
                    <a class="btn btn-success" href="#portfolioModal1" data-toggle="modal">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>

            <!-- /.row -->
        </div>
    </div>
    <!-- Use the modals below to showcase DETAIL USER ! -->
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

                            <div class="col-lg-6">
                                <img class="img-responsive img-centered" src="img/portfolio/item01.jpg" alt="">
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
                                <p>ID & Nama Produk</p>
                                <p>ID & Nama User</p>
                                <p>Quantity : </p>
                                <p>Status : </p>
                                <p>
                                    <strong>Phone Number : </a>.
                                </p>
                                <ul class="list-inline">
                                    <li>Start Time : </li>
                                    <li>Finish Time : </li>
                                </ul>
                                <p>Code : </p>

                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Konfirmasi Pembelian</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Batal Pembelian</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Close</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
