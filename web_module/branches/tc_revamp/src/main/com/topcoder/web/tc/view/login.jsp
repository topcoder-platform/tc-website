<%--
  - Author: TCSASSEMBLIER, kanakarajank
  - Version: 2.0
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: The page to display and filter a list of contests.
 --%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<s:include value="/includes/head.jsp">
			<s:param name="title">Home</s:param>
		</s:include>
		<link href="../css/skin.css" type="text/css" rel="stylesheet" media="screen" />
	</head>
	<body>
		<div id="wrapper">
			<s:include value="/includes/header.jsp">
			</s:include>
			<div id="content">
				<div id="leftColumn" class="sideBar">
					<s:include value="/includes/searchPanel.jsp"/>
					<s:include value="/includes/activeContestsPanel.jsp"/>
					<s:include value="/includes/networksPanel.jsp"/>
					<s:include value="/includes/toolsPanel.jsp"/>
				</div>
				<!--End #leftColunm-->
				<div id="centerColumn">
					<s:url var="loginLink" action="login" namespace="/">
					</s:url>
					<s:actionerror />
					<s:set name="theme" value="'xhtml'" scope="page" />
					
						<p>
							<h4>Forgot your password?</h4>
							<div>
								If you cannot remember your password <a href="<s:url value="%{getText('recoverpassword.url')}"/>">click here</a> and we can help you restore your account.
							</div>
						</p>
						<br/>
						<p>
							<h4>New to TopCoder?</h4>
							<div>
								<a href="<s:url value="%{getText('register.url')}"/>">Register now.</a> After you complete the registration process, we will send your account activation code via email.
							</div>
						</p>
						<br/>
						<s:form action="login" method="post">
								<table>							
									<s:textfield name="username" label="User Name" size="20" labelSeparator=":"/>
								
									<s:password name="password" label="Password" size="20" labelSeparator=":"/>
								
									<s:checkbox name="rememberme" label="Remember Me"/>
								</table>
								
								<a href="javascript:;" class="redBtn submitBtn"><span
									class="rightSide"><span class="inner">LOGIN</span> </span> </a>
						</s:form>	
				</div>
				<!--End #centerColumn-->
				<div class="clear"></div>
			</div>
		</div>
		<s:include value="/includes/footer.jsp" />
	</body>
</html>
