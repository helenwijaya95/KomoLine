<%@ Page Title="Search" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm1" %>

<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">


    <!-- ////////////////////////////////////////////////////////////////////////////////////-->
<!-- Custom Theme files -->
<!--theme-style-->
<link href="<%= ResolveUrl("~/CSS/searchStyle.css")%>" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shopin Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndroId Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--theme-style-->
<link href="<%= ResolveUrl("~/CSS/searchStyle2.css")%>"  rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<!--- start-rate---->
<script src="<%= ResolveUrl("~/Scripts/jstarbox.js")%>" ></script>
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
    <link href="<%= ResolveUrl("~/CSS/popuo-box.css")%>" rel="stylesheet" type="text/css" media="all"/>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
 
								 
	<!--content-->
    

		<div class="product">
			<div class="container">
               
			<div class="col-md-9">
			 <div class="mid-popular">
               <asp:DataList runat="server" ID="dlProd" Font-Name="Verdana" CellPadding="1" Font-Size="10pt" RepeatColumns="4" Style="margin: 1%; padding: 1%;">                <HeaderTemplate>
                    Hasil Pencarian
                </HeaderTemplate>
                <ItemTemplate>
					<div class="col-md-4 item-grid1 simpleCart_shelfItem">
					<div class=" mid-pop">
					<div class="pro-img">
						<asp:Image CssClass="img-responsive" ID="Image1" runat="server" ImageUrl='<%# String.Format("~/Image/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>'  />
						<div class="zoom-icon ">
                            <asp:HyperLink runat="server" CssClass="picture" NavigateUrl='<%# String.Format("~/Image/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>' Target="_self"  >
                                
                                <i class="glyphicon glyphicon-search icon "></i>    
                            </asp:HyperLink>
                            <asp:HyperLink NavigateUrl='<%# String.Format("ProductDetail.aspx?prodId={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID )%>' runat="server" Target="_self">
                                <i class="glyphicon glyphicon-search icon "></i>
                            </asp:HyperLink>				
						</div>
					</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span>Women</span>
							<h6><a href="single.html">Sed ut perspiciati</a></h6>
							</div>
							
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><label>$100.00</label><em class="item_price">$70.00</em></p>
								  <div class="block">
									<div class="starbox small ghosting"> </div>
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div> <!-- close div mid pop-->
					</div> <!-- item grid -->
                 <div class="clearfix"></div>
                    </ItemTemplate>
        
          </asp:DataList>
					</div> <!-- close div mid popular-->
				</div>
             
			<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h4 class="cate">Categories</h4>
							 <ul class="menu-drop">
							<li class="item1"><a href="#">Men </a>
								<ul class="cute">
									<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.html">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item2"><a href="#">Women </a>
								<ul class="cute">
									<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.html">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item3"><a href="#">Kids</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.html">Automatic Fails</a></li>
								</ul>
							</li>
							<li class="item4"><a href="#">Accessories</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.html">Automatic Fails</a></li>
								</ul>
							</li>
									
							<li class="item4"><a href="#">Shoes</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.html">Automatic Fails </a></li>
								</ul>
							</li>
						</ul>
					</div>
				<!--initiate accordion-->
						<script type="text/javascript">
						    $(function () {
						        var menu_ul = $('.menu-drop > li > ul'),
							           menu_a = $('.menu-drop > li > a');
						        menu_ul.hide();
						        menu_a.click(function (e) {
						            e.preventDefault();
						            if (!$(this).hasClass('active')) {
						                menu_a.removeClass('active');
						                menu_ul.filter(':visible').slideUp('normal');
						                $(this).addClass('active').next().stop(true, true).slideDown('normal');
						            } else {
						                $(this).removeClass('active');
						                $(this).next().stop(true, true).slideUp('normal');
						            }
						        });

						    });
						</script>
<!--//menu-->
 <section  class="sky-form">
					<h4 class="cate">Discounts</h4>
					 <div class="row row1 scroll-pane">
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Upto - 10% (20)</label>
						 </div>
						 <div class="col col-4">
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>40% - 50% (5)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label>
								<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label>
						 </div>
					 </div>
				 </section> 				 				 
				 
					
					 <!---->
					 <section  class="sky-form">
						<h4 class="cate">Type</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Sofa Cum Beds (30)</label>
								</div>
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Bags  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Caps & Hats (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jackets & Coats   (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Jeans  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Shirts   (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Sunglasses  (30)</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Swimwear  (30)</label>
								</div>
							</div>
				   </section>
				   		<section  class="sky-form">
						<h4 class="cate">Brand</h4>
							<div class="row row1 scroll-pane">
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Roadstar</label>
								</div>
								<div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Levis</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Persol</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Nike</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Edwin</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>New Balance</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Paul Smith</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Ray-Ban</label>
								</div>
							</div>
				   </section>		
		</div>
			</div class="clearfix"></div>
				<!--products-->
			
			<!--//products-->
		<!--brand-->
		<div class="container">
			<div class="brand">
				<div class="col-md-3 brand-grid">
					<img src="images/ic.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic1.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic2.png" class="img-responsive" alt="">
				</div>
				<div class="col-md-3 brand-grid">
					<img src="images/ic3.png" class="img-responsive" alt="">
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<!--//brand-->
			</div>
			
		</div>
	<!--//content-->
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

	<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/bootstrap.min.js"></script>
 <!--light-box-files -->
		<script src="js/jquery.chocolat.js"></script>
		<link rel="stylesheet" href="css/chocolat.css" type="text/css" media="screen" charset="utf-8">
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		    $(function () {
		        $('a.picture').Chocolat();
		    });
		</script>

    <!-- /////////////////////////////////////////////////////////////////-->



   
</asp:Content>
