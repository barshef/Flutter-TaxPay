<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="RequerryTransaction.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.RequerryTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function Comma(num) { //function to add commas to textboxes
            num += '';
            num = num.replace(',', ''); num = num.replace(',', ''); num = num.replace(',', '');
            num = num.replace(',', ''); num = num.replace(',', ''); num = num.replace(',', '');
            x = num.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1))
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            return x1 + x2;
        }
    </script>

    <script language="JavaScript">
        function validatenumerics(key) {
            //getting key code of pressed key
            var keycode = (key.which) ? key.which : key.keyCode;
            //comparing pressed keycodes

            if (keycode > 31 && (keycode < 48 || keycode > 57)) {
                alert(" You can enter only characters 0 to 9 ");
                return false;
            }
            else return true;

        }
    </script>

    <script language="javascript" type="text/javascript">
    // Except only numbers and dot (.) for salary textbox
    function onlyDotsAndNumbers(event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        if (charCode === 46) {
            return true;
        }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            alert(" You can enter only characters 0 to 9 as amount");
            return false;
        }
        else {
            return true;
        }
        
    }
    //Except only numbers for Age textbox
    function onlyNumbers(event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }

     // No alphabets for Emp No textbox
    function noAlphabets(event) {
        var charCode = (event.which) ? event.which : event.keyCode;
        if ((charCode >= 97) && (charCode <= 122) || (charCode >= 65) && (charCode <= 90))
            return false;

        return true;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
    <div class="service-blocks">
        <div class="container text-center">
            <div class="text-left">
                <br />
                <a id="Return2RevDetails" runat="server" style="color: crimson" onserverclick="Return2RevDetails_OnServerClick" href="#">&laquo; Go Back</a>
                <h4 class="report-info; text-left" style="color: red">
                    <asp:Label ID="LblAgencyName" ForeColor="green" runat="server" Text=""></asp:Label>
                    <p>
                        <asp:Label ID="LblRevenueName" CssClass="text-center" Font-Size="14px" Visible="True" ForeColor="black" runat="server" Text=""></asp:Label>
                    </p>
                </h4>
                
                <div class="container text-center">
                    <div class="text-center">
                        <div class="service-blocks" style="margin-top: 5px">
                            <div class="row">
                                <div class="col-sm-2">
                                </div>
                                <div class="col-sm-4">
                                    <div class="service-block clearfix">
                                        <div class="service-icon">
                                            <i class="flaticon-logistics42"></i>
                                        </div>
                                        <div class="service-content">
                                            <asp:Label ID="LblMsg" runat="server" Text="" Style="color: red"></asp:Label>
                                            <h5 class="pull-left" style="color: red">
                                                <asp:Label ID="LblAsstinput" ForeColor="black" runat="server" Text="Enter Your Transaction Ref. No. Below "></asp:Label></h5>
                                            <asp:TextBox ID="utinorasstref" class="form-control" placeholder="" runat="server" ForeColor="black"></asp:TextBox>
                                        </div>

                                    </div>
                                    <!-- /.service-block -->
                                </div>
                                <!-- /.col-sm-4 -->
                                <div class="col-sm-1">
                                    <div class="service-block clearfix">
                                        <div class="service-icon">
                                            <%--<asp:Button ID="BtnSearch"  runat="server" Text="Search" CssClass="btn btn-success animated lightSpeedIn" OnClick="BtnSearch_OnClick"/>
                                            <a id="hhh" class="btn btn-primary animated lightSpeedIn" href='<%=ResolveUrl("~/Agency") %>'><< Click here to make payment >> </a>--%>

                                            <a id="BtnSearches" runat="server" onserverclick="BtnSearches_OnServerClick" href="#" class="btn btn-primary animated lightSpeedIn">Search</a>
                                        </div>
                                    </div>
                                    <!-- /.service-block -->
                                </div>
                                <!-- /.col-sm-4 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="service-block clearfix">
                                        <div class="service-icon">
                                        </div>
                                        <div class="service-content">
                                            <asp:Label ID="LblgeturlInstcode" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="Lblurl" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblStateCode" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LbluseUrl" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblUrlInstcode" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblDbGatewayName" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblRevName" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblRevCode" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblselRevName" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="LblPayerStatus" runat="server" Text="" Visible="False"></asp:Label>
                                            <asp:Label ID="Lblpasstotals" runat="server" Text="" Visible="False"></asp:Label>
                                        </div>
                                    </div>
                                    <!-- /.service-block -->
                                </div>
                                <!-- /.col-sm-4 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.service-blocks -->
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
</asp:Content>
