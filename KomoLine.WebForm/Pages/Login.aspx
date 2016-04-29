<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KomoLine.WebForm.Pages.Login" %>

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
    <div class="form">
        <div>
            <h1>Login</h1>
        </div>

        <div class="input-group">
            <asp:Label ID="ErrorLabel" runat="server" Visible="False" ForeColor="Red" />
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-user input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 60px">ID</span>
            <asp:TextBox ID="IDTextBox" class="form-control" placeholder="ID" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
        </div>
        <div class="input-group">
            <span class="glyphicon glyphicon-lock input-group-addon" aria-hidden="true" id="basic-addon2" style="padding-right: 22px">Password</span>
            <asp:TextBox ID="PasswordTextBox" class="form-control" placeholder="Password" aria-describedby="basic-addon1" runat="server" TextMode="Password"></asp:TextBox>
        </div>
        <div class="input-group">
            <asp:Button ID="LoginButton" Text="Login" class="button" runat="server" Font-Bold="True" Font-Size="Large" Width="450px"></asp:Button>
        </div>
    </div>
</asp:Content>
