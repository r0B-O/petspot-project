<%@ Page Title="" Language="C#" MasterPageFile="~/owner/ownerMasterPage.master" AutoEventWireup="true" CodeFile="showbooking.aspx.cs" Inherits="owner_showbooking" %>

<script runat="server">

</script>


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
											List of Dog Show Conducted by Pet<span>Spot</span></h3>
        <table id="customers">
        <tr>
            <td>
                <h3>
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:petcs %>" SelectCommand="SELECT * FROM [dog_show]"></asp:SqlDataSource>
                </h3>
                <asp:DataList ID="DataList1" runat="server"  BorderStyle="Double" BorderWidth="2px" CellPadding="30" CssClass="auto-style7" DataKeyField="show_id" RepeatColumns="3" DataSourceID="SqlDataSource10">
                    <ItemTemplate>
                        <table id="customers">
                            <tr>
                                <td class="auto-style12">
                                    <span class="auto-style15"><em>
                                    <asp:Label ID="Label20" runat="server" CssClass="auto-style23" Text='<%# Eval("show_title") %>'></asp:Label>
                                    </em>
                                    <br />
                                    <br class="auto-style14" />
                                    <span class="auto-style16"><span class="auto-style20">Venue</span>:</span><asp:Label ID="Label24" runat="server" CssClass="auto-style19" Text='<%# Eval("venue") %>'></asp:Label>
                                    <br />
                                    <br class="auto-style14" />
                                    </span><span class="auto-style16"><span class="auto-style20">City</span>:</span><span class="auto-style15"><asp:Label ID="Label22" runat="server" CssClass="auto-style14" Text='<%# Eval("city") %>'></asp:Label>
                                    <br />
                                    <br class="auto-style14" />
                                    </span><span class="auto-style16"><span class="auto-style20">Show From Date</span>:</span><span class="auto-style15"><asp:Label ID="Label25" runat="server" CssClass="auto-style14" Text='<%# Eval("show_from_date") %>'></asp:Label>
                                    <br />
                                    <span class="auto-style20">
                                    <br class="auto-style14" />
                                    </span></span><span class="auto-style16"><span class="auto-style20">Show To Date</span>:</span><span class="auto-style15"><asp:Label ID="Label26" runat="server" CssClass="auto-style14" Text='<%# Eval("show_to_date") %>'></asp:Label>
                                    <br />
                                    <br class="auto-style14" />
                                    </span><span class="auto-style16"><span class="auto-style20">Status</span>:</span><span class="auto-style15"><asp:Label ID="Label27" runat="server" CssClass="auto-style14" Text='<%# Eval("status") %>'></asp:Label>
                                    <br />
                                    <br />
                                    </span>
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Book Now" />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
            <tr>
            <td class="auto-style21">&nbsp;</td>
        </tr>
            <tr>
            <td class="auto-style21">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

