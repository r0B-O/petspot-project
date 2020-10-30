
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login_login : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
        lbl_invalid.Visible = false;
    }
    //protected void btn_cancel_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Login/Login.aspx");
    //}

    

   


    protected void btn_new_Click(object sender, EventArgs e)
    {
        

        obj.query = "select * from login where username='" + txt_user.Text + "' and  password='" + txt_pwd.Text + "' and role='Admin'";
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            Session["Admin"] = obj.dr_pet[0].ToString();
            Response.Redirect("~/Admin/Admin_Home.aspx");
            obj.dr_pet.Close();

        }
        else
        {
            obj.dr_pet.Close();
            lbl_invalid.Visible = true;
        }


        obj.query = string.Format(@"SELECT         owner.owner_id, owner.name
FROM            login INNER JOIN
                         owner ON login.login_id = owner.login_id where username='" + txt_user.Text + "' and  password='" + txt_pwd.Text + "' and role='Owner' ");
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Session["Owner"] = obj.dr_pet[0].ToString();
            Response.Redirect("~/owner/owner_home.aspx");
            obj.dr_pet.Close();

        }
        else
        {
            obj.dr_pet.Close();
            lbl_invalid.Visible = true;
        }


        obj.query = string.Format(@"SELECT         buyer.buyer_id
FROM login INNER JOIN
                         buyer ON login.login_id = buyer.login_id where username='" + txt_user.Text + "' and  password='" + txt_pwd.Text + "'and role='Buyer'");
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            Session["buyer"] = obj.dr_pet[0].ToString();
            Response.Redirect("~/Buyer/buyer_home.aspx");
            obj.dr_pet.Close();



        }
        else
        {
            obj.dr_pet.Close();
            lbl_invalid.Visible = true;
        }
    }














   
}

