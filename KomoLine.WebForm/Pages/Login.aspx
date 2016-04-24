<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KomoLine.WebForm.Pages.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <h1>Form Login</h1>
    </div>
    <div class="input-group">
        <asp:Label ID="ErrorLabel" runat="server" Visible="False" ForeColor="Red" />
    </div>
    <div class="input-group">
        <span class="glyphicon glyphicon-user input-group-addon" aria-hidden="true" id="basic-addon2">ID</span>
        <asp:TextBox ID="IDTextBox" class="form-control" placeholder="ID" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2">Password</span>
        <asp:TextBox ID="PasswordTextBox" class="form-control" placeholder="Password" aria-describedby="basic-addon1" runat="server" TextMode="Password"></asp:TextBox>
    </div>
    <div class="input-group">
        <asp:Button ID="LoginButton" Text="Login" class="btn btn-default" runat="server"></asp:Button>
    </div>
</asp:Content>
