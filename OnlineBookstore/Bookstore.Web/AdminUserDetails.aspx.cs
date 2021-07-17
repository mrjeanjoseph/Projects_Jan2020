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
    public partial class adminprofile : System.Web.UI.Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void SearchLBtn_Click(object sender, EventArgs e)
        {
            GetUserById();
        }

        protected void UserActiveLBtn_Click(object sender, EventArgs e)
        {
            UpdateUserStatusById("Active");
        }

        protected void UserPendingLBtn_Click(object sender, EventArgs e)
        {
            UpdateUserStatusById("Pending");
        }

        protected void UserInactiveLBtn_Click(object sender, EventArgs e)
        {
            UpdateUserStatusById("Inactive");
        }

        protected void DeleteUserLBtn_Click(object sender, EventArgs e)
        {
            if (CheckUserExists())
            {
                DeleteUserById();
            }
            else
            {
                Response.Write("<script>alert('ID Feild cannot be blank.');</script>");
            }
        }

        private void DeleteUserById()
        {
            if (CheckUserExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE UserDetails WHERE Username = '" + userIdTxtBx.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('User Detail Deleted successfully.');</script>");
                    ClearForm();
                    GridView1.DataBind();
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

        private void GetUserById() // User defined function
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM UserDetails WHERE Username = '" + userIdTxtBx.Text.Trim() + "'", con);

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        fullNameTxtBx.Text = dr.GetValue(1).ToString();
                        birthDateTxtBx.Text = dr.GetValue(2).ToString();
                        contactNumTxtBx.Text = dr.GetValue(3).ToString();
                        emailTxtBx.Text = dr.GetValue(4).ToString();
                        addressTxtBx1.Text = dr.GetValue(5).ToString();
                        addressTxtBx2.Text = dr.GetValue(6).ToString();
                        cityTxtBx.Text = dr.GetValue(7).ToString();
                        stateTxtBx.Text = dr.GetValue(8).ToString();
                        zipCodeTxtBx.Text = dr.GetValue(9).ToString();
                        statusTxtBx.Text = dr.GetValue(10).ToString();
                    }
                }
                else
                {
                    Response.Write("<script>alert('User Id entered is invalid');</script>");
                    ClearForm();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void UpdateUserStatusById(string status)
        {
            if (CheckUserExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("UPDATE UserDetails SET AccountStatus = '" + status + "' WHERE Username = '" + userIdTxtBx.Text.Trim() + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Member status updated');</script>");
                    ClearForm();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('ID Feild cannot be blank.');</script>");
            }
        }

        private void ClearForm()
        {

            fullNameTxtBx.Text = "";
            birthDateTxtBx.Text = "";
            contactNumTxtBx.Text = "";
            emailTxtBx.Text = "";
            addressTxtBx1.Text = "";
            addressTxtBx2.Text = "";
            cityTxtBx.Text = "";
            stateTxtBx.Text = "";
            zipCodeTxtBx.Text = "";
            statusTxtBx.Text = "";

            GridView1.DataBind();
        }

        bool CheckUserExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from UserDetails where Username = '" + userIdTxtBx.Text.Trim() + "';", con);
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
    }
}