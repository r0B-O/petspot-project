<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="addtocart.aspx.cs" Inherits="owner_pet_cart" %>

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
      
         .auto-style1 {
             width: 94px;
         }
         .auto-style2 {
             width: 15px;
         }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="customers">
        <tr>
            <td>
                <asp:Panel ID="Panel3" runat="server">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <table class="single-right-left">
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="214px" ImageUrl="~/Buyer/images/3FDPa.png" Width="1000px" />
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                <asp:Button ID="btn_shop" runat="server" OnClick="btn_shop_Click" Text="Shop Now" Width="113px" />
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Panel ID="Panel2" runat="server">
                    <asp:Label ID="Label4" runat="server" ForeColor="#FF3300" Text="Sub Total"></asp:Label>
                    &nbsp;::
                    <asp:Label ID="lbl_sub" runat="server" Text="Label"></asp:Label>
&nbsp;<br />
                    <asp:Label ID="Label5" runat="server" ForeColor="#FF3300" Text="Tax"></asp:Label>
                    &nbsp;::
                    <asp:Label ID="lbl_tax" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="Label6" runat="server" ForeColor="#FF3300" Text="Grand Total"></asp:Label>
                    ::
                    <asp:Label ID="lbl_grand" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:GridView ID="grid_cart" runat="server" AutoGenerateColumns="False" DataKeyNames="cart_detid" Height="210px" OnRowCommand="grid_cart_RowCommand" OnRowDeleting="grid_cart_RowDeleting" Width="644px">
                        <Columns>
                            <asp:BoundField DataField="cart_detid" HeaderText="Cart ID" />
                            <asp:TemplateField HeaderText="Pet Name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_pet" runat="server" DataSourceID="SqlDataSource2" DataTextField="pet_name" DataValueField="pet_id" SelectedValue='<%# Bind("pet_id") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [pet_id], [pet_name] FROM [pet]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("pet_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pet_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity">
                                <ItemTemplate>
                                    <asp:TextBox ID="txt_qty" runat="server" Text='<%# Bind("qty") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Total">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_amt" runat="server" Text='<%# Bind("amt") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("amt") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowDeleteButton="True" />
                            <asp:ButtonField CommandName="Up_qty" Text="Update" />
                        </Columns>
                    </asp:GridView>
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btn_checkout" runat="server" CssClass="offset-sm-0" OnClick="btn_checkout_Click" Text="PLACE ORDER" Width="169px" />
                    <br />
                </asp:Panel>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

