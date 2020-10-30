using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_showbooking : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();

    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
        DataList1.Visible = true;

        
        }




   


    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/owner/Bookingform.aspx");
    }
}
