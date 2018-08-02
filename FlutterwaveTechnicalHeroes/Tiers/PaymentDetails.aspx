<%@ Page Title="" Language="C#" MasterPageFile="~/Tiers/RaveMasterPage.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.PaymentDetails" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control {
            height: 34px
        }

        .form-group {
            margin-bottom: 1px;
        }

        .form-control-static {
            padding-bottom: 2px;
            padding-top: 0px;
        }

        .modal-header {
            padding-bottom: 0px;
        }

        /*span.form-control {
            border: 0;
        }*/
    </style>
    <link href="<%= ResolveUrl("~/Assets/Engine/chosen/chosen.min.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Assets/Engine/select2/dist/css/select2.css") %>" rel="stylesheet" />
    <style>
        .BarshefPostbackSelect2 {
        }
    </style>

    <script>
        function Comma(num) { //function to add commas to textboxes
            num += '';
            num = num.replace(',', ''); num = num.replace(',', ''); num = num.replace(',', '');
            num = num.replace(',', ''); num = num.replace(',', ''); num = num.replace(',', '');
            var x = num.split('.');
            var x1 = x[0];
            var x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1))
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            return x1 + x2;

        }
    </script>

    <script language="JavaScript">
        function OnlyNumbers(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode !== 46 && charCode > 31
                && (charCode < 48 || charCode > 57))
                return false;
            return true;

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

    <script type="text/javascript">
        function Validate() {
            var $form = $('#<%= form1.ClientID %>');
            var amtpaid = $form.find('#<%=txtpayeamt.ClientID%>').val();
            var removecomaamtpaid = amtpaid.replace(/[^0-9-.]/g, '');

            var decimalamtpaid = parseFloat(removecomaamtpaid);
            console.log(decimalamtpaid);

            if (decimalamtpaid <= 0) {
                alert("Sorry! amount paid must not be greater than assessed amount.");
                document.getElementById("<%=txtpayeamt.ClientID %>").value = "";
                return false;
            }
            return true;
        }
    </script>
    <%--Method to disable backspace starts--%>
    <script>
        (function (global) {

            if (typeof (global) === "undefined") {
                throw new Error("window is undefined");
            }

            var hash = "!";
            var noBackPlease = function () {
                global.location.href += "#";

                // making sure we have the fruit available for juice (^__^)
                global.setTimeout(function () {
                    global.location.href += "!";
                }, 50);
            };

            global.onhashchange = function () {
                if (global.location.hash !== hash) {
                    global.location.hash = hash;
                }
            };

            global.onload = function () {
                noBackPlease();

                // disables backspace on page except on input fields and textarea..
                document.body.onkeydown = function (e) {
                    var elm = e.target.nodeName.toLowerCase();
                    if (e.which === 8 && (elm !== 'input' && elm !== 'textarea')) {
                        e.preventDefault();
                    }
                    // stopping event bubbling up the DOM tree..
                    e.stopPropagation();
                };
            };
        })(window);
    </script>
    <%--Method to disable backspace ends--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHoldaBody" runat="server">
    <div id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <div class="row content-row" style="margin-top: 30px;">
                <asp:Label ID="LblUrlInstcode" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblStateCode" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="Lblurl" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblDbGatewayName" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LbluseUrl" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblStateName" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblCurDate" runat="server" Text="" Visible="False"></asp:Label>

                <div class="col-md-7">
                    <div class="text-center">
                        <div class="text-left">
                            <asp:Panel ID="PanelGoBck1" runat="server">
                                <asp:Label ID="Label1" runat="server" Text="" Visible="False"></asp:Label><asp:Label ID="Label2" runat="server" Text="" Visible="False"></asp:Label><a href='<%=ResolveUrl("~/Agency") %>'>&laquo; Go Back</a>
                            </asp:Panel>
                        </div>
                    </div>
                    <h4 class="report-info; text-center" style="color: red">
                        <asp:Label ID="LblAgencyNameShow" ForeColor="green" runat="server" Text=""></asp:Label>
                        <p>
                            <asp:Label ID="LblRevenueName" CssClass="text-center" Font-Size="14px" Visible="True" ForeColor="black" runat="server" Text=""></asp:Label>
                        </p>
                    </h4>
                </div>

                <div class="row">
                    <div class="col-lg-9">
                        <div class="panel panel-default">
                            <div class="panel-heading clearfix">
                                <h3 class="panel-title" style="color: blue">Please provide the details below for your Receipt :</h3>
                                <ul class="panel-tool-options">
                                    <asp:HiddenField ID="HiddenFieldRevenueName" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldRevenueCode" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldAgencyName" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldEnteredUtinAssRefNo" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldUTIN" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldAgencycode" runat="server" />
                                    <asp:HiddenField ID="HiddenFieldPayer" runat="server" />
                                    <asp:HiddenField ID="HftransRefNo" runat="server" />
                                    <asp:HiddenField ID="HfSelectedStateItem" ClientIDMode="Static" runat="server" />
                                    <asp:HiddenField ID="HfSelectedLgaItem" ClientIDMode="Static" runat="server" />
                                    <asp:HiddenField ID="Hfamtpaid" runat="server" />
                                </ul>
                            </div>
                            <div class="row">
                                <asp:Panel ID="Panelpayamt" runat="server">
                                    <div class="col-md-6">
                                        <div class="form-group" style="padding-top: 20px">
                                            <label for="amountid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>Amount (=N=)</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="txtpayeamt" CssClass="form-control required" placeholder="" runat="server" MaxLength="200" onblur="return Validate()" onkeypress="return onlyDotsAndNumbers(event)" onkeyup="javascript:this.value=Comma(this.value, event, 30);" Style="text-align: right" required="required" autocomplete="off">
                                                </asp:TextBox>
                                                <asp:Label ID="Lblstatusmsg" runat="server" Text="" Visible="False" ForeColor="red"></asp:Label><asp:Label ID="Lblcheck" runat="server" Text="" ForeColor="red"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="coynameid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>Surname (or coy. name)</label>
                                        <div class="col-md-6">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payersurname" id="Lblpayersurname" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <p></p>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="othernameid" class="col-md-5 control-label" style="text-align: left; color: black">Other Names</label>
                                        <div class="col-sm-7">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerOtherNames" id="LblpayerOtherNames" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="coynameid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>Country</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCountries" runat="server" CssClass="select2 form-control chosen BarshefPostbackSelect2" onchange="PopulateStateName()"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="othernameid" class="col-md-5 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>State/County</label>
                                        <div class="col-sm-7">

                                            <asp:Panel ID="PanelHodaStateAvailable" runat="server">
                                                <asp:DropDownList ID="ddlStates" CssClass="select2 form-control BarshefPostbackSelect2" required="required" runat="server" onchange="PopulateLgaName()">
                                                </asp:DropDownList>
                                                <asp:ListItem Text="Please select state name" Value="0"></asp:ListItem>
                                            </asp:Panel>

                                            <asp:Panel ID="PanelHodaStateUnavailable" runat="server">
                                                <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerOtherState" id="txtOtherState" runat="server" />
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cityid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>City </label>
                                        <div class="col-md-6">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerCityName" id="txtCityName" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="areaid" id="areaid" class="col-md-5 control-label" style="text-align: left; color: black">Area</label>
                                        <div class="col-sm-7">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerArea" id="LblpayerArea" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="cityid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>Street No. & Street Name</label>
                                        <div class="col-md-6">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerStrtNo" id="txtStrtNo" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="areaid" class="col-md-5 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>L.G.A</label>
                                        <div class="col-sm-7">
                                            <asp:Panel ID="PanelHodaCityAvailable" runat="server">
                                                <asp:DropDownList ID="ddlCities" CssClass="select2 form-control BarshefPostbackSelect2" required="required" runat="server">
                                                </asp:DropDownList>
                                                <asp:ListItem Text="Please select l.g.a name" Value="0"></asp:ListItem>
                                            </asp:Panel>
                                            <asp:Panel ID="PanelHodaCityUnavailable" runat="server">
                                                <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerLga" id="txtlga" runat="server" />
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="cityid" id="cityid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>Telephone</label>
                                        <div class="col-md-6">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerTelNo" id="Txbphone" runat="server" maxlength="13" onkeypress="return OnlyNumbers(event)" />
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="areaid" class="col-md-5 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px">*</span>Email</label>
                                        <div class="col-sm-7">
                                            <input placeholder="" type="text" autocomplete="off" class="form-control" name="payerEmail" id="txtEmail" runat="server" onblur="checkEmail(this)" />
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group" style="padding-top: 10px">
                                        <label for="coynameid" class="col-md-6 control-label" style="text-align: left; color: black"><span style="color: red; font-size: 20px"></span>Payment Period</label>
                                        <div class="col-md-6">
                                            <input placeholder="Example: Jan. - Feb. 2018" type="text" autocomplete="off" class="form-control" name="payerpayperiod" id="lblpayperiod" runat="server" style="width: 200px" />
                                        </div>
                                    </div>
                                </div>
                                <p></p>
                                <div class="col-md-6">
                                    <div class="form-group">

                                        <div class="col-sm-7">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="text-center" style="margin-bottom: 26px; padding-top: 10px">
                                <button type="button" id="BtnReviewInputs" class="btn btn-success btn-xs pull-right">Review Entries</button>
                                <asp:Button ID="BtnSubPayment" runat="server" Text="Proceed to payment" class="btn btn-primary animated lightSpeedIn pull-right" OnClick="BtnSubPayment_OnClick" CssClass="hidden" OnClientClick="return TransRefInfo();" />
                                <br />
                                <script language="javascript">
                                    function TransRefInfo() {
                                        //bootbox.alert("A transaction reference number as been sent to your entered e-mail, with which you can querry transaction status");
                                        return alert('A transaction reference number as been sent to your entered e-mail, with which you can querry transaction status');
                                    }
                                </script>
                            </div>

                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div style="visibility: visible">
                            <h5 style="color: red">Transaction Identification Number : -
                                <asp:Label ID="Lbltransref" runat="server" Text="" ForeColor="red"></asp:Label></h5>
                            <address>
                                <h3>Please Note:- </h3>
                                It's important to write down the above transaction identication number, as this will be required in the case of any failed transaction.
                       
                            </address>
                        </div>
                        <!-- /.contact-info -->

                        <div class="contact-map">
                            <asp:Panel ID="PanelConImag" runat="server">
                                <img src="../Assets/Engine/img/TransPay.png" alt="" style="visibility: visible" />
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div id="userForm" class="form-horizontal" style="display: none; margin-left: 10px; margin-right: 9px">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Transaction Ref. No</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblTransRefNo" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Agency Name</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblDisRevName" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Revenue Name</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblDisRevCode" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Surname</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="Lblsurname" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Other Names</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblOtherName" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Country</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblCountry" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">State</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblState" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">City</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblCity" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Area</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblArea" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Address</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblDisAdd" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">L.G.A</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblLga" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Email Address</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblDisMail" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Telephone</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblDisPhone" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <asp:Panel ID="PanelPayAssDisplay" runat="server">
                        <div class="form-group">
                            <label class="col-md-3 control-label" style="padding-left: 1px">Total Assesed Amount (=N=)</label>
                            <div class="col-md-9 col-lg-9">
                                <p class="form-control-static text-left text-uppercase">
                                    <asp:Label ID="LblDisAssAmt" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="PanelpayamtDisPlay" runat="server">
                        <div class="form-group">
                            <label class="col-md-3 control-label" style="padding-left: 1px">Amount Entered (=N=)</label>
                            <div class="col-md-9 col-lg-9">
                                <p class="form-control-static text-left text-uppercase">
                                    <asp:Label ID="LblDisAmtPaid" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                                </p>
                            </div>
                        </div>
                    </asp:Panel>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="padding-left: 1px">Payment Period</label>
                        <div class="col-md-9 col-lg-9">
                            <p class="form-control-static text-left text-uppercase">
                                <asp:Label ID="LblPayPeriodOutPut" runat="server" Text="" CssClass="form-control" placeholder="" ForeColor="black"></asp:Label>
                            </p>
                        </div>
                    </div>
                    <div class="row">

                        <button id="btnSubmit" type="button" class="btn btn-primary animated lightSpeedIn pull-right">Confirm & Proceed</button>
                        <button id="btnCancel" type="button" class="btn btn-danger animated lightSpeedIn pull-left">Cancel</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHoldaFooter" runat="server">
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/jquery.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/JsModal/bootbox.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/bootstrap.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/metismenu/jquery.metisMenu.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/blockui-master/jquery-ui.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/blockui-master/jquery.blockUI.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/jquery.validate.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/wizard/jquery.bootstrap.wizard.min.js") %>"></script>
    <script src="<%: ResolveUrl("~/Assets/PayUtilityWizard/js/select2/select2.full.min.js") %>"></script>

    <script>
        $(document).ready(function () {
            $(".select2").select2();
            $(".select2-placeholer").select2({
                allowClear: true
            });

            // Colorpicker
            if ($.isFunction($.fn.colorpicker)) {
                $(".colorpicker").each(function (i, el) {
                    var $this = $(el);
                    var opts = {
                        //format: attrDefault($this, 'format', false)
                    };
                    var $nextEle = $this.next();
                    var $prevEle = $this.prev();
                    var $colorPreview = $this.siblings('.input-group-addon').find('.icon-color-preview');

                    $this.colorpicker(opts);

                    if ($nextEle.is('.input-group-addon') && $nextEle.has('span')) {
                        $nextEle.on('click', function (ev) {
                            ev.preventDefault();
                            $this.colorpicker('show');
                        });
                    }

                    if ($prevEle.is('.input-group-addon') && $prevEle.has('span')) {
                        $prevEle.on('click', function (ev) {
                            ev.preventDefault();
                            $this.colorpicker('show');
                        });
                    }

                    if ($colorPreview.length) {
                        $this.on('changeColor', function (ev) {

                            $colorPreview.css('background-color', ev.color.toHex());
                        });

                        if ($this.val()) {
                            $colorPreview.css('background-color', $this.val());
                        }
                    }
                });
            }
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            document.getElementById('<%=PanelHodaCityUnavailable.ClientID %>').hidden = true;
            document.getElementById('<%=PanelHodaStateUnavailable.ClientID %>').hidden = true;
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            //disableBtn();
            $('#BtnReviewInputs').click(function (e) {
                var surname = document.getElementById('<%=Lblpayersurname.ClientID %>').value;
                var countryvalue = document.getElementById('<%=ddlCountries.ClientID %>').value;
                console.log(countryvalue);
                var city = document.getElementById('<%=txtCityName.ClientID %>').value;
                var streetIdentity = document.getElementById('<%=txtStrtNo.ClientID %>').value;
                var telephone = document.getElementById('<%=Txbphone.ClientID %>').value;
                var email = document.getElementById('<%=txtEmail.ClientID %>').value;


                var amtpaid;
                if (amtpaid === "") {
                    bootbox.alert("Please enter valid amount!");
                    document.getElementById('<%=txtpayeamt.ClientID %>').focus();
                    return false;
                }

                if (surname === "") {
                    bootbox.alert("Please enter surname(or coy name)!");
                    document.getElementById('<%=Lblpayersurname.ClientID %>').focus();
                    return false;
                }

                var stateselectedvalue;
                var lgaselected;
                var stateentered;
                var lgaentered;
                if (countryvalue === "0") {
                    bootbox.alert("Please select a valid country name!");
                    document.getElementById('<%=ddlCountries.ClientID %>').focus();
                    return false;
                }

                else if (countryvalue === '161') {

                    stateselectedvalue = document.getElementById('<%=ddlStates.ClientID %>').value;
                    console.log(stateselectedvalue);

                    lgaselected = document.getElementById("<%=ddlCities.ClientID%>").options[document.getElementById("<%=ddlCities.ClientID%>").selectedIndex].text;
                    console.log(lgaselected);

                    lgaselected = document.getElementById('<%=ddlCities.ClientID %>').value;

                    if (stateselectedvalue === "0") {
                        bootbox.alert("Please select a valid state name!");
                        document.getElementById('<%=ddlStates.ClientID %>').focus();
                        return false;
                    }
                    if (lgaselected === "0") {
                        bootbox.alert("Please select valid L.G.A!");
                        document.getElementById('<%=ddlCities.ClientID %>').focus();
                        return false;
                    }
                }
                else {
                    stateentered = document.getElementById('<%=txtOtherState.ClientID %>').value;
                    lgaentered = document.getElementById('<%=txtlga.ClientID %>').value;

                    if (stateentered === "") {
                        bootbox.alert("Please enter valid state name!");
                        document.getElementById('<%=txtOtherState.ClientID %>').focus();
                        return false;
                    }
                    if (lgaentered === "") {
                        bootbox.alert("Please enter valid L.G.A!");
                        document.getElementById('<%=txtlga.ClientID %>').focus();
                        return false;
                    }

                }

                if (city === "") {
                    bootbox.alert("Please enter valid city name!");
                    document.getElementById('<%=txtCityName.ClientID %>').focus();
                    return false;
                }

                if (streetIdentity === "") {
                    bootbox.alert("Please enter valid street name!");
                    document.getElementById('<%=txtStrtNo.ClientID %>').focus();
                    return false;
                }

                if (telephone === "") {
                    bootbox.alert("Please enter valid telephone number!");
                    document.getElementById('<%=Txbphone.ClientID %>').focus();
                    return false;
                }
                if (email === "") {
                    bootbox.alert("Please enter valid email address!");
                    document.getElementById('<%=txtEmail.ClientID %>').focus();
                    return false;
                }

                console.log('start clicked');
                var $form = $('#<%= form1.ClientID %>');
                var agencyname = $form.find('#<%=HiddenFieldAgencyName.ClientID%>').val();
                var revenuename = $form.find('#<%=HiddenFieldRevenueName.ClientID%>').val();

                amtpaid = $form.find('#<%=txtpayeamt.ClientID%>').val();
                var amtpaid1 = $form.find('#<%=Hfamtpaid.ClientID%>').val();
                surname = $form.find('#<%=Lblpayersurname.ClientID%>').val();
                var othername = $form.find('#<%=LblpayerOtherNames.ClientID%>').val();
                countryvalue = $form.find('#<%=ddlCountries.ClientID%>').val();
                var countrytext = document.getElementById("<%=ddlCountries.ClientID%>").options[document.getElementById("<%=ddlCountries.ClientID%>").selectedIndex].text;
                console.log(countryvalue);

                city = $form.find('#<%=txtCityName.ClientID%>').val();
                var area = $form.find('#<%=LblpayerArea.ClientID%>').val();
                var streetname = $form.find('#<%=txtStrtNo.ClientID%>').val();
                telephone = $form.find('#<%=Txbphone.ClientID%>').val();
                email = $form.find('#<%=txtEmail.ClientID%>').val();
                var payertype = $form.find('[id="<% = HiddenFieldPayer.ClientID %>"]').val();
                var transrefno = $form.find('[id="<% = HftransRefNo.ClientID %>"]').val();
                var paymentPeriod = $form.find('#<%=lblpayperiod.ClientID%>').val();
                var revenuewithsessionname = $form.find('[id="<% = LblRevenueName.ClientID %>"]').html();
                console.log(revenuewithsessionname);
                console.log(countrytext);
                var stateselected;
                var formObj = {
                    revenuename: revenuename,
                    agencyname: agencyname,
                    surname: surname,
                    othername: othername,
                    countrytext: countrytext,
                    countryvalue: countryvalue,
                    stateselected: stateselected,
                    stateentered: stateentered,
                    lgaselected: lgaselected,
                    lgaentered: lgaentered,
                    city: city,
                    area: area,
                    streetname: streetname,
                    telephone: telephone,
                    email: email,
                    revenuewithsessionname: revenuewithsessionname,
                    amtpaid: amtpaid,
                    payertype: payertype,
                    transrefno: transrefno,
                    paymentPeriod: paymentPeriod
                };
                var payernamesession = '<%= Session["Payer"] %>';
                console.log(amtpaid);
                console.log(payertype);
                console.log(payernamesession);

                // Populate the form fields with the data returned from server
                $('#userForm');

                $('#<%=LblDisRevName.ClientID%>').html(formObj.agencyname);
                $('#<%=LblDisRevCode.ClientID%>').html(formObj.revenuename);
                $('#<%=Lblsurname.ClientID%>').html(formObj.surname);
                $('#<%=LblOtherName.ClientID%>').html(formObj.othername);
                $('#<%=LblCountry.ClientID%>').html(formObj.countrytext);
                $('#<%=LblCity.ClientID%>').html(formObj.city);
                $('#<%=LblArea.ClientID%>').html(formObj.area);
                $('#<%=LblDisAdd.ClientID%>').html(formObj.streetname);
                $('#<%=LblDisPhone.ClientID%>').html(formObj.telephone);
                $('#<%=LblDisMail.ClientID%>').html(formObj.email);
                $('#<%=LblTransRefNo.ClientID%>').html(formObj.transrefno);
                $('#<%=LblPayPeriodOutPut.ClientID%>').html(formObj.paymentPeriod);

                //do a check
                if (formObj.payertype === 'Payer') {
                    $('#<%=LblDisAssAmt.ClientID%>').html(formObj.assesamt).hide();
                    $('#PanelPayAssDisplay').hide();
                    $form.find('#<%= PanelPayAssDisplay.ClientID%>').hide();
                    document.getElementById('<%=PanelPayAssDisplay.ClientID %>').hidden = true;
                    $('#<%=LblDisAmtPaid.ClientID%>').html(formObj.amtpaid);
                    console.log('we r here');
                }
                else if (formObj.revenuename !== "") {
                    //{
                    $('#PanelpayamtDisPlay').hide();
                    amtpaid1 = $form.find('#<%=txtpayeamt.ClientID%>').val();
                    amtpaid = $form.find('#<%=Hfamtpaid.ClientID%>').val();
                    console.log(amtpaid);
                    $('#<%=LblDisAssAmt.ClientID%>').html(formObj.assesamt).show();
                    $('#<%=LblDisAmtPaid.ClientID%>').html(amtpaid).show();
                    $('#<%=LblDisAmtPaid.ClientID%>').html(amtpaid1).show();
                    console.log('we got to dubai');
                }
                else {
                    $('#<%=LblDisAssAmt.ClientID%>').html(formObj.assesamt);
                    $('#<%=LblDisAmtPaid.ClientID%>').html(formObj.amtpaid);
                    $('#<%=PanelpayamtDisPlay.ClientID%>').show();
                    $('#<%=PanelPayAssDisplay.ClientID%>').show();
                }

                if (formObj.countryvalue === '161') {
                    stateselected = document.getElementById("<%=ddlStates.ClientID%>").options[document.getElementById("<%=ddlStates.ClientID%>").selectedIndex].text;
                    console.log(countrytext);
                    window.HfSelectedStateItem.value = stateselected;

                    stateselectedvalue = $form.find('#<%=ddlStates.ClientID%>').val();
                    $('#<%=LblState.ClientID%>').html(stateselected);
                    console.log('Selected Country: Nigeria');

                    lgaselected = document.getElementById("<%=ddlCities.ClientID%>").options[document.getElementById("<%=ddlCities.ClientID%>").selectedIndex].text;
                    console.log(lgaselected);
                    window.HfSelectedLgaItem.value = lgaselected;

                    $('#<%=LblLga.ClientID%>').html(lgaselected);
                    lgaselected = $form.find('#<%=ddlCities.ClientID%>').val();

                }
                else {
                    stateentered = $form.find('#<%=txtOtherState.ClientID%>').val();
                    $('#<%=LblState.ClientID%>').html(stateentered);
                    lgaentered = $form.find('#<%=txtlga.ClientID%>').val();
                    $('#<%=LblLga.ClientID%>').html(lgaentered);
                }

                // Show the dialog
                bootbox
                    .dialog({
                        title:
                            'Please ensure you verify all information correctly before pressing the "Proceed to Payment Button"',
                        message: $('#userForm'),
                        show: false // We will show it manually later  
                    })
                    .on('shown.bs.modal',
                        function () {
                            $('#userForm')
                                .show(); // Show the login form
                        })
                    .on('hide.bs.modal',
                        function (e) {
                            // Bootbox will remove the modal (including the body which contains the login form)
                            // after hiding the modal
                            // Therefor, we need to backup the form
                            $('#userForm').hide().appendTo('body');
                        })
                    .modal('show');

            });

            $('#btnSubmit').click(function (e) {
                $('#<%= form1.ClientID%>').validate().cancelSubmit = true;
                console.log('posting back');
                $('#<%= BtnSubPayment.ClientID%>').click();
            });

            $('#btnCancel').on('click',
                function () {
                    // Save the form data via an Ajax request
                    //e.preventDefault();

                    var $form = $('#userForm');

                    // Hide the dialog
                    $form.parents('.bootbox').modal('hide');
                });
        });
    </script>

    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("~/Tiers/PaymentDetails.aspx")%>';
        console.log(pageUrl);
        function PopulateStateName() {
            $("#<%=ddlStates.ClientID%>").attr("disabled", "disabled");
            $("#<%=ddlCities.ClientID%>").attr("disabled", "disabled");
            if ($('#<%=ddlCountries.ClientID%>').val() === "0") {
                $('#<%=ddlStates.ClientID %>').empty().append('<option selected="selected" value="0">Please select</option>');
                $('#<%=ddlCities.ClientID %>').empty().append('<option selected="selected" value="0">Please select</option>');
            }
            else {
                $(
            '#<%=ddlStates.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/PopulateState',
                    data: '{countryId: ' + $('#<%=ddlCountries.ClientID%>').val() + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnStatePopulated,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }

        function OnStatePopulated(response) {
            PopulateControl(response.d, $("#<%=ddlStates.ClientID %>"));
        }
    </script>

    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("~/Tiers/PaymentDetails.aspx")%>';
        console.log(pageUrl);
        function PopulateLgaName() {
            $("#<%=ddlCities.ClientID%>").attr("disabled", "disabled");
            if ($('#<%=ddlStates.ClientID%>').val() === "0") {
                $('#<%=ddlCities.ClientID %>').empty().append('<option selected="selected" value="0">Please select</option>');
            }
            else {
                $('#<%=ddlCities.ClientID %>').empty().append('<option selected="selected" value="0">Loading...</option>');
                $.ajax({
                    type: "POST",
                    url: pageUrl + '/PopulateLga',
                    data: '{stateId: ' + $('#<%=ddlStates.ClientID%>').val() + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: OnLgaPopulated,
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }

        function OnLgaPopulated(response) {
            PopulateControl(response.d, $("#<%=ddlCities.ClientID %>"));
        }
    </script>

    <script type="text/javascript">
        function PopulateControl(list, control) {
            if (list.length > 0) {
                control.removeAttr("disabled");
                control.empty().append('<option selected="selected" value="0">Please select</option>');
                $.each(list, function () {
                    control.append($("<option></option>").val(this['Value']).html(this['Text']));
                });

                document.getElementById('<%=PanelHodaStateUnavailable.ClientID %>').hidden = true;
                document.getElementById('<%=PanelHodaStateAvailable.ClientID %>').hidden = false;

                document.getElementById('<%=PanelHodaCityUnavailable.ClientID %>').hidden = true;
                document.getElementById('<%=PanelHodaCityAvailable.ClientID %>').hidden = false;
            }
            else {
                control.empty().append('<option selected="selected" value="0">Not available<option>');
                document.getElementById('<%=PanelHodaStateUnavailable.ClientID %>').hidden = false;
                document.getElementById('<%=PanelHodaStateAvailable.ClientID %>').hidden = true;

                document.getElementById('<%=PanelHodaCityUnavailable.ClientID %>').hidden = false;
                document.getElementById('<%=PanelHodaCityAvailable.ClientID %>').hidden = true;
            }
        }
    </script>

    <script type="text/javascript">
        $(function () {
            initdropdown();
        });

        function initdropdown() {
            $('.BarshefPostbackSelect2').select2();
        }

        //On UpdatePanel Refresh
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    initdropdown();
                }
            });
        };
        //Sys.Application.add_load(initdropdown);
    </script>

    <script type="text/javascript">
        //this is used to compare two values using Jquerry, note Jquerry must be placed up for it to work
        $(function () {
            $("#ConfirmEntriesJq").click(function () {
                var password = $("#txtPassword").val();
                var confirmPassword = $("#txtConfirmPassword").val();
                if (password !== confirmPassword) {
                    alert("Passwords do not match.");
                    return false;
                }
                return true;
            });
        });
    </script>

    <script language="javascript">
        function checkEmail() {
            if (Email === "") {
                alert("Please enter valid email address");
                document.getElementById('<%=txtEmail.ClientID %>').focus();
                return false;
            }
            else {
                var $form = $('#<%= form1.ClientID %>');
                var email = $form.find('#<%=txtEmail.ClientID%>').val();
                console.log(email);
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

                if (!filter.test(email.value)) {
                    alert("Your email address seems incorrect. Please try again.");
                    email.focus;
                    return false;
                }
            }

        }
    </script>

    <script language="javascript">
        function checkPhone() {
            var exitval = false;
            var rsltcount = 0;
            var msgtext = "";
            //Mobile Validation  
            var $form = $('#<%= form1.ClientID %>');
            var mobileval = $form.find('#<%=Txbphone.ClientID%>').val();

            var mobilerslt = false;
            if (mobileval.length !== 10) {
                msgtext = msgtext + "\n Invalid mobile number or mobile number required";
                rsltcount += 1;
            }
            else {
                mobilerslt = OnlyNumbers(document.getElementById("<%= Txbphone.ClientID %>"));
                if (mobilerslt === false) {
                    msgtext = msgtext + "\n Invalid mobile number or mobile number required.";
                    rsltcount += 1;
                }
            }
        }
    </script>

    <%--For Checking email validation and numbers contant the below url.
    https://www.c-sharpcorner.com/article/textbox-validation-client-side-and-server-side-in-asp-net-webform/--%>

    <script language="javascript">
        function checkEmail(event) {
            var $form = $('#<%= form1.ClientID %>');
            var email = $form.find('#<%=txtEmail.ClientID%>').val();

            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(event.value)) {
                alert("Please enter a valid email address");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
