<%--
  - Author: isv
  - Version: 1.3
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio site top section.
  -
  - Version 1.1 (Studio Release Assembly 1) Change notes:
  - * Login box layout was modified.
  -
  - Version 1.2 (Studio Enhancements Release Assembly 1) Change notes:
  - * Renamed FAQ link to Help link.
  - * Updated URLs for Help and News links.
  - Version 1.3 (TopCoder Studio Member Profiles Assembly) change notes: linked to Studio's member profile.
  - Version 1.4 (TCCC-5829  https://apps.topcoder.com/bugs/browse/TCCC-5829)
  - * Add v2 Auth0 login widget.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<%
String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<!-- #header -->
<div id="header">
    <div class="headerInner">
        <h1><a href="http://studio.topcoder.com" title="Topcoder Studio"><img src="/i/v4/new-logo-topcoder-studio.png" alt="Topcoder Studio" /></a></h1>
        <!-- #userPanel -->
        <div id="userPanel">
            <div class="userPanelR">
                <div class="userPanelC">
                    <c:choose>
                        <c:when test="${sessionInfo.anonymous}">
                            <script src="https://d19p4zemcycm7a.cloudfront.net/w2/auth0-widget-2.3.6.min.js"></script>
                            <script type="text/javascript">
                            var widget = new Auth0Widget({ 
                                domain: '<%=Constants.DOMAIN_AUTH0%>',
                                clientID: '<%=Constants.CLIENT_ID_AUTH0%>',
                                callbackURL: 'https://<%=Constants.REG_SERVER_NAME%><%=Constants.REDIRECT_URL_AUTH0%>'});

                            function showAuth0Widget(){
                            widget.signin({ 
								state: 'https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/', 
								icon: 'http://www.topcoder.com/i/24x24_brackets.png', 
								showIcon: true}).on('signin_ready', function() {
									$('.a0-email input').each(function() { 
												$(this) 
												.clone() .attr('type','text') 
												.attr('placeholder', 'Username') 
												.attr('title', 'Username') 
												.insertAfter($(this)).prev().remove(); });
                            }); 
                            }

                            $(function () {
                            $('.social-login').click(function () { 
								showAuth0Widget(); });
                            });

                            </script>

                            Hello, <strong>Guest</strong> | <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=Login">login</a> |<a class="redBtn social-login" href="javascript:;">Social login</a> |<a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a> | <a href="http://community.topcoder.com/studio/members/">Members</a> | <a href="http://community.topcoder.com/studio/help/">Studio Help</a> | <a href="http://www.topcoder.com/">About TopCoder</a>
                        </c:when>
                        <c:otherwise>
                            Hello, <studio:handle coderId="${sessionInfo.userId}" styleClass="userLink" /><!--| <a href="http://community.topcoder.com/studio/help/">Studio Help</a>--> | <a href="/?module=MyStudioHome">My Studio</a> | <!--<a href="https://community.topcoder.com/studio/members/">Members</a> |--> <a href="http://www.topcoder.com/">About TopCoder</a> | <a href="/?module=Logout">Log out</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- end #userPanel  -->
        
        <!-- #nav  -->
        <ul id="nav">
            <li <% if (section.equals("tc_studio_home") || section.equals("home")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>">Home</a>
                </span></span>
            </li>
            <li <% if (section.equals("contest")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="/?module=ViewActiveContests">Competitions</a>
                </span></span>
            </li>
            <li <% if (section.equals("forums")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="/forums">Forums</a>
                </span></span>
            </li>
            <!--
            <li <% if (section.equals("howitworks")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="javascript:;">How it works</a>
                </span></span>
                <div class="subNav">
                    <div class="subNavHead">
                        <div class="subNavHeadR">
                            <div class="subNavHeadC">
                                <div class="subNavHeadInner"></div>
                            </div>
                        </div>
                    </div>
                    <div class="subNavContent">
                        <div class="subNavContentR">
                            <div class="subNavContentC">
                                <ul>
                                    <li><a href="http://community.topcoder.com/studio/what-is-studio/">Competitor Guide</a></li>
                                    <!-- end test DOM -->
                                    <li><a href="http://www.topcoder.com/solutions/">Launch a challenge</a></li>
                                    <li><a href="http://community.topcoder.com/studio/the-process/achievement-badges/">Badges</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- bottom part -->
                    <div class="subNavFoot">
                        <div class="subNavFootR">
                            <div class="subNavFootC">
                                <div class="subNavFootInner"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li <% if (section.equals("cup")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="javascript:;">Tournaments</a>
                </span></span>
                <div class="subNav">
                    <div class="subNavHead">
                        <div class="subNavHeadR">
                            <div class="subNavHeadC">
                                <div class="subNavHeadInner"></div>
                            </div>
                        </div>
                    </div>
                    <div class="subNavContent">
                        <div class="subNavContentR">
                            <div class="subNavContentC">
                                <ul>
                                    <li><a href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home">Studio Cup</a></li>
                                    <!-- end test DOM -->
                                    <li><a href="http://community.topcoder.com/tco13/">TCO</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- bottom part -->
                    <div class="subNavFoot">
                        <div class="subNavFootR">
                            <div class="subNavFootC">
                                <div class="subNavFootInner"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            -->
            <li <% if (section.equals("blog")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="http://community.topcoder.com/studio/">Blog</a>
                </span></span>
            </li>
            <!--
            <li <% if (section.equals("portfolio")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="/?module=Static&amp;d1=portfolio&amp;d2=portfolio">Portfolio</a>
                </span></span>
            </li>
            -->
            <li <% if (section.equals("contact")) {%> class="current"<% } %>>
                <span class="navMenuR"><span class="navMenuC">
                    <a href="/?module=Static&amp;d1=contactUs">Contact Studio</a>
                </span></span>
            </li>
        </ul>
        <!-- end #nav  -->
        
    </div>
</div>
<!-- end #header -->
 
