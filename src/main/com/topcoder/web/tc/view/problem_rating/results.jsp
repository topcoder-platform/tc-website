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
<body>
    <table>
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
