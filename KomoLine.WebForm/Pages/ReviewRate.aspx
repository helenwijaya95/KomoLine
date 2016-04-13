<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ReviewRate.aspx.cs" Inherits="KomoLine.WebForm.Pages.ReviewRate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-2.2.1.js"></script>  
    <script type="text/javascript" src="../Scripts/jquery-2.2.1.min.js"></script>
    <script type="text/javascript">
                $(document).ready(function () {
            $("#Button1").onClick(function () {
               alert("hi");
            });

        });
    </script>  
    <link href="../CSS/RevRate.css" rel="stylesheet" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">

    <div id="main">
        <div id="transForm">
            <asp:TextBox ID="transID" runat="server"/>
            <asp:Button ID="Button1" Text="OK" runat="server" ClientIDMode="Static" />
        </div>

        <div id="detProduct">
            <table border="1">
               <th>Product</th>
                <th>Review & Rate</th>
                <tr>
                    <td style="width:40%; text-align:center;">
                      <p>Nama Produk</p>   
                        <asp:Image id="Star1" runat="server" imageurl="../Image/star.png" AlternateText="1Star" Width="30%" Height="10%" />
                        <p>Nama Toko</p>
                    </td>
                    <td>
                         <p>Rate Produk (skala 1-5)</p>
                        <div id="stars">
                            <asp:ImageButton ID="rate1" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%"/>
                            <asp:ImageButton ID="rate2" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" />
                            <asp:ImageButton ID="rate3" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" />
                            <asp:ImageButton ID="rate4" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" />
                            <asp:ImageButton ID="rate5" runat="server" ImageUrl="../Image/blankstar.png" Height="8%" Width="8%" />
                            </div>
                         <p>Review Produk</p>
                        <textarea id="TextArea1" cols="30" rows="2">hahaahah</textarea>
                        <asp:Button ID="Button2" runat="server" Text="Kirim" />
                    </td>
                    
                </tr>
            </table>

        
        </div>
    </div>
</asp:Content>
