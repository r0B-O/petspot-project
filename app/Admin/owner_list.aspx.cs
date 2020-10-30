using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_login_owner : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
        
        if (!IsPostBack)
        {
            
            bindowner();
        }
    }
    public void bindowner()
    {
        obj.query = string.Format(@"SELECT        owner.owner_id, owner.name, owner.age, owner.gen, owner.mob, owner.phone, owner.email, owner.reg_date, owner.status, owner.login_id, login.login_id AS Expr1, login.[username], login.password
FROM            owner INNER JOIN
                         login ON owner.login_id = login.login_id");
        obj.getpetspot(obj.query);
        dv_owner.DataSource = obj.dt_pet;
        dv_owner.DataBind();
    }
    //protected void btn_submit_Click(object sender, EventArgs e)
    //{
    //    obj.query = "select login_id from login where username='" + txt_user_name.Text + "'";
    //    obj.selectpetspot(obj.query);
    //    if (obj.dr_pet.Read())
    //    {
    //        Response.Write("<script>alert('**Already Exist**')</script>");
    //        obj.dr_pet.Close();
    //    }
    //    else
    //    {
    //        obj.dr_pet.Close();

    //        obj.query = "insert into login values('" + txt_user_name.Text + "' , '" + txt_pswd.Text + "' ,'Owner')";

    //        obj.insertpetspot(obj.query);
    //        obj.query = "select @@identity";
    //        obj.getscalarid(obj.query);

    //        obj.query = "insert into owner values('" + txt_name.Text + "'," + txt_age.Text + ",'" + rbl_gen.SelectedItem.Text + "' , " + txt_mob.Text + ", " + txt_phn.Text + ", '" + txt_email.Text + "' , '" + System.DateTime.Now.ToString("MM/dd/yy") + "','New','" + obj.sid + "' )";
    //        obj.insertpetspot(obj.query);
    //        Response.Write("<script>alert('**Registration Completed**')</script>");

    //    }
    //    clear();

    //}
    //public void clear()
    //{
    //    txt_name.Text = "";
    //    rbl_gen.SelectedIndex = -1;
    //    txt_age.Text = "";
    //    txt_mob.Text = "";
    //    txt_phn.Text = "";
    //    txt_email.Text = "";
    //    txt_reg_date.Text = "";




    //}



    //protected void btn_reset_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/login/login_owner.aspx");
    //}



    protected void dv_owner_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int st = Convert.ToInt32(dv_owner.DataKey.Value.ToString());
        obj.query = "delete from owner where owner_id=" + st.ToString() + "";
        obj.getpetspot(obj.query);
        bindowner();
    }

    protected void dv_owner_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        string id = dv_owner.DataKey.Value.ToString();
        TextBox txtname = (TextBox)dv_owner.FindControl("txt_name");

        TextBox txtage = (TextBox)dv_owner.FindControl("txt_age");
        RadioButtonList rblgen = (RadioButtonList)dv_owner.FindControl("rbl_gen");
       
        
        //DropDownList ddlstate = (DropDownList)dv_owner.FindControl("ddl_state");
        TextBox txtmob = (TextBox)dv_owner.FindControl("txt_mob");
        TextBox txtphn = (TextBox)dv_owner.FindControl("txt_phn");

        TextBox txtemail = (TextBox)dv_owner.FindControl("txt_email");


        obj.query = "update owner set name='" + txtname.Text + "', age='" + txtage.Text + "', gen='" + rblgen.SelectedValue + "', mob=" + txtmob.Text + " , phone=" + txtphn.Text + ",email='" + txtemail.Text + "'where owner_id=" + id + "";
        obj.insertpetspot(obj.query);
        dv_owner.ChangeMode(DetailsViewMode.ReadOnly);
        bindowner();
    }

    protected void dv_owner_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {




        dv_owner.ChangeMode(e.NewMode);
        bindowner();

    }

  

    protected void dv_owner_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        dv_owner.PageIndex = e.NewPageIndex;
        bindowner();
    }
}