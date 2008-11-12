<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>
<%
    String active_page = request.getParameter("active_page") == null ? "" : request.getParameter("active_page");
    
%>	

<%--<div class="navBox">
    <a class="navTab" href="http://63.118.154.179/ribbit/forums"><img src="/i/events/aolicq/discuss.png" alt="discuss" onmouseover="this.src='/i/events/aolicq/discussOn.png';"  onmouseout="this.src='/i/events/aolicq/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/aolicq"><img src="/i/events/aolicq/apis.png" alt="apis" onmouseover="this.src='/i/events/aolicq/apisOn.png';"  onmouseout="this.src='/i/events/aolicq/apis.png';" /></a>
    <a class="navTab" href="http://63.118.154.179/ribbit/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/aolicq/submit.png" alt="submit" onmouseover="this.src='/i/events/aolicq/submitOn.png';"  onmouseout="this.src='/i/events/aolicq/submit.png';" /></a>
    <a class="navTab" href="http://63.118.154.179/ribbit/?module=ViewContestDetails&amp;ct=1001"><img src="/i/events/aolicq/register.png" alt="Register" onmouseover="this.src='/i/events/aolicq/registerOn.png';"  onmouseout="this.src='/i/events/aolicq/register.png';" /></a>
    <a class="navTab" href="http://63.118.154.179/ribbit/?module=Static&amp;d1=learnMore"><img src="/i/events/aolicq/learn.png" alt="learn" onmouseover="this.src='/i/events/aolicq/learnOn.png';"  onmouseout="this.src='/i/events/aolicq/learn.png';" /></a>
    <%=ApplicationServer.AOLICQ_SERVER_NAME%>/
</div> --%>
  
 <div id="nav-background">
        <ul id="nav">
            <li <% if (active_page.equals("home")) {%>class="active"<% } %>><a href="http://63.118.154.179/">Home</a></li>
            <li <% if (active_page.equals("learnMore")) {%>class="active"<% } %>><a href="http://63.118.154.179/?module=Static&amp;d1=learnMore">Learn More</a></li>
            <li <% if (active_page.equals("register")) {%>class="active"<% } %>><a href="#">Register</a></li>
            <li <% if (active_page.equals("SDK")) {%>class="active"<% } %>><a href="#">Get the SDK</a></li>
            <li <% if (active_page.equals("forums")) {%>class="active"<% } %>><a href="http://63.118.154.179/forums">Discuss</a></li>
            <li <% if (active_page.equals("submit")) {%>class="active"<% } %>><a href="#">Submit</a></li>
        </ul>
    </div>
