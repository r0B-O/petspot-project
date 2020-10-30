<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="owner_list.aspx.cs" Inherits="login_login_owner" %>

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
            color: #003399;
            background-color: #666666;
        }
        .auto-style9 {
            width: 418px;
            height: 53px;
            background-color: #CCCCCC;
        }
        .auto-style10 {
            height: 53px;
            width: 419px;
            background-color: #CCCCCC;
        }
        .auto-style13 {
            background-color: #CCCCCC;
        }
        .auto-style14 {
            color: #000000;
        }
        .auto-style15 {
            background-color: #666666;
        }
        .auto-style20 {
            height: 87px;
            background-color: #CCCCCC;
        }
        .auto-style24 {
            width: 419px;
            background-color: #CCCCCC;
        }
        .auto-style25 {
            color: #FFFFFF;
        }
        .auto-style26 {
            margin-left: 219px;
        }
         .auto-style29 {
             background-color: #CCCCCC;
             height: 27px;
         }
         .auto-style30 {
             width: 419px;
             background-color: #CCCCCC;
             height: 27px;
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
View all Owners<span>List</span></h3>
    <td>

     <table id="customers">
        <tr>
            <td class="auto-style6" colspan="2">
                <h2><strong class="auto-style14">&nbsp;</strong><span class="auto-style25"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VIEW ALL OWNERS
                                                                                           </strong></span><strong class="auto-style14"><br class="auto-style15" />
                    </strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <h3>
                    &nbsp;</h3>
            </td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:DetailsView ID="dv_owner" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="owner_id" Height="50px" OnItemDeleting="dv_owner_ItemDeleting" OnItemUpdating="dv_owner_ItemUpdating" OnModeChanging="dv_owner_ModeChanging" OnPageIndexChanging="dv_owner_PageIndexChanging" Width="125px">
                    <Fields>
                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Age">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_age" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender">
                            <EditItemTemplate>
                                <asp:RadioButtonList ID="rbl_gen" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("gen") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("gen") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mobile No">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_mob" runat="server" Text='<%# Bind("mob") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("mob") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("mob") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_phn" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="reg_date" HeaderText="Registration Date" />
                        <asp:BoundField DataField="status" HeaderText="Status" />
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                        <asp:BoundField />
                    </Fields>
                </asp:DetailsView>
            </td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                    &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29">
                &nbsp;</td>
            <td class="auto-style30">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style20" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style20" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
        </td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>

