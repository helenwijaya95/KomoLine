<%@ Page Title="Search" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="../Content/bootstrap.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="main">
       <div id="searchForm">
          <asp:TextBox ID="tbSearch"  style=" align-items:center" class="searchControl" placeholder="type products or shop name here..." runat="server" Height="20" Width="300"></asp:TextBox>
          <asp:Button Text="Search" ID="btnSearch" class="searchControl" runat="server" />
        
        </div>
        <div id="logReg">
              <a href="Login.aspx">Login</a> | <a href="Register.aspx">Register</a>
        </div>
        <br />
         <hr id="hrSrc"/>
     <div id="srcRes">

         <asp:Table ID="tblSearchRes" GridLines="Both" BorderColor="Black" runat="server">
                        <asp:TableRow style="padding-top:10px">
                            <asp:TableCell>
                               
                                <asp:hyperlink id="linkProd" NavigateUrl="#" runat="server">
                                   <asp:image id="imgProd" runat="server" imageurl="#" />
                                </asp:hyperlink>
                             </asp:TableCell>
                            <asp:TableCell> 
                               <asp:Label>Product Name</asp:Label>
                                <br /><br />
                                <asp:Label>Seller Name</asp:Label>
                                <br />
                                <asp:image id="Star1" runat="server" imageurl="#" AlternateText="1Star"/>
                                <asp:image id="Star2" runat="server" imageurl="#" AlternateText="2Star"/>
                                <asp:image id="Star3" runat="server" imageurl="#" AlternateText="3Star"/>
                                <asp:image id="Star4" runat="server" imageurl="#" AlternateText="4Star"/>
                                <asp:image id="Star5" runat="server" imageurl="#" AlternateText="5Star"/>
                                <asp:Button id="btnDetail" Text="Detail" runat="server" />

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
                                <asp:image id="Image2" runat="server" imageurl="#" AlternateText="1Star"/>
                                <asp:image id="Image3" runat="server" imageurl="#" AlternateText="2Star"/>
                                <asp:image id="Image4" runat="server" imageurl="#" AlternateText="3Star"/>
                                <asp:image id="Image5" runat="server" imageurl="#" AlternateText="4Star"/>
                                <asp:image id="Image6" runat="server" imageurl="#" AlternateText="5Star"/>
                                <asp:Button id="Button1" Text="Detail" runat="server" />

                            </asp:TableCell>
                           
                        </asp:TableRow>
                    </asp:Table>
           
          <!-- create dynamic table
              <asp:DataList runat="server" id="dlProd" 
                Border="1"
                Font-Name="Verdana" CellPadding="4"
                Font-Size="10pt"
                RepeatColumns="2" >
                <ItemTemplate>
                    put table in here
                </ItemTemplate>   
            </asp:DataList>-->
                   
        </div>
    </div>
   

    
</asp:Content>
