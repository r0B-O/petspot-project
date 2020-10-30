<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="manage_breed.aspx.cs" Inherits="Admin_manage_breed" %>

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
            width: 75%;
            height: 367px;
            margin-left: 189px;
            margin-top: 48px;
        }
        .auto-style2 {
            width: 210px;
            height: 73px;
            background-color: #C0C0C0;
        }
        .auto-style3 {
            text-align: center;
            font-weight: normal;
        }
        .auto-style4 {
            background-color: #999999;
        }
        .auto-style5 {
            color: #FFFFFF;
        }
        .auto-style6 {
            height: 73px;
            width: 589px;
            background-color: #C0C0C0;
        }
        .auto-style7 {
            height: 147px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <h3 class="hny-title">
Add new <span>Breed</span></h3>
   <td>
    <table id="customers">
        <tr>
            <td class="auto-style4" colspan="2">&nbsp;<h2 class="auto-style3"><strong><span class="auto-style5"></span>&nbsp;</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <h2>
                    <asp:Label ID="Label1" runat="server" Text="Breed"></asp:Label>
                </h2>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_breed" runat="server" Width="149px"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_breed" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="auto-style20" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="38px" Text="Submit" Width="115px" OnClick="btn_submit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="38px" Text="Reset" Width="102px" OnClick="btn_reset_Click" />
                <br />
            </td>
        </tr>

        <tr>
            <td class="auto-style7" colspan="2">
                <asp:GridView ID="grid_breed" runat="server" AutoGenerateColumns="False" DataKeyNames="breed_id" OnRowCancelingEdit="grid_breed_RowCancelingEdit" OnRowDeleting="grid_breed_RowDeleting" OnRowEditing="grid_breed_RowEditing" OnRowUpdating="grid_breed_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Breed">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_brd" runat="server" Text='<%# Bind("brd") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("brd") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" CausesValidation="False" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>

    </table>
       </td>
</asp:Content>

