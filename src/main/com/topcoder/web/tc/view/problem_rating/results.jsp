<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="problemRatingResults" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<%
    int count = 0;
%>
<html>
<head>
<title>TopCoder Problem Rating Results - <%=request.getAttribute("problemName")%></title>
</head>
<body>
    <table>
        <rsc:iterator list="<%=problemRatingResults%>" id="result">
        <% count = result.getIntItem("count"); %>
        <tr>
            <td>
                <rsc:item row="<%=result%>" name="question"/>
            </td>
            <td>
                <rsc:item row="<%=result%>" name="average" format="#.##"/>%
            </td>
        </tr>
        </rsc:iterator>
    </table>
<%=count%> Total votes
</body>
</html>
