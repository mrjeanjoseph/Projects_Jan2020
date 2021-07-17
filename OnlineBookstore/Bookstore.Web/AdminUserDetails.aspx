<%@ Page Title="Admin - User Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminUserDetails.aspx.cs" Inherits="Bookstore.Web.adminprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

            <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
            </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col center">
                                <h3>Admin</h3>
                                <h4>User Details</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <img width="75" src="img/adminIcon2.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                    <label>User Id</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="userIdTxtBx" placeholder="Id" runat="server"></asp:TextBox>
                                        <asp:LinkButton ID="searchLBtn" CssClass="btn btn-primary" runat="server" OnClick="SearchLBtn_Click"><i class="fas fa-search"></i></asp:LinkButton>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>Full Name</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="fullNameTxtBx" placeholder="Full Name" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>

                            <%--The Margin between the three linked buttons are not padded. Look into that!--%>
                            <div class="col-md-5">
                                <label>Account Status</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox CssClass="form-control" ID="statusTxtBx" placeholder="Status" runat="server" ReadOnly="True"></asp:TextBox>

                                        <asp:LinkButton ID="userActiveLBtn" class="btn btn-success" runat="server" OnClick="UserActiveLBtn_Click"><i class="fas fa-check-circle"></i></asp:LinkButton>

                                        <asp:LinkButton ID="userPendingLBtn" class="btn btn-warning" runat="server" OnClick="UserPendingLBtn_Click"><i class="far fa-pause-circle"></i></asp:LinkButton>

                                        <asp:LinkButton ID="userInactiveLBtn" class="btn btn-danger" runat="server" OnClick="UserInactiveLBtn_Click"><i class="fas fa-trash-alt"></i></asp:LinkButton>

                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <label>Date of Birth</label>
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="birthDateTxtBx" placeholder="DoB" runat="server" ReadOnly="True"></asp:TextBox>

                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>Phone Number</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="contactNumTxtBx" placeholder="Contact No." runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-5">
                                <label>Email Address</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="emailTxtBx" placeholder="Email" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label>Address 1</label>
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="addressTxtBx1" placeholder="Address 1" runat="server" ReadOnly="True" TextMode="MultiLine" Rows="1"></asp:TextBox>

                                </div>
                                <br />
                            </div>

                            <div class="col-6">
                                <label>Address 2</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="addressTxtBx2" placeholder="Address 2" runat="server" ReadOnly="True" TextMode="MultiLine" Rows="1"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                            <label>City</label>
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="cityTxtBx" placeholder="City" runat="server" ReadOnly="True"></asp:TextBox>

                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>State</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="stateTxtBx" placeholder="State" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>Zip Code</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="zipCodeTxtBx" placeholder="Zip Code" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center mx-auto">
                                <asp:Button ID="deleteUserLBtn" class="btn btn-danger w-50" runat="server" Text="Delete User Permanently" OnClick="DeleteUserLBtn_Click" />
                            </div>
                        </div>
                    </div>                   
                </div>
                <br />
            </div>
            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="100" src="img/bunchofBook.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>Issued Book List</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [UserDetails]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="Username" HeaderText="User Name" ReadOnly="True" SortExpression="Username" />
                                        <asp:BoundField DataField="FullName" HeaderText="Name" />
                                        <asp:BoundField DataField="AccountStatus" HeaderText="Status" SortExpression="AccountStatus" />
                                        <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" />
                                        <asp:BoundField DataField="Email" HeaderText="Email Address" />
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
