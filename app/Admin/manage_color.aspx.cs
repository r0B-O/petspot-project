using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manage_color : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
        if (!IsPostBack)
        {
            bindpet();
        }
    }
    public void bindpet()
    {
        obj.query = "select * from color";
        obj.getpetspot(obj.query);
        grid_color.DataSource = obj.dt_pet;
        grid_color.DataBind();
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select color_id from color where col='" + txt_color.Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into color values('" + txt_color.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindpet();
        }

        Response.Redirect("~/Admin/manage_color.aspx");
        clearall();


    }
     public void clearall()
    {
        txt_color.Text = "";
        txt_color.Focus();
    }

    protected void btn_reset_Click1(object sender, EventArgs e)
    
    {
        Response.Redirect("~/Admin/manage_color.aspx");

    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string petid = grid_color.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_petcat = (TextBox)grid_color.Rows[e.RowIndex].FindControl("txt_color");
        obj.query = "update color set col='" + txt_petcat.Text + "' where color_id=" + petid + "";
        obj.insertpetspot(obj.query);
        grid_color.EditIndex = -1;
        bindpet();
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_color.EditIndex = e.NewEditIndex;
        bindpet();

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string pet_id = grid_color.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from  color where color_id=" + pet_id + "";
        obj.insertpetspot(obj.query);
        bindpet();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_color.EditIndex = -1;
        bindpet();
    }
}
