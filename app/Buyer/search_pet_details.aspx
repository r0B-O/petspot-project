<%@ Page Title="" Language="C#" MasterPageFile="~/Buyer/BuyerMasterPage.master" AutoEventWireup="true" CodeFile="search_pet_details.aspx.cs" Inherits="Buyer_search_pet_details" %>

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
      
    .auto-style1 {
        width: 15px;
    }
    .auto-style2 {
        width: 33px;
    }
    .auto-style3 {
        width: 51px;
    }
    .auto-style4 {
        width: 639px;
    }
    .auto-style5 {
        width: 16px;
    }
    .auto-style6 {
        width: 24px;
    }
    .auto-style8 {
        width: 32px;
    }
    .auto-style9 {
        width: 38px;
    }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="customers">
    
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td class="auto-style4">    <asp:DataList ID="dl_details" runat="server" OnItemCommand="dl_details_ItemCommand" CssClass="auto-style4" >
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td colspan="4" rowspan="4">
                        <asp:Image ID="image1" runat="server" BorderColor="#666666" BorderStyle="Solid" Height="205px" ImageUrl='<%# Bind("image1","~/image/{0}") %>' Width="208px" />
                    </td>
                    <td class="auto-style2" colspan="2">
                        Pet Name:</td>
                    <td class="auto-style3" colspan="2">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("pet_name") %>'></asp:Label>
                    </td>
                    <td class="auto-style2" colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Age:</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Orgin</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("orgin") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Breed</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("brd") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="3">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td colspan="2">&nbsp; Weight&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                    <td colspan="2" class="auto-style8">&nbsp;&nbsp; &nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("wt") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4"><strong><em>Quantity</em></strong></td>
                    <td>
                        <asp:TextBox ID="txt_quan" runat="server" BorderColor="#333333" Height="23px" Width="137px"></asp:TextBox>
                    </td>
                    <td colspan="2" class="auto-style6">&nbsp;&nbsp;</td>
                    <td>
                        Height</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ht") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_addcart" runat="server" BorderColor="#666666" CommandName="cart" Height="59px" Text="Add to cart" Width="218px" />
                    </td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Color</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("col") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;<asp:Button ID="Button1" runat="server" BorderColor="#666666" CssClass="auto-style5" ForeColor="Red" Height="41px" OnClick="Button1_Click" Text="Cancel" Width="138px" />
                    </td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Gender</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button2" runat="server" BorderStyle="Solid" CommandName="ask" OnClick="Button2_Click" Text="Ask Question" />
                    </td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Features</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("features") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Temperament</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("temperament") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Activity</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("activity") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Price</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Life Span</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("life_span") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Scientific Name</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label14" runat="server" Text='<%# Bind("scientific_name") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Character</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label15" runat="server" Text='<%# Bind("character") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Behaviour</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label16" runat="server" Text='<%# Bind("behaviour") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="2" class="auto-style6">&nbsp;</td>
                    <td>
                        Category</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="2">
                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("cat_name") %>'></asp:Label>
                    </td>
                    <td colspan="2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td colspan="11">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="14">
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
            </td>
        </tr>
        </table>
</asp:Content>

