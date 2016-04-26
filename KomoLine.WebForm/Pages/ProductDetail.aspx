<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm2" %>

<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    
    <link href="<%= ResolveUrl("~/CSS/searchStyle.css")%>" rel="stylesheet" type="text/css" media="all" />
    <link href="<%= ResolveUrl("~/CSS/searchStyle2.css")%>" rel="stylesheet" type="text/css" media="all" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--- start-rate---->
    <script src="<%= ResolveUrl("~/Scripts/jstarbox.js")%>"></script>
    <link rel="stylesheet" href="<%= ResolveUrl("~/CSS/jstarbox.css")%>" type="text/css" media="screen" charset="utf-8" />
    <script type="text/javascript">
        jQuery(function () {
            jQuery('.starbox').each(function () {
                var starbox = jQuery(this);
                starbox.starbox({
                    average: starbox.attr('data-start-value'),
                    changeable: starbox.hasClass('unchangeable') ? false : starbox.hasClass('clickonce') ? 'once' : true,
                    ghosting: starbox.hasClass('ghosting'),
                    autoUpdateAverage: starbox.hasClass('autoupdate'),
                    buttons: starbox.hasClass('smooth') ? false : starbox.attr('data-button-count') || 5,
                    stars: starbox.attr('data-star-count') || 5
                }).bind('starbox-value-changed', function (event, value) {
                    if (starbox.hasClass('random')) {
                        var val = Math.random();
                        starbox.next().text(' ' + val);
                        return val;
                    }
                })
            });
        });
    </script>
    <!---//End-rate---->
    <link href="<%= ResolveUrl("~/CSS/form.css")%>" rel="stylesheet" type="text/css" media="all" />



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">


    <!--header-->
  

    <div class="single">

        <div class="container">
            <div class="col-md-9">

                	<div class="col-md-5 grid">		
		<div class="flexslider">
			  
			    
			        <div class="thumb-image"><asp:Image ID="ProductImage" runat="server" AlternateText="1Star" /> </div>
			  
			   
			  
		</div>
	</div>	

                <div class="col-md-7 single-top-in">
                    <div class="span_2_of_a1 simpleCart_shelfItem">
                        <h3 style="color:darkgreen;"><%= product.Name %></h3>
                        <p class="in-para" style="color:black;"><%= product.Description %></p>
                        <div class="price_single">
                            <span class="reducedfrom item_price"><%= product.Price %></span>

                            <div class="clearfix"></div>
                        </div>
                        <!-- display rating -->
                          <div style="background-color:aliceblue; width:58%; height:60%; text-align:center;">
                                <%
                                    for (int i = 0; i < product.Rating; i++)
                                    {
                                %>
                                <asp:Image ID="Image1" runat="server" ImageUrl="../Image/star.png" AlternateText="1Star" Width="18%"  />
                                <%
                                        }
                                %>

                                <%
                                    for (int i = 0; i < 5 - product.Rating; i++)
                                    {
                                %>
                                <asp:Image ID="Image3" runat="server" ImageUrl="../Image/blankstar.png" AlternateText="1Star" Width="18%" />
                                <%
                                    }
                                %>
                            </div>
                         <!-- close display rating -->

                        <div class="quantity">
                            <div class="quantity-select">
                                <div class="entry value-minus">&nbsp;</div>
                                <div class="entry value"><span>1</span></div>
                                <div class="entry value-plus active">&nbsp;</div>
                            </div>
                        </div>
                        <!--quantity-->
                        <script>
                            $('.value-plus').on('click', function () {
                                var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) + 1;
                                divUpd.text(newVal);
                            });

                            $('.value-minus').on('click', function () {
                                var divUpd = $(this).parent().find('.value'), newVal = parseInt(divUpd.text(), 10) - 1;
                                if (newVal >= 1) divUpd.text(newVal);
                            });
                        </script>
                        <!--quantity-->

                        <asp:HyperLink ID="buyLink" class="add-to item_add hvr-skew-backward" runat="server">Beli</asp:HyperLink>
                        <div class="clearfix"></div>
                    </div>

                </div>
                <div class="clearfix"></div>
                <!---->
                <div class="tab-head">
                    <nav class="nav-sidebar">
                        <ul class="nav tabs">
                            <li class="active"><a href="#tab1" data-toggle="tab">Review</a></li>
                           
       
                        </ul>
                    </nav>
                    <div class="tab-content one">
                       
                        <div  class="tab-pane active text-style" id="tab1">
                              <div class="facts">
                                  
                                <%
                        
                                    for (int count = 0; count < product.Reviews.Count; count++)
                                    {
                                        var element = product.Reviews.ElementAt(count);
                                        var Key = element.Key;
                                        var Value = element.Value;
            
                                %>
                              
                                    <p style="color:darkgreen; font-size:large;"><%= Key.Name %></p>
                                    <p style="color:black;"><%= Value %> </p>
                                    <br />
                                <%
                                    }
                                %>
                            </div>

                           
                        </div>
                       

                    </div>
                    <div class="clearfix"></div>
                </div>
                <!---->
            </div>
            <!----->


            <div class="clearfix"></div>
        </div>
    </div>

    </div>
			
		</div>

    <script src="<%= ResolveUrl("~/Scripts/imagezoom.js")%>"></script>



















    <!--//////////////////////////////////////////////////////////////////////////// -->

</asp:Content>
