<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddGender.aspx.cs" Inherits="WebFormBootstrap.AddGender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
            <h2>Add Gender</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtGenderName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtGenderName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-default" OnClick="btnAdd_Click" />
                </div>
            </div>
            
        <h1>Gender</h1>
        <div class="panel card-success">
            <!-- Default panel contents -->
            
            <asp:Repeater ID="rptrGender" runat="server">
                <HeaderTemplate>
                    <table class="table">
                <thead >
                    <tr class="table-active">
                        <th scope="col">#</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <th><%#Eval("GenderID") %></th>
                        <td><%#Eval("GenderName") %></td>
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
