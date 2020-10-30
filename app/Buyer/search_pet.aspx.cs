using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buyer_search_pet : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["buyer"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
            obj.connet_petspot();
            if (!IsPostBack)
            {
                
            getcat();
            }
        }
    public void bindpet()
    {
        obj.query = "select * from pet where cat_id = " + ddl_cat.SelectedValue + " ";
        obj.getpetspot(obj.query);
        dl1.DataSource = obj.dt_pet;
        dl1.DataBind();
    }
    public void getcat()
    {
        obj.query = "select * from category";
        obj.selectpetspot(obj.query);
        ddl_cat.DataSource = obj.dr_pet;
        ddl_cat.DataTextField = "cat_name";
        ddl_cat.DataValueField = "cat_id";
        ddl_cat.DataBind();
        ddl_cat.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }


    protected void dl1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName=="view")
        {
            string id = dl1.DataKeys[e.Item.ItemIndex].ToString();
            Application["pet_id"] = id;
            Response.Redirect("~/Buyer/search_pet_details.aspx");
        }
    }

    protected void ddl_cat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindpet();
    }




    protected void btn_search_Click(object sender, EventArgs e)
    {
    }

    
}