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
<%@ include file="/includes/formclasses.jsp" %>

<%
	// STANDARD PAGE VARIABLES
	String page_name = "s_contact.jsp";
	String action = request.getParameter("a");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>There has been an error uploading your file to TopCoder</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>

<!-- breadcrumb begins
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr><td width="100%" height="2" bgcolor="#000000"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
<!-- breadcrumb ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
	<tr valign="top">

<!-- Left Column begins -->
		<td width="165" class="leftColumn">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
<!-- Subscription promo -->
				<tr valign="top"><td><a href="s_subscriptions.jsp"><img src="/images/promoSubscription.gif" alt="Buy a Subscription" width="165" height="90" border="0" /></a></td></tr>
				<tr><td height="5"><img src="/images/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
			</table>
		</td>
		<td width="5" class="leftColumn"><img src="/images/clear.gif" alt="" width="5" height="10" border="0" /></td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
		<td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
		<td width="100%">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td height="15"><img src="/images/clear.gif" alt="" width="10" height="15" border="0" /></td></tr>
				<tr><td class="normal">&nbsp;</td></tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr valign="top">
					<td class="normal">
					Unfortunately, you have not inquired for this project or you are not yet a rated TopCoder member. You can get rated by participating in our Coding Competitions. Please check the current schedule for details regarding upcoming matches. To view other components and discuss component ideas with other members, visit <a class="statText" href="http://software.topcoder.com">TopCoder Software</a>. Your TopCoder handle and password will give you access to post questions or comments on the <a class="statText"  href="http://software.topcoder.com/forum/c_active_collab.jsp">Customer Forums</a>
                    If you have any problems please contact <a class="statText" href="mailto:service@topcodersoftware.com">service@topcodersoftware.com
					</td>
				</tr>
			</table>

			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr><td height="40"><img src="/images/clear.gif" alt="" width="10" height="40" border="0" /></td></tr>
			</table>
		</td>
<!-- Middle Column ends -->

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
