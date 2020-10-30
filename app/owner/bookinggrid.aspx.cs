using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class bookinggrid : System.Web.UI.Page
{

    petshop_class obj = new petshop_class();
    protected void Page_Load(object sender, EventArgs e)
    {
        obj.connet_petspot();
        if (!IsPostBack)
        {
            
            getshow();

        }
    }



    public void bindbook()
    {
        obj.query = string.Format(@"SELECT        book_show.*, dog_show.show_id, dog_show.show_title
    FROM            book_show CROSS JOIN
                             dog_show");
        obj.getpetspot(obj.query);
        grid_book.DataSource = obj.dt_pet;
        grid_book.DataBind();


    }

    public void getshow()
    {
        obj.query = "select show_id,show_title from dog_show";
        obj.selectpetspot(obj.query);
        DropDownList1.DataSource = obj.dr_pet;
        DropDownList1.DataTextField = "show_title";
        DropDownList1.DataValueField = "show_id";
        DropDownList1.DataBind();
        DropDownList1.Items.Insert(0, "--Select--");
        obj.dr_pet.Close();

    }

    protected void grid_book_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grid_book.EditIndex = -1;
        bindbook();

    }

    protected void grid_book_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string s_id = grid_book.DataKeys[e.RowIndex].Value.ToString();
        obj.query = "delete from book_show where book_id=" + s_id + "";
        obj.insertpetspot(obj.query);
        bindbook();
    }

    protected void grid_book_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grid_book.EditIndex = e.NewEditIndex;
        bindbook();
    }

  
     public void bindshow()
    {
        obj.query = "select * from book_show where show_id=" + DropDownList1.SelectedValue + "";
        obj.getpetspot(obj.query);
        grid_book.DataSource = obj.dt_pet;
        grid_book.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        bindshow();
    }
}