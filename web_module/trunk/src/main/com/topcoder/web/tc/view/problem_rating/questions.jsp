<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="problemRatingQuestions" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<html>
<head>
<title>TopCoder Problem Rating Questions - <%= request.getAttribute("problemName") %></title>
</head>
<body bgcolor="#000000">
<h3><%= request.getAttribute("problemName") %></h3>
<form action="/tc/?module=SubmitRatings" method="POST">
<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>">
    <table>
        <tr>
            <% for(int i = 0; i<10; i++){ %>
                <td>
                    <%=i%>
                </td>
            <% } %>
        </tr>
        <rsc:iterator list="<%=problemRatingQuestions%>" id="result">
        <tr>
            <td>
                <rsc:item row="<%=result%>" name="question"/>
            </td>
                <%
                    int qid = result.getIntItem("question_id");
                    for(int i = 1; i<=10; i++){
                %>
            <td>
                        <input type="radio" name="q<%= qid %>" value="<%= i %>">
            </td>
                <%  } %>
        </tr>
        </rsc:iterator>
    </table>
<input type="submit">
</form>
</body>
</html>
