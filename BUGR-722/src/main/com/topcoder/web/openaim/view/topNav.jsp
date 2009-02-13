<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/forums"><img src="/i/events/openaim/tabs/discuss.png" alt="discuss" onmouseover="this.src='/i/events/openaim/tabs/discussOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/openaim"><img src="/i/events/openaim/tabs/apis.png" alt="apis" onmouseover="this.src='/i/events/openaim/tabs/apisOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/apis.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/openaim/tabs/submit.png" alt="submit" onmouseover="this.src='/i/events/openaim/tabs/submitOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/submit.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/openaim/tabs/register.png" alt="Register" onmouseover="this.src='/i/events/openaim/tabs/registerOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/?module=Static&amp;d1=learnMore"><img src="/i/events/openaim/tabs/learn.png" alt="learn" onmouseover="this.src='/i/events/openaim/tabs/learnOn.png';"  onmouseout="this.src='/i/events/openaim/tabs/learn.png';" /></a>
</div>