<%@ Page Title="" Language="C#" MasterPageFile="~/owner/ownerMasterPage.master" AutoEventWireup="true" CodeFile="pet_details_view.aspx.cs" Inherits="owner_pet_details_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>--%>
        <style>
    #customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
width: auto;
column-gap:40px;
column-width:auto;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 5px;


  width: auto;
     

}


#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
      #customers tr{
          column-width:100px;
      }
      
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3 class="hny-title">
											View your Pet<span>details</span></h3>
    <table id="customers">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
    <asp:DetailsView ID="dv_pet" runat="server" AllowPaging="True" AutoGenerateRows="False" Height="50px" OnItemDeleting="dv_pet_ItemDeleting" OnItemUpdating="dv_pet_ItemUpdating" OnModeChanging="dv_pet_ModeChanging" OnPageIndexChanging="dv_pet_PageIndexChanging" Width="125px" DataKeyNames="pet_id">
        <Fields>
            <asp:TemplateField HeaderText="Owner Name">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_owner" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="owner_id" SelectedValue='<%# Bind("owner_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [owner_id], [name] FROM [owner]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("owner_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pet Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_pet_name" runat="server" Text='<%# Bind("pet_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pet_name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("pet_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Age">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_age" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Orgin">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_orgin" runat="server" DataSourceID="SqlDataSource2" DataTextField="orgin" DataValueField="orgin_id" SelectedValue='<%# Bind("orgin_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [orgin], [orgin_id] FROM [orgin]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("orgin_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("orgin") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_cat" runat="server" DataSourceID="SqlDataSource19" DataTextField="cat_name" DataValueField="cat_id" SelectedValue='<%# Bind("cat_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource19" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox22" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("cat_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Breed">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_breed" runat="server" DataSourceID="SqlDataSource17" DataTextField="brd" DataValueField="breed_id" SelectedValue='<%# Bind("breed_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource17" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [breed]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox21" runat="server" Text='<%# Bind("breed_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label19" runat="server" Text='<%# Bind("brd") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Weight">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_wt" runat="server" DataSourceID="SqlDataSource4" DataTextField="wt" DataValueField="wt_id" SelectedValue='<%# Bind("wt_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [weight]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox20" runat="server" Text='<%# Bind("wt_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("wt") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Height">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_ht" runat="server" DataSourceID="SqlDataSource3" DataTextField="ht" DataValueField="ht_id" SelectedValue='<%# Bind("ht_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [ht_id], [ht] FROM [height]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ht_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ht") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddl_color" runat="server" DataSourceID="SqlDataSource6" DataTextField="col" DataValueField="color_id" SelectedValue='<%# Bind("color_id") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [color]"></asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("color_id") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("col") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gender">
                <EditItemTemplate>
                    <asp:RadioButtonList ID="rdl_gen" runat="server" RepeatDirection="Horizontal" SelectedValue='<%# Bind("gender") %>'>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Features">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_fea" runat="server" Text='<%# Bind("features") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("features") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("features") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Temperament">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_temp" runat="server" Text='<%# Bind("temperament") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("temperament") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("temperament") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activity">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_activity" runat="server" Text='<%# Bind("activity") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("activity") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("activity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="COAT">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_coat" runat="server" Text='<%# Bind("coat") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("coat") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("coat") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Photo">
                <EditItemTemplate>
                    <asp:FileUpload ID="fup1" runat="server" />
                    <br />
                    <asp:TextBox ID="txt_fup1" runat="server" Text='<%# Eval("image1") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Eval("image1") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image1", "~/image/{0}") %>' />
                </ItemTemplate>
                <ControlStyle Height="100px" Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Photo">
                <EditItemTemplate>
                    <asp:FileUpload ID="fup2" runat="server" />
                    <br />
                    <asp:TextBox ID="txt_fup2" runat="server" Text='<%# Eval("image2") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox19" runat="server" Text='<%# Eval("image2") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("image2", "~/image/{0}") %>' />
                </ItemTemplate>
                <ControlStyle Height="100px" Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_price" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Total No of pet">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_tot_pet" runat="server" Text='<%# Bind("tot_pet") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("tot_pet") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("tot_pet") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Life Span">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_life" runat="server" Text='<%# Bind("life_span") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("life_span") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("life_span") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Scientific Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_sci" runat="server" Text='<%# Bind("scientific_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("scientific_name") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("scientific_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Character">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_char" runat="server" Text='<%# Bind("character") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("character") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("character") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Behaviour">
                <EditItemTemplate>
                    <asp:TextBox ID="txt_behav" runat="server" Text='<%# Bind("behaviour") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("behaviour") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("behaviour") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField CausesValidation="False" ShowEditButton="True" />
            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
        </Fields>
    </asp:DetailsView>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

