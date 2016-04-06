<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ListTransaction.aspx.cs" Inherits="KomoLine.WebForm.Pages.ListTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="../CSS/ListTrans.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Repeater ID="TransRepeater" runat="server">
        <HeaderTemplate>
            <table border="1">
                <tr>
                    <th>Transaction ID</th>
                     <th>Product</th>
                     <th>Buyer</th>
                     <th>Start Time</th>
                     <th>Finish Time</th>
                     <th>Status ID</th>
                     <th>Quantity</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                   
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr>
                <td>
                   
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
  <!-- <div id="main" style="margin:2%;">
        <h2>Transaction</h2>
        <table border="1">
            <tr>
                <th>Transaction ID</th>
                 <th>Product</th>
                 <th>Buyer</th>
                 <th>Start Time</th>
                 <th>Finish Time</th>
                 <th>Status ID</th>
                 <th>Quantity</th>
            </tr>
            <tr>
                <td>
                   
                </td>
            </tr>
        </table>
    </div> -->
</asp:Content>
