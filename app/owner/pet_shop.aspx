<%@ Page Title="" Language="C#" MasterPageFile="~/owner/ownerMasterPage.master" AutoEventWireup="true" CodeFile="pet_shop.aspx.cs" Inherits="owner_pet_shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<style type="text/css">
        .auto-style1 {
            width: 839px;
            height: 507px;
            margin-left: 308px;
            margin-right: 0px;
            margin-top: 3px;
            background-color: #C0C0C0;
        }
        .auto-style6 {
            text-align: center;
            color: #CCFFFF;
            background-color: #666666;
            height: 24px;
        }
        .auto-style9 {
            width: 418px;
            height: 28px;
            background-color: #CCCCCC;
        }
        .auto-style10 {
            height: 28px;
            width: 419px;
            background-color: #CCCCCC;
        }
        .auto-style13 {
            background-color: #CCCCCC;
        }
        .auto-style20 {
            height: 87px;
            background-color: #CCCCCC;
        }
        .auto-style24 {
            width: 419px;
            background-color: #CCCCCC;
        }
        .auto-style26 {
            margin-left: 3px;
        }
        .auto-style27 {
            background-color: #CCCCCC;
            height: 26px;
        }
        .auto-style28 {
            width: 419px;
            background-color: #CCCCCC;
            height: 26px;
        }
        .auto-style29 {
            background-color: #CCCCCC;
            height: 22px;
        }
        .auto-style30 {
            height: 22px;
            width: 419px;
            background-color: #CCCCCC;
        }
        .auto-style31 {
            background-color: #CCCCCC;
            height: 12px;
        }
        .auto-style32 {
            width: 419px;
            background-color: #CCCCCC;
            height: 12px;
        }
        .auto-style35 {
            height: 20px;
        }
        .auto-style36 {
            background-color: #CCCCCC;
            height: 8px;
        }
        .auto-style37 {
            width: 419px;
            background-color: #CCCCCC;
            height: 8px;
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
  background-color: #FF7315;
  color: white;
}
      #customers tr{
          column-width:100px;
      }
      
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <a href="pet_shop.aspx">pet_shop.aspx</a>--%>
	<h3 class="hny-title">
											Pet Shop Regis<span>tration</span></h3>
    <table id="customers">

        <tr>
            <td class="auto-style6" colspan="2">
                <strong>Manage Pets</strong></td>
        </tr>
        <tr>
            <td class="auto-style27">
                    Shop name</td>
            <td class="auto-style28">
                <asp:TextBox ID="txt_shop" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_shop" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                    LIC_NO</td>
            <td class="auto-style10">
                <asp:TextBox ID="txt_lic" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_lic" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29">
                    Owner Name</td>
            <td class="auto-style30">
                <asp:DropDownList ID="ddl_owner" runat="server" Width="129px">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddl_owner" ErrorMessage="**Select Name**" ForeColor="Red" Operator="NotEqual" ValueToCompare="--Select--"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                    Country</td>
            <td class="auto-style24">
                <asp:DropDownList ID="ddl_country" runat="server" Width="129px" AutoPostBack="True" OnSelectedIndexChanged="ddl_country_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddl_country" ErrorMessage="**Select any Country**" ForeColor="Red" Operator="NotEqual" ValueToCompare="--Select--"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                State</td>
            <td class="auto-style24">
                <asp:DropDownList ID="ddl_state" runat="server" Width="129px">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddl_state" ErrorMessage="**Select any state**" ForeColor="Red" Operator="NotEqual" ValueToCompare="--Select--"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                    Location</td>
            <td class="auto-style24">
                <asp:TextBox ID="txt_loc" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_loc" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                    Land Mark</td>
            <td class="auto-style24">
                <asp:TextBox ID="txt_land" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_land" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                Mobile No</td>
            <td class="auto-style24">
                <asp:TextBox ID="txt_mob" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                    Phone No</td>
            <td class="auto-style24">
                <asp:TextBox ID="txt_phn" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_phn" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style29">
                EST_date</td>
            <td class="auto-style30">
                <asp:TextBox ID="txt_est" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_est" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style36">
                    Email</td>
            <td class="auto-style37">
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_email" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style31">
                &nbsp;</td>
            <td class="auto-style32">
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="23px" Text="Submit" Width="102px" OnClick="btn_submit_Click" />
&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="21px" Text="Reset" Width="125px" OnClick="btn_reset_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style20" colspan="2">
                <asp:GridView ID="grid_shop" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="grid_shop_RowCancelingEdit" OnRowDeleting="grid_shop_RowDeleting" OnRowEditing="grid_shop_RowEditing" OnRowUpdating="grid_shop_RowUpdating" DataKeyNames="shop_id">
                    <Columns>
                        <asp:TemplateField HeaderText="Shop Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_shop" runat="server" Text='<%# Bind("shop_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("shop_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Licence No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_lic" runat="server" Text='<%# Bind("lic_no") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("lic_no") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Owner Name">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_owner" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="owner_id" SelectedValue='<%# Bind("owner_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [owner_id], [name] FROM [owner]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_country" runat="server" DataSourceID="SqlDataSource2" DataTextField="country" DataValueField="country_id" SelectedValue='<%# Bind("country_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [country_id], [country] FROM [country]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_state" runat="server" DataSourceID="SqlDataSource3" DataTextField="state" DataValueField="state_id" SelectedValue='<%# Bind("state_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [state], [state_id] FROM [state]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Location">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_location" runat="server" Text='<%# Bind("loc") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("loc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_mob" runat="server" Text='<%# Bind("mob") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("mob") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_phn" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Land mark">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_land" runat="server" Text='<%# Bind("land_mark") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("land_mark") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Est Date">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_est" runat="server" Text='<%# Bind("est_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("est_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>

