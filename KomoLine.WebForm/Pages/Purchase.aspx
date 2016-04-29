<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="KomoLine.WebForm.Pages.Purchase" %>
<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!--buat isi form purchase disini-->
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
                    <h4>ID & Nama Toko</h4><br>
                    <label>Deskripsi Barang : </label><br><br>
                    <label>Kategory : </label><br><br>
                    <label>Min Order : </label><br><br>
                    <label>Harga : </label><br>
                    <br>
                    <asp:TextBox ID="id" class="form-control" placeholder="ID" aria-describedby="basic-addon1" runat="server" ></asp:TextBox><br>
					
					<asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" /><br>
					
	                <asp:TextBox ID="quantity" class="form-control" placeholder="Banyak barang" aria-describedby="basic-addon1" runat="server"></asp:TextBox><br>
                    <a class="btn btn-success" href="#portfolioModal1" data-toggle="modal">Konfirmasi Pemesanan<span class="glyphicon glyphicon-chevron-right"></span></a>
                </div>
            </div>
            <hr>

            <!-- /.row -->
        </div>
    </div>

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
                            </div>
                            <div class="col-lg-6">
                                <p>Nama Produk :</p>
                                <p>Quantity    : </p>
                                <p>Harga       : </p>

                                <asp:Button ID="BuyButton" class="add-to item_add hvr-skew-backward" runat="server" OnClick="PurchaseButton_Click">Konfirmasi Pemesanan</asp:Button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">
                                    Batal Pemesanan</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

                

</asp:Content>
