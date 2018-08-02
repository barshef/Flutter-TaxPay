<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="DeclinedTrans.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.DeclinedTrans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
    <!--annual-report-section -->
        <section>
            <div class="row content-row" style="margin-top: 20px;">
                <div class="container">

                    <div class="text-center">
                        <h2 class="section-title" style="color:red">Payment Not Successful</h2>
                        <span class="section-sub">
                            <asp:label id="Lbltransmsg" runat="server" text="" style="color: red" Font-Size="25px"></asp:label>
                        </span>
                    </div>
                    <div class="annual-report-carousel">
                        <div id="reportCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="annual-report clearfix">
                                        <div class="report-thumb">
                                        </div>
                                        <div style="text-align:center; padding-bottom:10px">
                                        <div class="report-info" style="margin-top: 10px;">
                                            <h4>
                                                <label id="" style="color: black">Transaction Reference Number :- </label>&nbsp;&nbsp;<asp:Label ID="Lbltransrefno" runat="server" Text="" style="color: aqua"></asp:Label>
                                            </h4>
                                            <p>Thanks for using our online payment service.</p>


                                            <a id="Btnsubmits" runat="server" onserverclick="Btnsubmits_OnServerClick" href="#" class="btn btn-primary animated lightSpeedIn">Return to Home Page</a>

                                            <a id="bntRetry" runat="server" onserverclick="bntRetry_OnServerClick" href="#" class="btn btn-success animated lightSpeedIn">Retry Transaction</a>
                                        </div>
                                            </div>
                                    </div>
                                    <!-- /.annual-report -->
                                </div>
                            </div>
                            <!-- /.carousel-inne -->
                        </div>
                        <!--/.carousel -->
                    </div>
                    <!-- /.annual-report-carousel -->
                </div>
                <!--/.container -->
            </div>
        </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
</asp:Content>
