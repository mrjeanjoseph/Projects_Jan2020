using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Bookstore.Web
{
    public partial class booksinventory : System.Web.UI.Page
    {
        private static readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private static string global_filepath;
        private static int global_quantity, global_avalaible, global_checkedout;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillValues();
            }

            inventoryDetailGV.DataBind();
        }

        protected void AddBooksPBtn_Click(object sender, EventArgs e)
        {
            if (CheckBookExists())
            {
                Response.Write("<script>alert('This book Id already exist. Please try a different id.');</script>");
            }
            else
            {
                GetNewBooks();
            }
        }

        protected void UpdateBooksPBtn_Click(object sender, EventArgs e)
        {
            UpdateBooksById();
        }

        protected void DeleteBooksPBtn_Click(object sender, EventArgs e)
        {
            DeleteBooksById();
        }

        protected void SearchBooksBtn_Click(object sender, EventArgs e)
        {
            GetBookById();
        }

        protected void inventoryDetailGV_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        //User Defined functions
        private void DeleteBooksById()
        {
            if (CheckBookExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE InventoryDetails WHERE BookId = '" + bookIdTxtBx.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Book details deleted successfully.');</script>");
                    inventoryDetailGV.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid user Id');</script>");
            }

        }
        private void UpdateBooksById() 
        {
            if (CheckBookExists())
            {
                try
                {
                    //calc qty checkedout
                    int quantity = Convert.ToInt32(QtyTxtBx.Text.Trim());
                    int qtyAvailable = Convert.ToInt32(availableTxtBx.Text.Trim());
                    if (global_quantity == quantity)
                    {
                        //Nothing happens here!
                    }
                    else
                    {
                        if (quantity < global_checkedout)
                        {
                            Response.Write("<script>alert('Quantity available cannot be less than quantity checked out.');</script>");
                            return;
                        }
                        else
                        {
                            qtyAvailable = quantity - global_checkedout;
                            checkedOutTxtBx.Text = "" + qtyAvailable;
                        }
                    }

                    // load multiselect list of genres
                    string genres = "";
                    foreach (int listOfGenres in genreLBx.GetSelectedIndices())
                    {
                        genres += genreLBx.Items[listOfGenres] + "\n";
                    }
                    genres = genres.Remove(genres.Length - 1);

                    // to update the image file
                    string filePath = "~/inventoryBooks/book1.png",
                            fileName = Path.GetFileName(bookImgUpld.PostedFile.FileName);
                    if (fileName == "" || fileName == null)
                    {
                        filePath = global_filepath;
                    }
                    else
                    {
                        bookImgUpld.SaveAs(Server.MapPath("inventoryBooks/" + fileName));
                        filePath = "~/inventoryBooks/" + fileName;
                    }


                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE InventoryDetails SET BookName = @BookName, Genre = @Genre, AuthorName = @AuthorName, PublisherName = @PublisherName, PublishedDate = @PublishedDate, Language = @Language, Edition = @Edition, UnitPrice = @UnitPrice, NumberOfPages = @NumberOfPages, BookDescription = @BookDescription, Quantity = @Quantity, QtyAvailable = @QtyAvailable, BookImgLink = @BookImgLink WHERE BookId = '" + bookIdTxtBx.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("BookName", bookNameTxtBx.Text.Trim());
                    cmd.Parameters.AddWithValue("Genre", genres);

                    cmd.Parameters.AddWithValue("AuthorName", authorNameDDL.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("PublisherName", publisherNameDDL.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("PublishedDate", publishedDateBx.Text.Trim());

                    cmd.Parameters.AddWithValue("Language", languageDDL.SelectedValue.Trim());
                    cmd.Parameters.AddWithValue("Edition", editionTxtBx.Text.Trim());
                    cmd.Parameters.AddWithValue("UnitPrice", priceTxtBx.Text.Trim());
                    cmd.Parameters.AddWithValue("NumberOfPages", numOfPages.Text.Trim());
                    cmd.Parameters.AddWithValue("BookDescription", descriptionTxtBx.Text.Trim());

                    cmd.Parameters.AddWithValue("Quantity", quantity.ToString()); ;
                    cmd.Parameters.AddWithValue("QtyAvailable", qtyAvailable.ToString());

                    cmd.Parameters.AddWithValue("BookImgLink", filePath);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    inventoryDetailGV.DataBind();
                    Response.Write("<script>alert('Book details updated successfully.');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('ID entered is invalid.');</script>");
            }

        }
        private void FillValues()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT AuthorName FROM AuthorDetails;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                authorNameDDL.DataSource = dt;
                authorNameDDL.DataValueField = "AuthorName";
                authorNameDDL.DataBind();

                cmd = new SqlCommand("SELECT PublisherName FROM PublisherDetails;", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                publisherNameDDL.DataSource = dt;
                publisherNameDDL.DataValueField = "PublisherName";
                publisherNameDDL.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private void GetNewBooks()
        {
            try
            {
                string genres = "";
                foreach (int item in genreLBx.GetSelectedIndices())
                {
                    genres += genreLBx.Items[item] + "\n"; // inside of the double quotes should be a comma - let's see what happens.
                }
                genres = genres.Remove(genres.Length - 1);

                string filePath = "~/inventoryBooks/book1.png",
                fileName = Path.GetFileName(bookImgUpld.PostedFile.FileName);
                bookImgUpld.SaveAs(Server.MapPath("inventoryBooks/" + fileName));
                filePath = "~/inventoryBooks/" + fileName;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO InventoryDetails (BookId, BookName, Genre, AuthorName, PublisherName, PublishedDate, Language, Edition, UnitPrice, NumberOfPages, BookDescription, Quantity, QtyAvailable, QtyCheckedOut, BookImgLink) values (@BookId, @BookName, @Genre, @AuthorName, @PublisherName, @PublishedDate, @Language, @Edition, @UnitPrice, @NumberOfPages, @BookDescription, @Quantity, @QtyAvailable, @QtyCheckedOut, @BookImgLink)", con);

                cmd.Parameters.AddWithValue("@BookId", bookIdTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@BookName", bookNameTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@Genre", genres);
                cmd.Parameters.AddWithValue("@AuthorName", authorNameDDL.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PublisherName", publisherNameDDL.SelectedItem.Value);

                cmd.Parameters.AddWithValue("@PublishedDate", publishedDateBx.Text.Trim());
                cmd.Parameters.AddWithValue("@Language", languageDDL.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Edition", editionTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@UnitPrice", priceTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@NumberOfPages", numOfPages.Text.Trim());

                cmd.Parameters.AddWithValue("@BookDescription", descriptionTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@Quantity", QtyTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@QtyAvailable", QtyTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@QtyCheckedOut", "0");
                cmd.Parameters.AddWithValue("@BookImgLink", filePath);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Book detail added successfully.');</script>");
                inventoryDetailGV.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private bool CheckBookExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from InventoryDetails where BookId = '" + bookIdTxtBx.Text.Trim() + "' OR BookName = '" + bookNameTxtBx.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        private void GetBookById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM InventoryDetails WHERE BookId='" + bookIdTxtBx.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    bookNameTxtBx.Text = dt.Rows[0]["BookName"].ToString();

                    languageDDL.SelectedValue = dt.Rows[0]["Language"].ToString().Trim();
                    authorNameDDL.SelectedValue = dt.Rows[0]["AuthorName"].ToString().Trim();
                    publisherNameDDL.SelectedValue = dt.Rows[0]["PublisherName"].ToString().Trim();
                    publishedDateBx.Text = dt.Rows[0]["PublishedDate"].ToString();

                    genreLBx.ClearSelection();
                    string[] genre = dt.Rows[0]["Genre"].ToString().Trim().Split('\n');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < genreLBx.Items.Count; j++)
                        {
                            if (genreLBx.Items[j].ToString() == genre[i])
                            {
                                genreLBx.Items[j].Selected = true;
                            }
                        }
                    }

                    editionTxtBx.Text = dt.Rows[0]["Edition"].ToString().Trim();
                    priceTxtBx.Text = dt.Rows[0]["UnitPrice"].ToString().Trim();
                    numOfPages.Text = dt.Rows[0]["NumberOfPages"].ToString().Trim();
                    QtyTxtBx.Text = dt.Rows[0]["Quantity"].ToString().Trim();
                    availableTxtBx.Text = dt.Rows[0]["QtyAvailable"].ToString().Trim();
                    checkedOutTxtBx.Text = "" + (Convert.ToInt32(dt.Rows[0]["Quantity"].ToString()) -
                        Convert.ToInt32(dt.Rows[0]["QtyAvailable"].ToString()));
                    descriptionTxtBx.Text = dt.Rows[0]["BookDescription"].ToString().Trim();

                    global_quantity = Convert.ToInt32(dt.Rows[0]["Quantity"].ToString().Trim());
                    global_avalaible = Convert.ToInt32(dt.Rows[0]["QtyAvailable"].ToString().Trim());
                    global_checkedout = global_avalaible - global_quantity;
                    global_filepath = dt.Rows[0]["BookImgLink"].ToString();

                }
                else
                {
                    Response.Write("<script>alert('Book Id entered is invalid');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}