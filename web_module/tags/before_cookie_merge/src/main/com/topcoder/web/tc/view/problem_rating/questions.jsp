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
</head>
<body>
<center><h3><font color="#FFFFFF"><%= request.getAttribute("problemName") %></font></h3></center>
<tc-webtag:errorIterator id="err" name="problemRating"><%=err%><br/></tc-webtag:errorIterator>
<form name="ratings" action="/tc/" method="GET">
<input type="hidden" name="module" value="SubmitRatings">
<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>">
    <table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#001B35">
        <tr><td></td>
            <% for(int i = 1; i<=10; i++){ %>
                <td class="statTextBig">
                    &nbsp;&nbsp;<%=i%>
                </td>
            <% } %>
        </tr>
        <tc:problemRatingIterator list="<%=problemRatingQuestions%>" id="quest">
        <tr>
            <td class="statText">
                <jsp:getProperty name="quest" property="question"/>
            </td>
            <tc:counter min="1" max="10" inc="1" id="rating">
            <td>
                <% boolean checked = rating.equals(request.getParameter("q"+quest.getID())); %>
                <input type="radio" name="q<jsp:getProperty name="quest" property="ID"/>" value="<%= rating %>" <%=checked?"CHECKED":""%>>
            </td>
            </tc:counter>
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
