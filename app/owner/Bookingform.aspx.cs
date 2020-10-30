using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bookingform : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Owner"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
            obj.connet_petspot();
        txt_date.Text = System.DateTime.Now.ToString("MM/dd/yy");
        if (!IsPostBack)
        {
            getshow();
            //bindbook();
            
        }

    }

//    public void bindbook()
//    {
//        obj.query = string.Format(@"SELECT           dog_show.show_id, dog_show.status, dog_show.show_to_date, dog_show.show_title, book_show.book_id, book_show.show_id AS Expr1, book_show.name, book_show.apply_date, book_show.phone
//FROM            dog_show INNER JOIN
//                         book_show ON dog_show.show_id = book_show.show_id");
//        obj.getpetspot(obj.query);
//        ddl_show.DataSource = obj.dt_pet;
//        ddl_show.DataBind();


//    }

    public void getshow()
    {
        obj.query = "select show_id,show_title from dog_show";
        obj.selectpetspot(obj.query);
        ddl_show.DataSource = obj.dr_pet;
        ddl_show.DataTextField = "show_title";
        ddl_show.DataValueField = "show_id";
        ddl_show.DataBind();
        ddl_show.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();


    }



    protected void btn_booking_Click(object sender, EventArgs e)
    {

        obj.query = "insert into book_show values(" + ddl_show.SelectedValue + " ,'" + System.DateTime.Now.ToString("MM/dd/yy") + "','" + txt_name.Text + "','" + txt_phn.Text + "' )";

        obj.insertpetspot(obj.query);
        obj.query = "select @@identity";
        obj.getscalarid(obj.query);
        Response.Write("<script>alert('** !!! SUCCESS!!! YOUR BOOKING REFERENCE NO: "+obj.sid+"**')</script>");
        ddl_show.SelectedIndex = -1;
        
        
        txt_date.Text = "";
       txt_name.Text = "";
        txt_phn.Text = "";
        Response.Redirect("~/owner/Bookingform.aspx");



    }


    protected void btn_rest_Click(object sender, EventArgs e)
    {
        ddl_show.SelectedIndex = -1;
        
        txt_date.Text = "";
        txt_name.Text = "";
        txt_phn.Text = "";
    }
    
   
}