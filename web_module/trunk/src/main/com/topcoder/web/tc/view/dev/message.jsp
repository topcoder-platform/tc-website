<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.web.tc.Constants"%>
<head>
    <title>TopCoder - Message</title>
    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
                <jsp:param name="level3" value="active_contests"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyText">
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
            <jsp:include page="../body_top.jsp">
                <jsp:param name="image" value="development"/>
                <jsp:param name="image1" value="white"/>
                <jsp:param name="title" value="Components"/>
            </jsp:include>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

            <p style="width: 510px;">
                <strong><%=(String)request.getAttribute(Constants.MESSAGE)%></strong>
            </p>

        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="180">
            <jsp:include page="right.jsp"/>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
        <!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>


