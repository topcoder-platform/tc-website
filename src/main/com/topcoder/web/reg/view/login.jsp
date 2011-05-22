<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<s:include value="/includes/html_head.jsp">
		<s:param name="pageTitle">Login</s:param>
	</s:include>
<body> 
	<!-- header -->
	<div id="headerWrapper">
		<div id="headerInner">
			<a id="topcoderLogo" href="http://www.topcoder.com"><img  src="i/topcoder-logo.png" alt="Topcoder Logo"></img></a>
		</div>
	</div>
	<!-- header end -->
	
	<!-- main content -->
	<div id="mainWrapper">
		<div id="registerInnerWrapper" class="innerWrapper">
			<!-- red rounded box-->
			<div id="registerBox" class="redRoundedBox">
				<div class="top">
					<div class="leftTop"><div class="rightTop">
						<div class="topContent">
							<h2 id="loginTitle" class="title">LOGIN</h2>
						</div>
					</div></div>
				</div>
				<div id="loginErrors" class="invisible">
					<s:actionerror />
					<s:fielderror />
				</div>				
				<s:form action="loginAction" namespace="/" method="post" id="loginForm" >
				<div class="contentLeft"><div class="contentRight">
					<div class="contentBox">
						<dl class="twoColumnForm loginLabelColumn">
							<dt>Username</dt>
							<dd><s:textfield id="TI_username" cssClass="grayInputText registerInputMed" name="username" /><span id="usernameErrorMsg" class="errorMessage1">Please input your username</span></dd>
							<dt>Password</dt>
							<dd><s:password id="TI_password" cssClass="grayInputText registerInputMed" name="password" /><span id="passwordErrorMsg" class="errorMessage1">Incorrect password</span></dd>
							<dt>Remember Me</dt>
							<dd>
								<input id="TI_rememberMe" type="checkbox"/>
								<a id="login" class="mediumButton redButton" href="#">Login<span></span></a>
							</dd>
						</dl>
						<p id="forgotPara" class="loginPara"><b>Forgot your password?</b></p>
						<p class="loginPara">If you cannot remember your password, <a href='<s:url value="/password_recover.jsp"/>'>Click here</a> and we can help you restore your account.</p>
						<p id="newMemberPara" class="loginPara"><b>New to TopCoder?</b></p>
						<p class="loginPara"><a href='<s:url value="/register.jsp"/>'>Register now</a>. After you complete the registration process, we will send your account activation code via email.</p>
						<div id="registerSpacer"></div>
					</div>
				</div></div>
				</s:form>
				<div class="bottom">
					<div class="leftBottom"><div class="rightbottom">
						<div class="bottomContent">
						</div>
					</div></div>
				</div>
			</div>
			<!-- red rounded box-->			
		</div>
		<p class="footerPara">Lorem ipsum dolor sit amet, consectetur adipiscing elit.Nunc vitae magna augue. Cras luctus, enim eget egestas vulputate, est diam</p>
	</div>
	<!-- main content end -->
</body>
</html>

