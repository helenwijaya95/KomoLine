<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Template.Master" AutoEventWireup="true" CodeBehind="ListUser.aspx.cs" Inherits="KomoLine.WebForm.Pages.ListUser" %>

<%@ Import Namespace="KomoLine.Data.Model" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="server">
    <style>
        .input-group-addon{
            width:40%;
            text-align:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <section id="portfolio">
        <div class="container">
            <!-- Heading -->
            <div class="section-header">
                <div class="row section-title text-center">
                    <div class="col-sm-8 col-sm-offset-2">
                        <h1 class="wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">List Users</h1>
                    </div>
                </div>
            </div>
            <!-- ./Heading -->
            <div class="row">
                <asp:Repeater runat="server" ID="UserRepeater">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 portfolio-item wow zoomIn animated" data-wow-duration="1500ms" data-wow-delay="100ms">
                            <asp:HyperLink runat="server" CssClass="portfolio-link" data-target='<%# "#detailModal_"+(Container.DataItem as Account).Username.Replace(" ","_") %>' data-toggle="modal" >
                                <div class="portfolio-hover">
                                    <div class="portfolio-hover-content">
                                        <i class="fa fa-chain fa-2x"></i>
                                    </div>
                                </div>
                                <img src="<%# ResolveUrl("~/Image/profpic/"+(Container.DataItem as Account).Photo) %>" class="img-responsive" alt="Profile Picture">
                            </asp:HyperLink>
                            <div class="portfolio-caption">
                                <h4><%# (Container.DataItem as Account).Username %> - <%# (Container.DataItem as Account).Name %></h4>
                                <p class="text-muted"><%# (Container.DataItem as Account).Role %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--/.container-->
    </section>
    <!-- Use the modals below to showcase DETAIL USER ! -->
    <asp:Repeater runat="server" ID="DetailRepeater" OnItemDataBound="DetailRepeater_ItemDataBound">
        <ItemTemplate>
            <div class="modal fade" id="detailModal_<%# (Container.DataItem as Account).Username.Replace(" ","_") %>" role="dialog" aria-hidden="false">
                <div class="modal-dialog modal-lg">
                    <asp:UpdatePanel runat="server" ID="DetailPanel" UpdateMode="Conditional" ChildrenAsTriggers="false">
                        <ContentTemplate>
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h2 class="modal-title">
                                        <asp:Label runat="server" ID="NameLabel"></asp:Label></h2>
                                </div>
                                <div class="modal-body">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <!-- Project Details Go Here -->
                                                <p class="item-intro text-muted">
                                                    <asp:Label runat="server" ID="StatusLabel" ForeColor="Green" Font-Bold="true"></asp:Label>
                                                </p>
                                                <div class="col-lg-4">
                                                    <asp:Image runat="server" ID="ProfilePicture" CssClass="img-responsive img-centered" AlternateText="Profile Picture" />
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="input-group col-lg-8">
                                                        <span class="glyphicons glyphicons-home input-group-addon">Address</span>
                                                        <asp:Label runat="server" ID="AddressLabel" CssClass="form-control"></asp:Label>
                                                    </div>
                                                    <div class="input-group col-lg-8">
                                                        <span class="glyphicons glyphicons-envelope input-group-addon">Email</span>
                                                        <asp:Label runat="server" ID="EmailLabel" CssClass="form-control"></asp:Label>
                                                    </div>
                                                    <div class="input-group col-lg-8">
                                                        <span class="glyphicons glyphicons-phone-alt input-group-addon">Phone Number</span>
                                                        <strong><asp:Label runat="server" ID="PhoneLabel" CssClass="form-control"></asp:Label></strong>
                                                    </div>
                                                    <hr class="col-lg-8"/>
                                                    <div class="input-group col-lg-8">
                                                        <span class="glyphicons glyphicons-clock input-group-addon">Confirmed On</span>
                                                        <asp:Label runat="server" ID="ConfirmLabel" CssClass="form-control"></asp:Label>
                                                    </div>
                                                    <div class="input-group col-lg-8">
                                                        <span class="glyphicons glyphicons-clock input-group-addon">Register On</span>
                                                        <asp:Label runat="server" ID="RegisterLabel" CssClass="form-control"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
