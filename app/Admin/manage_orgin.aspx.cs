using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manage_orgin : System.Web.UI.Page
    
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
            bindorgin();
        }
    }
    public void bindorgin()
    {
        obj.query = "select * from orgin";
        obj.getpetspot(obj.query);
        grid_orgin.DataSource = obj.dt_pet;
        grid_orgin.DataBind();
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select orgin_id from orgin where orgin='" + txt_orgin + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into orgin values('" + txt_orgin.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            bindorgin();
        }
        clearall();

    }

    public void clearall()
    {
        txt_orgin.Text = "";
        txt_orgin.Focus();
       
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/manage_orgin.aspx");
    }

    protected void grid_orgin_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string orgid = grid_orgin.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_orgin = (TextBox)grid_orgin.Rows[e.RowIndex].FindControl("txt_org");
        obj.query = "update orgin set orgin='" + txt_orgin.Text + "' where orgin_id=" + orgid + "";
        obj.insertpetspot(obj.query);
        grid_orgin.EditIndex = -1;
        bindorgin();
    }

    protected void grid_orgin_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_orgin.EditIndex = e.NewEditIndex;
        bindorgin();
    }

    protected void grid_orgin_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string org_id = grid_orgin.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from orgin where orgin_id=" + org_id + "";
        obj.insertpetspot(obj.query);
        bindorgin();
    }

    protected void grid_orgin_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        
        grid_orgin.EditIndex = -1;
        bindorgin();
    }
}