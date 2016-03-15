<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KomoLine.WebForm.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
		<h1>Your Profile</h1>
	</div>
    <table border="0">
		<tr>
			<td><img src=""></td>
		</tr>
		<tr>
			<td><button>Change Picture</button></td>
		</tr>
		<tr>
			<td>Email</td>
			<td>: ...</td>
		</tr>
		<tr>
			<td>Username</td>
			<td>: ...</td>
		</tr>
		<tr>
			<td>Password</td>
			<td>: *****</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>: ...</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>: ...</td>
		</tr>
		<tr>
			<td>Phone Number</td>
			<td>: ...</td>
		</tr>
		<tr>
			<td><button>Edit Profile</button></td>
		</tr>
	</table>
</asp:Content>
