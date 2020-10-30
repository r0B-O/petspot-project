<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="pet_cart.aspx.cs" Inherits="owner_pet_cart" %>

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
    &nbsp;<table id="customers">
        <tr>
            <td>
                <asp:GridView ID="grid_cart" runat="server" AutoGenerateColumns="False" DataKeyNames="cart_detid" OnRowCommand="grid_cart_RowCommand" OnRowDeleting="grid_cart_RowDeleting" Height="210px" Width="644px">
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
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_search_more" runat="server" OnClick="btn_search_more_Click" Text="Search More" Width="116px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" ForeColor="#FF3300" Text="Sub Total"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="lbl_sub" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back" Width="113px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" ForeColor="#FF3300" Text="Tax"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_tax" runat="server" Text="Label"></asp:Label>
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label6" runat="server" ForeColor="#FF3300" Text="Grand Total"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_grand" runat="server" Text="Label"></asp:Label>
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_checkout" runat="server" OnClick="btn_checkout_Click" Text="Chechout" Width="169px" CssClass="offset-sm-0" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblcartid" runat="server" Text="" Visible="false"></asp:Label>
&nbsp;<asp:Panel ID="Panel1" runat="server">
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2">
                                <h3><strong><em>Shipping Address</em></strong></h3>
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>
                                <asp:TextBox ID="txt_address" runat="server" TextMode="MultiLine"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_address" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Postal Code</td>
                            <td>
                                <asp:TextBox ID="txt_postal" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_postal" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">City</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txt_city" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_city" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>State</td>
                            <td>
                                <asp:DropDownList ID="ddl_state" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Country</td>
                            <td>
                                <asp:DropDownList ID="ddl_country" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>
                                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_name" ErrorMessage="Alphabets Only" ValidationExpression="^[a-zA-z]+([\s][a-zA-Z]+)*$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Contact No</td>
                            <td>
                                <asp:TextBox ID="txt_phn" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_phn" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Proceed to Pay" Width="122px" />
                                &nbsp;&nbsp;
                                <asp:Button ID="btn_reset" runat="server" OnClick="btn_reset_Click" Text="Reset" Width="88px" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

