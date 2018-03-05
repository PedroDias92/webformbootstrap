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
        <asp:Repeater ID="rptrProductDetails" OnItemDataBound="rptrProductDetails_ItemDataBound" runat="server">
            <ItemTemplate>
                <div class="divDet1">
                    <h1 class="proNameView"><%#Eval("PName")%></h1>
                    <span class="proOgPriceView"><%#Eval("PPrice")%></span><span class="proPriceDiscountView"><%#string.Format("{0}",Convert.ToInt64(Eval("PPrice")))%></span>
                    <p class="proPriceView"><%#Eval("PSelPrice")%></p>
                </div>
                <div>
                    <h5 class="h5Size">SIZE</h5>
                    <div>
                        <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="divDet1">
                    <asp:Button ID="btnAddToCart" CssClass="mainButton" runat="server" Text="ADD TO CART" OnClick="btnAddToCart_Click" />
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger" Text=""></asp:Label>
                </div>
                <div>
                    <h5 class="h5Size">Description</h5>
                    <p><%#Eval("PDescription")%>p>
                </div>
                <div>
                    <h5 class="h5Size">Product Details</h5>
                    <p><%#Eval("PProductDetails")%></p>
                </div>
                <div class="divDet1">
                    <h5 class="h5Size">Material & Care</h5>
                    <p><%#Eval("PMaterialCare")%></p>
                </div>
                <div>
                    <p><%# ((int)Eval("FreeDelivery")==1)?"Free Delivery":"" %></p>
                    <p><%# ((int)Eval("30DayRet")==1)?"30 days":"" %></p>
                    <p><%# ((int)Eval("COD")==1)?"cash on delivery":"" %></p>
                </div>

                <asp:HiddenField ID="hfCatID" Value='<%#Eval("PCategoryID") %>' runat="server" />
                <asp:HiddenField ID="hfSubCatID" Value='<%#Eval("PSubCatID") %>' runat="server" />
                <asp:HiddenField ID="hfGenderID" Value='<%#Eval("PGenderID") %>' runat="server" />
                <asp:HiddenField ID="hfBrandID" Value='<%#Eval("PBrandID") %>' runat="server" />
                    </ItemTemplate>
        </asp:Repeater>
    </div>
    </div>
</asp:Content>
