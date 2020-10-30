<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="griddogshow.aspx.cs" Inherits="griddogshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grid_dog" runat="server" AutoGenerateColumns="False" DataKeyNames="show_id" OnRowCancelingEdit="grid_dog_RowCancelingEdit" OnRowDeleting="grid_dog_RowDeleting" OnRowEditing="grid_dog_RowEditing" OnRowUpdating="grid_dog_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Show Tittle">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_tittle" runat="server" Text='<%# Bind("show_title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("show_title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_country" runat="server" DataSourceID="SqlDataSource2" DataTextField="country" DataValueField="country_id" SelectedValue='<%# Bind("country_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [country]"></asp:SqlDataSource>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_city" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_state" runat="server" DataSourceID="SqlDataSource1" DataTextField="state" DataValueField="state_id" SelectedValue='<%# Bind("state_id") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [state]"></asp:SqlDataSource>
                                <br />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Venue">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_venue" runat="server" Text='<%# Bind("venue") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("venue") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Show from date">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_show_from" runat="server" Text='<%# Bind("show_from_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("show_from_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Show to date">
                            <EditItemTemplate>
                                <asp:TextBox ID="txt_show_to" runat="server" Text='<%# Bind("show_to_date") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("show_to_date") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

