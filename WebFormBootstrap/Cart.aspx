<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebFormBootstrap.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="padding-top: 50px;">
        <div class="col-md-9">
            <h5 class="proNameViewCart" runat="server" id="h5NoItems"></h5>
            <asp:Repeater ID="rptrCartProducts" runat="server">
                <ItemTemplate>
                    <div class="media" style="border: 1px solid #eaeaec">
                        <div class="media-left" style="margin-right: 30px;">
                            <a href="ProductView.aspx?PID=<%#Eval("PID") %>" target="_blank">
                                <img class="media-object" src="Images/ProductImages/15/blue shirt02.jpg" alt="things" width="100px;" onerror="this.src='Images/noimage.jpg'">
                               <!-- <img class="d-block w-100" src="Images/ProductImages/<%#("PID") %>/<%#("Name") %><%#("Extention") %>" alt="<%#("Name") %>" onerror="this.src='Images/noimage.jpg'"> -->
                            </a>
                        </div>
                        <div class="media-body">
                            <h4 class="media-heading proNameViewCart"><%#Eval("PName") %></h4>
                            <p class="proPriceDiscountView"><%#Eval("SizeNamee") %></p>
                            <span class="proPriceView"><%#Eval("PSelPrice","{0:c}") %></span> <!--"{0:c}" dá o simbolo do euro/dollar dependendo da localizacao do browser -->
                            <span class="proOgPriceView"><%#Eval("PPrice","{0:c}") %></span>
                            <p>
                                <asp:Button CommandArgument='<%#Eval("PID")+"-"+ Eval("SizeIDD")%>' ID="btnRemoveItem" OnClick="btnRemoveItem_Click" CssClass="removeButton" runat="server" Text="REMOVE" />
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col-md-3" runat="server" id="divPriceDetails" style="padding-left: 50px;">
            <div>
                <h5>PRICE DETAILS</h5>
                <div>
                    <label>Cart Total: </label>
                    <span class="pull-right priceGray " id="spanCartTotal" runat="server"></span>
                </div>
                <div>
                    <label>Cart Discount: </label>
                    <span class="pull-right priceGreen" id="spanDiscount" runat="server"></span>
                </div>
            </div>
            <div class="proPriceView">
                <label>Total: </label>
                <span class="pull-right" id="spanTotal" runat="server"></span>
            </div>
            <div>
                <asp:Button ID="btnBuyNow" OnClick="btnBuyNow_Click1" CssClass="buyNowBtn" runat="server" Text="Buy now" />
            </div>
        </div>
    </div>
</asp:Content>
