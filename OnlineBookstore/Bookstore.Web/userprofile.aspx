<%@ Page Title="User Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Bookstore.Web.Userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "scrollY": "200px",
                "scrollCollapse": true,
                "paging": false
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="75" src="img/userIcon.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>Your Profile</h3>
                                <span>Account Status</span>
                                <asp:Label class="badge rounded-pill bg-info text-dark" ID="accountStatusLbl" runat="server" Text="Your Status"></asp:Label>
                            </div>
                        </div>

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
                                    <asp:TextBox class="form-control" ID="birthDateTxtBx" placeholder="Date of Birth"
                                        runat="server" TextMode="Date"></asp:TextBox>
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
                                        <asp:ListItem Text="North Dakota" Value="NA" />
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
                                    <span class="badge rounded-pill bg-success">Want to create a new password?</span>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="userNameTxtBx" placeholder="Username"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="currentPassTxtBx" placeholder=""
                                        runat="server" TextMode="Password" ReadOnly="True"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="newPassTxtBx" placeholder="New Password"
                                        runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-8 mx-auto center">
                                <div class="form-group">
                                    <asp:Button ID="updateBtn" class="btn btn-success w-100" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
                                </div>
                                <br />
                            </div>
                        </div>
                    </div>
                    <a href="Homepage.aspx"><< Back to Home</a>
                </div>
                <br />
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="75" src="img/book.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>Your issued Books</h3>
                                <asp:Label class="badge rounded-pill bg-info text-dark" ID="Label2" runat="server" Text="Your Book Information"></asp:Label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:eLibraryDBConnectionString %>' SelectCommand="SELECT * FROM [BookStatus]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="UserDetailsGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberId" OnRowDataBound="UserDetailsGV_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="MemberId" HeaderText="User Id" ReadOnly="True" SortExpression="MemberId"></asp:BoundField>
                                        <asp:BoundField DataField="MemberName" HeaderText="Name" SortExpression="MemberName"></asp:BoundField>
                                        <asp:BoundField DataField="BookId" HeaderText="Book Id" SortExpression="BookId"></asp:BoundField>
                                        <asp:BoundField DataField="BookName" HeaderText="Book Name" SortExpression="BookName"></asp:BoundField>
                                        <asp:BoundField DataField="CheckedOutDate" HeaderText="Checked Out Date" SortExpression="CheckedOutDate"></asp:BoundField>
                                        <asp:BoundField DataField="DueDate" HeaderText="Due Date" SortExpression="DueDate"></asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
        </div>
    </div>


</asp:Content>
