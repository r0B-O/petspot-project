<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="bookinggridadmin.aspx.cs" Inherits="bookinggrid" %>

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
    <%--<style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            margin-top: 33px;
        }
        .auto-style4 {
            color: #FF0000;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h3 class="hny-title">
Booking<span>Details</span></h3>
    <td>
    <table id="customers">
        <tr>
            <td>
                <h2 class="auto-style4">SELECT SHOW</h2>
                <p class="auto-style4">&nbsp;</p>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="50px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grid_book1" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" OnRowCancelingEdit="grid_book_RowCancelingEdit" OnRowDeleting="grid_book_RowDeleting" OnRowEditing="grid_book_RowEditing" CssClass="auto-style3" Width="667px">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="apply_date" HeaderText="Apply Date" />
                        <asp:BoundField DataField="phone" HeaderText="Phone" />
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        </table>
</asp:Content>

