<%@ page import="javax.naming.*" %>
<%@ page import="javax.ejb.CreateException" %>
<%@ page import="java.io.*" %>
<%@ page import="java.rmi.*" %>
<%@ page import="javax.rmi.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.reflect.*" %>

<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<%
	// STANDARD PAGE VARIABLES
	String page_name = "c_forgot_password.jsp";
	String action = request.getParameter("a");
%>

<%
    String strError = "";
    String txtHandle = request.getParameter("txtHandle");
    if (txtHandle == null) {
        txtHandle = "";
    }
    
	if (action != null) {
		action = action.trim();
		
		if (action.equalsIgnoreCase("Get Password")) {
		    if ("".equals(txtHandle)) {
		        strError = "You must enter a valid user name.";
		    } else {
		    
		        try {
        		    //Send the email
        		    USER_MANAGER.sendPasswordEmail(txtHandle);
        		    response.sendRedirect("s_sent_password.jsp");
        		    return;
        		} catch (com.topcoder.dde.user.NoSuchUserException nsue) {
        		    strError = "Invalid username";
        		}
    		}
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>TopCoder Software</title>

<link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />

<script language="JavaScript" type="text/javascript" src="/scripts/javascript.js">
</script>

</head>

<body class="body" marginheight="0" marginwidth="0" onLoad="frmLogin.txtHandle.focus()">

<!-- Header begins -->
<%@ include file="/includes/header.jsp" %>
<%@ include file="/includes/nav.jsp" %>
<!-- Header ends -->

<!-- breadcrumb begins -->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
<!-- breadcrumb ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
	<tr valign="top">

<!-- Left Column begins -->
		<td width="165" class="leftColumn">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/clear.gif" alt="" width="165" height="5" border="0" /></td></tr>
			</table>
		</td>
		<td width="5" class="leftColumn"><img src="/images/clear.gif" alt="" width="5" height="10" border="0" /></td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
		<td width="100%">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
				<tr><td class="normal"><img src="/images/headLogin.gif" alt="Login" width="545" height="35" border="0" /></td></tr>
				<tr><td class="subhead">I forgot my password</td></tr>
			</table>
				
			<table width="100%" cellpadding="0" cellspacing="6" align="center" border="0">
				<tr valign="top">
        			<form name="frmLogin" action="<%=page_name%>" method="post">
					<td align="center">
						<table width="500" cellpadding="0" cellspacing="0" border="0" align="center">
							<tr><td><img src="/images/regUserNameHead.gif" alt="User Name" width="500" height="29" border="0" /></td></tr>
						</table>

						<table width="500" border="0" cellspacing="4" cellpadding="0" align="center" class="register">
<!-- Column Setting Row -->
							<tr valign="middle">
							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="loginCenter" colspan="2">Enter your User Name below and we will send your password to you by Email.</td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

<!-- User Name Error Text -->
							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="registerText" width="1%"></td>
								<td class="errorText" width="1%"><%=strError%></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

<!-- User Name -->
							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="registerLabel" width="1%" nowrap>User Name</td>
								<td class="registerText" width="1%"><input class="registerForm" type="text" name="txtHandle" value ="<%=txtHandle%>" size="30" maxlength="30"></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="loginCenter" colspan="2"><img src="/images/clear.gif" alt="" width="5" height="10" border="0" /></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="loginCenter" colspan="2"><input class="registerButton" type="submit" name="a" value="Get Password"></input></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>

							<tr valign="middle">
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
								<td class="loginCenter" colspan="2"><img src="/images/clear.gif" alt="" width="5" height="10" border="0" /></td>
								<td width="48%"><img src="/images/clear.gif" alt="" width="5" height="1" border="0" /></td>
							</tr>
						</table>

						<table width="500" cellpadding="0" cellspacing="0" border="0" align="center">
							<tr><td><img src="/images/regFoot.gif" alt="" width="500" height="10" border="0" /></td></tr>
							<tr><td height="40"><img src="/images/clear.gif" alt="" width="10" height="40" border="0" /></form></td></tr>
						</table>
					</td>
				    </form>
				</tr>
			</table></td>
<!--Middle Column ends -->

<!-- Gutter 2 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
		<td width="245">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr><td height="15"><img src="/images/clear.gif" alt="" width="245" height="15" border="0" /></td></tr>
			</table>
		</td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
		<td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->
	</tr>
</table>
	
<!-- Footer begins -->
<jsp:include page="/includes/footer.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
