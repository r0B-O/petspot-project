using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class griddogshow : System.Web.UI.Page
{
    petshop_class obj = new petshop_class();

    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
        if (!IsPostBack)
        {
           
            binddogshow();
            //getowner();
        }

    }


    public void binddogshow()
    {
        obj.query = string.Format(@"SELECT        country.country_id, country.country, state.state_id, state.state, dog_show.show_id, dog_show.show_title, dog_show.city, dog_show.venue, dog_show.show_from_date, dog_show.show_to_date, dog_show.status
FROM            dog_show INNER JOIN
                         country ON dog_show.country_id = country.country_id INNER JOIN
                         state ON dog_show.state_id = state.state_id");
        obj.getpetspot(obj.query);
        grid_dog.DataSource = obj.dt_pet;
        grid_dog.DataBind();
    }

    protected void grid_dog_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_dog.EditIndex = -1;
        binddogshow();
    }

    protected void grid_dog_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string s_id = grid_dog.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from dog_show where show_id=" + s_id + "";
        obj.insertpetspot(obj.query);
        binddogshow();
    }

    protected void grid_dog_RowEditing(object sender, GridViewEditEventArgs e)
    {

        grid_dog.EditIndex = e.NewEditIndex;
        binddogshow();
    }

    protected void grid_dog_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string sid = grid_dog.DataKeys[e.RowIndex].Value.ToString();
        TextBox txt_showtitle = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_tittle");
        DropDownList ddlcountry = (DropDownList)grid_dog.Rows[e.RowIndex].FindControl("ddl_country");
        TextBox txt_showcity = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_city");
        DropDownList ddlstate = (DropDownList)grid_dog.Rows[e.RowIndex].FindControl("ddl_state");

        TextBox txt_showvenue = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_venue");
        TextBox txt_showfrom = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_show_from");
        TextBox txt_showto = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_show_to");
        obj.query = "update dog_show set show_title='" + txt_showtitle.Text + "' , country_id=" + ddlcountry.SelectedValue + ", city='" + txt_showcity.Text + "', state_id=" + ddlstate.SelectedValue + " ,venue='" + txt_showvenue.Text + "' , show_from_date='" + txt_showfrom.Text + "', show_to_date = '" + txt_showto.Text + "' where show_id=" + sid + "";
        obj.insertpetspot(obj.query);
        grid_dog.EditIndex = -1;
        binddogshow();
    }
}