<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.aolicq.Constants" %>
<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>
<%
    String active_page = request.getParameter("active_page") == null ? "" : request.getParameter("active_page");
    
%>	

<%--<div class="navBox">
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/forums"><img src="/i/events/aolicq/discuss.png" alt="discuss" onmouseover="this.src='/i/events/aolicq/discussOn.png';"  onmouseout="this.src='/i/events/aolicq/discuss.png';" /></a>
    <a class="navTab" href="http://dev.aol.com/api/aolicq"><img src="/i/events/aolicq/apis.png" alt="apis" onmouseover="this.src='/i/events/aolicq/apisOn.png';"  onmouseout="this.src='/i/events/aolicq/apis.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>"><img src="/i/events/aolicq/submit.png" alt="submit" onmouseover="this.src='/i/events/aolicq/submitOn.png';"  onmouseout="this.src='/i/events/aolicq/submit.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>"><img src="/i/events/aolicq/register.png" alt="Register" onmouseover="this.src='/i/events/aolicq/registerOn.png';"  onmouseout="this.src='/i/events/aolicq/register.png';" /></a>
    <a class="navTab" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=learnMore"><img src="/i/events/aolicq/learn.png" alt="learn" onmouseover="this.src='/i/events/aolicq/learnOn.png';"  onmouseout="this.src='/i/events/aolicq/learn.png';" /></a>
    <%=ApplicationServer.AOLICQ_SERVER_NAME%>/
</div> --%> 

 <div id="header">
      <div id="header-container">
        <h1>Ribbit<sup>&reg;</sup></h1>
          <ul id="nav">
              <li id="home-nav"><a <% if (active_page.equals("home")) {%>class="active"<% } %> href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/">Home</a></li>
              <li id="learnmore-nav"><a <% if (active_page.equals("learnMore")) {%>class="active"<% } %> href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=learnMore">Learn More</a></li>
              <li id="register-nav"><a <% if (active_page.equals("register")) {%>class="active"<% } %> href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>">Register</a></li>
              <li id="getsdk-nav"><a <% if (active_page.equals("SDK")) {%>class="active"<% } %> href="http://developer.ribbit.com/register" target="_blank">Get the SDK</a></li>
              <li id="discuss-nav"><a <% if (active_page.equals("forums")) {%>class="active"<% } %> href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/forums">Discuss</a></li>
              <li id="blog-nav"><a <% if (active_page.equals("blog")) {%>class="active"<% } %> href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/news/">Blog</a></li>
              <li id="submit-nav"><a <% if (active_page.equals("submit")) {%>class="active"<% } %> href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=<%=Constants.MINISITE_CONTEST_ID%>">Submit</a></li>
           </ul>
           
          <a href="http://www.topcoder.com/" class="powered-by-topcoder">Powered by TopCoder</a>
			<ul id="secondary-nav">
                <li class="first"><a href="http://www.topcoder.com/">TopCoder</a></li>
                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=rules">Rules</a></li>
                <li><a href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Static&amp;d1=faq">FAQ</a></li>
            </ul>
        </div>
    </div>