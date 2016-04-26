<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="KomoLine.WebForm.Pages.Purchase" %>
<%@ Import Namespace="KomoLine.Data.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <!--buat isi form purchase disini-->
    <table border="0">
        <tr>
            <div class="input-group">
                <td>
                    <asp:Label ID="IdBarang" Text="ID*" runat="server"></asp:Label></td>
                <td>
                    <asp:TextBox ID="id" class="form-control" placeholder="ID" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
            </div>
        </tr>
        <tr>
            <div class="input-group">
                <td>
                    <asp:Label ID="quantityBarang" Text="Banyak barang*" runat="server"></asp:Label></td>
                <td>
                    <asp:TextBox ID="quantity" class="form-control" placeholder="Banyak barang" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
            </div>
        </tr>
        <tr>
            <td>
                <asp:Button ID="PurchaseButton" Text="Confirm" class="btn btn-default" runat="server" OnClick="PurchaseButton_Click"></asp:Button>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" />
            </td>
        </tr>
    </table>
</asp:Content>
