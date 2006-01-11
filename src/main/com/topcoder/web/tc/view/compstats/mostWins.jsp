<%@ page language="java"
         import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.shared.dataAccess.resultSet.*,
                 java.util.*" %>

<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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

<% ResultSetContainer rsc = (ResultSetContainer)request.get("result");%>
<table>
<tr><td>Most wins</td></tr>
<% Iterator it = rsc.iterator();
while (it.hasNext()) {
	ResultSetContainer.ResultSetRow row = (ResultSetContainer.ResultSetRow) it.next();%>
	<tr><td><%=row.getItem(1);%></td>
	<td><%=row.getItem(2);%></td></tr>
<% } %>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
