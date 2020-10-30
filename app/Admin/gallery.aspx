<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="Admin_gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style type="text/css">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style4" colspan="2">&nbsp;<h2 class="auto-style3"><strong><span class="auto-style5">Gallery</span>&nbsp;</strong></h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <h3>Videos</h3>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TextBox1" runat="server" Height="26px" Width="179px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">
                <h3>
                    <asp:Label ID="Label1" runat="server" Text="Show Tittle"></asp:Label>
                </h3>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="ddl_tittle" runat="server" Width="189px" Height="29px">
                </asp:DropDownList>
            </td>
        </tr>

            <tr>
            <td class="auto-style7" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="38px" Text="Submit" Width="191px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="38px" Text="Reset" Width="192px" />
            </td>
        </tr>
    </table>
</asp:Content>

