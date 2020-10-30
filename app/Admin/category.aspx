<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="Admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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


#customers tr
{
    width:auto;
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
Register Your<span>Pet</span></h3>
    <td>
    <table id="customers">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <h2>
                    Category&nbsp;&nbsp;
                <asp:TextBox ID="txt_name" runat="server" Width="183px"></asp:TextBox>
            &nbsp; <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="44px" Text="ADD" Width="96px" OnClick="btn_submit_Click" style="margin-left: 99" />
                </h2>
            </td>
            <td>
            &nbsp;</td>
        </tr>

        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                &nbsp;&nbsp;</td>
        </tr>

        <tr>
            <td>
                <asp:GridView ID="grid_cat" runat="server" AutoGenerateColumns="False" DataKeyNames="cat_id" OnRowCancelingEdit="grid_cat_RowCancelingEdit" OnRowDeleting="grid_cat_RowDeleting" OnRowEditing="grid_cat_RowEditing" OnRowUpdating="grid_cat_RowUpdating" Height="171px" Width="580px">
                    <Columns>
                        <asp:BoundField DataField="cat_id" HeaderText="Category ID" SortExpression="cat_id" >
                        <ControlStyle Width="150px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Category" SortExpression="cat_name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_category" runat="server" Text='<%# Bind("cat_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("cat_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" CausesValidation="False" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</td>
</asp:Content>

