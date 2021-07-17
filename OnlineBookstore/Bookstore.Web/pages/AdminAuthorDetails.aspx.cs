using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookstore.Web
{
    public partial class authorlogin : Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                Response.Write("<script>alert('This id already exists in the database.');</script>");
                ClearForm();
            }
            else
            {
                AddNewAuthor();
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                UpdateAuthorDetail();
            }
            else
            {
                Response.Write("<script>alert('Author Detail does not exist');</script>");
                ClearForm();
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExists())
            {
                DeleteAuthorDetail();
            }
            else
            {
                Response.Write("<script>alert('Author Detail has been deleted');</script>");
                ClearForm();
            }
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            SearchAuthorById(); // Add some validation here
        }


        //User Defined Function
        private void AddNewAuthor()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO AuthorDetails (AuthorId, AuthorName) values (@AuthorId, @AuthorName)", con);

                cmd.Parameters.AddWithValue("@AuthorId", authorIdTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@AuthorName", authorNameTxtBx.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Detail added successfully.');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        private void UpdateAuthorDetail()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE AuthorDetails SET AuthorName = @AuthorName WHERE AuthorId = '"+authorIdTxtBx.Text.Trim()+"'", con);

                cmd.Parameters.AddWithValue("@AuthorName", authorNameTxtBx.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Detail updated successfully.');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void DeleteAuthorDetail()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE AuthorDetails WHERE AuthorId = '" + authorIdTxtBx.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Author Detail Deleted successfully.');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void SearchAuthorById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from AuthorDetails where AuthorId = '" + authorIdTxtBx.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    authorNameTxtBx.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Author Id does not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool CheckAuthorExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from AuthorDetails where AuthorId = '" + authorIdTxtBx.Text.Trim() + "';", con);
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

        private void ClearForm()
        {
            authorNameTxtBx.Text = "";
            authorIdTxtBx.Text = "";
        }
    }
}