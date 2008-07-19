<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums"><img src="/i/events/winformula/discuss.png" alt="discuss" onmouseover="this.src='/i/events/winformula/discussOn.png';"  onmouseout="this.src='/i/events/winformula/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/winformula"><img src="/i/events/winformula/apis.png" alt="apis" onmouseover="this.src='/i/events/winformula/apisOn.png';"  onmouseout="this.src='/i/events/winformula/apis.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/winformula/submit.png" alt="submit" onmouseover="this.src='/i/events/winformula/submitOn.png';"  onmouseout="this.src='/i/events/winformula/submit.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/winformula/register.png" alt="Register" onmouseover="this.src='/i/events/winformula/registerOn.png';"  onmouseout="this.src='/i/events/winformula/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=learnMore"><img src="/i/events/winformula/learn.png" alt="learn" onmouseover="this.src='/i/events/winformula/learnOn.png';"  onmouseout="this.src='/i/events/winformula/learn.png';" /></a>
</div>
