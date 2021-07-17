using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookstore.Web
{
    public partial class ViewBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            inventoryDetailGV.DataBind();
        }

        protected void inventoryDetailGV_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}