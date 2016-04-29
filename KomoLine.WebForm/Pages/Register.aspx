<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KomoLine.WebForm.Pages.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <style type="text/css">
        .form {
            margin-left: 300px;
            margin-right: 300px;
        }

        .button{
            margin-left: 50px;
            margin-top: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" />
    <div class="form">
        <div>
            <h1>REGISTER HERE...</h1>
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-envelope input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 103px; margin-right: 0px">Email</span>
            <asp:TextBox ID="email" CssClass="form-control" placeholder="Email" aria-describedby="basic-addon1" runat="server" TextMode="Email"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-user input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 104px">Name</span>
            <asp:TextBox ID="name" CssClass="form-control" placeholder="Name" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-user input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 81px">Username</span>
            <asp:TextBox ID="username" CssClass="form-control" placeholder="Username" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 84px;">Password</span>
            <asp:TextBox ID="password" TextMode="password" CssClass="form-control" placeholder="Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 36px">ConfirmPassword</span>
            <asp:TextBox ID="confirmpass" TextMode="password" CssClass="form-control" placeholder="Confirm Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="register" Text="Register" CssClass="button" runat="server" Font-Bold="True" Font-Size="Large" Width="450px"></asp:Button>
    </div>
</asp:Content>
