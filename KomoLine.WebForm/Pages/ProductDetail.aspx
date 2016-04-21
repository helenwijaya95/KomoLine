<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="../CSS/ProdDetail.css" rel="stylesheet" />
    <%@ Import Namespace="KomoLine.Data.Model" %>
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="pdMain">
        <div id="searchForm">
          <asp:TextBox ID="tbSearch"  style=" align-items:center" class="searchControl" placeholder="ketik nama produk atau nama toko..." runat="server" Height="20" Width="300"></asp:TextBox>
          <asp:Button Text="Cari" ID="btnSearch" class="searchControl" runat="server" />
        
        </div>
        <div id="logReg">
              <a href="Login.aspx">Login</a> | <a href="Register.aspx">Register</a>
        </div>
        <br />
         <hr id="hrSrc"/>

        <div id="productDet">
           
            <% string idProduct = Request.QueryString["prodId"]; %>
            
            <%
               
                
             %>
            <p><%= product.Name %></p>

            <hr />
            <asp:image id="image1" runat="server" AlternateText="1Star" Width="25%" />

            <p>Rp <%= product.Price %></p>
            
            <asp:Button Text="Beli Barang" runat="server" CssClass="class1" />
            <hr />
            <div id="prodTabs">
                <ul>
                    <li><a href="#">Detail Produk</a></li>
				    <li><a href="#">Rating</a></li>
				    <li><a href="#">Review</a></li>
                </ul>
                <div id="content">
                    <p><%= product.Description %></p>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
