<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.controller.request.Login" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:set value="<%=Constants.FIRST_MINI_SEASON_ID%>" var="firstMiniSeasonId"/>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frmLogin.submit();
                return false;
            } else return true;
        }
    </script>


        <div id="header">
        <%-- Header --%>
        
            <div id="brand">
                <div id="logoTC">
                  <a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="/i/events/winformula/logoTC.png" alt="powered by TopCoder, Inc." /></a>
                </div>
                  <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/"><img src="/i/events/winformula/ESPNLogo.png" alt="ESPN Winning Formula Challange" /></a>
            </div>
              
            <div id="global-links">
            <%-- Global Link --%>
                <a href="http://www.espn.com/">ESPN</a> | <a href="http://<%=ApplicationServer.SERVER_NAME%>/">TopCoder</a> | 
                <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=rules">Rules</a><%-- Temporarily Hidden | <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=faq">FAQ</a>--%>
            <%-- End Global Link --%>
            </div>
            
            <c:choose>
                <c:when test="${sessionInfo.anonymous}">
                    <div id="login">
                    <%-- Login --%>
                        <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}" >
                            <input type="hidden" name="module" id="module" value="Login" />
                            <a href="javascript:document.frmLogin.submit()" class="topButton" title="Log In"><span>Log In</span></a>
                            <input name="<%=Login.USER_NAME%>" maxlength="15" type="text" class="textbox" id="username" value="TopCoder Handle" onkeypress="submitEnter(event)" />
                            <input name="<%=Login.PASSWORD%>" maxlength="30" type="password" class="textbox" id="password" value="Password" onkeypress="submitEnter(event)" />
                        </form>
                    <%-- End Login --%>
                    </div>
                    <div id="user-links">
                        <%-- User Link --%>
                        <a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a> | <a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword">Forgot Password</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="user-links">
                    <%-- User Link --%>
                    <strong>Hello, <tc-webtag:handle coderId='${sessionInfo.userId}'/></strong>
                    | <strong><a class="" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Logout">Logout</a></strong>
                    <%-- End User Link --%>
                    </div>
                </c:otherwise>
            </c:choose>
        
        <%-- End Header --%>
        </div>
        
        <div id="main-nav">
        <%-- Main Navigation --%>
            <div id="lCorner-nav"><%-- Left Corner Navigation --%></div>
                <ul>
                    <li id="nav-home"<% if (tabLev1.equals("homepage")) {%> class="on"<% } %>><a title="Home" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/"><span class="hide">Home</span></a></li>
                    <li id="nav-standing"<% if (tabLev1.equals("standings")) {%> class="on"<% } %>><a title="Standings" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewStandings"><span class="hide">Standings</span></a></li>
                    <li id="nav-how-to-compete"<% if (tabLev1.equals("compete")) {%> class="on"<% } %>><a title="How to Compete" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete"><span class="hide">How to Compete</span></a></li>
                    <li id="nav-register"<% if (tabLev1.equals("register")) {%> class="on"<% } %>><a title="Register" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewRegistration&amp;ct=1001"><span class="hide">Register</span></a></li>
                    <li id="nav-manage-algorithm"<% if (tabLev1.equals("manage")) {%> class="on"<% } %>><a title="Manage My Algorithm" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/algorithm?module=ManageMyAlgorithms"><span class="hide">Manage My Algorithms</span></a></li>
                    <li id="nav-profile"<% if (tabLev1.equals("profile")) {%> class="on"<% } %>><a title="My Profile" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=ViewProfile"><span class="hide">My Profile</span></a></li>
                    <li id="nav-blog"<% if (tabLev1.equals("blog")) {%> class="on"<% } %>><a title="Blog" onfocus="this.blur();" href="http://topcoderblogs.com/winningformula"><span class="hide">Blog</span></a></li>
                    <li id="nav-forums"<% if (tabLev1.equals("forums")) {%> class="on"<% } %>><a title="Forums" onfocus="this.blur();" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/forums"><span class="hide">Forums</span></a></li>
              </ul>
          <div id="rCorner-nav"><%-- Right Corner Navigation --%></div>
        <%-- End Main Navigation --%>
        </div>