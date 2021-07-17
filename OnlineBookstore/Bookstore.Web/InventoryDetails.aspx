<%@ Page Title="Book Details - Inventory" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InventoryDetails.aspx.cs" Inherits="Bookstore.Web.booksinventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find
                ("tr:first"))).dataTable();
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-lg-5">
                <div class="card card" style="max-width: 50rem;">
                    <div class="card-body">

                        <div class="row">
                            <div class="col center">
                                <h4>Books Details</h4>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <img id="imgview" height="150" width="100" src="InventoryBooks/book2.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <asp:FileUpload onchange="readURL(this);" class="form-control" ID="bookImgUpld" runat="server" />
                                <br />
                            </div>
                        </div>

                        <div class="row"> <%--Found a bug here - there is an issue here with the button stacking--%>
                            <div class="col-md-4">
                                <label>Book Id</label>
                                <div class="form-group">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="bookIdTxtBx" placeholder="Book Id" runat="server"></asp:TextBox>
                                        <asp:Button ID="searchBooksBtn" class=" form-control btn btn-primary" runat="server" Text="Sedarch" OnClick="SearchBooksBtn_Click" />
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-8">
                                <label>Book Name</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="bookNameTxtBx" placeholder="Book Name" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Language</label>
                                <div class="form-group center">
                                    <asp:DropDownList class="form-control" ID="languageDDL" runat="server">
                                        <asp:ListItem Text="--Select--" Value="--Select--" />
                                        <asp:ListItem Text="English" Value="English" />
                                        <asp:ListItem Text="Creole" Value="Creole" />
                                        <asp:ListItem Text="French" Value="French" />
                                        <asp:ListItem Text="Spanish" Value="Spanish" />
                                        <asp:ListItem Text="Chinese" Value="Chinese" />
                                    </asp:DropDownList>
                                </div>
                                <br />

                                <label>Publisher Name</label>
                                <div class="form-group center">
                                    <asp:DropDownList class="form-control" ID="publisherNameDDL" runat="server">
                                        <asp:ListItem Text="--Select--" Value="--Select--" Selected="True" />
                                    </asp:DropDownList>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-4">
                                <label>Author Name</label>
                                <div class="form-group center">
                                    <asp:DropDownList class="form-control" ID="authorNameDDL" runat="server">
                                        <asp:ListItem Text="--Select--" Value="--Select--" />
                                    </asp:DropDownList>
                                </div>
                                <br />

                                <label>Publisher Date</label>
                                <div class="form-group center">
                                    <asp:TextBox class="form-control" ID="publishedDateBx" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-4">
                                <label>Genre</label>
                                <div class="form-group center">
                                    <asp:ListBox ID="genreLBx" class="form-control" runat="server" SelectionMode="Multiple" Rows="4">
                                        <asp:ListItem Text="Adventure" Value="Adventure" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />
                                        <asp:ListItem Text="Self-help" Value="Self-help" />
                                        <asp:ListItem Text="Wellness" Value="Wellness" />
                                        <asp:ListItem Text="Crime" Value="Crime" />
                                        <asp:ListItem Text="Fantasy" Value="Fantasy" />
                                        <asp:ListItem Text="Thriller" Value="Thriller" />
                                        <asp:ListItem Text="Suspense" Value="Suspense" />
                                        <asp:ListItem Text="Autobiography" Value="Autobiography" />
                                        <asp:ListItem Text="Personal Dev" Value="Personal Dev" />
                                        <asp:ListItem Text="Motivation" Value="Motivation" />

                                    </asp:ListBox>

                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Edition</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="editionTxtBx" placeholder="Edition" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>Unit Price</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="priceTxtBx" placeholder="0" runat="server" SelectionMode="Single" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>No. of Pages</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="numOfPages" placeholder="0" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Total Quantity</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="QtyTxtBx" placeholder="0" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>Qty Available</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="availableTxtBx" placeholder="0" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <label>Qty Checked Out</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="checkedOutTxtBx" placeholder="0" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label>Book Description</label>
                                <div class="form-group center">
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" ID="descriptionTxtBx" placeholder="Description here!" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    </div>
                                </div>
                                <br />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="addBooksPBtn" class="btn btn-success w-100" runat="server" Text="Add" OnClick="AddBooksPBtn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="updateBooksPBtn" class="btn btn-warning w-100" runat="server" Text="Update" OnClick="UpdateBooksPBtn_Click" />
                            </div>
                            <div class="col-4">
                                <asp:Button ID="deleteBooksPBtn" class="btn btn-danger w-100" runat="server" Text="Delete" OnClick="DeleteBooksPBtn_Click" />
                            </div>
                        </div>
                    </div>
                    <a href="homepage.aspx"><< Back to Home</a>
                </div>
                <br />
            </div>
            <div class="col-lg-7">
                <div class="card card" style="max-width: 50rem;">
                    <div class="card-body">
                        <div class="row">
                            <div class="col center">
                                <img width="100" src="img/bunchofBook2.png" />
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <h3>Inventory</h3>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col center">
                                <hr />
                            </div>
                        </div>

                        <div class="row">
                            <div>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryDBConnectionString %>" SelectCommand="SELECT * FROM [InventoryDetails]"></asp:SqlDataSource>
                                <asp:GridView class="table table-striped table-bordered" ID="inventoryDetailGV" runat="server" AutoGenerateColumns="False" DataKeyNames="BookId" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="inventoryDetailGV_SelectedIndexChanged">
                                    <Columns>
                                        <asp:BoundField DataField="BookId" HeaderText="Id" ReadOnly="True" SortExpression="BookId" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <div class="container-fluid">
                                                    <div class="row">
                                                        <div class="col-lg-10">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("BookName") %>' Font-Bold="True" Font-Size="Large"></asp:Label>
                                                                </div>
                                                                <hr />
                                                                <div class="col-12">
                                                                    Author:
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text='<%# Eval("AuthorName") %>'></asp:Label>
                                                                    &nbsp;| Publisher:
                                                                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Text='<%# Eval("PublisherName") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-12">
                                                                    Published Date:
                                                                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Text='<%# Eval("PublishedDate") %>'></asp:Label>
                                                                    Genre:
                                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text='<%# Eval("Genre") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-12">
                                                                    Language:
                                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text='<%# Eval("Language") %>'></asp:Label>
                                                                    &nbsp;| No of Pages:
                                                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("NumberOfPages") %>'></asp:Label>
                                                                    &nbsp;| Edition:
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="True" Text='<%# Eval("Edition") %>'></asp:Label>
                                                                </div>
                                                                <div class="col-12">
                                                                    Unit Price:
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                                                    &nbsp;| Qty:
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="True" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                                    &nbsp;| Qty Avail:
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="True" Text='<%# Eval("QtyAvailable") %>'></asp:Label>
                                                                    &nbsp;| Chckd out:
                                                                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Text='<%# Eval("QtyCheckedOut") %>'></asp:Label><hr />
                                                                </div>
                                                                <div class="col-12">
                                                                    Description:
                                                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("BookDescription") %>'></asp:Label>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-lg-2">
                                                            <asp:Image CssClass="img-fluid p-2" ID="Image1" runat="server" ImageUrl='<%# Eval("BookImgLink") %>' />
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
