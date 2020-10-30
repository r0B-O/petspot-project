<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="search_pet.aspx.cs" Inherits="Buyer_search_pet" %>

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
      
    </style>>
<style type="text/css">
    .auto-style1 {
        height: 22px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="customers">
        <tr>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Search a Category"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddl_cat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_cat_SelectedIndexChanged" Width="182px">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_search" runat="server" Text="Search" Width="166px" OnClick="btn_search_Click" />
            &nbsp;
                </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
    <asp:DataList ID="dl1" runat="server" Height="233px" RepeatColumns="3" DataKeyField="pet_id" OnItemCommand="dl1_ItemCommand" >
        <ItemTemplate>
            <table class="auto-style8">
                <tr>
                    <td colspan="2" rowspan="3">
                        <asp:Image ID="Image1" runat="server" Height="211px" ImageUrl='<%# Bind("image1","~/image/{0}") %>' Width="271px" BorderColor="#663300" BorderStyle="Solid" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text='<%# Bind("pet_name") %>'></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="view" ImageUrl='<%# Bind("image1","~/image/{0}") %>' Height="50px" Width="50px" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

