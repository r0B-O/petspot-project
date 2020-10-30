<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="state.aspx.cs" Inherits="Admin_state" %>

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
Add <span>State</span></h3>

        <td>

        <table id="customers">
        <tr>
            <td class="auto-style4" colspan="2">&nbsp;<h2 class="auto-style3"><strong><span class="auto-style5">MANAGE STATE</span>&nbsp;</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Country"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddl_country" runat="server" Height="22px" Width="123px">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddl_country" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">
                <h2>
                    <asp:Label ID="Label1" runat="server" Text="State"></asp:Label>
                </h2>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_state" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_state" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="38px" Text="Submit" Width="74px" OnClick="btn_submit_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="38px" Text="Reset" Width="78px" OnClick="btn_reset_Click" CausesValidation="False" />
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">
                <asp:GridView ID="grid_state" runat="server" AutoGenerateColumns="False" DataKeyNames="state_id" OnRowCancelingEdit="grid_state_RowCancelingEdit" OnRowDeleting="grid_state_RowDeleting" OnRowEditing="grid_state_RowEditing" OnRowUpdating="grid_state_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Country">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_country" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country_id" Height="16px" SelectedValue='<%# Bind("country_id") %>' Width="125px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [country_id], [country] FROM [country]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_state" runat="server" Text='<%# Bind("state") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
            </td>
        </tr>
    </table>
</td>
</asp:Content>

