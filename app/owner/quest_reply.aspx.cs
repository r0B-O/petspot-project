using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_quest_reply : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    int owner;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Owner"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
        {
            owner = Convert.ToInt32(Session["Owner"].ToString());
            obj.connet_petspot();
        }
        txt_date.Text = System.DateTime.Now.ToString("MM/dd/yy");

        
        if (!IsPostBack)
        {
            BindQuestion();
        }



    }
void BindQuestion()
    {
        obj.query = @"select ask_quest.* , pet.pet_name from ask_quest 
                        inner join pet on pet.pet_id = ask_quest.pet_id
where pet.owner_id = "+owner+" ";
        obj.getpetspot(obj.query);
        GVQuestions.DataSource = obj.dt_pet;
        GVQuestions.DataBind();
    }



   
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select * from quest_reply where quest_id = "+lblqstid.Text+"";
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Replied**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into quest_reply values(" + lblqstid.Text + ",'" + txt_rply.Text + "',"+owner+",'" + System.DateTime.Now.ToString("MM/dd/yy") + "')";
            obj.insertpetspot(obj.query);
            PanelReply.Visible = false;
            Response.Write("<script>alert('**inserted**')</script>");
        }
        Response.Redirect("~/owner/quest_reply");
    }
    
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/owner/quest_reply.aspx");
    }

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

    protected void GVQuestions_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.Equals("reply"))
        {
            int iid = Convert.ToInt32(e.CommandArgument);
            int qid = Convert.ToInt32(GVQuestions.DataKeys[iid].Values[0]);
            obj.query = "select pet.pet_name, ask_quest.quest_id from ask_quest inner join pet on pet.pet_id = ask_quest.pet_id where ask_quest.quest_id = "+qid+"";
            obj.selectpetspot(obj.query);
            if(obj.dr_pet.Read())
            {
                txtpettname.Text = obj.dr_pet[0].ToString();
                obj.dr_pet.Close();
            }
            
            lblqstid.Text = "" + qid;
            PanelReply.Visible = true;
        }
    }
}