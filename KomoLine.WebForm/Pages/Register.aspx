<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KomoLine.WebForm.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <script>
        $('#myButton').on('click', function () {
            var $btn = $(this).button('loading')
            $btn.button('reset')
        })
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <div>
		<h1>REGISTER HERE...</h1>
	</div>
    <table border="0">
		<tr>
			<div class="input-group">
				<td><input type="text" class="form-control" placeholder="Email" aria-describedby="basic-addon1"></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><input type="text" class="form-control" placeholder="Name" aria-describedby="basic-addon1"></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1"></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><input type="password" class="form-control" placeholder="Password" aria-describedby="basic-addon1"></td>
			</div>
		</tr>
		<tr>
			<div class="input-group">
				<td><input type="text" class="form-control" placeholder="Confirm Password" aria-describedby="basic-addon1"></td>
			</div>
		</tr>
		<tr>
			<td>
				<button type="button" id="myButton" data-loading-text="Loading..." class="btn btn-primary" autocomplete="off">
                    Register
                </button>
			</td>
		</tr>
	</table>
</asp:Content>
