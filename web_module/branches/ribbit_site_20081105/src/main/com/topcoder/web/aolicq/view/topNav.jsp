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

 <div id="header">
      <div id="header-container">
        <h1>Ribbit<sup>&reg;</sup></h1>
          <ul id="nav">
              <li id="home-nav"><a <% if (active_page.equals("home")) {%>class="active"<% } %> href="http://63.118.154.179/">Home</a></li>
              <li id="learnmore-nav"><a <% if (active_page.equals("learnMore")) {%>class="active"<% } %> href="http://63.118.154.179/?module=Static&amp;d1=learnMore">Learn More</a></li>
              <li id="register-nav"><a <% if (active_page.equals("register")) {%>class="active"<% } %> href="http://63.118.154.179/?module=login">Register</a></li>
              <li id="getsdk-nav"><a <% if (active_page.equals("SDK")) {%>class="active"<% } %> href="#">Get the SDK</a></li>
              <li id="discuss-nav"><a <% if (active_page.equals("forums")) {%>class="active"<% } %> href="http://63.118.154.179/forums">Discuss</a></li>
              <li id="blog-nav"><a href="#">Blog</a></li>
              <li id="submit-nav"><a href="#">Submit</a></li>
          </ul>
          <a href="#" class="powered-by-topcoder">Powered by TopCoder</a>
			<ul id="secondary-nav">
                <li class="first"><a href="#">TopCoder</a></li>
                <li><a href="#">Rules</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </div>
    </div>