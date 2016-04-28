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
               <asp:Label ID="error" runat="server" style="float:left;" Visible="False" ForeColor="Black" />
			<div class="col-md-9">
			 <div class="mid-popular" style="margin:0;">
               <asp:DataList runat="server" ID="dlProd" Font-Name="Verdana" CellPadding="1" RepeatColumns="3" >                
                   <HeaderTemplate>
                   
                       
                </HeaderTemplate>
                <ItemTemplate>
					<div class="col-md-4 item-grid1 simpleCart_shelfItem" style="width:50%;">
					<div class=" mid-pop">
					<div class="pro-img">
						<asp:Image CssClass="img-responsive" ID="Image1" runat="server" ImageUrl='<%# String.Format("~/Image/product/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>'  />
						<div class="zoom-icon ">
                            <a class="picture" href='<%# String.Format("../Image/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>' class="b-link-stripe b-animate-go  thickbox">
                                <i class="glyphicon glyphicon-search icon "></i>    
                            </a>
                            <asp:HyperLink NavigateUrl='<%# String.Format("ProductDetail.aspx?id={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID )%>' runat="server" Target="_self">
                                <i class="glyphicon glyphicon-menu-right icon"></i>
                            </asp:HyperLink>				
						</div>
					</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span><%# ((KomoLine.Data.Model.Product)Container.DataItem).Category %></span>
							<h6><asp:HyperLink NavigateUrl='<%# String.Format("ProductDetail.aspx?id={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID )%>' runat="server"><%# ((KomoLine.Data.Model.Product)Container.DataItem).Name %></asp:HyperLink></h6>
							</div>
							
							<div class="clearfix"></div>
							</div>
							<div class="mid-2>
								<p ><label>$100.00</label><em class="item_price"><%# ((KomoLine.Data.Model.Product)Container.DataItem).Price %></em></p>
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
			
	<!--//content-->
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<!-- slide -->
 <!--light-box-files -->
		<script src="<%= ResolveUrl("~/Scripts/jquery.chocolat.js")%>"></script>
		<link rel="stylesheet" href="<%= ResolveUrl("~/CSS/chocolat.css")%>" type="text/css" media="screen" charset="utf-8"/>
		<!--light-box-files -->
		<script type="text/javascript" charset="utf-8">
		    $(function () {
		        $('a.picture').Chocolat();
		    });
		</script>

    <!-- /////////////////////////////////////////////////////////////////-->



   
</asp:Content>
