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
    <title>Find Components</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="/includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
            <jsp:include page="/includes/left.jsp" >
                <jsp:param name="level1" value="components"/>
                <jsp:param name="level2" value="find"/>
            </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter ends -->

<!-- Middle Column begins -->
        <td width="100%">
		<table cellspacing=0 cellpadding=0 border=0 width=510 align=center>
			<tr>
				<td colspan=2>
				<img src="/images/clear.gif" alt="" width="10" height="15" border="0" /><br/>
				<img src="/images/headComponentsShort.gif" alt="Components" width="153" height="32" border="0"><br/>
				<img src="/images/clear.gif" alt="" width="10" height="15" border="0" />
				</td>
			</tr>
			<tr>
				<td class=catalogIndexHeader colspan=2>Find Components</td>
			</tr>
			<tr valign=top>
				<td class=catalogIndexCell><A href="/components/appSuiteIndex.jsp"><img src="/images/catalog/appSuiteBtn.jpg" border=0/></A></td>
				<td class=catalogIndexCell width=100%><A href="/components/appSuiteIndex.jsp"><b>Browse Application Suites</b></A><br/>Application Suites are multi-purpose tools to solve a variety of software needs in one package. Thinking of adding an eCommerce section to your site? Our eCommerce Application Suite has everything you will need from a shopping cart to security.</td>
			</tr>
			<tr valign=top>
				<td class=catalogIndexCell><A href="/catalog/c_showroom.jsp"><img src="/images/catalog/categoryBtn.jpg" border=0/></A></td>
				<td class=catalogIndexCell><A href="/catalog/c_showroom.jsp"><b>Browse Components by Category</b></A><br/>Need some Security Tools? How about some Administration Tools? If you have a specific software functionality need, browse here to view our Component Catalog broken up into categories.</td>
			</tr>
			<tr valign=top>
				<td class=catalogIndexCell><A href="/catalog/c_showroom.jsp?a=all"><img src="/images/catalog/indexBtn.jpg" border=0/></A></td>
				<td class=catalogIndexCell><A href="/catalog/c_showroom.jsp?a=all"><b>Browse Component Index</b></A><br/>An alphabetical listing of our components, both Java and .Net.  Browse here if you know the exact component that you are looking for.</td>
			</tr>
		</table>
        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
        <jsp:include page="/includes/right.jsp" >
            <jsp:param name="level1" value="components"/>
        </jsp:include>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
