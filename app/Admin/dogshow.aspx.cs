using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_dogshow : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            getCountry();
            getstate();
            //binddogshow();
            //getowner();
        }
    }

//    public void binddogshow()
//    {
//        obj.query = string.Format(@"SELECT        country.country_id, country.country, state.state_id, state.state, dog_show.show_id, dog_show.show_title, dog_show.city, dog_show.venue, dog_show.show_from_date, dog_show.show_to_date, dog_show.status
//FROM            dog_show INNER JOIN
//                         country ON dog_show.country_id = country.country_id INNER JOIN
//                         state ON dog_show.state_id = state.state_id");
//        obj.getpetspot(obj.query);
//        grid_dog.DataSource = obj.dt_pet;
//        grid_dog.DataBind();
//    }

    public void getCountry()
    {
        obj.query = "select * from country";
        obj.selectpetspot(obj.query);
        ddl_country.DataSource = obj.dr_pet;
        ddl_country.DataTextField = "country";
        ddl_country.DataValueField = "country_id";
        ddl_country.DataBind();
        ddl_country.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }


    public void getstate()
    {
        obj.query = "select state,state_id from state";
        obj.selectpetspot(obj.query);
        ddl_state.DataSource = obj.dr_pet;
        ddl_state.DataTextField = "state";
        ddl_state.DataValueField = "state_id";
        ddl_state.DataBind();
        ddl_state.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        obj.query = "select show_id from dog_show where show_title='" + txt_tittle.Text + "'";
        obj.selectpetspot(obj.query);
        if (obj.dr_pet.Read())
        {
            Response.Write("<script>alert('**Already Exist**')</script>");
            obj.dr_pet.Close();
        }
        else
        {
            obj.dr_pet.Close();
            obj.query = "insert into dog_show values('" + txt_tittle.Text + "'," + ddl_country.SelectedValue + ",'" + txt_city.Text + "', " + ddl_state.SelectedValue+",'" + txt_ven.Text + "'," + txt_show_from.Text + "," + txt_show_to.Text + ", '" + txt_status.Text + "')";
            obj.insertpetspot(obj.query);
            Response.Write("<script>alert('**inserted**')</script>");
            //binddogshow();
        }
    }

    protected void btn_reset_Click(object sender, EventArgs e)
    {
        txt_tittle.Text = "";
        ddl_country.SelectedIndex = -1;
        ddl_state.SelectedIndex = -1;
        txt_city.Text = "";
        txt_show_from.Text = "";
        txt_show_to.Text = "";
        txt_ven.Text = "";
        txt_status.Text = "";
        txt_tittle.Focus();


    }



    //protected void grid_dog_RowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    string s_id = grid_dog.DataKeys[e.RowIndex].Value.ToString();
    //    obj.query = "delete from dog_show where show_id=" + s_id + "";
    //    obj.insertpetspot(obj.query);
    //    binddogshow();
    //}

    //protected void grid_dog_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    string sid = grid_dog.DataKeys[e.RowIndex].Value.ToString();
    //    TextBox txt_showtitle = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_tittle");
    //    DropDownList ddlcountry = (DropDownList)grid_dog.Rows[e.RowIndex].FindControl("ddl_country");
    //    TextBox txt_showcity = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_city");
    //    DropDownList ddlstate = (DropDownList)grid_dog.Rows[e.RowIndex].FindControl("ddl_state");
       
    //    TextBox txt_showvenue = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_venue");
    //    TextBox txt_showfrom = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_from");
    //    TextBox txt_showto = (TextBox)grid_dog.Rows[e.RowIndex].FindControl("txt_to");
    //    obj.query = "update dog_show set show_title='" + txt_showtitle.Text + "' , country_id=" + ddlcountry.SelectedValue + ", city='"+ txt_showcity.Text+"', state_id="+ddlstate.SelectedValue+" ,venue='"+ txt_showvenue.Text+"' , show_from_date='"+txt_show_from.Text+"', show_to_date = '"+txt_show_to.Text+"' , status = '"+txt_status.Text+"'where show_id=" + sid + "";
    //    obj.insertpetspot(obj.query);
    //    grid_dog.EditIndex = -1;
    //    binddogshow();
    //}

    //protected void grid_dog_RowEditing(object sender, GridViewEditEventArgs e)
    //{
    //    grid_dog.EditIndex = e.NewEditIndex;
    //    binddogshow();
    //}

    //protected void grid_dog_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    grid_dog.EditIndex = -1;
    //    binddogshow();
    //}
}