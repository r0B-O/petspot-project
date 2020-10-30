<%@ Page Title="" Language="C#" MasterPageFile="~/owner/ownerMasterPage.master" AutoEventWireup="true" CodeFile="bookinggrid.aspx.cs" Inherits="bookinggrid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <table class="auto-style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <h2 class="auto-style4">SELECT SHOW</h2>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="204px">
                </asp:DropDownList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="grid_book" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" OnRowCancelingEdit="grid_book_RowCancelingEdit" OnRowDeleting="grid_book_RowDeleting" OnRowEditing="grid_book_RowEditing" CssClass="auto-style3" Width="667px">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="apply_date" HeaderText="Apply Date" />
                        <asp:BoundField DataField="phone" HeaderText="Phone" />
                        <asp:CommandField CausesValidation="False" ShowEditButton="True" />
                        <asp:CommandField CausesValidation="False" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

