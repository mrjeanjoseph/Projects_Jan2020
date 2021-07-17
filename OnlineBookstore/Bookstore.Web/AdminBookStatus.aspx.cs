using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI.WebControls;

// There's bunch of errors when loading the page - FIND THEM

namespace Bookstore.Web
{
    public partial class issuedbooks : System.Web.UI.Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            BookStatusGV.DataBind();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            SearchBooksByNameAndId();
        }

        protected void CheckOutBtn_Click(object sender, EventArgs e)
        {

            if (CheckIfBookExist() && CheckIfMemberExist()) // There's a bug here somewhere!
            {
                if (MemberDuplicateBooks())
                {
                    Response.Write("<script>alert('This member already checked out this book!');</script>");
                }
                else
                {
                    CheckOutBooks();
                }
            }
            else
            {
                Response.Write("<script>alert('An error has occured. Please try again!');</script>");
            }
        }

        protected void ReturnBtn_Click(object sender, EventArgs e)
        {
            if (CheckIfBookExist() && CheckIfMemberExist()) // There's a bug here somewhere!
            {
                if (MemberDuplicateBooks())
                {
                    ReturnBooks();
                }
                else
                {
                    Response.Write("<script>alert('This book does not exist!');</script>");                    
                }
            }
            else
            {
                Response.Write("<script>alert('An error has occured. Please try again!');</script>");
            }
        }


        //Custom User Defined Functions
        private void ReturnBooks()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE FROM BookStatus WHERE BookId = '" + bookIdTxtBx.Text.Trim() + "' AND MemberId ='" + bookNameTxtBx.Text.Trim() + "'", con);

                int result = cmd.ExecuteNonQuery();
                
                if (result > 0)
                {
                    cmd = new SqlCommand("UPDATE BookStatus SET QtyAvailable = QtyAvailable WHERE BookId = '" + bookIdTxtBx.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Response.Write("<script>alert('Book returned successfully');</script>");
                    BookStatusGV.DataBind();

                    con.Close();
                }
            } 
            catch (Exception)
            {

                throw;
            }
        }
        private void CheckOutBooks()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO BookStatus (MemberId, MemberName, BookId, BookName, CheckedOutDate, DueDate) values (@MemberId, @MemberName, @BookId, @BookName, @CheckedOutDate, @DueDate)", con);

                cmd.Parameters.AddWithValue("@MemberId", memberIdTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@MemberName", memberNameTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@BookId", bookIdTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@BookName", bookNameTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@CheckedOutDate", checkedOutDateTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@DueDate", dueDateTxtBx.Text.Trim());
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE InventoryDetails SET QtyAvailable = QtyAvailable - 1 WHERE BookId = '" + bookIdTxtBx.Text.Trim() + "'", con);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book checked out successffully');</script>");
                BookStatusGV.DataBind();
                //ClearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private void SearchBooksByNameAndId()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT BookName from InventoryDetails where BookId = '" + bookIdTxtBx.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    bookNameTxtBx.Text = dt.Rows[0]["BookName"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Book Id does not exist');</script>");
                }

                cmd = new SqlCommand("SELECT FullName from UserDetails where Username = '" + memberIdTxtBx.Text.Trim() + "';", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    memberNameTxtBx.Text = dt.Rows[0]["FullName"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Member Id does not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private bool CheckIfBookExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM InventoryDetails WHERE BookId = '" + bookIdTxtBx.Text.Trim() + "' AND QtyAvailable > 0", con);
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
        private bool CheckIfMemberExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT FullName FROM UserDetails WHERE Username = '" + memberIdTxtBx.Text.Trim() + "'", con);
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
        private bool MemberDuplicateBooks()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM BookStatus WHERE MemberId = '" + memberIdTxtBx.Text.Trim() + "' AND BookId = '" + bookIdTxtBx.Text.Trim() + "'", con);
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
                return true;
            }
        }
        private void ClearForm()
        {
            memberIdTxtBx.Text = "";
            memberNameTxtBx.Text = "";
            bookNameTxtBx.Text = "";
            bookIdTxtBx.Text = "";
            checkedOutDateTxtBx.Text = "";
            dueDateTxtBx.Text = "";
        }

        protected void BookStatusGV_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    DateTime today = DateTime.Today;
                    if (today > dt)
                    {
                        e.Row.BackColor = Color.Red;
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}