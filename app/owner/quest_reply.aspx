<%@ Page Title="" Language="C#" MasterPageFile="~/owner/ownerMasterPage.master" AutoEventWireup="true" CodeFile="quest_reply.aspx.cs" Inherits="owner_quest_reply" %>

<script runat="server">

    
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <%-- <style type="text/css">
        .auto-style1 {
            width: 75%;
            height: 123px;
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
            background-color: #C0C0C0;
        }
    </style>--%><style>
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
    <h3 class="hny-title">
											Question  <span>Reply</span></h3>

    
        <table id="customers">
        <tr>
            <td class="auto-style4" colspan="2">&nbsp;<h2 class="auto-style3"><strong><span class="auto-style5">Reply</span>&nbsp;</strong></h2>
            </td>
        </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GVQuestions" runat="server" AutoGenerateColumns="False" DataKeyNames="quest_id" OnRowCommand="GVQuestions_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="quest_id" HeaderText="ID" />
                        <asp:BoundField DataField="pet_name" HeaderText="PetName" />
                            <asp:BoundField DataField="question" HeaderText="Question" />
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="email" HeaderText="Email" />
                         
                            <asp:ButtonField CommandName="reply" Text="Reply" />
                         
                    </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblqstid" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            </table>
    <asp:Panel ID="PanelReply" runat="server" visible="false">
<table>
    <tr>
            <td class="auto-style2">
                    Pet Name</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtpettname" runat="server" ReadOnly="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_rply" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>    
    <tr>
            <td class="auto-style2">
                    Reply</td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_rply" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_rply" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>    
    <tr>
            <td class="auto-style2">
                <p>
                    <asp:Label ID="Label1" runat="server" Text="Reply date"></asp:Label>
                </p>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_date" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_date" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr> 
    <tr>
        <td colspan="2">
            <asp:Button ID="btsubnreply" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="30px" Text="Submit" Width="73px" OnClick="btn_submit_Click" style="margin-left: 0px" />
         </td>
    </tr>  
    </table>
</asp:Panel>
   <%-- <table>
        <tr>
            <td colspan="2">       
     </td>
            <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Question"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddl_quest" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddl_quest" ErrorMessage="**Choose Question**" ForeColor="Red" Operator="NotEqual"></asp:CompareValidator>
            </td>
        </tr>

        

        <tr>
            <td class="auto-style2">
                    Replied By</td>
            <td class="auto-style6">
                <asp:TextBox ID="txt_r_by" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_r_by" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>

        

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="30px" Text="Submit" Width="73px" OnClick="btn_submit_Click" style="margin-left: 0px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="30px" Text="Reset" Width="87px" OnClick="btn_reset_Click" />
                &nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">
                <asp:GridView ID="grid_reply" runat="server" AutoGenerateColumns="False" DataKeyNames="quer_id" OnRowCancelingEdit="grid_reply_RowCancelingEdit" OnRowDeleting="grid_reply_RowDeleting" OnRowEditing="grid_reply_RowEditing" OnRowUpdating="grid_reply_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Question">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_quest" runat="server" DataSourceID="SqlDataSource1" DataTextField="question" DataValueField="quest_id" SelectedValue='<%# Bind("quest_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT [quest_id], [question] FROM [ask_quest]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("quest_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Reply">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_reply" runat="server" Text='<%# Bind("reply") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("reply") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Replied By">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_by" runat="server" Text='<%# Bind("replied_by") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("replied_by") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="rep_date" HeaderText="Date" />
                        <asp:CommandField ShowEditButton="True" CausesValidation="False" />
                        <asp:CommandField ShowDeleteButton="True" CausesValidation="False" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            </td>
        </tr>
    </table>--%>
</asp:Content>

