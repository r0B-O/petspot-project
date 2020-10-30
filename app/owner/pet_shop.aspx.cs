using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_pet_shop : System.Web.UI.Page
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
            getCountry();
            
            getowner();
            bindshop();
            //getowner();
        }

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

    public void getstate()
    {
        obj.query = "select state,state_id from state";
        obj.selectpetspot(obj.query);
        ddl_state.DataSource = obj.dr_pet;
        ddl_state.DataTextField = "state";
        ddl_state.DataValueField = "state_id";
        ddl_state.DataBind();
        ddl_state.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }
    public void getowner()
    {
        obj.query = "select name,owner_id from owner";
        obj.selectpetspot(obj.query);
        ddl_owner.DataSource = obj.dr_pet;
        ddl_owner.DataTextField = "name";
        ddl_owner.DataValueField = "owner_id";
        ddl_owner.DataBind();
        ddl_owner.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }

    public void bindshop()
    {
        obj.query = string.Format(@"SELECT            pet_shop.shop_id, pet_shop.lic_no, pet_shop.owner_id, pet_shop.shop_name, pet_shop.country_id, pet_shop.state_id, pet_shop.loc, pet_shop.mob, pet_shop.phone, pet_shop.land_mark, pet_shop.email, pet_shop.est_date, 
                         owner.owner_id, owner.name, state.state_id, state.state, country.country_id A, country.country
FROM            pet_shop INNER JOIN
                         owner ON pet_shop.owner_id = owner.owner_id INNER JOIN
                         state ON pet_shop.state_id = state.state_id INNER JOIN
                         country ON pet_shop.country_id = country.country_id");
        obj.getpetspot(obj.query);
        grid_shop.DataSource = obj.dt_pet;
        grid_shop.DataBind();
    
}

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select shop_id from pet_shop where lic_no=" + txt_lic.Text + "  and shop_name='"+txt_shop.Text+"'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into pet_shop values(" + txt_lic.Text + "," + ddl_owner.SelectedValue + ",'" + txt_shop.Text + "'," + ddl_country.SelectedValue + "," + ddl_state.SelectedValue + ",'" + txt_loc.Text + "'," + txt_mob.Text + "," + txt_phn.Text + ",'" + txt_land.Text + "','" + txt_email.Text + "','" + txt_est.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindshop();
        }
        clearall();

    }


    public void clearall()
    {
        txt_lic.Text = "";
        ddl_owner.SelectedIndex = -1;
        ddl_country.SelectedIndex = -1;
        ddl_state.SelectedIndex = -1;
        txt_shop.Text = "";
        txt_loc.Text = "";
        txt_land.Text = "";
        txt_phn.Text = "";
        txt_email.Text = "";
        txt_est.Text = "";
        txt_shop.Focus();

    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/owner/ ownerMasterPage.master");
    }



    protected void grid_shop_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string s_id = grid_shop.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from pet_shop where shop_id=" + s_id + "";
        obj.insertpetspot(obj.query);
        bindshop();

    }

    protected void grid_shop_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_shop.EditIndex = -1;
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
        DropDownList ddlowner= (DropDownList)grid_shop.Rows[e.RowIndex].FindControl("ddl_owner");
        DropDownList ddlcountry = (DropDownList)grid_shop.Rows[e.RowIndex].FindControl("ddl_country");
        DropDownList ddlstate = (DropDownList)grid_shop.Rows[e.RowIndex].FindControl("ddl_state");
        TextBox txtlocation = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_location");
        

       
        TextBox txtland = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_land");
        TextBox txtmob = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_mob");
        TextBox txtphn = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_phn");
        TextBox txtest = (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_est");
        TextBox txtemail= (TextBox)grid_shop.Rows[e.RowIndex].FindControl("txt_email");
        obj.query = "update pet_shop set lic_no=" + txtlic.Text + " , owner_id=" + ddlowner.SelectedValue + ",shop_name='" + txtname.Text + "', country_id=" + ddlcountry.SelectedValue + ",state_id=" + ddlstate.SelectedValue + " ,loc='" + txtlocation.Text + "' , mob=" + txtmob.Text + ", phone = " + txtphn.Text + " , land_mark = '" + txtland.Text + "',email = '" + txtemail.Text + "' where shop_id=" + sid + "";
        obj.insertpetspot(obj.query);
       grid_shop.EditIndex = -1;
        bindshop();
    }



    protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
    {
        getstate();
    }
}