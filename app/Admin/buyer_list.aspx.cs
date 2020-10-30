using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_buyer_reg : System.Web.UI.Page
{

    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
       

        if (!IsPostBack)
        {
            //getstate();
            bindbuyer();
        }

    }



    public void bindbuyer()
    {
        obj.query = string.Format(@"SELECT        buyer.buyer_id, buyer.name, buyer.address, buyer.city, buyer.state_id, buyer.mob, buyer.phone, buyer.email, buyer.login_id, buyer.reg_date, buyer.status, login.login_id AS Expr1, login.[username], login.password, login.role
FROM            buyer INNER JOIN
                         login ON buyer.login_id = login.login_id");
        obj.getpetspot(obj.query);
        dv_buyer.DataSource = obj.dt_pet;
        dv_buyer.DataBind();


    }

    //public void getstate()
    //{
    //    obj.query = "select state,state_id from state";
    //    obj.selectpetspot(obj.query);
    //    ddl_state.DataSource = obj.dr_pet;
    //    ddl_state.DataTextField = "state";
    //    ddl_state.DataValueField = "state_id";
    //    ddl_state.DataBind();
    //    ddl_state.Items.Insert(0, "--Select--");
    //    obj.dr_pet.Close();

    //}
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

    //        obj.query = "insert into login values('" + txt_user_name.Text + "' , '" + txt_pswd.Text + "' ,'Buyer')";

    //        obj.insertpetspot(obj.query);
    //        obj.query = "select @@identity";
    //        obj.getscalarid(obj.query);

    //        obj.query = "insert into buyer values('" + txt_name.Text + "','" + txt_add.Text + "','" + txt_city.Text + "'," + ddl_state.SelectedValue + " , " + txt_mob.Text + ", " + txt_phn.Text + ", '" + txt_email.Text + "' ,'" + obj.sid + "','" + System.DateTime.Now.ToString("MM/dd/yy") + "','New' )";
    //        obj.insertpetspot(obj.query);
    //        Response.Write("<script>alert('**Registration Completed**')</script>");
    //        bindbuyer();

    //    }
    //    clear();

    //}
    //public void clear()
    //{
    //    txt_name.Text = "";
    //   ddl_state.SelectedIndex = -1;
    //    txt_add.Text = "";
    //    txt_mob.Text = "";
    //    txt_phn.Text = "";
    //    txt_pswd.Text = "";
    //    txt_c_pswd.Text = "";
    //    txt_reg_date.Text = "";




    //}

    //protected void btn_reset_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/login/buyer_reg.aspx");
    //}

    protected void dv_buyer_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int st = Convert.ToInt32(dv_buyer.DataKey.Value.ToString());
        obj.query = "delete from buyer where buyer_id=" + st.ToString() + "";
        obj.getpetspot(obj.query);
        bindbuyer();
    }

    protected void dv_buyer_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        string id = dv_buyer.DataKey.Value.ToString();
        TextBox txtname = (TextBox)dv_buyer.FindControl("txt_name");

        TextBox txtaddr = (TextBox)dv_buyer.FindControl("txt_addr");
        TextBox txtcity = (TextBox)dv_buyer.FindControl("txt_city");
        //RadioButtonList rblgen = (RadioButtonList)dv_buyer.FindControl("rbl_gen");
        DropDownList ddlstate = (DropDownList)dv_buyer.FindControl("ddl_state");
        TextBox txtmob = (TextBox)dv_buyer.FindControl("txt_mob");
        TextBox txtphn = (TextBox)dv_buyer.FindControl("txt_phn");
        
        TextBox txtemail = (TextBox)dv_buyer.FindControl("txt_email");


        obj.query = "update buyer set name='" + txtname.Text + "', address='" + txtaddr.Text + "', city='" + txtcity.Text + "',state_id=" + ddlstate.SelectedValue + ", mob=" +txtmob.Text+" , phone="+txtphn.Text+",email='"+txtemail.Text+"'where buyer_id=" + id + "";
        obj.insertpetspot(obj.query);
        dv_buyer.ChangeMode(DetailsViewMode.ReadOnly);
        bindbuyer();
    }


    protected void dv_buyer_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
       dv_buyer.PageIndex = e.NewPageIndex;
        bindbuyer();
    }

    protected void dv_buyer_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {

        dv_buyer.ChangeMode(e.NewMode);
        bindbuyer();

    }
}