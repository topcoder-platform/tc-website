<%@ page import="com.topcoder.dde.util.Constants"%>
<%@ page language="java"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%@ include file="/includes/util.jsp" %>
<%@ include file="/includes/session.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Application Development, .NET&#8482; and Java&#8482; Software Components at TopCoder Software</title>
    <link rel="stylesheet" type="text/css" href="/includes/tcs_style.css" />
    <script language="JavaScript" type="text/javascript" src="/scripts/javascript.js"></script>
</head>

<body class="body">

<!-- Header begins -->
<jsp:include page="/includes/top.jsp"/>
<jsp:include page="../includes/menu.jsp" >
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="middle">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="180" class="leftColumn">
        <jsp:include page="../includes/left.jsp" >
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
                    <td align="left" colspan="3">
                        <textarea name="terms" rows="20" cols="80" readonly ><%=request.getAttribute(Constants.TERMS)%></textarea>
                        <br />
                        <a href="<%=sessionInfo.getServletPath()%>?module=ComponentTermsAgree">I agree</a> to these terms.
                    </td>
                </tr>

<!-- Small promos begins -->
            <jsp:include page="../includes/small_promos.jsp" flush="true" />
<!-- Small promos ends -->

            </table>

<!-- Customers begins -->
<!-- Customers ends -->

<!-- Press Highlights begins -->
            <jsp:include page="../includes/press_highlights.jsp" flush="true" />
<!-- Press Highlights ends -->

            <p><br></p>

        </td>
<!-- Middle Column ends -->

<!-- Gutter 2 begins -->
        <td width="15"><img src="/images/clear.gif" alt="" width="15" height="10" border="0" /></td>
<!-- Gutter 2 ends -->

<!-- Right Column begins -->
        <td width="170">
        <jsp:include page="../includes/right.jsp" >
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
<jsp:include page="../includes/foot.jsp" flush="true" />
<!-- Footer ends -->

</body>
</html>

