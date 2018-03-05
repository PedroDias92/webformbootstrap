<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebFormBootstrap.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="padding-top: 50px;">
        <div class="col-md-9">
            <h5>MY CART (2 Items) </h5>
            <div class="media" style="border: 1px solid #eaeaec" >
                <div class="media-left" style=" margin-right:30px;">
                    <a href="#">
                        <img class="media-object" src="Images/ProductImages/15/blue shirt02.jpg" alt="things" width="100px;">
                    </a>
                </div>
                <div class="media-body">
                    <h4 class="media-heading proNameViewCart">Media heading</h4>
                    <p class="proPriceDiscountView">Size:42</p>
                    <span class="proPriceView">RS: 455</span>
                    <span class="proOgPriceView">RS: 455</span>
                    <p>
                        <asp:Button ID="btnRemoveItem" OnClick="btnRemoveItem_Click" CssClass="removeButton" runat="server" Text="Remove" />
                    </p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div>
                <h5>PRICE DETAILS</h5>
                <div>
                    <label>Cart Total: </label>
                    <span class="pull-right priceGray ">1900</span>
                </div>
                <div>
                    <label>Cart Discount: </label>
                    <span class="pull-right priceGreen">-500</span>
                </div>
            </div>
            <div class="proPriceView">
                <label>Total: </label>
                <span class="pull-right">1400</span>
            </div>
            <div>
                <asp:Button ID="btnBuyNow" OnClick="btnBuyNow_Click1" CssClass="buyNowBtn" runat="server" Text="Buy now" />
            </div>
        </div>
    </div>
</asp:Content>
