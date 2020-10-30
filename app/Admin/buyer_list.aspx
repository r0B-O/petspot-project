<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="buyer_list.aspx.cs" Inherits="login_buyer_reg" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <td>

    <table id="customers">
        <tr>
            <td class="auto-style6" colspan="2">
                <h2><strong class="auto-style14">&nbsp;</strong><span class="auto-style25"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BUYER LIST</strong></span></h2>
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
                <h3>
                    &nbsp;</h3>
            </td>
            <td class="auto-style10">
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:DetailsView ID="dv_buyer" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="buyer_id" Height="50px" OnItemDeleting="dv_buyer_ItemDeleting" OnItemUpdating="dv_buyer_ItemUpdating" OnModeChanging="dv_buyer_ModeChanging" OnPageIndexChanging="dv_buyer_PageIndexChanging" Width="125px">
                    <Fields>
                        <asp:TemplateField HeaderText="Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_name" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_addr" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_city" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_state" runat="server" DataSourceID="SqlDataSource1" DataTextField="state" DataValueField="state_id" SelectedValue='<%# Bind("state_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [state]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("state_id") %>'></asp:TextBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("state_id") %>'></asp:Label>
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
                    </Fields>
                </asp:DetailsView>
                <br />
                <br />
                <br />
            </td>
            <td class="auto-style24">
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
            </td>
        </tr>
        <tr>
            <td class="auto-style13">
                &nbsp;</td>
            <td class="auto-style24">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style13">
            </td>
            <td class="auto-style24">
            </td>
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
            <td class="auto-style20" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style20" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
        </td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>

