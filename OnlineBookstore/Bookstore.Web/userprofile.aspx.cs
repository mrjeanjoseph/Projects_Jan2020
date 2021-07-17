
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookstore.Web
{
    public partial class Userprofile : Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        { // Issue resolved with page load
            try
            {
                if (Session["Username"].ToString() == "" || Session["Username"] == null)
                {
                    Response.Write("<script>alert('Session expired. Please login again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                    GetBooksDetails();
                    if (!Page.IsPostBack)
                    {
                        LoadUserDetails(); // There's a bug here
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("UserLogin.aspx");
            }
        }
        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() == "" || Session["Username"] == null)
            {
                Response.Write("<script>alert('Session expired. Please login again');</script>");
                //Response.Redirect("UserLogin.aspx");
            }
            else
            {
                UpdateUserDetails();
            }
        } // There's a bug here - somewhere

        //User Defined Function
        private void UpdateUserDetails()
        {
            string newPassw;
            if (newPassTxtBx.Text.Trim() == "")
            {
                newPassw = currentPassTxtBx.Text.Trim();
            }
            else
            {
                newPassw = newPassTxtBx.Text.Trim();
            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("UPDATE UserDetails SET FullName=@FullName, BirthDate=@BirthDate, ContactNumber=@ContactNumber, Email=@Email, StreetAddress1=@StreetAddress1, StreetAddress2=@StreetAddress2, City=@City, State=@State, ZipCode=@ZipCode, AccountStatus=@AccountStatus, Password=@currentPass WHERE Username = '" + Session["Username"].ToString().ToString() + "'", con);

                cmd.Parameters.AddWithValue("@FullName", fullNameTxtBx.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@BirthDate", birthDateTxtBx.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@ContactNumber", phoneNumberTxtBx.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@Email", emailTxtBx.Text.Trim().ToString());

                cmd.Parameters.AddWithValue("@StreetAddress1", addressTxtBx1.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@StreetAddress2", addressTxtBx2.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@City", cityTxtBx.Text.Trim().ToString());
                cmd.Parameters.AddWithValue("@State", stateDDL.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ZipCode", zipcodeTxtBx.Text.Trim().ToString());

                cmd.Parameters.AddWithValue("@AccountStatus", "Pending");
                cmd.Parameters.AddWithValue("@Password", newPassw);

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    Response.Write("<script>alert('User Details loaded successfully.');</script>");
                    LoadUserDetails();
                    GetBooksDetails();
                }
                else
                {
                    Response.Write("<script>alert('Error in the ExecuteNonQuery command');</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('UpdateUserDetails Method Error');</script>");
            }
        }
        private void LoadUserDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM UserDetails WHERE FullName = '" + Session["FullName"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                fullNameTxtBx.Text = dt.Rows[0]["FullName"].ToString().Trim();
                birthDateTxtBx.Text = dt.Rows[0]["BirthDate"].ToString().Trim();
                phoneNumberTxtBx.Text = dt.Rows[0]["ContactNumber"].ToString().Trim();
                emailTxtBx.Text = dt.Rows[0]["Email"].ToString().Trim();
                addressTxtBx1.Text = dt.Rows[0]["StreetAddress1"].ToString().Trim();
                addressTxtBx2.Text = dt.Rows[0]["StreetAddress2"].ToString().Trim();
                stateDDL.SelectedValue = dt.Rows[0]["State"].ToString().Trim();
                cityTxtBx.Text = dt.Rows[0]["City"].ToString().Trim();
                zipcodeTxtBx.Text = dt.Rows[0]["ZipCode"].ToString().Trim();

                //Maybe you're loading too much information into that grid

                userNameTxtBx.Text = dt.Rows[0]["Username"].ToString().Trim();
                currentPassTxtBx.Text = dt.Rows[0]["Password"].ToString().Trim();
                newPassTxtBx.Text = dt.Rows[0]["ConfirmPass"].ToString().Trim();

                accountStatusLbl.Text = dt.Rows[0]["AccountStatus"].ToString().Trim();

                if (dt.Rows[0]["AccountStatus"].ToString().Trim() == "Active")
                {
                    accountStatusLbl.Attributes.Add("class", "badge badge-bill badge-success");
                }
                else if (dt.Rows[0]["AccountStatus"].ToString().Trim() == "Pending")
                {
                    accountStatusLbl.Attributes.Add("class", "badge badge-bill badge-warning");
                }
                else if (dt.Rows[0]["AccountStatus"].ToString().Trim() == "Inactive")
                {
                    accountStatusLbl.Attributes.Add("class", "badge badge-bill badge-danger");
                }
                else
                {
                    accountStatusLbl.Attributes.Add("class", "badge badge-bill badge-danger");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Getting user date Error!');</script>");
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        private void GetBooksDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM BookStatus WHERE MemberId = '" + Session["Username"].ToString() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                UserDetailsGridView.DataSource = dt;
                UserDetailsGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Getting user date Error!');</script>");
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void UserDetailsGV_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DateTime today = DateTime.Today,
                    dt = Convert.ToDateTime(e.Row.Cells[5].Text);
                    if (today > dt)
                    {
                        e.Row.BackColor = Color.Red;
                    }
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Error from the UserDetailsGV_RowDataBound');</script>");
                //Response.Write("<script>alert('" + ex.Message + "');</script>");
                Response.Redirect("UserLogin.aspx");
            }
        }
    }
}