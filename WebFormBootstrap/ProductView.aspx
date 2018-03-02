<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="WebFormBootstrap.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-5">
        <div class="img-thumbnail">
            <img src="Images/Flying%20Machine%20Men%20White%20Printed%20Casual%20Shirt01.jpg" class="img-thumbnail" />
        </div>
    </div>
    <div class="col-md-7">
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
            <asp:Button ID="btnAddToCart" CssClass="mainButton" runat="server" Text="ADD TO CART" />
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
</asp:Content>
