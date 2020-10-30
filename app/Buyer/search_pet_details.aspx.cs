using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buyer_search_pet_details : System.Web.UI.Page
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
            buyer = Convert.ToInt32(Session["buyer"].ToString());
        }
       
        if (!IsPostBack)
        {
            bindpetdetails();

        }

    }
    public void bindpetdetails()
    {

        obj.query = string.Format(@"SELECT        pet.pet_id, pet.owner_id, pet.pet_name, pet.age, pet.orgin_id,pet.cat_id, pet.breed_id, pet.wt_id, pet.ht_id, pet.color_id, pet.gender, pet.features, pet.temperament, pet.activity, pet.coat, pet.image1, pet.image2, pet.price, pet.tot_pet, 
                         pet.life_span, pet.scientific_name, pet.character, pet.behaviour, owner.owner_id , owner.name, height.ht, height.ht_id, orgin.orgin_id , orgin.orgin,category.cat_id,category.cat_name, color.color_id, color.col, weight.wt, 
                         weight.wt_id , breed.breed_id , breed.brd
FROM            pet INNER JOIN
                         owner ON pet.owner_id = owner.owner_id INNER JOIN
                         orgin ON pet.orgin_id = orgin.orgin_id INNER JOIN
                         category ON pet.cat_id = category.cat_id INNER JOIN
                         height ON pet.ht_id = height.ht_id INNER JOIN
                         weight ON pet.wt_id = weight.wt_id INNER JOIN
                         color ON pet.color_id = color.color_id INNER JOIN
                         breed ON pet.breed_id = breed.breed_id where pet.pet_id= "+Application["pet_id"] +"");
        obj.getpetspot(obj.query);
        dl_details.DataSource = obj.dt_pet;
        dl_details.DataBind();
    }

   
    protected void dl_details_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName=="cart")
        {
            string qu = "select * from pet_cart_det where pet_id=" + Application["pet_id"] + " and buyer_id = "+buyer+ " and status='Added to Cart'";
            obj.selectpetspot(qu);
            if(obj.dr_pet.Read()) 
            {
                Response.Write("<script> alert('Item Existing in your shopping cart. Please Update shopping cart quantity')</script>");
                obj.dr_pet.Close();
                Response.Redirect("~/Buyer/pet_cart.aspx");
            }
            else
            {
                obj.dr_pet.Close();
                TextBox quan = (TextBox)dl_details.Items[e.Item.ItemIndex].FindControl("txt_quan");
                Label price = (Label)dl_details.Items[e.Item.ItemIndex].FindControl("Label12");
                int total = Convert.ToInt32(quan.Text) * Convert.ToInt32(price.Text);

                string qur="insert into pet_cart_det values(0 ," + Application["pet_id"] + " , " + quan.Text+"," + total + ",'"+System.DateTime.Now.ToString("MM/dd/yy")+"'," + buyer + ",'Added to Cart')";
                obj.insertpetspot(qur);
                Response.Redirect("~/Buyer/pet_cart.aspx");
               

            }

        }
        if(e.CommandName=="more")
        {
            Response.Redirect("search_pet.aspx");
        }


        if (e.CommandName == "ask")
        {

            Response.Redirect("~/Buyer/ask_quest.aspx");

        }


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Buyer/search_pet.aspx");
    }



    protected void Button2_Click(object sender, EventArgs e)
    {

    }

   
}