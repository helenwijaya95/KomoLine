<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ListBarang.aspx.cs" Inherits="KomoLine.WebForm.Pages.EditHapusBarang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div id="main" style="margin: 2%;">
          <asp:Label ID="error" runat="server" style="float:left;" Visible="False" ForeColor="Black" />
         <h2>List Barang</h2>
        <asp:Repeater ID="editBarangRpt" runat="server">
            <HeaderTemplate>
                <table border="1" class="transTab">
                    <tr>
                        <th>Gambar</th>
                        <th>ID Produk</th>
                        <th>Kategori</th>
                        <th>Nama</th>
                        <th>Min_Order</th>
                        <th>Deskripsi</th>
                        <th>Harga</th>
                        <th>Penjual</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><img src='<%# String.Format("../Image/product/{0}", ((KomoLine.Data.Model.Product)Container.DataItem).PhotoPath )%>' style="width:40%; align-content:center;" /></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).ID %></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).Category %></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).Name %></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).MinimalOrder %></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).Description %></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).Price %></td>
                    <td><%# ((KomoLine.Data.Model.Product)Container.DataItem).Owner.Name %></td>
                    <td><asp:Button ID="btnEditProd" Text="Edit" runat="server" PostBackUrl='<%# String.Format("~/Pages/EditBarang.aspx?id={0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID)%>'/></td>
                    <td><asp:Button ID="btnHapusProd" Text="Hapus" runat="server" UseSubmitBehavior="false" OnCommand="btnHapusProd_Command" CommandArgument= '<%# String.Format("{0}", ((KomoLine.Data.Model.Product)Container.DataItem).ID)%>' /></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>

        </asp:Repeater>
        <asp:Button Text="Tambah Barang" runat="server" PostBackUrl="~/Pages/TambahBarang.aspx"/>

    </div>
</asp:Content>
