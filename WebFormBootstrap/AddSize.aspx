<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddSize.aspx.cs" Inherits="WebFormBootstrap.AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Size</h2>
            <hr />
            <!--SizeNAme-->
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Size Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtSizeName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtSizeName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!--Brand-->
            <div class="form-group">
                <asp:Label ID="txtBrand" runat="server" CssClass="col-md-2 control-label" Text="Brand"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlBrand" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!--Category-->
            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlCategory" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!--SubCategory-->
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="SubCategory"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSubCat" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlSubCat" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>
            <!--Gender-->
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGender" CssClass="form-control" runat="server"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlGender" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
            </div>



            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>

        <h1>Sizes</h1>
        <div class="panel card-success">
            <!-- Default panel contents -->

            <asp:Repeater ID="rptrSubCategory" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr class="table-active">
                                <th scope="col">#</th>
                                <th scope="col">Size tag</th>
                                <th scope="col">Brand</th>
                                <th scope="col">Category</th>
                                <th scope="col">SubCategory</th>
                                <th scope="col">Gender</th>
                                <th scope="col">Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%# Eval("SizeID") %></th>
                        <th><%# Eval("SizeName") %></th>
                        <th><%# Eval("Name") %></th>
                        <th><%# Eval("CatName") %></th>
                        <td><%# Eval("SubCatName") %></td>
                        <td><%# Eval("GenderName") %></td>
                        <td>Edit</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
