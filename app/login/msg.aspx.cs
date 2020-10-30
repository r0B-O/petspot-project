using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_msg : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
       
            obj.connet_petspot();
        //obj.query=" select book_id bok

        Console.WriteLine("!!! SUCCESS!!! YOUR BOOKING REFERENCE NO: " + obj.sid + "");
    }
}