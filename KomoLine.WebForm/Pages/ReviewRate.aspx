<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ReviewRate.aspx.cs" Inherits="KomoLine.WebForm.Pages.ReviewRate" %>

<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <script src="<%= ResolveUrl("~/Scripts/RateRev.js") %>" type="text/javascript"></script>
    <link href="<%= ResolveUrl("~/CSS/RevRate.css")%>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div id="main">
        <div id="transForm">
            <asp:Label Text="Transaction ID : " runat="server"></asp:Label>
            <asp:TextBox ID="transID" ClientIDMode="Static" runat="server"/>
            <asp:Button ID="btnTransID" Text="OK" runat="server" ClientIDMode="Static" OnClick="btnTransID_Click" />
            
        </div>

        <div id="detProduct">
            <table border="1">
                <th>Product</th>
                <th>Review & Rate</th>
                <tr>
                    <td style="width: 40%; text-align: center;">
                        <p><%= transByID.Product.Name %></p>
                        <asp:Image ID="prodImg" runat="server" ImageUrl="../Image/star.png" AlternateText="image" Width="50%" />
                        <p><%= transByID.Product.Owner.Name %></p>
                    </td>
                    <td>
                        <p>Rate Produk (skala 1-5)</p>
                        <div id="stars">
                            <asp:ImageButton ID="rate1" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="1" />
                            <asp:ImageButton ID="rate2" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="2" />
                            <asp:ImageButton ID="rate3" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="3" />
                            <asp:ImageButton ID="rate4" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="4" />
                            <asp:ImageButton ID="rate5" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="5" />

                        </div>
                        <p>Review Produk</p>
                        <asp:TextBox ID="tbReview" TextMode="MultiLine" Columns="40" Rows="5" runat="server">hahaahah</asp:TextBox>
                        <asp:Button ID="btnKirim" runat="server" Text="Kirim" OnClick="btnKirim_Click" />
                    </td>

                </tr>
            </table>
        </div>
    </div>
</asp:Content>
