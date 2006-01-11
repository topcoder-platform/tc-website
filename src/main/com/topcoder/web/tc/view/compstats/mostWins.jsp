<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.*" %>

<%@ page import="java.util.Iterator" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
            </jsp:include>
        </td>


        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="statistics_w"/>
                <jsp:param name="title" value="Component Contest Details"/>
            </jsp:include>

            <% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");%>
            <table>
                <tr><td>Most wins</td></tr>

				<rsc:iterator list="<%=rsc%>" id="row">
					<tr><td><rsc:item name="coder"/></td><td><rsc:item name="num_wins"/></td></tr>
				</rsc:iterator>
            </table>


        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>















