<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="FlutterwaveTechnicalHeroes.Tiers.HomePage" %>

<!DOCTYPE html>
<html lang="en">

<%--<html xmlns="http://www.w3.org/1999/xhtml">--%>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>:: TaxOnline Payment System ::</title>
    <!-- Web Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>

    <!-- Bootstrap Core CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/bootstrap.min.css") %>" rel="stylesheet" />
    <!-- Flaticon CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/fonts/flaticon/flaticon.css") %>" rel="stylesheet" />
    <!-- font-awesome CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/font-awesome.min.css") %>" rel="stylesheet" />
    <!-- Offcanvas CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/hippo-off-canvas.css") %>" rel="stylesheet" />
    <!-- animate CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/animate.css") %>" rel="stylesheet" />
    <!-- language CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/language-select.css") %>" rel="stylesheet" />
    <!-- owl.carousel CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/owl.carousel/assets/owl.carousel.css") %>" rel="stylesheet" />
    <!-- magnific-popup -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/magnific-popup.css") %>" rel="stylesheet" />
    <!-- Main menu -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/menu.css") %>" rel="stylesheet" />
    <!-- Template Common Styles -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/template.css") %>" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/style.css") %>" rel="stylesheet" />
    <!-- Responsive CSS -->
    <link href="<%: ResolveUrl("~/Assets/Engine/css/responsive.css") %>" rel="stylesheet" />

    <script src="<%: ResolveUrl("~/Assets/Engine/js/vendor/modernizr-2.8.1.min.js") %>"></script>

    <!-- HTML5 Shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/vendor/html5shim.js"></script>
        <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
   
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
    <%--Method to disable backspace end--%>
</head>

