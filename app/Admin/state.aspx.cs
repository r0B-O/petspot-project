using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_state : System.Web.UI.Page


{
   petshop_class obj = new petshop_class(); 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Admin"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
            obj.connet_petspot();
        if (!IsPostBack)
        {
            getCountry();
            bindstate();
        }
            


    }


    public void bindstate()
    {
        obj.query = string.Format(@"SELECT        state.state_id, state.state, state.country_id, country.country, country.country_id 
FROM state INNER JOIN
                         country ON state.country_id = country.country_id") ;
        obj.getpetspot(obj.query);
        grid_state.DataSource = obj.dt_pet;
        grid_state.DataBind();
    }


    
    public void getCountry()
    {
        obj.query = "select * from country";
        obj.selectpetspot(obj.query);
        ddl_country.DataSource = obj.dr_pet;
        ddl_country.DataTextField = "country";
        ddl_country.DataValueField = "country_id";
        ddl_country.DataBind();
        ddl_country.Items.Insert(0,"--Select--");
        obj.dr_pet.Close();

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {

        obj.query = "select state_id from state where state='" + txt_state.Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into state values('" + txt_state.Text + "','" + ddl_country.SelectedValue + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindstate();
        }
        clearall();
    }
    public void clearall()
    {
        txt_state.Text = "";
        ddl_country.SelectedIndex = -1;
        txt_state.Focus();
        
}
    protected void btn_reset_Click(object sender, EventArgs e)
    {
    Response.Redirect("~/Admin/state.aspx");
}

    protected void grid_state_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grid_state.EditIndex = -1;
        bindstate();
    }

    protected void grid_state_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string s_id = grid_state.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from state where state_id=" + s_id + "";
        obj.insertpetspot(obj.query);
        bindstate();
    }

    protected void grid_state_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sid = grid_state.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_petstate = (TextBox)grid_state.Rows[e.RowIndex].FindControl("txt_state");
        DropDownList ddlcountry = (DropDownList)grid_state.Rows[e.RowIndex].FindControl("ddl_country");
        obj.query = "update state set state='" + txt_petstate.Text + "' , country_id="+ddlcountry.SelectedValue+" where state_id=" + sid + "";
        obj.insertpetspot(obj.query);
        grid_state.EditIndex = -1;
        bindstate();
    }

    protected void grid_state_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_state.EditIndex = e.NewEditIndex;
        bindstate();
    }
}