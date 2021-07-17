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
    public partial class Userlogin : Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void UserLoginLBtn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM UserDetails WHERE Username = '" + userNameTxtBx.Text.Trim() + "' AND Password = '" + passwordTxtBx.Text.Trim() + "'", con);
                SqlDataReader readDB = cmd.ExecuteReader();
                if (readDB.HasRows)
                {
                    while (readDB.Read())
                    {
                        Response.Write("<script>alert('Login Successfull!');</script>");

                        Session["UserLogedIn"] = userNameTxtBx.Text.Trim();
                        Session["Username"] = readDB.GetValue(0).ToString();
                        Session["FullName"] = readDB.GetValue(1).ToString();
                        Session["AccountStatus"] = readDB.GetValue(11).ToString();
                    }
                    Response.Redirect("Homepage.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Username and password entered is invalid');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" +ex.Message+ "');</script>");
            }
        }

        protected void UserSignupLBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignup.aspx");
        }
    }
}