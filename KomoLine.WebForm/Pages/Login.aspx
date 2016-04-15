<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KomoLine.WebForm.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
		<h1>Form Login</h1>
	</div>
    <table border="0">
		<tr>
			<div class="input-group">
                <td><asp:Label ID="iduser" Text="ID*" runat="server"></asp:Label></td>
				<td><asp:TextBox ID="id" class="form-control" placeholder="ID" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
                <td><asp:Label ID="katasandi" Text="Kata Sandi*" runat="server"></asp:Label></td>
				<td><asp:TextBox ID="sandi" type="password" class="form-control" placeholder="Kata sandi" aria-describedby="basic-addon1" runat="server"></asp:TextBox></td>
			</div>
		</tr>
		<tr>
            <td><asp:Label ID="WI" Text="*Wajib diisi" runat="server"></asp:Label></td>
        </tr>
        <tr>
			<td>
				<asp:Button ID="kirim" Text="Kirim" class="btn btn-default" runat="server"></asp:Button>
			</td>
		</tr>
	</table>
</asp:Content>
