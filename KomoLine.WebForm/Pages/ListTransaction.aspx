<%@ Page Title="Transaksi" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ListTransaction.aspx.cs" Inherits="KomoLine.WebForm.Pages.ListTransaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <link href="<%= ResolveUrl("~/CSS/ListTrans.css")%>" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="main" style="margin: 2%;">
        <h2>List Transaksi</h2>
        <asp:Repeater ID="TransRepeater" runat="server">
            <HeaderTemplate>
                <table border="1" class="transTab">
                    <tr>
                        <th>ID Transaksi</th>
                        <th>Produk</th>
                        <th>Pembeli</th>
                        <th>Waktu Mulai</th>
                        <th>Waktu Selesai</th>
                        <th>Status</th>
                        <th>Jumlah</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).Code %></td>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).Product.Name %></td>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).Buyer.Name %></td>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).StartOn %></td>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).ConfirmedOn %></td>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).Status %></td>
                    <td><%# ((KomoLine.Data.Model.Transaction)Container.DataItem).Quantity %></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
    </div>
</asp:Content>
