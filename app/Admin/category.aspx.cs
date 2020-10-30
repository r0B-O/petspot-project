using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_category : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(HttpContext.Current.Session["Admin"]==null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else

            obj.connet_petspot();
        if(!IsPostBack)
        {
            bindpet();
        }
    }

    public void bindpet()
    {
        obj.query = "select * from category";
        obj.getpetspot(obj.query);
        grid_cat.DataSource = obj.dt_pet;
        grid_cat.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select cat_id from category where cat_name='" + txt_name .Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into category values('" + txt_name.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindpet();

        }
        clearall();
    }
     public void clearall()
    {
        txt_name.Text = "";
        txt_name .Focus();
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/category.aspx");
        
    }

    protected void grid_cat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string pet_id = grid_cat.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from category where cat_id=" + pet_id + "";
        obj.insertpetspot(obj.query);
        bindpet();
    }

    protected void grid_cat_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string petid = grid_cat.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_petcat = (TextBox)grid_cat.Rows[e.RowIndex].FindControl("txt_category");
        obj.query = "update category set cat_name='" + txt_petcat .Text + "' where cat_id=" + petid + "";
        obj.insertpetspot(obj.query);
        grid_cat.EditIndex = -1;
        bindpet();
    }

    protected void grid_cat_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_cat.EditIndex = e.NewEditIndex;
        bindpet();

    }

    protected void grid_cat_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_cat.EditIndex = -1;
        bindpet();
    }
}