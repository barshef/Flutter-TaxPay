<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="LoginAccess.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.LoginAccess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
      <!--annual-report-section -->
    <section >
        <div class="container">
            <div class="row content-row" style="margin-top: 30px;">
                <div class="text-center">
                    <h2 class="section-title">Pay Route Login Portal</h2>
                    <span class="section-sub">Please login below with valid credentials</span>
                    <br/>
                    <asp:Label ID="LblgeturlInstcode" runat="server" Text="" Visible="False"></asp:Label>  
                </div>
                <div class="modal-header">
                   <%-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <h4 class="modal-title" id="quoteModalLabel"><asp:Label ID="LblMsg" runat="server" Text=""></asp:Label></h4>
                </div><br/><br/>
                
                <div class="modal-body">
                    <div runat="server">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>User Name</label>
                                    <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Username"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password</label>
                                    <asp:TextBox ID="txtpassword" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <a id="BtnLogin" runat="server"  href="#" class="btn btn-primary animated lightSpeedIn">Login</a>
                    </div>
                </div>
                
            </div><!--/.container -->
        </div>
        
    </section>
    <!--/.annual-report-section -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
</asp:Content>
