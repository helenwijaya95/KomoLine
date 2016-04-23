<%@ Page Title="Search" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm1" %>

<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="<%= ResolveUrl("~/CSS/SearchRes.css")%>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="main">
        <div id="searchForm">
            <asp:TextBox ID="tbSearch" Style="align-items: center" class="searchControl" placeholder="ketik nama produk atau nama toko..." runat="server" Height="20" Width="300"></asp:TextBox>
            <asp:Button Text="Cari" ID="btnSearch" class="searchControl" runat="server" OnClick="btnSearch_Click" />
        </div>
        <div id="logReg">
            <a href="Login.aspx">Login</a> | <a href="Register.aspx">Register</a>
        </div>
        <br />
        <hr id="hrSrc" />
        <asp:DataList runat="server" ID="dlProd" Font-Name="Verdana" CellPadding="4" Font-Size="10pt" RepeatColumns="2" Style="margin: 5%; padding: 5%;">
            <HeaderTemplate>
                Hasil Pencarian
            </HeaderTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="linkProd" NavigateUrl='<%# String.Format("ProductDetail.aspx?prodId={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID )%>' Target="_self" runat="server">
                    <asp:Image CssClass="imgalign" ID="imgProd" runat="server" ImageUrl='<%# String.Format("~/Image/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>' Width="35%" />
                </asp:HyperLink>

                <div id="prodDetail" style="float: right;">
                    <p><%# ((Product)Container.DataItem).Name %></p>
                    <%
                       // ((KomoLine.Data.Model.Product)Container.DataItem).Name
                        Account acc = new Account();
                        for(int i = 0; i < rate1; i++)
                    %>
                        <asp:Image id="Star1" runat="server" imageurl="../Image/star.png" AlternateText="1Star" Width="5%" Height="5%" />                   
                    <%
                        for(int j =0; j<rate1; j++)
                        {
                            
                        
                    %>
                    <asp:Image ID="Image1" runat="server" ImageUrl="../Image/blankstar.png" AlternateText="1Star" Width="5%" Height="5%" />
                    <%  } %>
                     <asp:HyperLink ID="HyperLink1" Text="Detail" NavigateUrl='<%# String.Format("ProductDetail.aspx?prodId={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID )%>' Target="_self" runat="server">
       
                </asp:HyperLink>
                 
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
