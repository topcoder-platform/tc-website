<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/forums"><img src="/i/events/truveo/tabs/discuss.png" alt="discuss" onmouseover="this.src='/i/events/truveo/tabs/discussOn.png';"  onmouseout="this.src='/i/events/truveo/tabs/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/truveo"><img src="/i/events/truveo/tabs/apis.png" alt="apis" onmouseover="this.src='/i/events/truveo/tabs/apisOn.png';"  onmouseout="this.src='/i/events/truveo/tabs/apis.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/truveo/tabs/submit.png" alt="submit" onmouseover="this.src='/i/events/truveo/tabs/submitOn.png';"  onmouseout="this.src='/i/events/truveo/tabs/submit.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/truveo/tabs/register.png" alt="Register" onmouseover="this.src='/i/events/truveo/tabs/registerOn.png';"  onmouseout="this.src='/i/events/truveo/tabs/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.TRUVEO_SERVER_NAME%>/?module=Static&amp;d1=learnMore"><img src="/i/events/truveo/tabs/learn.png" alt="learn" onmouseover="this.src='/i/events/truveo/tabs/learnOn.png';"  onmouseout="this.src='/i/events/truveo/tabs/learn.png';" /></a>
</div>