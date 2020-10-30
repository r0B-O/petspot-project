using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_pet : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HttpContext.Current.Session["Owner"] == null)
        {
            Response.Redirect("~/login/login.aspx");
        }
        else
            obj.connet_petspot();
        if (!IsPostBack)
        {
            getbreed();
            getweight();
            
            getowner();
            getcolor();
            getorgin();
            getheight();
            getcat();
          

            
        }

    }
   


    public void getowner()
    {
        obj.query = "select name,owner_id from owner";
        obj.selectpetspot(obj.query);
        ddl_name.DataSource = obj.dr_pet;
        ddl_name.DataTextField = "name";
        ddl_name.DataValueField = "owner_id";
        ddl_name.DataBind();
        ddl_name.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }

    public void getorgin()
    {
        obj.query = "select * from orgin";
        obj.selectpetspot(obj.query);
        ddl_orgin.DataSource = obj.dr_pet;
        ddl_orgin.DataTextField = "orgin";
        ddl_orgin.DataValueField = "orgin_id";
        ddl_orgin.DataBind();
        ddl_orgin.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

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

    public void getbreed()
    {
        obj.query = "select * from breed";
        obj.selectpetspot(obj.query);
        ddl_breed.DataSource = obj.dr_pet;
        ddl_breed.DataTextField = "brd";
        ddl_breed.DataValueField = "breed_id";
        ddl_breed.DataBind();
        ddl_breed.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }
    public void getweight()
    {
        obj.query = "select * from weight";
        obj.selectpetspot(obj.query);
        ddl_wt.DataSource = obj.dr_pet;
        ddl_wt.DataTextField = "wt";
        ddl_wt.DataValueField = "wt_id";
        ddl_wt.DataBind();
        ddl_wt.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }

    public void getheight()
    {
        obj.query = "select * from height";
        obj.selectpetspot(obj.query);
        ddl_ht.DataSource = obj.dr_pet;
        ddl_ht.DataTextField = "ht";
        ddl_ht.DataValueField = "ht_id";
        ddl_ht.DataBind();
        ddl_ht.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }

    public void getcolor()
    {
        obj.query = "select * from color";
        obj.selectpetspot(obj.query);
        ddl_color.DataSource = obj.dr_pet;
        ddl_color.DataTextField = "col";
        ddl_color.DataValueField = "color_id";
        ddl_color.DataBind();
        ddl_color.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }






    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select pet_id from pet where pet_name ='" + txt_pet.Text + "'";
        obj.selectpetspot(obj.query);

        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into pet values(" + ddl_name.SelectedValue + " ,'" + txt_pet.Text + "' , " + txt_age.Text + " , " + ddl_orgin.SelectedValue + " , " + ddl_breed.SelectedValue + " , " + ddl_wt.SelectedValue + " , " + ddl_ht.SelectedValue + " , " + ddl_color.SelectedValue + " , '" + rdl_gen.SelectedValue + "' , '" + txt_features.Text + "' , '" + txt_temp.Text + "'  ,  '" + txt_activity.Text + "' , '" + txt_coat.Text +"'  , '" + fup_image1.FileName +"' , '" + fup_image2.FileName +"'  ,  " + txt_price.Text + "  , " + txt_tot_pet.Text + " , '" + txt_life.Text + "' , '" + txt_sci.Text + "' , '" + txt_char.Text + "' , '" + txt_behave.Text + "',"+ddl_cat.SelectedValue + ")";
            obj.insertpetspot(obj.query);
            fup_image1.SaveAs(Server.MapPath("~/image/" + fup_image1.FileName));
            fup_image2.SaveAs(Server.MapPath("~/image/" + fup_image2.FileName));
            
            Response.Write("<script>alert('**inserted**')</script>");
            
        }
        clearall();

    }


    public void clearall()
    {
        txt_age.Text = "";
        txt_activity.Text = "";
        txt_behave.Text = "";
        txt_char.Text = "";
        txt_coat.Text = "";
        txt_features.Text = "";
        txt_life.Text = "";
        txt_pet.Text = "";
        txt_price.Text = "";
        txt_sci.Text = "";
        txt_temp.Text = "";
        txt_tot_pet.Text = "";
        ddl_breed.SelectedIndex = -1;
        ddl_color.SelectedIndex = -1;
        ddl_ht.SelectedIndex = -1;
        ddl_name.SelectedIndex = -1;
        ddl_orgin.SelectedIndex = -1;

        ddl_wt.SelectedIndex = -1;
        ddl_cat.SelectedIndex = -1;


    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/owner/pet.aspx");
    }

    
     
}