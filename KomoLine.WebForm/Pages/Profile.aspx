<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KomoLine.WebForm.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
		<h1>Your Profile</h1>
	</div>
        <asp:Image ID="profpic" src="" runat="server"/>
	    <asp:Button ID="chpic" Text="Change Picture" class="btn btn-default" runat="server" OnClick="chpic_Click"></asp:Button><br />
		<asp:Label ID="email" Text="Email" runat="server"></asp:Label>
		<asp:Label ID="cemail" Text="....." runat="server"></asp:Label><br />
		<asp:Label ID="username" Text="Username" runat="server"></asp:Label>
		<asp:Label ID="cusername" Text=": ....." runat="server"></asp:Label><br />
        <asp:Label ID="name" Text="Name" runat="server"></asp:Label>
   	    <asp:Label ID="cname" Text=": ....." runat="server"></asp:Label><br />
		<asp:Label ID="address" Text="Address" runat="server"></asp:Label>
		<asp:Label ID="caddress" Text=": ....." runat="server"></asp:Label><br />
		<asp:Label ID="phnumb" Text="Phone Number" runat="server"></asp:Label>
		<asp:Label ID="cphnumb" Text=": ....." runat="server"></asp:Label><br />
		<asp:Button ID="editprof" Text="Edit Profile" class="btn btn-default" runat="server" OnClick="editprof_Click"></asp:Button>
</asp:Content>
