<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="problemRatingQuestions" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<html>
<head>
<title>TopCoder Problem Rating Questions - <%= request.getAttribute("problemName") %></title>
<LINK REL="stylesheet" TYPE="text/css" href="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" href="/css/coders.css"/>
<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
}
</SCRIPT>
<STYLE TYPE="text/css">
BODY
{
	background-color: #001B35;
	padding: 0px;
	margin: 0px;
}
</STYLE>
</head>
<body bgcolor="#001B35">
<center><h3><font color="#FFFFFF"><%= request.getAttribute("problemName") %></font></h3></center>
<form name="ratings" action="/tc/?module=SubmitRatings" method="POST">
<input type="hidden" name="pid" value="<%= request.getParameter("pid") %>">
    <table BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">
        <tr><td></td>
            <% for(int i = 0; i<10; i++){ %>
                <td class="statTextBig" align="center">
                    <%=i%>
                </td>
            <% } %>
        </tr>
        <rsc:iterator list="<%=problemRatingQuestions%>" id="result">
        <tr>
            <td class="statText" align="center">
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
        <tr>
        <td colspan="9" align="right">
            <a href="/tc/?module=ProblemRatingResults&pid=<%= request.getParameter("pid") %>" class="statText">View Results</a>
        </td><td>
            <a onlick="document.ratings.submit()" class="statText">View Results</a>
        </td></tr>
    </table>
    <center>
<input type="submit" value="Submit Ratings">
    </center>
</form>
</body>
</html>
