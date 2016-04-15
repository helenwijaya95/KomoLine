<%@ Page Title="Search" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="../CSS/SearchRes.css" rel="stylesheet" />
      <%@ Import Namespace="KomoLine.Data.Model" %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="main">
       <div id="searchForm">
          <asp:TextBox ID="tbSearch"  style=" align-items:center" class="searchControl" placeholder="ketik nama produk atau nama toko..." runat="server" Height="20" Width="300"></asp:TextBox>
          <asp:Button Text="Cari" ID="btnSearch" class="searchControl" runat="server" OnClick="btnSearch_Click" />
        
        </div>
        <div id="logReg">
              <a href="Login.aspx">Login</a> | <a href="Register.aspx">Register</a>
        </div>
        <br />
         <hr id="hrSrc"/>   
              <asp:DataList runat="server" ID="dlProd" 
                Font-Name="Verdana" CellPadding="4"
                Font-Size="10pt"
                RepeatColumns="2" runat="server" 
                style="margin:5%; padding:5%;" 
                  >

                  <HeaderTemplate>
                      Hasil Pencarian
                  </HeaderTemplate>
                <ItemTemplate>
                    <asp:hyperlink id="linkProd" NavigateUrl='<%# String.Format("ProductDetail.aspx?prodId={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID )%>' Target="_self" runat="server">
                        <asp:image CssClass="imgalign" id="imgProd" runat="server" imageurl='<%# String.Format("~/Image/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>'  Width="35%" />
                    </asp:hyperlink>

                    <div id="prodDetail" style="float:right;">
                         <p><%# ((KomoLine.Data.Model.Product)Container.DataItem).Name %></p>
                   
               
                    <%
                        Account acc = new Account();
                        for(int i =0; i<3; i++)
                        {
                            
                        
                     %>
                    <asp:image id="Star1" runat="server" imageurl="../Image/star.png" AlternateText="1Star" Width="5%" Height="5%" />
                    <% } %>

                    <%
                        for(int i =0; i<2; i++)
                        {
                            
                        
                     %>
                    <asp:image id="Image1" runat="server" imageurl="../Image/blankstar.png" AlternateText="1Star" Width="5%" Height="5%" />
                    <% } %>
                    <asp:Button id="btnDetail" Text="Detail" OnCommand="btnDetail_Command" CommandArgument="<%# ((KomoLine.Data.Model.Product)Container.DataItem).ID %>"
                   
                    </div>
                   
                      </ItemTemplate>   
            </asp:DataList>
                   
        
    </div>
   

    
</asp:Content>
