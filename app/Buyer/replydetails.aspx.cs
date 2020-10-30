using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_quest_reply : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    int buyer;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
        {
            obj.connet_petspot();
            buyer = Convert.ToInt32(Session["buyer"]);
        }
       

        
        if (!IsPostBack)
        {
           
            bindreply();
        }



    }

//public void getquestion()
//    {
//        obj.query = "select quest_id , question from ask_quest";
//        obj.selectpetspot(obj.query);
//        ddl_quest.DataSource = obj.dr_pet;
//        ddl_quest.DataTextField = "question";
//        ddl_quest.DataValueField = "quest_id";
//        ddl_quest.DataBind();
//        ddl_quest.Items.Insert(0, "--Select--");
//        obj.dr_pet.Close();
//    }


    public void bindreply()
    {
        obj.query = @"select ask_quest.*, pet.pet_name, category.cat_name,quest_reply.reply from ask_quest
                        inner join pet on pet.pet_id = ask_quest.pet_id
                        inner join category on category.cat_id = pet.cat_id
                        inner join quest_reply on quest_reply.quest_id = ask_quest.quest_id
                            where ask_by = " + buyer+"";
        
        obj.getpetspot(obj.query);
        grid_reply.DataSource = obj.dt_pet;
        grid_reply.DataBind();
    }
    //protected void btn_submit_Click(object sender, EventArgs e)
    //{
    //    obj.query = "select quer_id from quest_reply where reply ='" + txt_rply.Text + "'";
    //    obj.selectpetspot(obj.query);
    //    if (obj.dr_pet.Read())
    //    {
    //        Response.Write("<script>alert('**Already Exist**')</script>");
    //        obj.dr_pet.Close();
    //    }
    //    else
    //    {
    //        obj.dr_pet.Close();
    //        obj.query = "insert into quest_reply values('" + ddl_quest.SelectedValue + "','" + txt_rply.Text + "','" + txt_r_by.Text + "','" + System.DateTime.Now.ToString("MM/dd/yy") + "')";
    //        obj.insertpetspot(obj.query);
    //        Response.Write("<script>alert('**inserted**')</script>");
    //        bindreply();
    //    }

    //    clear();
    //}
    //void clear()
    //{
    //    ddl_quest.SelectedIndex = -1;
    //    txt_rply.Text = "";
    //    txt_r_by.Text = "";
       
        

    //}
    //protected void btn_reset_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/owner/quest_reply.aspx");
    //}

    //protected void grid_reply_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string s_id = grid_reply.DataKeys[e.RowIndex].Value.ToString();
    //    obj.query = "delete from quest_reply where quer_id=" + s_id + "";
    //    obj.insertpetspot(obj.query);
    //    bindreply();
    //}

    //protected void grid_reply_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    grid_reply.EditIndex = e.NewEditIndex;
    //    bindreply();
    //}

    //protected void grid_reply_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    grid_reply.EditIndex = -1;
    //    bindreply();
    //}

    //protected void grid_reply_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{

    //    string sid = grid_reply.DataKeys[e.RowIndex].Value.ToString();
    //    DropDownList ddlques = (DropDownList)grid_reply.Rows[e.RowIndex].FindControl("ddl_quest");
    //    TextBox txtreply = (TextBox)grid_reply.Rows[e.RowIndex].FindControl("txt_reply");
    //    TextBox txtby = (TextBox)grid_reply.Rows[e.RowIndex].FindControl("txt_by");

    //    obj.query = "update quest_reply set quest_id=" + ddlques.SelectedValue + " , reply='" + txtreply.Text + "', replied_by='"+txtby.Text+"' where quer_id=" + sid + "";
    //    obj.insertpetspot(obj.query);
    //    grid_reply.EditIndex = -1;
    //    bindreply();

    //}
}