<%@ Page Title="" Language="C#" MasterPageFile="~/login/loginMasterPage.master" AutoEventWireup="true"   CodeFile="login.aspx.cs" Inherits="login_login" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
					

					
                <span class="login100-form-title p-b-55">
						Login
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Valid email is required: ex@abc.xyz">
                        <asp:TextBox ID="txt_user" class="input100"  placeholder="Email" runat="server"></asp:TextBox>
						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-envelope"></span>
						</span>
					</div>

					<div class="wrap-input100 validate-input m-b-16" data-validate = "Password is required">
                         <asp:TextBox ID="txt_pwd" class="input100" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
						
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<span class="lnr lnr-lock"></span>
						</span>
					</div>

    <div>
<%--    <asp:Label ID="lbl_invalid" runat="server" Text="Invalid Username/Password"></asp:Label>--%>
        </div>

					<%--<div class="contact100-form-checkbox m-l-4">--%>
                        <div>
                            <asp:Label ID="lbl_invalid" class="text-center w-full p-t-42 p-b-22"  runat="server" Text="Invalid Username/Password"></asp:Label>

						
					</div>
					
					<div class="container-login100-form-btn p-t-25">

                        <asp:Button ID="btn_new" class="login100-form-btn" OnClick="btn_new_Click" runat="server" Text="Login" />
						
					</div>

					<div class="text-center w-full p-t-42 p-b-22">
						<span class="txt1">
							Need an account? 
						</span>
					</div>

					<a href="buyer_reg.aspx" class="btn-google m-b-10">
						<img src="images/icons/userpro.PNG" alt="GOOGLE">
						Buyer Sign up
					</a>

					<a href="login_owner.aspx" class="btn-google m-b-10">
						<img src="images/icons/userpro.PNG" alt="GOOGLE">
						Owner Sign up
					</a>

					<%--<div class="text-center w-full p-t-115">
						<span class="txt1">
						</span>

						<a class="txt1 bo1 hov1" href="../pethome/pethome1.aspx">
							Go to Home
						</a>
					</div>--%>
	
        

</asp:Content>

