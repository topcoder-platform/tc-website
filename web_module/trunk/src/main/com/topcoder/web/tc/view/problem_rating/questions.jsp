<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="problemRatingQuestions" scope="request" class="java.util.List" />
<html>
<head>
<title>TopCoder Problem Rating Questions - <%= request.getAttribute("problemName") %></title>
<jsp:include page="../script.jsp"/>
</SCRIPT>
</head>
<body bgcolor="#001B35">
<center><h3><font color="#FFFFFF"><%= request.getAttribute("problemName") %></font></h3></center>
<tc-webtag:errorIterator id="err" name="problemRating"><%=err%><br/></tc-webtag:errorIterator>
<form name="ratings" action="/tc/?module=SubmitRatings" method="GET">
<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>">
    <table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">
        <tr><td></td>
            <% for(int i = 1; i<=10; i++){ %>
                <td class="statTextBig">
                    &nbsp;&nbsp;<%=i%>
                </td>
            <% } %>
        </tr>
        <tc:problemRatingIterator list="<%=problemRatingQuestions%>" id="quest">
        <tr>
            <tc:counter min="1" max="10" inc="1">
            <td class="statText">
                <jsp:getProperty name="<%=quest%>" property="question"/>
            </td>
            <td>
                        <input type="radio" name="<jsp:getProperty name="<%=quest%>" property="questionID"/>" value="<%= counter %>">
            </td>
            </tc:problemRatingInput>
        </tr>
        </tc:problemRatingIterator>
    </table>
    <table align="right">
        <tr>
        <td align="right">
            <a href="/tc/?module=ProblemRatingResults&pid=<%= request.getParameter("pid") %>" class="statText">View Results</a>&nbsp;&nbsp;
        </td><td align="right">
            <a href="javascript:document.ratings.submit()" class="statText">Submit Ratings</a>&nbsp;&nbsp;
        </td></tr>
    </table>
</form>
</body>
</html>
