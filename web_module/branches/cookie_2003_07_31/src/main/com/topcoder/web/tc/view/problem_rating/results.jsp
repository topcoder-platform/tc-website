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
<jsp:include page="../script.jsp"/>
</head>
<body>
<center><h3><font color="#FFFFFF"><%= request.getAttribute("problemName") %></font></h3></center>
    <table BGCOLOR="#001B35">
        <tr><td class="statTextBig">Question</td><td class="statTextBig">Average Rating</td></tr>
        <rsc:iterator list="<%=problemRatingResults%>" id="result">
        <% count = result.getIntItem("count"); %>
        <tr>
            <td class="statText">
                <rsc:item row="<%=result%>" name="question"/> :
            </td>
            <td class="statText">
                <rsc:item row="<%=result%>" name="average" format="#.##"/>
            </td>
        </tr>
        </rsc:iterator>
    </table>
    <span class="statText" align="right"><%=count%> Total votes</span>
</body>
</html>
