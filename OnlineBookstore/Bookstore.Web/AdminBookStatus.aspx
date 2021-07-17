<%@ Page Title="Book Checkout Status" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookStatus.aspx.cs" Inherits="Bookstore.Web.issuedbooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable({
                "scrollY": "200px",
                "scrollCollapse": true,
                "paging": false
            } );
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
                                <h3>Book Details</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <img width="75" src="img/book.png" />
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
                                    <asp:TextBox class="form-control" ID="memberIdTxtBx" placeholder="Member Id"
                                        runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-5">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="bookIdTxtBx" placeholder="Book Id" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-2">
                                <div class="form-group center">
                                    <asp:Button ID="searchBtn" class="btn btn-primary" runat="server" Text="Search" OnClick="SearchBtn_Click" />
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="memberNameTxtBx" placeholder="Member Name"
                                        runat="server" ReadOnly="True"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="bookNameTxtBx" placeholder="Book Name" runat="server" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="checkedOutDateTxtBx" placeholder="Checkout Date" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-6">
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="dueDateTxtBx" placeholder="Due Date" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row mr-auto">
                            <div class="col center">
                                <asp:Button ID="checkOutBtn" class="btn btn-success w-75" runat="server" Text="Check Out" OnClick="CheckOutBtn_Click" />
                            </div>
                            <div class="col center">
                                <asp:Button ID="returnBtn" class="btn btn-success w-75" runat="server" Text="Return" OnClick="ReturnBtn_Click" />
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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:eLibraryDBConnectionString %>' SelectCommand="SELECT * FROM [BookStatus]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="BookStatusGV" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberId" DataSourceID="SqlDataSource1" OnRowDataBound="BookStatusGV_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="MemberId" HeaderText="Member Id" ReadOnly="True" SortExpression="MemberId"></asp:BoundField>
                                        <asp:BoundField DataField="MemberName" HeaderText="Member Name" SortExpression="MemberName"></asp:BoundField>
                                        <asp:BoundField DataField="BookId" HeaderText="Book Id" SortExpression="BookId"></asp:BoundField>
                                        <asp:BoundField DataField="BookName" HeaderText="Book Name" SortExpression="BookName"></asp:BoundField>
                                        <asp:BoundField DataField="CheckedOutDate" HeaderText="Check Out Date" SortExpression="CheckedOutDate"></asp:BoundField>
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
