<%@ Page Title="Search" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="../CSS/SearchRes.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="main">
       <div id="searchForm">
          <asp:TextBox ID="tbSearch"  style=" align-items:center" class="searchControl" placeholder="ketik nama produk atau nama toko..." runat="server" Height="20" Width="300"></asp:TextBox>
          <asp:Button Text="Cari" ID="btnSearch" class="searchControl" runat="server" />
        
        </div>
        <div id="logReg">
              <a href="Login.aspx">Login</a> | <a href="Register.aspx">Register</a>
        </div>
        <br />
         <hr id="hrSrc"/>
     <!--<div id="srcRes">

         <asp:Table ID="tblSearchRes" GridLines="Both" BorderColor="Black" runat="server">
                        <asp:TableRow style="padding-top:10px">
                            <asp:TableCell Width="30%" Height="50%">
                               
                                <asp:hyperlink id="linkProd" NavigateUrl="#" runat="server">
                                   <asp:image id="imgProd" runat="server" imageurl="#" />
                                </asp:hyperlink>
                             </asp:TableCell>
                            <asp:TableCell> 
                               <asp:Label>Nama Produk</asp:Label>
                                <br /><br />
                                <asp:Label>Nama Toko</asp:Label>
                                <br />
                                <asp:image id="Star1" runat="server" imageurl="../Image/star.png" AlternateText="1Star" Width="10%" Height="10%" />
                                <asp:image id="Star2" runat="server" imageurl="../Image/star.png" AlternateText="2Star" Width="10%" Height="10%"/>
                                <asp:image id="Star3" runat="server" imageurl="../Image/star.png" AlternateText="3Star" Width="10%" Height="10%"/>
                                <asp:image id="Star4" runat="server" imageurl="../Image/star.png" AlternateText="4Star" Width="10%" Height="10%"/>
                                <asp:image id="Star5" runat="server" imageurl="../Image/star.png" AlternateText="5Star" Width="10%" Height="10%"/>
                                <asp:Button id="btnDetail" Text="Detail" runat="server"/>

                            </asp:TableCell>
                        </asp:TableRow>
              <asp:TableRow>
                            <asp:TableCell>
                               
                                <asp:hyperlink id="Hyperlink1" NavigateUrl="#" runat="server">
                                   <asp:image id="Image1" runat="server" imageurl="#" />
                                </asp:hyperlink>

                             </asp:TableCell>
                            <asp:TableCell> 
                               <asp:Label>Product Name</asp:Label>
                                <br /><br />
                                <asp:Label>Seller Name</asp:Label>
                                <br />
                                <asp:image id="Image2" runat="server" imageurl="../Image/star.png" AlternateText="1Star" Width="10%" Height="10%" />
                                <asp:image id="Image3" runat="server" imageurl="../Image/star.png" AlternateText="2Star" Width="10%" Height="10%"/>
                                <asp:image id="Image4" runat="server" imageurl="../Image/star.png" AlternateText="3Star" Width="10%" Height="10%"/>
                                <asp:image id="Image5" runat="server" imageurl="../Image/star.png" AlternateText="4Star" Width="10%" Height="10%"/>
                                <asp:image id="Image6" runat="server" imageurl="../Image/star.png" AlternateText="5Star" Width="10%" Height="10%"/>
                                <asp:Button id="Button1" Text="Detail" runat="server" />

                            </asp:TableCell>
                           
                        </asp:TableRow>
                    </asp:Table>-->
       
              <asp:DataList runat="server" ID="dlProd" 
                Border="1"
                Font-Name="Verdana" CellPadding="4"
                Font-Size="10pt"
                RepeatColumns="2" runat="server" >

                  <HeaderTemplate>
                      Hasil Pencarian
                  </HeaderTemplate>
                <ItemTemplate>
                    <asp:hyperlink id="linkProd" NavigateUrl="#" runat="server">
                        <asp:image id="imgProd" runat="server" imageurl="~/Image/<%# ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath %>" />
                    </asp:hyperlink>

                    <p><%# ((KomoLine.Data.Model.Product)Container.DataItem).Name %></p>
                    <p><%# ((KomoLine.Data.Model.Product)Container.DataItem).Owner.Name %></p>
               
                    <asp:image id="Star1" runat="server" imageurl="../Image/star.png" AlternateText="1Star" Width="10%" Height="10%" />
                    <asp:image id="Star2" runat="server" imageurl="../Image/star.png" AlternateText="2Star" Width="10%" Height="10%"/>
                    <asp:image id="Star3" runat="server" imageurl="../Image/star.png" AlternateText="3Star" Width="10%" Height="10%"/>
                    <asp:image id="Star4" runat="server" imageurl="../Image/star.png" AlternateText="4Star" Width="10%" Height="10%"/>
                    <asp:image id="Star5" runat="server" imageurl="../Image/star.png" AlternateText="5Star" Width="10%" Height="10%"/>
                    <asp:Button id="btnDetail" Text="Detail" runat="server"/>
                </ItemTemplate>   
            </asp:DataList>
                   
        
    </div>
   

    
</asp:Content>
