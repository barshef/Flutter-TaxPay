<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="SuccessTrans.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.SuccessTrans" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
    <!--annual-report-section -->
    <section>
        <div class="row content-row" style="margin-top: 20px;">
            <div class="container">
                <asp:Panel ID="PanelPrint" runat="server">
                <div class="text-center">
                    <h2 class="section-title"><asp:Label ID="LblStateName" runat="server" Text="Ogun State" ></asp:Label>&nbsp;Payment Acknowledgement</h2>
                    <span class="section-sub">
                       <asp:label id="Lbltransmsg" runat="server" text="Transaction Successful" style="color: green" Font-Size="25px"></asp:label><br />
                        <asp:Label ID="LblMsg" runat="server" Text="" Style="color: red"></asp:Label>
                        <asp:Label ID="LblPartialMsg" runat="server" Text="" Style="color: red">Oh we are sorry something went wrong, <br /> however your transaction is successful, <br /> please check your email to querry your transaction status.</asp:Label>
                    </span>
                </div>

                    
                <div class="annual-report-carousel" >
                    <div id="reportCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" style="padding-top:5px; padding-left:8px">
                            <div class="item active">
                                <div class="annual-report clearfix">
                                    <div class="report-thumb">
                                        <img src="<%: ResolveUrl("~/Engines/img/newslide/Approved.png") %>" >
                                    </div>
                                    <div class="report-info" style="margin-top: 1px;">
                                        <table runat="server" >
                                            <tr>
                                               
                                                <td style="width: 200px;"><label id="" style="color: black">Payer Name :- </label>
                                                </td>
                                                <td style="width: 200px;"><asp:Label ID="LblPayerName" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;"><label id="" style="color: black">Payment Date & Time :- </label>
                                                </td>
                                                <td style="width: 200px;"><asp:Label ID="LblDateTime" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                                </tr>
                                            <tr>
                                                <td style="width: 200px;"><label id="" style="color: black">Payment Ref. Number :- </label>
                                                </td>
                                                <td style="width: 200px;"><asp:Label ID="Lbltransrefno" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;"><label id="" style="color: black">Receipt Number :- </label>
                                                </td>
                                                <td style="width: 200px;"><asp:Label ID="LblReceiptNo" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;"><label id="" style="color: black">Amount Paid (=N=) :- </label>
                                                </td>
                                                <td style="width: 200px;"><asp:Label ID="Lblamtpaid" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 200px;"><label id="" style="color: black">Agency Name :- </label>
                                                </td>
                                                <td style="width: 200px;"><asp:Label ID="LblAgencyName" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                                </tr>
                                            <tr>
                                                <td style="width: 200px;"><label id="" style="color: black">Revenue Name :- </label>
                                                </td>
                                                <td style="width: 300px;"><asp:Label ID="LblRevName" runat="server" Text="" style="color: black; text-decoration:solid"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                         
                                        <div style="text-align:center; padding-bottom:10px">
                                            <br />
                                            <p style="color: black;">Thanks for using our online payment service.</p>
                                            <asp:LinkButton ID="Btnsubmit" class="btn btn-primary animated lightSpeedIn" runat="server" Style="color: White" Text="Print" OnClientClick="return printpage1();"><i class="fa fa-print"></i> Print</asp:LinkButton>
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtthirdpartyemail" class="" placeholder="Enter third party email here" runat="server" ForeColor="black" onkeypress="Javascript:checkEmail();"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a id="btnthirdpartyemail" runat="server" onserverclick="btnthirdpartyemail_ServerClick" href="#" class="btn btn-success animated lightSpeedIn">Send to third party email<i class="fa fa-report"></i></a>
                                        <a id="sendMail" runat="server" onserverclick="sendMail_ServerClick" href="#" class="btn btn-success animated lightSpeedIn">Send mail<i class="fa fa-report"></i></a>
                                            <a id="btnhome" runat="server" onserverclick="btnhome_OnServerClick" href="#" class="btn btn-primary animated lightSpeedIn">Back to Homepage<i class="fa fa-report"></i></a>
                                        <br /></div>
                                    </div>
                                </div>
                                <!-- /.annual-report -->
                            </div>
                            <!--/.item -->
                        </div>
                    </div>
                    <!--/.carousel -->
                </div>
                <!-- /.annual-report-carousel -->
                    </asp:Panel>
            </div>
         
            <!--/.container -->
        </div>
    </section>
    <!--/.annual-report-section -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
    <script type="text/javascript">
        function printpage1() {

            //Get the print button and put it into a variable
            var printButton = document.getElementById("<%=PanelPrint.ClientID%>");
            var mainwindow = window.open('', '', 'height=500,width=800');
            mainwindow.document.write('<html><head>');
            mainwindow.document.write('<link href="<%= ResolveUrl("~/Assets/Engine/css/bootstrap.min.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link rel="stylesheet" href="<%= ResolveUrl("~/Assets/Engine/css/font-awesome.min.css") %>" />');
            mainwindow.document.write('<link href="<%= ResolveUrl("~/Assets/Engine/fonts/flaticon/flaticon.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%= ResolveUrl("~/Assets/Engine/css/hippo-off-canvas.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/animate.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/language-select.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/owl.carousel/assets/owl.carousel.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/magnific-popup.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/menu.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/template.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/style.css") %>" rel="stylesheet" />');
            mainwindow.document.write('<link href="<%: ResolveUrl("~/Assets/Engine/css/responsive.css") %>" rel="stylesheet" />');

            mainwindow.document.write('<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,800"/>');
            mainwindow.document.write('</head><body>');
            //Set the print button visibility to 'hidden' 
            document.getElementById("<%=Btnsubmit.ClientID%>").style.visibility = 'hidden';
            document.getElementById("<%=btnthirdpartyemail.ClientID%>").style.visibility = 'hidden';
            mainwindow.document.write(printButton.innerHTML);
            mainwindow.document.write('</body></html>');
            mainwindow.document.close();
            setTimeout(function () {
                mainwindow.print();
            }, 1300);
            document.getElementById("<%=Btnsubmit.ClientID%>").style.visibility = 'visible';
            return false;

        }
    </script>

  <script language="javascript">
function checkEmail() {

    var email = document.getElementById('txtthirdpartyemail');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
    alert('Please provide a valid email address');
    email.focus;
    return false;
 }
}</script>
</asp:Content>
