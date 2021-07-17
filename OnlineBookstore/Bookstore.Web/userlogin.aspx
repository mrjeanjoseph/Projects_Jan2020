<%@ Page Title="User Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Bookstore.Web.Userlogin" %>

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
<%--                            <img width="100" src="img/userIcon.png" />--%>
                              <i class="fas fa-user-circle fa-7x"></i> <!-- uses solid style -->
                        </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>User Login</h3>
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <a>Don't have an account?</a><br />
                                <p>
                                    <asp:LinkButton ID="userSignupBtn" runat="server" OnClick="UserSignupLBtn_Click">Register here</asp:LinkButton>
                                </p>                                
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col">
                                <div class="form-group center">
                                    <asp:TextBox CssClass="form-control" ID="userNameTxtBx" placeholder="Username"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                                <div class="form-group center">
                                    <asp:TextBox CssClass="form-control" ID="passwordTxtBx" placeholder="Password"
                                        runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                                <div class="center">
                                    <div class="form-group center">
                                        <asp:Button ID="userLoginLBtn" class="btn btn-success w-50 btn-lg" runat="server" Text="Login" OnClick="UserLoginLBtn_Click" />
                                    </div>
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <a href="Homepage.aspx"><< Back to Home</a>
                </div>
                <br />

            </div>
        </div>
    </div>

</asp:Content>
