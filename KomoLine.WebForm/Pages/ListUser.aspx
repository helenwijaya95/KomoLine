<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ListUser.aspx.cs" Inherits="KomoLine.WebForm.Pages.ListUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section id="portfolio" > 
        <div class="container">
          <!-- Heading -->
            <div class="section-header">
                <div class="row section-title text-center">
                <div class="col-sm-8 col-sm-offset-2">
                    <h1 class="wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                        <span>List User</span> "ID & Nama Admin"</h1>
                 </div>
                </div>
              </div>
              <!-- ./Heading -->           
            <div class="row">  
                <!-- Box-1 -->  
                <div class="col-md-4 col-sm-6 portfolio-item wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-chain fa-2x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/item01.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>"ID dan Nama user"</h4>
                        <p class="text-muted">"Status user"</p>
                    </div>
                </div>
                <!-- Box-2 -->
                <div class="col-md-4 col-sm-6 portfolio-item wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-chain fa-2x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/item01.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>"ID dan Nama user"</h4>
                        <p class="text-muted">"Status user"</p>
                    </div>
                </div>
                <!-- Box-3 -->
                <div class="col-md-4 col-sm-6 portfolio-item wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content">
                                <i class="fa fa-chain fa-2x"></i>
                            </div>
                        </div>
                        <img src="img/portfolio/item01.jpg" class="img-responsive" alt="">
                    </a>
                    <div class="portfolio-caption">
                        <h4>"ID dan Nama user"</h4>
                        <p class="text-muted">"Status user"</p>
                    </div>
                </div>        
            </div>
    </div><!--/.container-->
 </section>
    <!-- Use the modals below to showcase DETAIL USER ! -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog"
        aria-hidden="true">
        <div class="modal-content">
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
                            <h2>ID & Nama User</h2>
                            <p class="item-intro text-muted">
                                Status User "Vendot/Buyer"</p>
                            <div class="col-lg-6">
                                <img class="img-responsive img-centered" src="img/portfolio/item01.jpg" alt="">
                            </div>
                            <div class="col-lg-6">
                                <p>Address</p>
                                <a href="#">Email</a>
                                <p>
                                    <strong>Phone Number</a>.</p>
                                <ul class="list-inline">
                                    <li>Confirm Time</li>
                                    <li>Register Time</li>
                                </ul>
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
