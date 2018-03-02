<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="WebFormBootstrap.ProductView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="col-md-4 ">
        <div class="img-thumbnail">
            <!-- carousel images -->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                </ol>
                <div class="carousel-inner">
                    <asp:Repeater ID="rptrImages" runat="server">
                        <ItemTemplate>
                            <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>">
                                <img class="d-block w-100" src="Images/ProductImages/15/blue shirt03.jpg" alt="<%#("PID") %>" onerror="this.src='Images/noimage.jpg'" >
                                <!--<img class="d-block w-100" src="Images/ProductImages/<%#("PID") %>/<%#("Name") %><%#("Extention") %>" alt="<%#("Name") %>" onerror="this.src='Images/noimage.jpg'"> -->
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
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
        </div>
        <!-- carousel images -->
    </div>
    <div class="col-md-4">
        <div class="divDet1">
            <h1 class="proNameView">wrogn men blue slim fit printed casual shirt</h1>
            <span class="proOgPriceView">Rs. 1899</span><span class="proPriceDiscountView">210 off</span>
            <p class="proPriceView"> Rs.1228</p>
        </div>
        <div>
            <h5 class="h5Size">SIZE</h5>
            <div>
                <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="M" Text="M"></asp:ListItem>
                    <asp:ListItem Value="L" Text="L"></asp:ListItem>
                    <asp:ListItem Value="XL" Text="XL"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="divDet1">
            <asp:Button ID="btnAddToCart" CssClass="mainButton" runat="server" Text="ADD TO CART" onClick="btnAddToCart_Click"/>
        </div>
        <div>
            <h5 class="h5Size">Description</h5>
            <p>100%Cotton</p>
        </div>
        <div>
            <h5 class="h5Size">Product Details</h5>
            <p>100%Cotton</p>
        </div>
        <div class="divDet1">
            <h5 class="h5Size">Material & Care</h5>
            <p>100%Cotton</p>
        </div>
        <div>
            <p>Free Delivery</p>
            <p>30 days</p>
            <p>cash on del</p>
        </div>

        </div>
    </div>
</asp:Content>
