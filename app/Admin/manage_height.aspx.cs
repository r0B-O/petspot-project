using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manage_height : System.Web.UI.Page
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
        obj.query = "select * from height";
        obj.getpetspot(obj.query);
        grid_height.DataSource = obj.dt_pet;
        grid_height.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select ht_id from height where ht='" + txt_ht.Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into height values('" + txt_ht.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindpet();
        }
        clearall();
    }
    public void clearall()
    {
        txt_ht.Text = "";
        txt_ht.Focus();
    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Admin/manage_height.aspx");
    }

    protected void grid_height_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string height_id = grid_height.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from height where ht_id=" + height_id + "";
        obj.insertpetspot(obj.query);
        bindpet();
    }

    protected void grid_height_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string htid = grid_height.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_petcat = (TextBox)grid_height.Rows[e.RowIndex].FindControl("txt_ht");
        obj.query = "update height set ht='" + txt_petcat.Text + "' where ht_id=" + htid + "";
        obj.insertpetspot(obj.query);
        grid_height.EditIndex = -1;
        bindpet();
    }

    protected void grid_height_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_height.EditIndex = e.NewEditIndex;
        bindpet();

    }

    protected void grid_height_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

        grid_height.EditIndex = -1;
        bindpet();
    }
}