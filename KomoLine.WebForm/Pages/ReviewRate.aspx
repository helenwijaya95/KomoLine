<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ReviewRate.aspx.cs" Inherits="KomoLine.WebForm.Pages.ReviewRate" %>

<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <script src="<%= ResolveUrl("~/Scripts/RateRev.js") %>" type="text/javascript"></script>
    <link href="<%= ResolveUrl("~/CSS/RevRate.css")%>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div id="main2" runat="server" style="background-color:white;">
       <div id="transForm">
           
           <div class="input-group">
            <asp:TextBox ID="transID" ClientIDMode="Static" runat="server"  class="form-control" placeholder="Transaction ID" aria-describedby="basic-addon1" />
                </div>
                <div class="input-group">
            <asp:Button ID="btnTransID" Text="OK" CssClass="btn btn-default" runat="server" ClientIDMode="Static" OnClick="btnTransID_Click"   class="form-control"  />
            </div>

        </div>

        <div id="detProduct" runat="server" visible="false" >
            <table border="1" style="margin-top:5%;">
                <th>Product</th>
                <th>Review & Rate</th>
                <tr>
                    <td style="width: 40%; text-align: center;">
                       
                        <asp:Image ID="prodImg" runat="server" ImageUrl="../Image/star.png" AlternateText="image" Width="50%"  CssClass="imageSet"/>
                         <h2><%= transByID.Product.Name %></h2>
                        <p style="color:darkgreen; margin:0px;"><%= transByID.Product.Category %></p>
                    </td>
                    <td>
                        <p style="margin-left:5%;">Rate Produk (skala 1-5)</p>
                        <div id="stars" style="margin-left:10%;">
                            <asp:ImageButton ID="rate1" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="1" />
                            <asp:ImageButton ID="rate2" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="2" />
                            <asp:ImageButton ID="rate3" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="3" />
                            <asp:ImageButton ID="rate4" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="4" />
                            <asp:ImageButton ID="rate5" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" OnCommand="rate1_Command" CommandArgument="5" />

                        </div>
                        <p style="margin-left:5%;"">Review Produk</p>


                        <div class="input-group">
                        <asp:TextBox ID="tbReview" TextMode="MultiLine" Columns="50" Rows="5" runat="server" style="margin-left:10%;"  class="form-control"  aria-describedby="basic-addon1">hahaahah</asp:TextBox>
                       </div>
                         <div class="input-group">
                        <asp:Button ID="btnKirim" CssClass="btn btn-default" style="margin-left:50%;"  runat="server" Text="Kirim" OnClick="btnKirim_Click" class="form-control"  aria-describedby="basic-addon1" />
                          </div> 
                    </td>

                </tr>
            </table>
        </div>
    </div>
</asp:Content>
