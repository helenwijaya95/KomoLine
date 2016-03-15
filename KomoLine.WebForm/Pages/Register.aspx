<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KomoLine.WebForm.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <table border="0">
		<tr>

			<td>Email</td>
			<td>: <asp:TextBox ID="EmailTextbox" runat="server" CssClass=""/></td>
		</tr>
		<tr>
			<td>Name</td>
			<td>: <input type="text" value=""></td>
		</tr>
		<tr>
			<td id="tab">Username</td>
			<td>: <input type="text" value=""></td>
		</tr>
		<tr>
			<td id="tab">Password</td>
			<td>: <input type="password" value=""></td>
		</tr>
		<tr>
			<td id="tab">Confirm Password</td>
			<td>: <input type="password" value=""></td>
		</tr>
		<tr>
			<td id="tab"></td>
			<td><input type="submit" value="Register"></td>
		</tr>
	</table>
</asp:Content>
