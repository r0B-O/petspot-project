using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manaage_country : System.Web.UI.Page
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
            bindpet();
        }
    }

    public void bindpet()
    {
        obj.query = "select * from country";
        obj.getpetspot(obj.query);
        grid_country.DataSource = obj.dt_pet;
        grid_country.DataBind();
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select country_id from country where country='" + txt_country.Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            obj.dr_pet.Close();

            Response.Write("<script>alert('**Already Exist**')</script>");
            
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into country values('" + txt_country.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
        bindpet();
    }
        clearall();
    }

    public void clearall()
    {
        txt_country.Text = "";
        txt_country.Focus();
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/manage_country");
    }

    protected void grid_country_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string pet_id = grid_country.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from country where country_id=" + pet_id + "";
        obj.insertpetspot(obj.query);
        bindpet();
    }

    protected void grid_country_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_country.EditIndex = -1;
        bindpet();
    }

    protected void grid_country_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_country.EditIndex = e.NewEditIndex;
        bindpet();
    }

    protected void grid_country_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string petid = grid_country.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_petcat = (TextBox)grid_country.Rows[e.RowIndex].FindControl("txt_coun");
        obj.query = "update country set country='" + txt_petcat.Text + "' where country_id=" + petid + "";
        obj.insertpetspot(obj.query);
        grid_country.EditIndex = -1;
        bindpet();

    }
}