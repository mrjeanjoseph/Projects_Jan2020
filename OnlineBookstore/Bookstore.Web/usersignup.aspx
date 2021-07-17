<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserSignup.aspx.cs" Inherits="Bookstore.Web.Usersignup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="75" src="img/userIcon.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>Registration</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <a>Already have an account?</a><br />
                                <a href="UserLogin.aspx">Login here</a>
                            </div>
                        </div>
                        <br />


                        <div class="row">
                            <div class="col center">
                                <hr />
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="fullNameTxtBx" placeholder="Full Name"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="birthDateTxtBx" placeholder="Date of Birth" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="phoneNumberTxtBx" placeholder="Phone Number"
                                        runat="server" TextMode="Phone"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="emailTxtBx" placeholder="Email"
                                        runat="server" TextMode="Email"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="addressTxtBx1" placeholder="Street Address 1"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="addressTxtBx2" placeholder="Street Address 2"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:DropDownList class="form-control" ID="stateDDL" runat="server">
                                        <asp:ListItem Text="--Select--" Value="select" />
                                        <asp:ListItem Text="Haiti" Value="LAS" />
                                        <asp:ListItem Text="North Carolina" Value="NC" />
                                        <asp:ListItem Text="South Carolina" Value="SC" />
                                        <asp:ListItem Text="Virginia" Value="VA" />
                                        <asp:ListItem Text="Florida" Value="FL" />
                                        <asp:ListItem Text="Georgia" Value="GA" />
                                        <asp:ListItem Text="Tennessee" Value="TN" />
                                        <asp:ListItem Text="West Virginia" Value="WV" />
                                        <asp:ListItem Text="Texas" Value="TX" />
                                        <asp:ListItem Text="California" Value="CA" />
                                    </asp:DropDownList>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="cityTxtBx" placeholder="City"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="zipcodeTxtBx" placeholder="ZipCode"
                                        runat="server" TextMode="Number"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <div class="form-group center">
                                    <span class="badge rounded-pill bg-success">Please Create a username and password</span>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="usernameTxtBx" placeholder="Username"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="passwordTxtBx" placeholder="Password"
                                        runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="confirmPassTxtBx" placeholder="Confirm Password"
                                        runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <div class="form-group">
                                    <asp:Button ID="registerBtn" class="btn btn-success w-50 btn-lg" runat="server" Text="Register" OnClick="RegisterBtn_Click" />
                                </div>
                                <br />
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