<body id="page-top">
    <form id="form1" runat="server">
        <div id="st-container" class="st-container">
            <div class="st-pusher">
                <div class="st-content">
                    <header class="header">
                        <nav class="top-bar">
                            <div class="overlay-bg">
                                <div class="container">
                                    <div class="row">

                                        <div class="col-sm-6 col-xs-12">
                                            <div class="call-to-action">
                                                <ul class="list-inline">
                                                    <asp:Panel ID="PanelDeltareturnurl" runat="server">
                                                        <asp:Label ID="LblgeturlInstcode" runat="server" Text="" Visible="False"></asp:Label>
                                                        <li id="homeurl"><a href='<%=ResolveUrl("~/Home") %>'><i class="fa fa-home"></i>Home</a></li>
                                                    </asp:Panel>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /.col-sm-6 -->

                                        <div class="col-sm-6 hidden-xs">
                                            <div class="topbar-right">
                                                <ul class="social-links list-inline pull-right">
                                                    <li style="color: white"><i class="fa fa-phone"></i>
                                                        <asp:Label ID="Llbstatephon" runat="server" Text="" Visible="True"></asp:Label></li>
                                                    <li style="color: white"><i class="fa fa-envelope"></i>
                                                        <asp:Label ID="Lblstateconemail" runat="server" Text="" Visible="True"></asp:Label></li>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.container -->
                            </div>
                            <!-- /.overlay-bg -->
                        </nav>
                        <!-- /.top-bar -->

                        <div id="search">
                            <button type="button" class="close">×</button>
                            <div>
                                <input type="search" value="" placeholder="type keyword(s) here" />
                                <button type="submit" class="btn btn-primary">Search</button>
                            </div>
                        </div>

                        <nav class="navbar navbar-default" role="navigation">
                            <div class="container mainnav">
                                <div class="navbar-header">
                                    <h1 class="logo"><a class="navbar-brand" href='<%=ResolveUrl("~/Home") %>'>

                                        <img src="<%: ResolveUrl(InslogintImg) %>" alt="" style="height: 42px"></a></h1>
                                    <!-- offcanvas-trigger -->
                                    <button type="button" class="navbar-toggle collapsed pull-right">
                                        <span class="sr-only">Toggle navigation</span>
                                        <i class="fa fa-bars"></i>
                                    </button>

                                </div>

                                <div class="collapse navbar-collapse navbar-collapse">
                                    <span class="search-button pull-right"><a href="#search"><i class="fa fa-search"></i></a></span>

                                    <ul class="nav navbar-nav navbar-right">
                                        <!-- Home -->
                                        <li class="dropdown active">
                                        <li class="dropdown active"><a href='<%=ResolveUrl("~/Home") %>'>Home <span></span></a>
                                        </li>
                                        <li class="dropdown"><a href='<%=ResolveUrl("~/FailTransaction") %>'>Transaction Status <span></span></a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- /.navbar-collapse -->
                            </div>
                            <!-- /.container -->


                        </nav>
                    </header>

                    <div id="main-carousel" class="carousel slide hero-slide" data-ride="carousel" style="">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#main-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#main-carousel" data-slide-to="1"></li>
                            <%--<li data-target="#main-carousel" data-slide-to="2"></li>--%>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <%--<div class="item active">
                                <img src="<%: ResolveUrl("~/Assets/Engine/img/payimg/Slider/paymenteasyedited.jpg") %>" alt="Hero Slide" style="width: 900px; height: 400px">
                            </div>--%>
                            <div class="item active">
                                <img src="<%: ResolveUrl("~/Assets/Engine/img/payimg/Slider/payments.png") %>" alt="Hero Slide" style="width: 1200px; height: 400px">
                            </div>
                           
                            <div class="item">
                                <img src="<%: ResolveUrl("~/Assets/Engine/img/payimg/Others/tranimg.jpg") %>" alt="Hero Slide" style="width: 1200px; height: 400px">
                                
                            </div>
                            <!--.item-->
                        </div>
                        <!--.carousel-inner-->
                        <!-- Controls -->
                        <a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="left carousel-control" href="#main-carousel" role="button" data-slide="prev">
                            <i class="fa fa-angle-left" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#main-carousel" role="button" data-slide="next">
                            <i class="fa fa-angle-right" aria-hidden="true"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                   
                    <!-- testimonial-section start -->
                    <section class="partner-section" style="margin-top: 2px">
                        <div class="container text-center">
                            <p></p>
                            <a class="btn btn-success animated lightSpeedIn" href='<%=ResolveUrl("~/Agency") %>'><< Click here to make payment >> </a>
                        </div>
                        <!-- /.container -->
                    </section>
                <hr/>
                <section class="counter-section" >
                    <div class="container text-center" >
                        <div class="row">
                            <div class="col-sm-4 col-xs-12">
                                <div class="counter-block">
                                </div>
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                <div class="counter-block">
                                    <img src='<%=ResolveUrl("~/Assets/Engine/img/payimg/Others/iswlogonewcombined.png") %>' />
                                </div>
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                <div class="counter-block">
                                    
                                </div>
                            </div>
                        </div> <!-- /.row -->
                    </div><!-- /.container -->
                </section><!-- /.counter-section -->

                    <!-- counter end -->
                    <!-- copyright-section start -->
                    <footer class="copyright-section">
                        <div class="container text-center">
                            <div class="footer-menu">
                                <asp:Label ID="LblAddress" runat="server" Text=""></asp:Label><br/>
                                <asp:Label ID="LblAnodaTeleNo" runat="server" Text=""></asp:Label>
                                <%--<ul>
                                <li><a href="#">Privacy &amp; Cookies</a></li>
                                <li><a href="#">Terms &amp; Conditions</a></li>
                                <li><a href="#">Accessibility</a></li>
                            </ul>--%>
                            </div>

                            <div class="copyright-info">
                                <span>
                                    <script language="javascript">
                                        today = new Date();
                                        y0 = today.getFullYear();
                                    </script>
                                    Copyright &copy; 2017-<script language="javascript">
                                                              document.write(y0);
                                    </script>. All rights Reserved &reg;
                                    <br />
                                    | A Product of <strong style="color: green">REEMS</strong> Powered by <u><a style="color: green" href="http://icmaservices.com" target="_blank">ICMA PROFESSIONAL SERVICES.</a></u> |</span>
                            </div>
                        </div>
                        <!-- /.container -->
                    </footer>
                    <!-- copyright-section end -->
                </div>
                <!-- .st-content -->
            </div>
            <!-- .st-pusher -->

            <section class="cta-section">
                <div class="container text-center">
                    <a href='<%=ResolveUrl("~/PayerDetails") %>' class="btn btn-primary quote-btn">Staff Login</a>
                </div>
                <asp:Label ID="LblUrlInstcode" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblStateCode" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="Lblurl" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblDbGatewayName" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LbluseUrl" runat="server" Text="" Visible="False"></asp:Label>
                <asp:Label ID="LblStateName" runat="server" Text="" Visible="False"></asp:Label>
            </section>

            <!-- OFF CANVAS MENU -->
           
            <!-- .offcanvas-menu -->
        </div>
        <!-- /st-container -->
        <!-- Preloader -->
        <div id="preloader">
            <div id="status">
                <div class="status-mes"></div>
            </div>
        </div>
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
        <script src="<%: ResolveUrl("~/Assets/Engine/js/scripts.js") %>"></script>
    </form>
</body>
</html>
