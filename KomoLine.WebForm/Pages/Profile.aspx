<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KomoLine.WebForm.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
		<h1>Your Profile</h1>
	</div>
    <table border="0">
		<tr>
			<td><asp:Image ID="profpic" src="" runat="server"/></td>
		</tr>
		<tr>
			<td><asp:Button ID="chpic" Text="Change Picture" class="btn btn-default" runat="server"></asp:Button></td>
		</tr>
		<tr>
			<td><asp:Label ID="email" Text="Email" runat="server"></asp:Label></td>
			<td><asp:Label ID="cemail" Text=": ....." runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="username" Text="Username" runat="server"></asp:Label></td>
			<td><asp:Label ID="cusername" Text=": ....." runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="password" Text="Password" runat="server"></asp:Label></td>
			<td><asp:Label ID="cpassword" type="password" Text=": *****" runat="server"></asp:Label></td>
		</tr>
		<tr>
            <td><asp:Label ID="name" Text="Name" runat="server"></asp:Label></td>
			<td><asp:Label ID="cname" Text=": ....." runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="address" Text="Address" runat="server"></asp:Label></td>
			<td><asp:Label ID="caddress" Text=": ....." runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Label ID="phnumb" Text="Phone Number" runat="server"></asp:Label></td>
			<td><asp:Label ID="cphnumb" Text=": ....." runat="server"></asp:Label></td>
		</tr>
		<tr>
			<td><asp:Button ID="editprof" Text="Edit Profile" class="btn btn-default" runat="server"></asp:Button></td>
		</tr>
	</table>
</asp:Content>
