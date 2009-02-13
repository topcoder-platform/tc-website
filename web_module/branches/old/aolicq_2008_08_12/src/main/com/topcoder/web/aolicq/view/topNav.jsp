<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/forums"><img src="/i/events/aolicq/discuss.png" alt="discuss" onmouseover="this.src='/i/events/aolicq/discussOn.png';"  onmouseout="this.src='/i/events/aolicq/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/aolicq"><img src="/i/events/aolicq/apis.png" alt="apis" onmouseover="this.src='/i/events/aolicq/apisOn.png';"  onmouseout="this.src='/i/events/aolicq/apis.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/aolicq/submit.png" alt="submit" onmouseover="this.src='/i/events/aolicq/submitOn.png';"  onmouseout="this.src='/i/events/aolicq/submit.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/aolicq/register.png" alt="Register" onmouseover="this.src='/i/events/aolicq/registerOn.png';"  onmouseout="this.src='/i/events/aolicq/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=learnMore"><img src="/i/events/aolicq/learn.png" alt="learn" onmouseover="this.src='/i/events/aolicq/learnOn.png';"  onmouseout="this.src='/i/events/aolicq/learn.png';" /></a>
</div>
