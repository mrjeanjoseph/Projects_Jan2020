<%@ Page Title="Inventory Book Lists" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="Bookstore.Web.ViewBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find
                ("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row">
            <div class="col center">
                <h3>Inventory</h3>
            </div>
            <br />
            <div class="row">
                <div class="card">
                    <div class="card-body">
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
        </div>
    </div>
</asp:Content>
