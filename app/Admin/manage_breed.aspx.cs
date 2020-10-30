using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manage_breed : System.Web.UI.Page

  
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
        obj.query = "select * from breed";
        obj.getpetspot(obj.query);
        grid_breed.DataSource = obj.dt_pet;
        grid_breed.DataBind();
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select breed_id from breed where brd='" + txt_breed.Text + "'";
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into breed values('" + txt_breed.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindpet();
        }
        clear();
    }


    public void clear()
    {

        txt_breed.Text = "";
        txt_breed.Focus();
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/manage_breed.aspx");

    }

    protected void grid_breed_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string petid = grid_breed.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_petbrd = (TextBox)grid_breed.Rows[e.RowIndex].FindControl("txt_brd");
        obj.query = "update breed set brd='" + txt_petbrd.Text + "' where breed_id=" + petid + "";
        obj.insertpetspot(obj.query);
        grid_breed.EditIndex = -1;
        bindpet();
    }

    protected void grid_breed_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string pet_id = grid_breed.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from breed where breed_id=" + pet_id + "";
        obj.insertpetspot(obj.query);
        bindpet();
    }

    protected void grid_breed_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_breed.EditIndex = -1;
        bindpet();
    }

    protected void grid_breed_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_breed.EditIndex = e.NewEditIndex;
        bindpet();

    }
}
