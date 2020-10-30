using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookinggrid : System.Web.UI.Page
{

    petshop_class obj = new petshop_class();
    int buyer;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
        {
            obj.connet_petspot();
            buyer = Convert.ToInt32(Session["buyer"]);
        }
        bindbook();

        grid_payments.Visible = true;
    }



    public void bindbook()
    {
        obj.query = string.Format(@"SELECT        pet_cart_det.*, pet_cart.*, pet.pet_id AS Expr1, pet.pet_name, buyer.buyer_id AS Expr2, buyer.name
FROM            pet_cart_det INNER JOIN
                         pet_cart ON pet_cart_det.cart_id = pet_cart.cart_id INNER JOIN
                         pet ON pet_cart_det.pet_id = pet.pet_id INNER JOIN
                         buyer ON pet_cart_det.buyer_id = buyer.buyer_id INNER JOIN
                         buyer AS buyer_1 ON pet_cart_det.buyer_id = buyer_1.buyer_id where buyer.buyer_id=" + Session["buyer"] + "");
        obj.getpetspot(obj.query);
        grid_payments.DataSource = obj.dt_pet;
        grid_payments.DataBind();


    }

    //public void getshow()
    //{
    //    obj.query = "select show_id,show_title from dog_show";
    //    obj.selectpetspot(obj.query);
    //    DropDownList1.DataSource = obj.dr_pet;
    //    DropDownList1.DataTextField = "show_title";
    //    DropDownList1.DataValueField = "show_id";
    //    DropDownList1.DataBind();
    //    DropDownList1.Items.Insert(0, "--Select--");
    //    obj.dr_pet.Close();

    //}

    //protected void grid_book_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    grid_book1.EditIndex = -1;
    //    bindbook();

    //}

    //protected void grid_book_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string s_id = grid_book1.DataKeys[e.RowIndex].Value.ToString();
    //    obj.query = "delete from book_show where book_id=" + s_id + "";
    //    obj.insertpetspot(obj.query);
    //    bindbook();
    //}

    //protected void grid_book_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    grid_book1.EditIndex = e.NewEditIndex;
    //    bindbook();
    //}


    // public void bindshow()
    //{
    //    obj.query = "select * from book_show where show_id=" + DropDownList1.SelectedValue + "";
    //    obj.getpetspot(obj.query);
    //    grid_book1.DataSource = obj.dt_pet;
    //    grid_book1.DataBind();
    //}
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    bindshow();
    //}


}