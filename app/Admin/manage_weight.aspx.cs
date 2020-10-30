using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manage_weight : System.Web.UI.Page
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
        if(!IsPostBack)
        {
            bindweight();
        }
    }

    public void bindweight()
    {
        obj.query = "select * from weight";
        obj.getpetspot(obj.query);
        grid_weight.DataSource = obj.dt_pet;
        grid_weight.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select wt_id from weight where wt='" + txt_wt.Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into weight values('" + txt_wt.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindweight();

        }
        clearall();
    }
    public void clearall()
    {
        txt_wt.Text = "";
        txt_wt.Focus();
       
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/manage_weight.aspx");
    }

    protected void grid_weight_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string wtid = grid_weight.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_wt = (TextBox)grid_weight.Rows[e.RowIndex].FindControl("txt_weight");
        obj.query = "update weight set wt='" + txt_wt.Text + "' where wt_id=" + wtid + "";
        obj.insertpetspot(obj.query);
        grid_weight.EditIndex = -1;
        bindweight();
    }

    protected void grid_weight_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_weight.EditIndex = e.NewEditIndex;
        bindweight();
    }

    protected void grid_weight_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string weight_id = grid_weight.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from weight where wt_id=" + weight_id + "";
        obj.insertpetspot(obj.query);
        bindweight();
    }

    protected void grid_weight_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_weight.EditIndex = -1;
        bindweight();
    }
}