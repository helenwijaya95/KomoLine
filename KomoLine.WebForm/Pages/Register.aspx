<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KomoLine.WebForm.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
        <h1>REGISTER HERE...</h1>
    </div>
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" />
    <div class="input-group">
        <span class="glyphicon glyphicon-envelope input-group-addon" aria-hidden="true" id="basic-addon2">Email</span>
        <asp:TextBox ID="email" CssClass="form-control" placeholder="Email" aria-describedby="basic-addon1" runat="server" TextMode="Email"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="glyphicon glyphicon-user input-group-addon" aria-hidden="true" id="basic-addon2">Name</span>
        <asp:TextBox ID="name" CssClass="form-control" placeholder="Name" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="glyphicon glyphicon-user input-group-addon" aria-hidden="true" id="basic-addon2">Username</span>
        <asp:TextBox ID="username" CssClass="form-control" placeholder="Username" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2">Password</span>
        <asp:TextBox ID="password" type="password" CssClass="form-control" placeholder="Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
    </div>
    <div class="input-group">
        <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2">ConfirmPassword</span>
        <asp:TextBox ID="confirmpass" type="password" CssClass="form-control" placeholder="Confirm Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
    </div>
    <asp:Button ID="register" Text="Register" class="btn btn-default" runat="server"></asp:Button>
</asp:Content>
