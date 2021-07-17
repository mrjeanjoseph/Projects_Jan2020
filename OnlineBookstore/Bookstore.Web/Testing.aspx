<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Testing.aspx.cs" Inherits="Bookstore.Web.Testing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <div class="col-md-5 mx-auto">
            <div class="card">
                <div class="card-body border border-2 rounded-3">
                    <div class="row">
                        <div class="col center">
                            <%--                            <img width="100" src="img/userIcon.png" />--%>
                            <i class="fas fa-user-circle fa-7x"></i>
                            <!-- uses solid style -->
                        </div>
                    </div>

                    <div class="row">
                        <div class="col center">
                            <h3>User Login</h3>
                            <hr />
                        </div>
                    </div>

                    <br />

                    <div class="row">
                        <div class="col-md-6 mx-auto">
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
                            <div class="form-group center">
                                <div class="form-group">
                                    <asp:Button ID="userLoginLBtn" class="btn btn-success w-100 btn-lg" runat="server" Text="Login" />
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

</asp:Content>
