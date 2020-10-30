using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_pet_cart : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    int grand, tax, total,buyer;
   
    protected void Page_Load(object sender, EventArgs e)

    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
       
            //Panel1.Visible = false;
            
         
        obj.connet_petspot();
        buyer = Convert.ToInt32(Session["buyer"].ToString());
        bindcart();
        if (lbl_sub.Text == "Label")
        {
            Panel2.Visible = false;
            Panel3.Visible = true;
        }
        else
            Panel3.Visible = false;
    
            Panel2.Visible = true;
        if (!IsPostBack)
        {
            bindcart();
            //getState();
            //getCountry();
           
        }


    }

    

    public void bindcart()
    {
        obj.query = string.Format(@"SELECT        pet_cart_det.cart_detid, pet_cart_det.cart_id, pet_cart_det.pet_id, pet_cart_det.qty, pet_cart_det.amt, pet.pet_id , pet.pet_name, pet.price
FROM            pet_cart_det INNER JOIN
                         pet ON pet_cart_det.pet_id = pet.pet_id where pet_cart_det.buyer_id =" + buyer + " and pet_cart_det.status = 'Added to Cart'");
        obj.getpetspot(obj.query);
        grid_cart.DataSource = obj.dt_pet;
        grid_cart.DataBind();
        grandtotal();
    }
  
    public void grandtotal()
    {

        obj.query = "select * from pet_cart_det where buyer_id=" + buyer + " and status = 'Added to Cart'";
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            obj.dr_pet.Close();
            obj.query = "select sum(amt) from pet_cart_det where buyer_id=" + buyer + " and status = 'Added to Cart'";
            obj.selectpetspot(obj.query);
            if (obj.dr_pet.Read())
            {
                lbl_sub.Text = Convert.ToString(obj.dr_pet[0].ToString());
                obj.dr_pet.Close();

                grand = Convert.ToInt32(lbl_sub.Text.ToString());
                tax = grand * 12 / 100;
                lbl_tax.Text = Convert.ToString(tax);
                total = tax + grand;
                lbl_grand.Text = Convert.ToString(total);
            }
      
        }
        obj.dr_pet.Close();
        
    }



  

    protected void btn_search_more_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/search_pet.aspx");
    }

    protected void grid_cart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string s_id = grid_cart.DataKeys[e.RowIndex].Value.ToString();
         obj.query = "delete from pet_cart where buyer_id = " + buyer + " and status = 'NEW ORDER'";
        obj.insertpetspot(obj.query);
          bindcart();
        //if(lbl_sub.Text=="Label")
        //{
        //    Panel2.Visible = false;
        //    Panel3.Visible = true;
        //}
    }

    protected void grid_cart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Up_qty")
        {
            string qu;
            int price, amount;
            int id = Convert.ToInt32(grid_cart.DataKeys[Convert.ToInt32(e.CommandArgument.ToString())].Value.ToString());
            TextBox quan = (TextBox)grid_cart.Rows[Convert.ToInt32(e.CommandArgument.ToString())].FindControl("txt_qty");
            Label pri = (Label)grid_cart.Rows[Convert.ToInt32(e.CommandArgument.ToString())].FindControl("Label2");
            Label sub = (Label)grid_cart.Rows[Convert.ToInt32(e.CommandArgument.ToString())].FindControl("Label3");
            price = Convert.ToInt32(pri.Text);
            amount = price * Convert.ToInt32(quan.Text);
            qu = "update pet_cart_det set qty=" + quan.Text + ",amt=" + amount + " where cart_detid=" + id + "";
            obj.insertpetspot(qu);
            grid_cart.EditIndex = -1;
            bindcart();
        }
}
   protected void btn_checkout_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Buyer/pet_cart.aspx");

    }

    protected void btn_shop_Click(object sender, EventArgs e)
    {

         Response.Redirect("~/Buyer/Search_pet.aspx");

    }
}