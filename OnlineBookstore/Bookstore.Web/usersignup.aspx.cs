using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Bookstore.Web
{
    public partial class Usersignup : Page
    {
        readonly string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            if (CheckUserExists())
            {
                Response.Write("<script>alert('Username taken. Please try a different username');</script>");
            }
            else
            {
                SignUpNewUser();
            } 
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

                SqlCommand cmd = new SqlCommand("SELECT * from UserDetails where Username = '" + usernameTxtBx.Text.Trim() + "';", con);
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

        //user Define method
        void SignUpNewUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO UserDetails (Username, FullName, BirthDate, ContactNumber, Email, StreetAddress1, StreetAddress2, City, State, ZipCode, AccountStatus, Password, ConfirmPass) values (@Username, @FullName, @BirthDate, @ContactNumber, @Email, @StreetAddress1, @StreetAddress2, @City, @State, @ZipCode, @AccountStatus, @Password, @ConfirmPass)", con);

                cmd.Parameters.AddWithValue("@Username", usernameTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@FullName", fullNameTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@BirthDate", birthDateTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNumber", phoneNumberTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", emailTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@StreetAddress1", addressTxtBx1.Text.Trim());
                cmd.Parameters.AddWithValue("@StreetAddress2", addressTxtBx2.Text.Trim());
                cmd.Parameters.AddWithValue("@City", cityTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@State", stateDDL.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ZipCode", zipcodeTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@AccountStatus", "Pending");
                cmd.Parameters.AddWithValue("@Password", passwordTxtBx.Text.Trim());
                cmd.Parameters.AddWithValue("@ConfirmPass", confirmPassTxtBx.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign up successfull. Go to user Login page');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}