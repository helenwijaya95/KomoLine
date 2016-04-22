<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KomoLine.WebForm.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server" EnableViewState="False">
    <div>
		<h1>Your Profile</h1>
	</div>
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red"/>
        <asp:Image ID="profpic" ImageUrl=".../Image/profpic/default.png" runat="server"/>
            <input type="file" name="pic" accept="image/*"/>
            <input type="submit"/>
		<div class="input-group">
            <span class="input-group-addon" id="basic-addon1">Email</span>
            <asp:TextBox ID="cemail" CssClass="form-control" aria-describedby="basic-addon1" runat="server" TextMode="Email"></asp:TextBox>
		</div>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">Username</span>
            <asp:TextBox ID="cusername" CssClass="form-control" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
	    </div>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">Name</span>
            <asp:TextBox ID="cname" CssClass="form-control" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
	    </div>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">Address</span>
            <asp:TextBox ID="caddress" CssClass="form-control" aria-describedby="basic-addon1" runat="server" TextMode="MultiLine"></asp:TextBox>
	    </div>
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">Phone Number</span>
            <asp:TextBox ID="cphnumber" CssClass="form-control" aria-describedby="basic-addon1" runat="server"></asp:TextBox>
	    </div>
		<asp:Button ID="editprof" Text="Save Profile" CsscClass="btn btn-default" runat="server"></asp:Button>
</asp:Content>
