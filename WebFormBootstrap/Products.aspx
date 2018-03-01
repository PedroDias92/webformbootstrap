<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebFormBootstrap.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="padding-top: 50px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
            <div class="col-sm-3 col-md-3">
                <div class="thumbnail">
                    <img src="images/Flying Machine Men White Printed Casual Shirt01.jpg" alt="shirt" class="img-thumbnail">
                    <div class="caption">
                        <div class="probrand"><%#Eval("Name") %></div>
                        <div class="proName"><%#Eval("PName") %></div>
                        <div class="proPrice"><span class="proOgPrice">2200</span> 1999 <span class="proPriceDiscount">(201 Off)</span></div>
                    </div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
