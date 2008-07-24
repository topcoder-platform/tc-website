<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>



        <div id="header">
        <!-- Header -->
        
            <div id="brand">
                <div id="logoTC">
                  <a href="/"><img src="/i/events/winformula/logoTC.png" alt="powered by TopCoder, Inc." /></a>
                </div>
                  <a href="#"><img src="/i/events/winformula/ESPNLogo.png" alt="ESPN Winning Formula Challange" /></a>
            </div>
              
            <div id="global-links">
            <!-- Global Link -->
                <a href="/">TopCoder</a> | 
                <a href="rules.htm">Rules</a> | <a href="faq.htm">FAQ</a>
            <!-- End Global Link -->
            </div>
            
            <div id="login">
            <!-- Login -->
                <form action="" > 
                  <a href="#" class="topButton" title="Log In"><span>Log In</span></a>
                  <input name="username" type="text" class="textbox" id="username" value="TopCoder Username" />
                  <input name="password" type="password" class="textbox" id="password" value="Password" />
                </form>
            <!-- End Login -->
            </div>
            
            <div id="user-links">
            <!-- User Link -->
            <a href="#">Register</a> | <a href="#">Forgot Password </a>
            <!-- End User Link -->
            </div>
        
        <!-- End Header -->
        </div>
        
        <div id="main-nav">
        <!-- Main Navigation -->
            <div id="lCorner-nav"><!-- Left Corner Navigation --></div>
                <ul>
                    <li id="nav-home"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/" title="Home" <% if (tabLev1.equals("home")) {%> class="on"<% } %>><span class="hide">Home</span></a></li>
                    <li id="nav-standing"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=standings" title="Standings" <% if (tabLev1.equals("standings")) {%> class="on"<% } %>><span class="hide">Standings</span></a></li>
                    <li id="nav-how-to-compete"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete" title="How to Compete" <% if (tabLev1.equals("compete")) {%> class="on"<% } %>><span class="hide">How to Compete</span></a></li>
                    <li id="nav-register"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=register" title="Register"><span class="hide" <% if (tabLev1.equals("register")) {%> class="on"<% } %>>Register</span></a></li>
                    <li id="nav-manage-algorithm"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=manageMyAlgorithms" title="Manage My Algorithm" <% if (tabLev1.equals("manage")) {%> class="on"<% } %>><span class="hide">Manage My Algorithms</span></a></li>
                    <li id="nav-profile"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/Profile" title="My Profile" <% if (tabLev1.equals("profile")) {%> class="on"<% } %>><span class="hide">My Profile</span></a></li>
                    <li id="nav-blog" ><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=blog" title="Blog" <% if (tabLev1.equals("blog")) {%> class="on"<% } %>><span class="hide">Blog</span></a></li>
                    <li id="nav-forums"><a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums" title="Forums" <% if (tabLev1.equals("forums")) {%> class="on"<% } %>><span class="hide">Forums</span></a></li>
              </ul>
          <div id="rCorner-nav"><!-- Right Corner Navigation --></div>
        <!-- End Main Navigation -->
        </div>