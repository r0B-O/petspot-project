using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

   
   public partial class Buyer_receipt : System.Web.UI.Page

    {
        petshop_class obj = new petshop_class();
        int rid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
        {
            obj.connet_petspot();
        }
        rid = Convert.ToInt32(Request.QueryString["rid"].ToString());
        

        lbl_amount.Text = Application["gr_amt"].ToString();

        string qu = "SELECT * FROM payments WHERE pay_id = "+rid+"";
        obj.selectpetspot(qu);
        obj.dr_pet.Read();
        lbl_id.Text = obj.dr_pet["pay_id"].ToString();
        lbl_date.Text = obj.dr_pet["pay_date"].ToString();
        lbl_status.Text = obj.dr_pet["Status"].ToString();
        obj.dr_pet.Close();
    }





        protected void print_Click(object sender, EventArgs e)
        {
          
        }
    
}
