<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums"><img src="/i/events/winformula/tbd.png" alt="Forums" onmouseover="this.src='/i/events/winformula/tbdOn.png';"  onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=blog"><img src="/i/events/winformula/tbd.png" alt="Blog" onmouseover="this.src='/i/events/winformula/tbdOn.png';"  onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Profile><img src="/i/events/winformula/tbd.png" alt="My Profile" onmouseover="this.src='/i/events/winformula/tbdOn.png';"  onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=manageMyAlgorithms"><img src="/i/events/winformula/tbd.png" alt="Manage My Algorithms" onmouseover="this.src='/i/events/winformula/tbdOn.png';"  onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/winformula/register.png" alt="Register" onmouseover="this.src='/i/events/winformula/registerOn.png';"  onmouseout="this.src='/i/events/winformula/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete"><img src="/i/events/winformula/tbd.png" alt="How to Compete" onmouseover="this.src='/i/events/winformula/tbdOn.png';"  onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=standings"><img src="/i/events/winformula/tbd.png" alt="Standings" onmouseover="this.src='/i/events/winformula/tbdOn.png';"  onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/"><img src="/i/events/winformula/tbd.png" alt="Home" onmouseover="this.src='/i/events/winformula/tbdOn.png';" onmouseout="this.src='/i/events/winformula/tbd.png';" /></a>
</div>
