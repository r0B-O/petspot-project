<%@ Page Title="" Language="C#" MasterPageFile="~/owner/ownerMasterPage.master" AutoEventWireup="true" CodeFile="pet.aspx.cs" Inherits="owner_pet" %>

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
          .auto-style27 {
              background-color: #CCCCCC;
              height: 25px;
          }
          .auto-style28 {
              width: 419px;
              background-color: #CCCCCC;
              height: 25px;
          }
          .auto-style29 {
              background-color: #CCCCCC;
              height: 23px;
          }
          .auto-style30 {
              width: 419px;
              background-color: #CCCCCC;
              height: 23px;
          }
          .auto-style31 {
              background-color: #CCCCCC;
              height: 26px;
          }
          .auto-style32 {
              width: 419px;
              background-color: #CCCCCC;
              height: 26px;
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
Register Your<span>Pet</span></h3>
    <td>
     <table  id="customers" >
        <tr>
            <td >
                    Owner Name</td>
            <td>
                <asp:DropDownList ID="ddl_name" runat="server">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddl_name" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Pet Name</td>
            <td>
                <asp:TextBox ID="txt_pet" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_pet" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Age</td>
            <td>
                <asp:TextBox ID="txt_age" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_age" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Orgin
                </td>
            <td>
                <asp:DropDownList ID="ddl_orgin" runat="server">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddl_orgin" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                Category 
            </td>
            <td>
                <asp:DropDownList ID="ddl_cat" runat="server">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="ddl_cat" ErrorMessage="**Choose any category**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Breed</td>
            <td>
                <asp:DropDownList ID="ddl_breed" runat="server">
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ddl_breed" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Weight</td>
            <td>
                <asp:DropDownList ID="ddl_wt" runat="server" >
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddl_wt" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Height</td>
            <td>
                <asp:DropDownList ID="ddl_ht" runat="server" >
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddl_ht" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                Color</td>
            <td>
                <asp:DropDownList ID="ddl_color" runat="server" >
                </asp:DropDownList>
                <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="ddl_color" ErrorMessage="**Choose any country**" Operator="NotEqual" ValueToCompare="--Select--" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td >
                Gender</td>
            <td>
                <asp:RadioButtonList ID="rdl_gen" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td >
                Features</td>
            <td>
                <asp:TextBox ID="txt_features" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_features" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Temperament</td>
            <td>
                <asp:TextBox ID="txt_temp" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_temp" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Activity</td>
            <td>
                <asp:TextBox ID="txt_activity" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_activity" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                COAT</td>
            <td>
                <asp:TextBox ID="txt_coat" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_coat" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Picture</td>
            <td>
                <asp:FileUpload ID="fup_image1" runat="server" />
                <asp:Button ID="btn_up1" runat="server" Text="Upload" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="fup_image1" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Picture</td>
            <td>
                <asp:FileUpload ID="fup_image2" runat="server" />
                <asp:Button ID="btn_up2" runat="server" Text="Upload" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="fup_image2" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Price</td>
            <td>
                <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txt_price" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Total No of Pets</td>
            <td>
                <asp:TextBox ID="txt_tot_pet" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txt_tot_pet" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Life Span</td>
            <td>
                <asp:TextBox ID="txt_life" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txt_life" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Scientific Name</td>
            <td>
                <asp:TextBox ID="txt_sci" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txt_sci" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                Character</td>
            <td>
                <asp:TextBox ID="txt_char" runat="server" style="height: 22px" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txt_char" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >
                    Behaviour</td>
            <td>
                <asp:TextBox ID="txt_behave" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txt_behave" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td >
                <asp:Button ID="btn_submit" runat="server" BorderStyle="Double" CssClass="auto-style26" Height="38px" Text="Submit" Width="127px" OnClick="btn_submit_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btn_reset" runat="server" BackColor="White" BorderStyle="Double" Height="38px" Text="Reset" Width="125px" OnClick="btn_reset_Click" />
                </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
        </td>
</asp:Content>

