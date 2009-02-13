<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/forums"><img src="/i/events/truveo/discuss.png" alt="discuss" onmouseover="this.src='/i/events/truveo/discussOn.png';"  onmouseout="this.src='/i/events/truveo/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/truveo"><img src="/i/events/truveo/apis.png" alt="apis" onmouseover="this.src='/i/events/truveo/apisOn.png';"  onmouseout="this.src='/i/events/truveo/apis.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/truveo/submit.png" alt="submit" onmouseover="this.src='/i/events/truveo/submitOn.png';"  onmouseout="this.src='/i/events/truveo/submit.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/truveo/register.png" alt="Register" onmouseover="this.src='/i/events/truveo/registerOn.png';"  onmouseout="this.src='/i/events/truveo/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/?module=Static&amp;d1=learnMore"><img src="/i/events/truveo/learn.png" alt="learn" onmouseover="this.src='/i/events/truveo/learnOn.png';"  onmouseout="this.src='/i/events/truveo/learn.png';" /></a>
</div>
