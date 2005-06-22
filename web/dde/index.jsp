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
    String page_name = "s_index.jsp";
    String action = request.getParameter("a");
%>

<%
    String code = request.getParameter("code");
    if (code == null) {
        code = "";
    }
    if (action != null) {
        if (action.equalsIgnoreCase("authentication")) {
            response.sendRedirect("c_register_activate.jsp?code="+code);
            return;
        }
    }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Application Development, .NET&#8482; and Java&#8482; Software Components at TopCoder Software</title>
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

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="/includes/left.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>
<!-- Left Column ends -->

<!-- Gutter 1 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 1 ends -->

<!-- Middle Column begins -->
        <td width="99%" align="center">
            <table border="0" cellpadding="0" cellspacing="10" width="530">
                <tr>
                    <td align="left">
                        <br/><a href="/applications/index.jsp"><img src="images/promos/promo_home_1.gif" alt="" width="267" height="59" border="0" /></a><br/><br/>
                        Using our member base of thousands of highly-skilled developers from all over the world, our competition-based
                        methodology, and our catalogs of re-usable components, TopCoder delivers high-quality software at a lower cost than the competition.
                        <strong><a href="/applications/index.jsp">Learn more</a></strong>
                    </td>
                    <td align="left">
                        <a href="/applications/index.jsp"><img src="images/promos/promo_home_2.jpg" alt="" width="247" height="175" border="0" /></a>
                    </td>
                </tr>

<!-- Small promos begins -->
<!-- Small promos ends -->

            </table>

<!-- Featured Customers begins -->
			<jsp:include page="/includes/customers_featured.jsp" flush="true" />
<!-- Featured Customers ends -->

<!-- Press Highlights begins -->
            <jsp:include page="/includes/press_highlights.jsp" flush="true" />
<!-- Press Highlights ends -->

            <p><br></p>

        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
        <jsp:include page="/includes/topDownloads.jsp" />
        <jsp:include page="/includes/right.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        
        <jsp:include page="/includes/newReleases.jsp" />
        <jsp:include page="/includes/right.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>
<!--Right Column ends -->

<!-- Gutter 3 begins -->
        <td width="10"><img src="/images/clear.gif" alt="" width="10" height="10" border="0" /></td>
<!-- Gutter 3 ends -->

    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="/includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>
