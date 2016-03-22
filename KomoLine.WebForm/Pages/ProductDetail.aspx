<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="KomoLine.WebForm.Pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="../CSS/ProdDetail.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="pdMain">
        <div id="searchForm">
          <asp:TextBox ID="tbSearch"  style=" align-items:center" class="searchControl" placeholder="type products or shop name here..." runat="server" Height="20" Width="300"></asp:TextBox>
          <asp:Button Text="Search" ID="btnSearch" class="searchControl" runat="server" />
        
        </div>
        <div id="logReg">
              <a href="Login.aspx">Login</a> | <a href="Register.aspx">Register</a>
        </div>
        <br />
         <hr id="hrSrc"/>

    </div>
</asp:Content>
