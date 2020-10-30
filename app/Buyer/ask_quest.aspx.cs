using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buyer_ask_quest : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    int pid , buyer;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
            
            obj.connet_petspot();
        buyer= Convert.ToInt32(Session["buyer"].ToString());
        pid = Convert.ToInt32(Application["pet_id"]);
        txt_date.Text = System.DateTime.Now.ToString("MM/dd/yy");
        if (!IsPostBack)
        {
            bindask();
            getpet();
        }
        

    }

    public void getpet()
    {
        obj.query = "select pet_name from pet where pet_id = "+pid+"";
        obj.selectpetspot(obj.query);
        if(obj.dr_pet.Read())
        {
            lblpetid.Text = obj.dr_pet[0].ToString();
        }
        //ddl_pet.DataSource = obj.dr_pet;
        //ddl_pet.DataTextField = "pet_name";
        //ddl_pet.DataValueField = "pet_id";
        //ddl_pet.DataBind();
        //ddl_pet.Items.Insert(0, "--Select--");
        //obj.dr_pet.Close();

    }
    public  void bindask()
    {
        obj.query = @"select ask_quest.quest_id,ask_quest.question , quest_reply.reply from ask_quest 
                    inner join quest_reply on quest_reply.quest_id= ask_quest.quest_id 
                        where ask_quest.pet_id = " + pid+"";
        obj.getpetspot(obj.query);
        GVQuestion.DataSource = obj.dt_pet;
        GVQuestion.DataBind();
    }



    protected void btn_submit_Click(object sender, EventArgs e)
    {
        //obj.query = "select quest_id from ask_quest where name='" + txt_name.Text + "'";
        //obj.selectpetspot(obj.query);
        //if (obj.dr_pet.Read())
        //{
        //    Response.Write("<script>alert('**Already Exist**')</script>");
        //    obj.dr_pet.Close();
        //}
        //else
        //{
            //obj.dr_pet.Close();
            obj.query = "insert into ask_quest values('" + txt_quest.Text + "','" + txt_name.Text + "','" + txt_email.Text + "','" + System.DateTime.Now.ToString("MM/dd/yy") + "',"+pid+","+buyer+")";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
        Response.Redirect("~/Buyer/ask_quest.aspx");
        //}

        
    }
    void clear()
    {
        txt_quest.Text = "";
        txt_name.Text = "";
        txt_email.Text = "";
        txt_date.Text = "";

    }
    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/ask_quest.aspx");
    }

    
}