<%@ Page Title="Tambah Barang" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="TambahBarang.aspx.cs" Inherits="KomoLine.WebForm.Pages.TambahBarang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <h1>Tambah Barang</h1>
    </div>
    
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" />
    <asp:Image ID="ProductImage" ImageUrl="~/Image/noPImage.png" runat="server" />
    <asp:FileUpload runat="server" ID="UploadImage" accept="image/*" />
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">Category</span>
        <asp:DropDownList ID="ddCat" CssClass="form-control" aria-describedby="basic-addon1" runat="server" ForeColor="Green" Font-Bold="true"></asp:DropDownList>
    </div>
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">Name</span>
        <asp:TextBox ID="tbProdName" CssClass="form-control" aria-describedby="basic-addon1" runat="server" ></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">Minimal Order</span>
        <asp:TextBox ID="tbMinOrder" CssClass="form-control" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">Description</span>
        <asp:TextBox ID="tbDesc" CssClass="form-control" aria-describedby="basic-addon1" runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">Price</span>
        <asp:TextBox ID="tbPrice" CssClass="form-control" aria-describedby="basic-addon1" runat="server" ></asp:TextBox>
    </div>
  
    <asp:Button ID="insertProd" Text="Tambah" CsscClass="btn btn-default" runat="server" OnClick="insertProd_Click"></asp:Button>
</asp:Content>
