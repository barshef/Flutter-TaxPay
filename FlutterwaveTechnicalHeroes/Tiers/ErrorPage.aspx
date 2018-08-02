<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>:: Payment Route System ::</title>
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel="stylesheet" type='text/css'/>
    <!-- Bootstrap Core CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/bootstrap.min.css") %>" rel="stylesheet"/>
    <!-- Flaticon CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/fonts/flaticon/flaticon.css") %>" rel="stylesheet"/>
    <!-- font-awesome CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/font-awesome.min.cs") %>" rel="stylesheet"/>
    <!-- Offcanvas CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/hippo-off-canvas.css") %>" rel="stylesheet"/>
    <!-- animate CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/animate.css") %>" rel="stylesheet"/>
    <!-- language CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/language-select.css") %>" rel="stylesheet"/>
    <!-- owl.carousel CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/owl.carousel/assets/owl.carousel.css") %>" rel="stylesheet"/>
    <!-- magnific-popup -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/magnific-popup.css") %>" rel="stylesheet"/>
    <!-- Main menu -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/menu.css") %>" rel="stylesheet"/>
    <!-- Template Common Styles -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/template.css") %>" rel="stylesheet"/>
    <!-- Custom CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/style.css") %>" rel="stylesheet"/>
    <!-- Responsive CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/responsive.css") %>" rel="stylesheet"/>
    
    <script src="<%: ResolveUrl("~/Assets/Engine/js/vendor/modernizr-2.8.1.min.js") %>"></script>

    <!-- HTML5 Shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/vendor/html5shim.js"></script>
        <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
        <%--Anoda method to disable back--%>
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
        <%--Anoda method to disable back--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- career -->
            <section class="career">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 text-center">
                            <asp:Label ID="LbluseUrl" runat="server" Text="" Visible="False"></asp:Label>
                            <h1 class="section-title" style="color: red">Network Error - 500</h1>
                            <span class="section-sub">Oops! We are sorry something went wrong there!<br/>Development team alerted ; issues will be resolve shortly, <br/>please click the button below to continue</span><br/><br/>
                            <span style="margin-top: 100px"><a class="btn btn-warning animated lightSpeedIn"  href='<%=ResolveUrl("~/Home") %>'>Back to Home</a></span>
                        </div>
                    </div><!--/.row -->
							
                </div><!--/.container -->
            </section>
            <!-- copyright-section start -->
            <footer class="">
                <div class="container text-center">
                    <div class="copyright-info">
                        <span><script language="javascript">
                                  today = new Date();
                                  y0 = today.getFullYear();
                              </script>
                            Copyright &copy; 2017-<script language="javascript">

                                                      document.write(y0);
                                                  </script>. All rights Reserved &reg; <br/>| A Product of <strong style="color: lightseagreen">REEMS</strong>
                            powered by <u><a style="color: orangered" href="https://icmaservices.com" target="_blank">ICMA PROFESSIONAL SERVICES. |</a></u></span>
                    </div>
                </div>
                <!-- /.container -->
            </footer>
            <!-- copyright-section end -->
            <!--/.career -->
        </div>
    </form>
</body>
<!-- jQuery -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/jquery.js") %>"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/bootstrap.min.js") %>"></script>
<!-- owl.carousel -->
<script src="<%: ResolveUrl("~/Assets/Engine/owl.carousel/owl.carousel.min.js") %>"></script>
<!-- Magnific-popup -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/jquery.magnific-popup.min.js") %>"></script>
<!-- Offcanvas Menu -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/hippo-offcanvas.js") %>"></script>
<!-- inview -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/jquery.inview.min.js") %>"></script>
<!-- stellar -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/jquery.stellar.js") %>"></script>
<!-- countTo -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/jquery.countTo.js") %>"></script>
<!-- classie -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/classie.js") %>"></script>
<!-- selectFx -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/selectFx.js") %>"></script>
<!-- sticky kit -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/jquery.sticky-kit.min.js") %>"></script>
<!-- GOGLE MAP -->
<script src="https://maps.googleapis.com/maps/api/js"></script>
<!--TWITTER FETCHER-->
<script src="<%: ResolveUrl("~/Assets/Engine/js/twitterFetcher_min.js") %>"></script>
<!-- Custom Script -->
<script src="<%: ResolveUrl("~/Assets/Engine/js/scripts.js") %>"></script>
</html>
