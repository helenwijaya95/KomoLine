<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="EditBarang.aspx.cs" Inherits="KomoLine.WebForm.Pages.EditBarang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
     <div>
        <h1>Edit Barang</h1>
    </div>
    
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" />
    <asp:Image ID="ProductImage"  runat="server" />
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
  
    <asp:Button ID="editProd" Text="Edit" CsscClass="btn btn-default" runat="server"></asp:Button>
</asp:Content>
