<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="ask_quest.aspx.cs" Inherits="Buyer_ask_quest" %>

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
            <td class="auto-style4" colspan="2">&nbsp;<h2 class="auto-style3"><strong><span class="auto-style5">ASK QUESTIONS</span>&nbsp;</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                    <asp:Label ID="Label2" runat="server" Text="Question"></asp:Label>
                    *</td>
            <td class="auto-style10">
                <asp:TextBox ID="txt_quest" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_quest" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style11">
                    Pet Name</td>
            <td class="auto-style12">
                <asp:Label ID ="lblpetid" runat="server" Text=""></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style11">
                    Name*</td>
            <td class="auto-style12">
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_name" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style13">
                    Email*</td>
            <td class="auto-style14">
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_email" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style15">
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Sent Date"></asp:Label>
                </p>
            </td>
            <td class="auto-style16">
                <asp:TextBox ID="txt_date" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_date" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="28px" Text="Submit" Width="99px" OnClick="btn_submit_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="26px" Text="Reset" Width="104px" OnClick="btn_reset_Click" CausesValidation="False" />
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">
                <asp:GridView ID="GVQuestion" runat="server" AutoGenerateColumns="False" DataKeyNames="quest_id">
                    <Columns>
                        <asp:BoundField DataField="question" HeaderText="Questions" />
                         <asp:BoundField DataField="reply" HeaderText="Owner's Reply" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>

