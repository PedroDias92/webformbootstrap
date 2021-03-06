﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="WebFormBootstrap.UserHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>User Home</title>

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
                    <li class="nav-item">
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
                <ul class="nav navbar-nav navbar-right">
                    <li class="nav-item ">
                        <button id="btnCart" type="button" class="btn btn-outline-success">
                            Cart <span class="badge badge-light" id="pCount" runat="server"></span>
                            <span class="sr-only">unread messages</span>
                        </button>
                    </li>
                    <li class="nav-item">
                        <asp:Button ID="btnSignOut" runat="server" CssClass="btn btn-default nav-btn" Text="Sign in" OnClick="btnSignOut_Click1" />
                        <asp:Button ID="btnSignIn" runat="server" CssClass="btn btn-default nav-btn" Text="Sign Out" OnClick="btnSignOut_Click" />

                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <asp:Label ID="lblSuccess" runat="server" CssClass="text-success"></asp:Label>
    
    </form>



    <!--Footer-->
    <hr />
    <footer class="footer-pos">
        <div class="container">

            <p>&copy; Pedro Dias 2018 &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
        </div>
    </footer>
    <!--Footer-->
</body>
</html>
