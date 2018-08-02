<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="AgencyPage.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.AgencyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
    <!-- Add icon library for click load Start-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    <style>
        /* Style buttons */
        .buttonload {
            background-color: #4CAF50; /* Green background */
            border: none; /* Remove borders */
            color: white; /* White text */
            padding: 12px 16px; /* Some padding */
            font-size: 16px /* Set a font size */
        }
    </style>
    <!-- Add icon library for click load End-->

    <%--<script src="https://code.jquery.com/jquery-1.9.1.js"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
    <!-- testimonial-section start -->
    <section class="partner-section" style="margin-top: 2px">
        <div class="text-left">
            <asp:Label ID="LblMsg" runat="server" Text="" Style="color: red"></asp:Label>
            <asp:Label ID="LblMerchantCode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblgeturlInstcode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblGateWayId" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LbluseUrl" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="Lblurl" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="" Visible="False"></asp:Label>
        </div>

        <div class="container text-center">
            <div class="text-left">
                <br />
                <a style="color: crimson" href='<%=ResolveUrl("~/Home") %>'>&laquo; Go Back</a>
                <br />
            </div>
            <div class="pull-left">
                <h4 class="report-info" style="color: black; text-align: left; margin-top: 1px">Please click on the Agency Name in which you are paying to below:</h4>
            </div>

            <div>
                <p>
                    <asp:Repeater ID="RptAgencyName" runat="server" OnItemCommand="RptAgencyName_OnItemCommand">

                        <HeaderTemplate>
                            <table id="example1" class="display nowrap" style="width: 1000px">
                                <thead>
                                    <tr>
                                        <th style="text-align: center; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px; width: 2px">S/N</th>
                                        <th style="text-align: left; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px">Agency Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="text-align: center; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px; color: blue"><%# ((IDataItemContainer) Container).DataItemIndex + 1 %></td>

                                <td style="text-align: left; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px; color: blue">
                                    <asp:HiddenField ID="HiddenAgencyID" runat="server" Value='<%# Eval("Value") %>' />
                                    <asp:HiddenField ID="HiddenAgencyName" runat="server" Value='<%# Eval("Name") %>' />
                                    <asp:LinkButton ID="lblVwDetails" runat="server" Text='<%# Eval("Name") %>' Visible="True" CommandName="SelectedRow" ForeColor="blue"></asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody></table> 
                        </FooterTemplate>

                    </asp:Repeater>
                </p>
            </div>

            <!-- /.counter-section -->
        </div>
        <!-- /.container -->
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var dataTable = $('#example1').DataTable({
                
                'iDisplayLength': 10
            });

        });
    </script>
</asp:Content>
