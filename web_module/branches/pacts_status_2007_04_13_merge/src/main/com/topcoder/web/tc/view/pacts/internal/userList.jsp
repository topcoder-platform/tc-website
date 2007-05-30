<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>PACTS</title>
</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.text.DecimalFormat"%>
<%
    UserProfileHeader[] userList = (UserProfileHeader[])
        request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
    if (userList == null) {
        out.println("no list!!!<br>");
        userList = new UserProfileHeader[0];
    }
%>

<h1>PACTS</h1>
<h2>User List</h2>
<%
    if (userList.length == 0) {
        out.println("no results matched your query<br>");
    }
    else {
%>
        <table border="0" cellpadding="5" cellspacing="5">
        <tr>
        <td><b>User</b></td><td><b>Last Name</b></td><td><b>First Name</b></td><td><b>Middle Name</b></td><td><b>Accrual Amount</b></td>
        </tr>
<%
        DecimalFormat df = new DecimalFormat(PactsConstants.DECIMAL_FORMAT_STRING);

        for (int n = 0; n < userList.length; n++) {
            out.print("<tr>\n<td><a href=\"");
            out.print(PactsConstants.INTERNAL_SERVLET_URL);
            out.print("?"+PactsConstants.TASK_STRING+"=");
            out.print(PactsConstants.VIEW_TASK+"&");
            out.print(PactsConstants.CMD_STRING+"=");
            out.print(PactsConstants.USER_CMD+"&");
            out.print(PactsConstants.USER_ID+"=");
            out.print(userList[n].getId());
            out.print("\">"+userList[n].getHandle()+"</a></td>\n");

            out.print("<td>" + userList[n].getLast() + "</td>");
            out.print("<td>" + userList[n].getFirst() + "</td>");
            out.print("<td>" + userList[n].getMiddle() + "</td>");
            out.print("<td>" + df.format(userList[n].getAccrualAmount()) + "</td>");
            out.print("</tr>\n");
        }
    }
%>

</table>

<jsp:include page="InternalFooter.jsp" flush="true" />
</body>

</html>
