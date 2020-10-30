using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_pet_cart : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    int grand=0, tax, total, buyer;
   
    protected void Page_Load(object sender, EventArgs e)

    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
        {
            Panel1.Visible = false;
            buyer = Convert.ToInt32(Session["buyer"].ToString());
        }
        obj.connet_petspot();
       
        if (!IsPostBack)
        {
            bindcart();
            getState();
            getCountry();
           
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
    public void getCountry()
    {
        obj.query = "select * from country";
        obj.selectpetspot(obj.query);
        ddl_country.DataSource = obj.dr_pet;
        ddl_country.DataTextField = "country";
        ddl_country.DataValueField = "country_id";
        ddl_country.DataBind();
        ddl_country.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }
    public void getState()
    {
        obj.query = "select * from state";
        obj.selectpetspot(obj.query);
        ddl_state.DataSource = obj.dr_pet;
        ddl_state.DataTextField = "state";
        ddl_state.DataValueField = "state_id";
        ddl_state.DataBind();
        ddl_state.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }


    public void grandtotal()
    {
       
        obj.query = "select sum(amt) from pet_cart_det where buyer_id=" + buyer + " and status = 'Added to Cart'";
        obj.selectpetspot(obj.query);
        if(obj.dr_pet.Read())
        {
            lbl_sub.Text = Convert.ToString(obj.dr_pet.GetValue(0).ToString());
            obj.dr_pet.Close();

            grand = Convert.ToInt32(lbl_sub.Text);
            tax=grand*12/100;
            lbl_tax.Text = Convert.ToString(tax);
            total = tax + grand;
            lbl_grand.Text = Convert.ToString(total);

        }
    }



  

    protected void btn_search_more_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/search_pet.aspx");
    }

    protected void grid_cart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
         string s_id = grid_cart.DataKeys[e.RowIndex].Value.ToString();
         obj.query = "delete from pet_cart_det where  cart_detid=" + s_id + "";
         obj.insertpetspot(obj.query);
         bindcart();
         grandtotal();

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

        //obj.query = "select * from pet_cart where buyer_id = " + buyer + " and status = 'NEW ORDER'";
        //obj.selectpetspot(obj.query);
        //if (obj.dr_pet.Read())
        //{
        //    obj.dr_pet.Close();
            obj.query = "delete from pet_cart where buyer_id = " + buyer + " and status = 'NEW ORDER'";
            obj.insertpetspot(obj.query);
        //}
        //obj.dr_pet.Close();
        obj.query = "insert into pet_cart values("+ Session["buyer"] + ",'" + System.DateTime.Now.ToString("MM/dd/yy") + "'," + lbl_tax.Text + ",0," + lbl_grand.Text + ",'NEW ORDER')";
        obj.insertpetspot(obj.query);

        obj.query = "select @@identity";
        obj.getscalarid(obj.query);

       
        lblcartid.Text = obj.sid.ToString();

        obj.query = "update pet_cart_det set cart_id = " + lblcartid.Text + " where buyer_id = " + buyer + " and status = 'Added to Cart'";
        obj.insertpetspot(obj.query);

        Panel1.Visible = true;
        btn_checkout.Visible = false;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Application["gr_amt"] = lbl_grand.Text;
        obj.query = "select * from delivery_address where cont_name='" + txt_name.Text + "' and cont_phone=" + txt_phn.Text + "";
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('Already Exist')</script>");
            obj.dr_pet.Close();

        }

       else 
    
        {
            obj.dr_pet.Close();
            obj.query = "insert into delivery_address values( "+lblcartid.Text+",'" + txt_address.Text + "'," + txt_postal.Text + ",'" + txt_city.Text + "'," + ddl_state.SelectedValue + "," + ddl_country.SelectedValue + ",'" + txt_name.Text + "'," + txt_phn.Text + ")";
            obj.insertpetspot(obj.query);

        }
        Response.Redirect("~/Buyer/payments.aspx?cartid="+lblcartid.Text+"");
        clear();
    }
    public void clear()
    {
        

        txt_address.Text = "";
        txt_postal.Text = "";
        txt_city.Text = "";
        ddl_country.SelectedIndex = -1;
        ddl_state.SelectedIndex = -1;
        txt_name.Text = "";
        txt_phn.Text = ""; 



    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/pet_cart.aspx");
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/search_pet.aspx");

    }
}