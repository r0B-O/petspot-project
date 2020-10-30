<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="receipt.aspx.cs" Inherits="Buyer_receipt" %>

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
            <td colspan="2">
                <h1>Payment Receipt</h1>
                <br />
            </td>
        </tr>
        <tr>
            <td>Transaction ID</td>
            <td>
                <asp:Label ID="lbl_id" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Amount</td>
            <td>
                <asp:Label ID="lbl_amount" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Transaction Date</td>
            <td>
                <asp:Label ID="lbl_date" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <asp:Label ID="lbl_status" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        </table>  
    <input type="button" class="btn" onclick="window.print();" />
     <button type="submit" class="btn-danger" onclick="window.print();">Print Receipt</button>

    <%--<asp:Button ID="print"  runat="server" Text="Print Receipt" OnClick="window.print();" />--%>
</asp:Content>

