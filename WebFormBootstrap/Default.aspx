    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebFormBootstrap.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Home Page</title>

    <!-- Bootstrap -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet">-->
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="icon" href="data:;base64,iVBORw0KGgo="/>
    <link href="Content/Custom-cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/Cart.aspx";
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><span>
                <img alt="Logo" src="images/logo.png" height="30" /></span>24H Clothes</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="Default.aspx">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contact</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Products
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="Products.aspx">All Products</a>
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header">Men</h6>
                            <a class="dropdown-item" href="#">shirt</a>
                            <a class="dropdown-item" href="#">pants</a>
                            <div class="dropdown-divider"></div>
                            <h6 class="dropdown-header">Women</h6>
                            <a class="dropdown-item" href="#">top</a>
                            <a class="dropdown-item" href="#">legins</a>
                        </div>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right" >
                    <li class="nav-item ">
                        <button id="btnCart" type="button" class="btn btn-outline-success">
                            Cart <span class="badge badge-light" id="pCount" runat="server"></span>
                            <span class="sr-only">unread messages</span>
                        </button>
                    </li>
                    <li class="nav-item">
                        <asp:Button ID="btnSignIn" runat="server" CssClass="btn btn-default nav-btn" Text="Sign in" OnClick="btnSignOut_Click1" />
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-default nav-btn" Text="Sign Out" OnClick="btnSignOut_Click" />
                    </li>
                </ul>

            </div>
        </nav>
    </div>
    <!--   Carousel -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" src="images/Carousel 01.jpg" alt="First slide" />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Iphone 6 plus</h5>
                    <p>The New phone from Apple</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy</a></p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/Carousel 02.jpg" alt="Second slide" />
                <div class="carousel-caption d-none d-md-block">
                    <h5>Samgung S5</h5>
                    <p>The New phone from Samsung</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy</a></p>
                </div>
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" src="images/Carousel 03.jpg" alt="Third slide" />
                <div class="carousel-caption d-none d-md-block">
                    <h5>17'' screen from LG</h5>
                    <p>Buy it now!</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Buy</a></p>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <!-- Carousel -->
    <br />
    <br />
    <!-- Middle Contents -->
    <div class="container center">
        <div class="row">
            <div class="col-lg-4 center">
                <img class="rounded-circle" src="images/Thumb01.jpeg" alt="thumb01" width="140" height="140" />
                <h2>Mobiles</h2>
                <p>Um smartphone (palavra inglesa que significa "telefone inteligente", ainda sem correspondente em português) é um telemóvel (celular, no Brasil) que combina recursos de computadores pessoais, com funcionalidades avançadas que podem ser estendidas por meio de programas aplicativos executados pelo seu sistema operacional (SO - sistema operativo, ou OS – operating system), chamados simplesmente aplicações. Os sistemas operacionais dos smartphones permitem que desenvolvedores criem milhares de programas adicionais, com diversas utilidades, agregados em lojas online como o Google Play para Android, MS Windows Store para Windows Phone e a Apple App Store para iOS.</p>
                <p><a class="btn btn-primary" href="#" role="button">View &raquo</a></p>
            </div>
            <div class="col-lg-4">
                <img class="rounded-circle" src="images/Thumb02.jpg" alt="thumb02" width="140" height="140" />
                <h2>Clothing</h2>
                <p>Um smartphone (palavra inglesa que significa "telefone inteligente", ainda sem correspondente em português) é um telemóvel (celular, no Brasil) que combina recursos de computadores pessoais, com funcionalidades avançadas que podem ser estendidas por meio de programas aplicativos executados pelo seu sistema operacional (SO - sistema operativo, ou OS – operating system), chamados simplesmente aplicações. Os sistemas operacionais dos smartphones permitem que desenvolvedores criem milhares de programas adicionais, com diversas utilidades, agregados em lojas online como o Google Play para Android, MS Windows Store para Windows Phone e a Apple App Store para iOS.</p>
                <p><a class="btn btn-primary" href="#" role="button">View &raquo</a></p>
            </div>
            <div class="col-lg-4">
                <img class="rounded-circle" src="images/Thumb03.jpg" alt="thumb03" width="140" height="140" />
                <h2>Footwear</h2>
                <p>Um smartphone (palavra inglesa que significa "telefone inteligente", ainda sem correspondente em português) é um telemóvel (celular, no Brasil) que combina recursos de computadores pessoais, com funcionalidades avançadas que podem ser estendidas por meio de programas aplicativos executados pelo seu sistema operacional (SO - sistema operativo, ou OS – operating system), chamados simplesmente aplicações. Os sistemas operacionais dos smartphones permitem que desenvolvedores criem milhares de programas adicionais, com diversas utilidades, agregados em lojas online como o Google Play para Android, MS Windows Store para Windows Phone e a Apple App Store para iOS.</p>
                <p><a class="btn btn-primary" href="#" role="button">View &raquo</a></p>
            </div>
        </div>
    </div>

    <!-- Middle Contents -->

    <!--Footer-->
    <hr />
        <footer>
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; 2015 TechCybo.com &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
            </div>
        </footer>
    <!--Footer-->

    </form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!--<script src="js/bootstrap.min.js"></script>-->
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>
