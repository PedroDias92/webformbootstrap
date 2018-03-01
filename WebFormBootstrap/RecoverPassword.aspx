<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="WebFormBootstrap.RecoverPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Reset your Password !</title>

    <!-- Bootstrap -->
    <!--<link href="css/bootstrap.min.css" rel="stylesheet">-->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="icon" href="data:;base64,iVBORw0KGgo="/>
    <link href="Content/Custom-cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!--navbar-->
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
                                <h6 class="dropdown-header">Men</h6>
                                <a class="dropdown-item" href="#">shirt</a>
                                <a class="dropdown-item" href="#">pants</a>
                                <div class="dropdown-divider"></div>
                                <h6 class="dropdown-header">Women</h6>
                                <a class="dropdown-item" href="#">top</a>
                                <a class="dropdown-item" href="#">legins</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="SignIn.aspx">Sign In</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="SignUp.aspx">Sign Up</a>
                        </li>
                    </ul>
                </div>
            </nav>
            </div>
            <!--navbar-->

            <!-- New Password -->
            <div class="container">
            <div class="form-horizontal">
                <h2>Reset Password</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="lblMsg" runat="server" CssClass="col-md-2 control-label" Font-Size="XX-Large" Font-Bold="True"></asp:Label>
                    </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" runat="server" CssClass="col-md-2 control-label" Text="New Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbNewPass" CssClass="form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="Please enter your new Password !" ControlToValidate="tbNewPass"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblRetypePass" runat="server" CssClass="col-md-2 control-label" Text="Confirm Password" Visible="False"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbConfirmPass" CssClass="form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Both Password must be same !" ControlToCompare="tbConfirmPass" ControlToValidate="tbNewPass"></asp:CompareValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btRecPass" runat="server" CssClass="btn btn-default" Text="Reset" Visible="False" OnClick="btRecPass_Click"/>
                    </div>
                </div>
            </div>
        </div>

    
    <!-- New Password -->
    </form>
    


    <!--Footer-->
    <hr />
    <footer class="footer-pos">
        <div class="container">

            <p>&copy; Pedro Dias 2018 &middot; <a href="Default.aspx">Home</a> &middot; <a href="#">About</a> &middot; <a href="#">Contact</a> &middot; <a href="#">Products</a></p>
        </div>
    </footer>
    <!--Footer-->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!--<script src="js/bootstrap.min.js"></script>-->
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>