<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="replydetails.aspx.cs" Inherits="owner_quest_reply" %>

<script runat="server">

    
</script>


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

    
        <table id="customers">
        <tr>
            <td class="auto-style4" colspan="2"><h2 class="auto-style3"><strong><span class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View All&nbsp;Reply </span>&nbsp;</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                    &nbsp;</td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style2">
                
                </td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style2">
                    <asp:GridView ID="grid_reply" runat="server" AutoGenerateColumns="False" DataKeyNames="quest_id">
                        <Columns>
                            <asp:BoundField DataField="question" HeaderText="Question" />
                            <asp:BoundField DataField="cat_name" HeaderText="Category" />
                            <asp:BoundField DataField="pet_name" HeaderText="Pet Name" />
                            <asp:BoundField DataField="reply" HeaderText="Answer" />
                        </Columns>
                    </asp:GridView>
            </td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>

        <tr>
            <td class="auto-style2">
                <p>
                    &nbsp;</p>
            </td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

