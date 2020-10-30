<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="dogshow.aspx.cs" Inherits="Admin_dogshow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%-- <style type="text/css">
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
             height: 23px;
         }
        .auto-style9 {
            width: 418px;
            height: 33px;
            background-color: #CCCCCC;
        }
        .auto-style10 {
            height: 33px;
            width: 419px;
            background-color: #CCCCCC;
        }
        .auto-style25 {
            color: #FFFFFF;
        }
        .auto-style26 {
            margin-left: 219px;
        }
         .auto-style27 {
             height: 33px;
             background-color: #CCCCCC;
         }
         .auto-style28 {
             height: 24px;
             background-color: #CCCCCC;
         }
         .auto-style29 {
             height: 24px;
             width: 419px;
             background-color: #CCCCCC;
         }
         .auto-style30 {
             height: 18px;
             background-color: #CCCCCC;
         }
         .auto-style31 {
             height: 18px;
             width: 419px;
             background-color: #CCCCCC;
         }
         .auto-style32 {
             height: 15px;
             background-color: #CCCCCC;
         }
         .auto-style33 {
             height: 15px;
             width: 419px;
             background-color: #CCCCCC;
         }
         .auto-style34 {
             background-color: #CCCCCC;
             height: 26px;
         }
         .auto-style35 {
             width: 419px;
             background-color: #CCCCCC;
             height: 26px;
         }
         .auto-style36 {
             height: 20px;
             background-color: #CCCCCC;
         }
         .auto-style37 {
             height: 20px;
             width: 419px;
             background-color: #CCCCCC;
         }
         .auto-style38 {
             height: 17px;
             background-color: #CCCCCC;
         }
         .auto-style39 {
             height: 17px;
             width: 419px;
             background-color: #CCCCCC;
         }
         .auto-style40 {
             height: 49px;
             background-color: #CCCCCC;
         }
         .auto-style41 {
             height: 49px;
             width: 419px;
             background-color: #CCCCCC;
         }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <td>
     <table id="customers">
        <tr>
            <td class="auto-style6" colspan="2">
                <span class="auto-style25"><strong>DOG SHOW</strong></span></td>
        </tr>
        <tr>
            <td class="auto-style32">
                <h3>
                    Show Tittle</h3>
            </td>
            <td class="auto-style33">
                <asp:TextBox ID="txt_tittle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_tittle" ErrorMessage="**Required**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <h3>
                    Country</h3>
            </td>
            <td class="auto-style10">
                <asp:DropDownList ID="ddl_country" runat="server" Width="128px">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddl_country" ErrorMessage="**Choose any country**" ForeColor="Red" Operator="NotEqual" ValueToCompare="--Select--"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style28">
                <h3>
                    City</h3>
            </td>
            <td class="auto-style29">
                <asp:TextBox ID="txt_city" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_city" ErrorMessage="**Required**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30">
                <h3>
                    State</h3>
            </td>
            <td class="auto-style31">
                <asp:DropDownList ID="ddl_state" runat="server" Width="128px">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddl_state" ErrorMessage="**Choose any state**" ForeColor="Red" Operator="NotEqual" ValueToCompare="--Select--"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style34">
                <h3>
                    Venue</h3>
            </td>
            <td class="auto-style35">
                <asp:TextBox ID="txt_ven" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_ven" ErrorMessage="**Required**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style36">
                <h3>
                    Show from date</h3>
            </td>
            <td class="auto-style37">
                <asp:TextBox ID="txt_show_from" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_show_from" ErrorMessage="**Required**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style38">
                <h3>
                    Show to date</h3>
            </td>
            <td class="auto-style39">
                <asp:TextBox ID="txt_show_to" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_show_to" ErrorMessage="**Required**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style40">
                <h3>
                    <asp:Label ID="lbl_status" runat="server" style="text-align: center" Text="Status"></asp:Label>
                </h3>
            </td>
            <td class="auto-style41">
                <asp:TextBox ID="txt_status" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_status" ErrorMessage="**Required**" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style27" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="24px" Text="Submit" Width="127px" OnClick="btn_submit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="22px" Text="Reset" Width="125px" OnClick="btn_reset_Click" />
            </td>
        </tr>
        </table>
        </td>
</asp:Content>

