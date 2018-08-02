<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="RevenueDetails.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.RevenueDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
    <style>
        .dataTables_filter {
            display: none;
        }
    </style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
    <!-- testimonial-section start -->
    <section class="partner-section" style="margin-top: 2px">
        <div class="text-left">
            <asp:Label ID="LblMsg" runat="server" Text="" Style="color: red"></asp:Label>
            <asp:Label ID="LblMerchantCode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblgeturlInstcode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblGateWayId" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="Lblurl" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblStateCode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LbluseUrl" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblUrlInstcode" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LblDbGatewayName" runat="server" Text="" Visible="False"></asp:Label>

        </div>

        <div class="container text-left">
            <div class="text-left">
                <br />
                <a style="color: crimson" href='<%=ResolveUrl("~/Agency") %>'>&laquo; Go Back</a>
                <h5 class="report-info; text-left" style="color: red">
                    <asp:Label ID="LblAgencyName" ForeColor="green" runat="server" Text=""></asp:Label><asp:Label ID="LblAgencyID" Visible="False" ForeColor="black" runat="server" Text=""></asp:Label><asp:Label ID="LblSelectRevID" Visible="False" ForeColor="black" runat="server" Text=""></asp:Label><asp:Label ID="LblSelectedRevName" Visible="False" ForeColor="black" runat="server" Text=""></asp:Label></h5>
                <p style="text-align: left">
                    <asp:Label ID="Label2" ForeColor="black" runat="server" Text="Kindly click on the Revenue Name for which you are paying below : "></asp:Label>
                </p>
            </div>
            <span style="margin-left: 140px; text-align: left"></span>
            <div class="pull-right">
                Search Box :
                                <asp:TextBox ID="searchbox1" runat="server" placeholder="I am looking for ?. ..."></asp:TextBox>
            </div>
            <div>

                <asp:Repeater ID="RptRevenueName" runat="server" OnItemCommand="RptRevenueName_OnItemCommand">

                    <HeaderTemplate>
                        <table id="example1" class="display nowrap" style="width: 1000px">
                            <thead>
                                <tr>
                                    <th style="text-align: center; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px; width: 2px">S/N</th>
                                    <th style="text-align: left; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px">Revenue Name</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: center; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px; color: blue"><%# ((IDataItemContainer) Container).DataItemIndex + 1 %></td>

                            <td style="text-align: left; padding-top: 0.5px; padding-bottom: 0.5px; font-size: 12px; color: blue">
                                <asp:HiddenField ID="HiddenRevenueID" runat="server" Value='<%# Eval("Value") %>' />
                                <asp:HiddenField ID="HiddenRevenueName" runat="server" Value='<%# Eval("Name") %>' />
                                <%--<asp:Label ID="Lblpayaname" Visible="True" runat="server" Text='<%#Eval("Value")%>'></asp:Label>--%>
                                <asp:LinkButton ID="lblVwDetails" ForeColor="blue" runat="server" Text='<%# Eval("Name") %>' Visible="True" CommandName="SelectedRow"></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody></table> 
                    </FooterTemplate>

                </asp:Repeater>
            </div>
        </div>
        <!-- /.container -->
    </section>
    <!-- testimonial-section end -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
            var dataTable = $('#example1').DataTable({
                
                'iDisplayLength': 15
            });

            $("#<%= searchbox1.ClientID %>").keyup(function () {
                //dataTable.fnFilter(this.value);
                dataTable
                    .search(this.value)
                    .draw();
            });
        });
    </script>
</asp:Content>
