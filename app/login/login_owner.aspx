<%@ Page Title="" Language="C#" MasterPageFile="~/login/loginMasterPage.master" AutoEventWireup="true" CodeFile="login_owner.aspx.cs" Inherits="login_login_owner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <div>


                        <ul class="top-hnt-right-content col-lg-6">

						<li class="button-log usernhy">
                            <a class="txt1 bo1 hov1" href="../pethome/pethome1.aspx">
							Go to Home
                              
                                <span class="fa fa-user" aria-hidden="true"></span>
						</a>
							<%--<a class="btn-open" href="../pethome/pethome1.aspx">
								
							</a>--%>
						</li>
                            </ul>
					</div>
    
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

     <table class="auto-style1">
        <tr>
            <td class="auto-style6">
                <h2><strong class="auto-style14">&nbsp;</strong><span class="auto-style25"><strong>OWNER SIGN UP
                                                                                           </strong></span></h2>
                <br>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_name" runat="server" class="input100"  placeholder="Enter Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:TextBox ID="txt_age" runat="server" class="input100"  placeholder="Enter your address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_age" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:RadioButtonList ID="rbl_gen" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <br>

        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_mob" runat="server"  class="input100"  placeholder="Enter Mobile" TextMode="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_mob" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_phn" class="input100"  placeholder="Enter phone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_phn" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_email" class="input100"  placeholder="Enter Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_email" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_user_name"  class="input100"  placeholder="Enter username" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_user_name" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_pswd" Textmode="Password" class="input100"  placeholder="Enter password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_pswd" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style24">
                <asp:TextBox ID="txt_c_pswd" TextMode="Password" class="input100"  placeholder="Confirm Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txt_c_pswd" ErrorMessage="**Required**" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style30">
                <asp:TextBox ID="txt_reg_date" runat="server"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style20">
                <asp:Button ID="btn_submit" runat="server" class="login100-form-btn" OnClick="btn_submit_Click" Text="Register"  BorderStyle="Double" /><asp:Button ID="btn_reset" runat="server" class="login100-form-btn" OnClick="btn_submit_Click"  Text="Reset" />
                
                </td>
        </tr>
        <tr>
            <td class="auto-style20">
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
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>

