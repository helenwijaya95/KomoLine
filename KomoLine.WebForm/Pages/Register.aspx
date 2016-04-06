<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KomoLine.WebForm.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
		<h1>REGISTER HERE...</h1>
	</div>
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red"/>
    <table border="0">
		<tr>
			<div class="input-group">
				<td><asp:TextBox ID="email" CssClass="form-control" placeholder="Email" aria-describedby="basic-addon1" runat="server" TextMode="Email"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><asp:TextBox ID="name" class="form-control" placeholder="Name" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><asp:TextBox ID="username" class="form-control" placeholder="Username" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><asp:TextBox ID="password" type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><asp:TextBox ID="confirmpass" type="password" class="form-control" placeholder="Confirm Password" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
			<td>
				<asp:Button ID="register" Text="Register" class="btn btn-default" runat="server"></asp:Button>
			</td>
		</tr>
	</table>
</asp:Content>
