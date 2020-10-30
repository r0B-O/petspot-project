using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class owner_pet_details_view : System.Web.UI.Page
    
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
            bindpetreg();
        }
    }
    public void bindpetreg()
    {
        obj.query = string.Format(@"SELECT        pet.pet_id, pet.owner_id, pet.pet_name, pet.age, pet.orgin_id, pet.breed_id, pet.wt_id, pet.ht_id, pet.color_id, pet.gender, pet.features, pet.temperament, pet.activity, pet.coat, pet.image1, pet.image2, pet.price, pet.tot_pet, 
                         pet.life_span, pet.scientific_name, pet.character, pet.behaviour, owner.owner_id , owner.name, height.ht, height.ht_id, orgin.orgin_id , orgin.orgin, color.color_id, color.col, weight.wt, 
                         weight.wt_id , breed.breed_id , breed.brd,category.cat_name, category.cat_id
FROM            pet INNER JOIN
                         owner ON pet.owner_id = owner.owner_id INNER JOIN
                         orgin ON pet.orgin_id = orgin.orgin_id INNER JOIN
                         height ON pet.ht_id = height.ht_id INNER JOIN
                         weight ON pet.wt_id = weight.wt_id INNER JOIN
                         color ON pet.color_id = color.color_id INNER JOIN
                         breed ON pet.breed_id = breed.breed_id INNER JOIN
category ON pet.cat_id = category.cat_id ");
        obj.getpetspot(obj.query);
        dv_pet.DataSource = obj.dt_pet;
        dv_pet.DataBind();
    }






    protected void dv_pet_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
    {
        int st = Convert.ToInt32(dv_pet.DataKey.Value.ToString());
       
        
        obj.query = "delete from pet where pet_id=" +st.ToString()+ "";
        obj.insertpetspot(obj.query);
        bindpetreg();

    }

    protected void dv_pet_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        string image1;
        string image2;
        string id = dv_pet.DataKey.Value.ToString();
        DropDownList ddlowner = (DropDownList)dv_pet.FindControl("ddl_owner");
        TextBox txtname = (TextBox)dv_pet.FindControl("txt_pet_name");
        TextBox txt_age = (TextBox)dv_pet.FindControl("txt_age");
        DropDownList ddlorgin = (DropDownList)dv_pet.FindControl("ddl_orgin");
        DropDownList ddlcat = (DropDownList)dv_pet.FindControl("ddl_cat");

        DropDownList ddlbreed = (DropDownList)dv_pet.FindControl("ddl_breed");

        DropDownList ddlwt = (DropDownList)dv_pet.FindControl("ddl_wt");
        DropDownList ddlht = (DropDownList)dv_pet.FindControl("ddl_ht");
        DropDownList ddlcolor = (DropDownList)dv_pet.FindControl("ddl_color");
        RadioButtonList rblgender = (RadioButtonList)dv_pet.FindControl("rdl_gen");
        TextBox txtfea = (TextBox)dv_pet.FindControl("txt_fea");
        TextBox txttemp = (TextBox)dv_pet.FindControl("txt_temp");
        TextBox txtact = (TextBox)dv_pet.FindControl("txt_activity");
        TextBox txtcoat = (TextBox)dv_pet.FindControl("txt_coat");
        TextBox txtimage1 = (TextBox)dv_pet.FindControl("txt_fup1");
        FileUpload fupimg1 = (FileUpload)dv_pet.FindControl("fup1");
        if (fupimg1.HasFile)
        {
            fupimg1.SaveAs(Server.MapPath("~/image/" + fupimg1.FileName));
            image1 = fupimg1.FileName;
        }
        else
        {
            image1 = txtimage1.Text;
        }


        TextBox txtimage2 = (TextBox)dv_pet.FindControl("txt_fup2");
        FileUpload fupimg2 = (FileUpload)dv_pet.FindControl("fup2");
        if (fupimg2.HasFile)
        {
            fupimg2.SaveAs(Server.MapPath("~/image/" + fupimg2.FileName));
            image2 = fupimg2.FileName;
        }
        else
        {
            image2 = txtimage2.Text;
        }
        TextBox txtprice = (TextBox)dv_pet.FindControl("txt_price");
        TextBox txttotal = (TextBox)dv_pet.FindControl("txt_tot_pet");

        TextBox txtlife = (TextBox)dv_pet.FindControl("txt_life");
        TextBox txtsci = (TextBox)dv_pet.FindControl("txt_sci");
        TextBox txtchar = (TextBox)dv_pet.FindControl("txt_char");
        TextBox txtbehav = (TextBox)dv_pet.FindControl("txt_behav");


        obj.query = "update pet set owner_id=" + ddlowner.SelectedValue + ",pet_name='" + txtname.Text + "',age=" + txt_age.Text + ",orgin_id=" + ddlorgin.SelectedValue + " ,breed_id=" + ddlbreed.SelectedValue + " ,wt_id=" + ddlwt.SelectedValue + " ,ht_id=" + ddlht.SelectedValue + ",color_id=" + ddlcolor.SelectedValue + ",gender='" + rblgender.SelectedValue + "',features='" + txtfea.Text + "' ,temperament='" + txttemp.Text + "' ,activity='" + txtact.Text + "' ,coat='" + txtcoat.Text + "' ,image1='" + fupimg1.HasFile + "',image2='" + fupimg2.HasFile + "' ,price=" + txtprice.Text + " ,tot_pet=" + txttotal.Text + " ,life_span='" + txtlife.Text + "',scientific_name='" + txtsci.Text + "',character='" + txtchar.Text + "',behaviour='" + txtbehav.Text + "',cat_id=" + ddlcat.SelectedValue + "where pet_id=" + id + "";
        obj.insertpetspot(obj.query);
        dv_pet.ChangeMode(DetailsViewMode.ReadOnly);
        bindpetreg();
    }

    protected void dv_pet_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        dv_pet.ChangeMode(e.NewMode);
        bindpetreg();
    }

    protected void dv_pet_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        dv_pet.PageIndex = e.NewPageIndex;
        bindpetreg();
    }
}