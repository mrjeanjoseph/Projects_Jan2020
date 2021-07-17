<%@ Page Title="Admin Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Bookstore.Web.adminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="100" src="img/adminIcon.png" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col center">
                                <h3>Admin Login</h3>
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox CssClass="form-control" ID="adminIdTxtBx" placeholder="Admin ID"
                                        runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox CssClass="form-control" ID="passwordTxtBx" placeholder="Password"
                                        runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col center">
                            <div class="form-group">
                                <asp:Button ID="adminLoginBtn" class="btn btn-success w-50 btn-lg" runat="server" Text="Login" OnClick="AdminLoginBtn_Click" />
                            </div>
                            <br />
                        </div>
                    </div>
                </div>
                <a href="homepage.aspx"><< Back to Home</a>
            </div>
            <br />

        </div>
    </div>

</asp:Content>
