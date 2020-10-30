using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_shopgrid : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            

            
            bindshop();
            //getowner();
        }

    }


    public void bindshop()
    {
        obj.query = string.Format(@"SELECT            pet_shop.shop_id, pet_shop.lic_no, pet_shop.owner_id, pet_shop.shop_name, pet_shop.country_id, pet_shop.state_id, pet_shop.loc, pet_shop.mob, pet_shop.phone, pet_shop.land_mark, pet_shop.email, pet_shop.est_date, 
                         owner.owner_id, owner.name, state.state_id, state.state, country.country_id A, country.country
FROM            pet_shop INNER JOIN
                         owner ON pet_shop.owner_id = owner.owner_id INNER JOIN
                         state ON pet_shop.state_id = state.state_id INNER JOIN
                         country ON pet_shop.country_id = country.country_id where owner.owner_id=" + Session["Owner"] + "");
        obj.getpetspot(obj.query);
        grid_shop.DataSource = obj.dt_pet;
        grid_shop.DataBind();

    }

    protected void grid_shop_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_shop.EditIndex = -1;
        bindshop();
    }

    protected void grid_shop_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string s_id = grid_shop.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from pet_shop where shop_id=" + s_id + "";
        obj.insertpetspot(obj.query);
        bindshop();

    }

    protected void grid_shop_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_shop.EditIndex = e.NewEditIndex;
        bindshop();
    }

    protected void grid_shop_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sid = grid_shop.DataKeys[e.RowIndex].Value.ToString();
        TextBox txtname = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_shop");
        TextBox txtlic = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_lic");
        DropDownList ddlowner = (DropDownList)grid_shop.Rows[e.RowIndex].FindControl("ddl_owner");
        DropDownList ddlcountry = (DropDownList)grid_shop.Rows[e.RowIndex].FindControl("ddl_country");
        DropDownList ddlstate = (DropDownList)grid_shop.Rows[e.RowIndex].FindControl("ddl_state");
        TextBox txtlocation = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_location");



        TextBox txtland = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_land");
        TextBox txtmob = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_mob");
        TextBox txtphn = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_phn");
        TextBox txtest = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_est");
        TextBox txtemail = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_email");
        obj.query = "update pet_shop set lic_no=" + txtlic.Text + " , owner_id=" + ddlowner.SelectedValue + ",shop_name='" + txtname.Text + "', country_id=" + ddlcountry.SelectedValue + ",state_id=" + ddlstate.SelectedValue + " ,loc='" + txtlocation.Text + "' , mob=" + txtmob.Text + ", phone = " + txtphn.Text + " , land_mark = '" + txtland.Text + "',email = '" + txtemail.Text + "' where shop_id=" + sid + "";
        obj.insertpetspot(obj.query);
        grid_shop.EditIndex = -1;
        bindshop();
    }
}