using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buyer_payments : System.Web.UI.Page
{

    petshop_class obj = new petshop_class();
    int cartid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
            btn_receipt.Visible = false;
        cartid = Convert.ToInt32(Request.QueryString["cartid"].ToString());
        txt_pay_date.Text = System.DateTime.Now.ToString("MM/dd/yy");
        obj.connet_petspot();
        txt_amt.Text = Application["gr_amt"].ToString();
        

    }
     public void clear()
    {
        ddl_cardtype.SelectedIndex = -1;
        txt_bank.Text = "";
        txt_card_no.Text = "";
        txt_date.Text = "";
        txt_pay_date.Text = "";
        


    }

    public void grandtotal()
    {
        obj.query = "select cart_amt from pet_cart where card_id=" + Session["orderid"] + "";
        obj.selectpetspot(obj.query);
        if(obj.dr_pet.Read())
        {
            txt_amt.Text = Convert.ToString(obj.dr_pet.GetValue(0).ToString());
            obj.dr_pet.Close();


        }
    }


    protected void btn_pay_Click(object sender, EventArgs e)
    {
        obj.query = "insert into payments values(" +cartid+",'" + ddl_cardtype.SelectedValue + "'," + txt_card_no.Text + ",'" + txt_bank.Text + "'," + txt_date.Text + ",'" + System.DateTime.Now.ToString("MM/dd/yy") + "','Transaction Successfull')";
        obj.insertpetspot(obj.query);

        obj.query = "select @@identity";
        obj.getscalarid(obj.query);

        string sid = obj.sid.ToString();

        obj.query = "update pet_cart set status = 'Payment Successful' where cart_id = "+cartid+"";
        obj.insertpetspot(obj.query);

        obj.query = "update pet_cart_det set status ='Check Out Successfully' where cart_id = "+cartid+" ";
        obj.insertpetspot(obj.query);

        Response.Write("<script>alert('Order Placed')</script>");
        Response.Redirect("~/Buyer/receipt.aspx?rid="+sid+"");
        btn_receipt.Visible = true;
        


    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/search_pet.aspx");
       

    }

    protected void btn_receipt_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/receipt.aspx");
    }
}