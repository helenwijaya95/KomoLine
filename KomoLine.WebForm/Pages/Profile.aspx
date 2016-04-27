<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="KomoLine.WebForm.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server" EnableViewState="False">
    <div>
        <h1>Your Profile</h1>
    </div>
    
    <asp:Label ID="error" runat="server" Visible="False" ForeColor="Red" />
    <asp:Image ID="ProfileImage" ImageUrl="~/Image/profpic/default.png" Height="100px" Width="100px" runat="server" />
    <asp:FileUpload runat="server" ID="UploadImage" accept="image/*" />
    <div class="input-group">
        <span class="input-group-addon" id="basic-addon1">Status: </span>
        <asp:Label ID="StatusLabel" CssClass="form-control" aria-describedby="basic-addon1" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
    </div>
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
    <asp:PlaceHolder runat="server" ID="PromotePlaceholder">
        <div class="input-group">
            <span class="input-group-addon" id="basic-addon1">Become A Vendor?</span>
            <asp:Label ID="RequestLabel" runat="server"  CssClass="form-control" aria-describedby="basic-addon1" ForeColor="Green" Font-Bold="true"></asp:Label>
            <asp:CheckBox ID="CheckPromotion" CssClass="form-control" aria-describedby="basic-addon1" runat="server"></asp:CheckBox>
        </div>
    </asp:PlaceHolder>
    <asp:Button ID="editprof" Text="Save Profile" CsscClass="btn btn-default" runat="server"></asp:Button>
</asp:Content>
