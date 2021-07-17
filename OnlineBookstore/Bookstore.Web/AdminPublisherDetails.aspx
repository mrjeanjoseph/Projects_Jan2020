<%@ Page Title="Admin - Publisher Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminPublisherDetails.aspx.cs" Inherits="Bookstore.Web.publisherlogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

        <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col center">
                                <h3>Publisher Details</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <img width="100" src="img/publisherIcon.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="publisherIdTxtBx" placeholder="Publisher Id" runat="server"></asp:TextBox>
                                        <asp:Button ID="searchBtn" class="btn btn-primary" runat="server" Text="Search" OnClick="SearchBtn_Click" />
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-7">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="publisherNameTxtBx" placeholder="Publisher Full Name"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row mr-auto">
                            <div class="col-4">
                                <asp:Button ID="addBtn" class="btn btn-success w-100" runat="server" Text="Add" OnClick="AddBtn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="updateBtn" class="btn btn-warning w-100" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="deleteBtn" class="btn btn-danger w-100" runat="server" Text="Delete" OnClick="DeleteBtn_Click" />
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx"><< Back to Home</a>
                </div>
                <br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="75" src="img/authorListIcon.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>Publisher Lists</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [PublisherDetails]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PublisherId" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="PublisherId" HeaderText="Publisher Id" ReadOnly="True" SortExpression="PublisherId" />
                                        <asp:BoundField DataField="PublisherName" HeaderText="Publisher Name" SortExpression="PublisherName" />
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
