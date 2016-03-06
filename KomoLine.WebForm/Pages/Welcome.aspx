<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="KomoLine.WebForm.Pages.Welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="TestTable" runat="server">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>ID</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td><asp:Label ID="TestLabel" runat="server" Text="<%#Container.DataItem %>"></asp:Label></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
