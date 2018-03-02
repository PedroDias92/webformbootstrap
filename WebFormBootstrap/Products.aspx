<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebFormBootstrap.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="padding-top: 50px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
            <div class="col-sm-3 col-md-3">
                <div class="thumbnail">
                    <!--VER ISTO--> <!-- eliminar os registos dos produtos --> 
                    
                    
                    
                    <img src="Images/shirt01.jpg" atl="shirt" class="img-thumbnail"/>
                    <!--<p>Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName")%><%#Eval("Extention")%>  alt="<%#Eval("ImageName")%>"</p> -->
                    
                    <div class="caption">
                        <div class="probrand"><%#Eval("ImageName") %></div>
                        <div class="proName"><%#Eval("BrandName") %></div>
                        <div class="proPrice"><span class="proOgPrice"><%#Eval("PPrice") %></span> <%#Eval("PSelPrice") %> <span class="proPriceDiscount">(<%#Eval("DiscAmount")%> Off)</span></div>
                    </div>
                </div>
            </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
