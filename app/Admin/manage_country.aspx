﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="manage_country.aspx.cs" Inherits="Admin_manaage_country" %>

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
Add<span>Country</span></h3>
    <td>
        <table id="customers">
        <tr>
            <td class="auto-style4" colspan="2">&nbsp;<h2 class="auto-style3"><strong><span class="auto-style5">MANAGE COUNTRY</span>&nbsp;</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <h2>
                    <asp:Label ID="Label1" runat="server" Text="Country"></asp:Label>
                </h2>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_country" runat="server" Width="181px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_country" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="38px" Text="Submit" Width="191px" OnClick="btn_submit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="38px" Text="Reset" Width="192px" OnClick="btn_reset_Click" />
                <asp:GridView ID="grid_country" runat="server" AutoGenerateColumns="False" DataKeyNames="country_id" OnRowCancelingEdit="grid_country_RowCancelingEdit" OnRowDeleting="grid_country_RowDeleting" OnRowEditing="grid_country_RowEditing" OnRowUpdating="grid_country_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Country">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_coun" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;</td>
        </tr>
    </table>
        </td>
</asp:Content>

