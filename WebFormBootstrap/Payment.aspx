<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebFormBootstrap.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="padding-top: 50px;">
    <div class="col-md-9">
        <div class="form-horizontal">
            <h2>Delivery Address</h2>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Name"></asp:Label>
                <div class="col-md-7">
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" TextMode="Multiline" CssClass="col-md-2 control-label" Text="Address"></asp:Label>
                <div class="col-md-7">
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Pin Code"></asp:Label>
                <div class="col-md-7">
                    <asp:TextBox ID="txtPinCode" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPinCode"></asp:RequiredFieldValidator>
                </div>
            </div>

        </div>
    </div>
    <div class="col-md-3" runat="server" id="divPriceDetails" style="padding-top: 50px; padding-left:20px;">
            <div style="border-bottom: 1px solid #eaeaec;">
                <h5 class="proNameViewCart">PRICE DETAILS</h5>
                <div>
                    <label>Cart Total</label>
                    <span class="pull-right priceGray" id="spanCartTotal" runat="server"></span>
                </div>
                <div>
                    <label>Cart Discount</label>
                    <span class="pull-right priceGreen" id="spanDiscount" runat="server"></span>
                </div>
            </div>
            <div>
                <div class="proPriceView">
                    <label>Total</label>
                    <span class="pull-right" id="spanTotal" runat="server"></span>
                </div>
            </div>
        </div>
    <div class="col-md-12" style="padding-left: 20px;">
        <h3>Choose Payment Mode</h3>
        <hr />

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#wallets" role="tab">Wallets</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#cards" role="tab">CREDIT/DEBIT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#cod" role="tab">COD</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="wallets" role="tabpanel">
                <h3>Home</h3>
                <p>Some Content</p>
                <asp:Button ID="btnPaytm" OnClick="btnPaytm_Click" runat="server" Text="Pay with Paytm" />
            </div>
            <div class="tab-pane" id="cards" role="tabpanel">
                <h3>Menu1</h3>
                <p>Some Content</p>
                <asp:Button ID="Button1" OnClick="btnPaytm_Click" runat="server" Text="Pay with Paytm" />
            </div>
            <div class="tab-pane" id="cod" role="tabpanel">
                <h3>Menu2</h3>
                <p>Some Content</p>
                <asp:Button ID="Button2" OnClick="btnPaytm_Click" runat="server" Text="Pay with Paytm" />
            </div>
            
        </div>

    </div>
</asp:Content>
