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
    public partial class publisherlogin : System.Web.UI.Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SearchBtn_Click(object sender, EventArgs e)
        {
            SearchPublisherById();
        }
        private void SearchPublisherById() // User defined function
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from PublisherDetails where PublisherId = '" + publisherIdTxtBx.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    publisherNameTxtBx.Text = dt.Rows[0][1].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Publisher Id does not exist');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                Response.Write("<script>alert('This id already exists in the database.');</script>");
                ClearForm();
            }
            else
            {
                AddNewPublisher();
            }
        }
        private void AddNewPublisher() // User defined function
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO PublisherDetails (PublisherId, PublisherName) values (@PublisherId, @PublisherName)", con);

                cmd.Parameters.AddWithValue("@PublisherId", publisherIdTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@PublisherName", publisherNameTxtBx.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Detail added successfully.');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                UpdatePublisherDetail();
            }
            else
            {
                Response.Write("<script>alert('Publisher Detail does not exist');</script>");
                ClearForm();
            }
        }
        private void UpdatePublisherDetail() // User Defined function
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE PublisherDetails SET PublisherName = @PublisherName WHERE PublisherId = '" + publisherIdTxtBx.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@PublisherName", publisherNameTxtBx.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher Detail updated successfully.');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExists())
            {
                DeletePublisherDetail();
            }
            else
            {
                Response.Write("<script>alert('Publisher detail has been deleted');</script>");
                ClearForm();
            }
        }
        private void DeletePublisherDetail() // User Defined Function
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("DELETE PublisherDetails WHERE PublisherId = '" + publisherIdTxtBx.Text.Trim() + "'", con);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Publisher details deleted successfully.');</script>");
                ClearForm();
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        bool CheckPublisherExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from PublisherDetails where PublisherId = '" + publisherIdTxtBx.Text.Trim() + "';", con);
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
            publisherNameTxtBx.Text = "";
            publisherIdTxtBx.Text = "";
        }
    }
}