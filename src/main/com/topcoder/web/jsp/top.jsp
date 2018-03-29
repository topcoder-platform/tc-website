<%--
 * Copyright (C) 2004 - 2015 TopCoder Inc., All Rights Reserved.
 *
 * Author: TCSASSEMBLER
 * Version: 1.3
 *
 * This JSP renders TopCoder web site's shortcut bar.
 *
 * Changes in Content Creation Contest Online Review and TC Site Integration Assembly 1.0:
 * Add content creation shortcut icon.
 * 
 * Add Reporting shortcut icon.
 *
 * Add Bug Hunt shortcut icon (Release Assembly - TopCoder BugHunt Competition Integration)
 *
 * Changes in ( Release Assembly - TopCoder Website Social Login ) 1.1
 * 1. Modify the login link to open Auth0 login widget so the users can login with their social accounts. 
 *
 * Changes in ( Release Assembly - Social Login Linking for Existing User ) 1.2
 * Only load auth0 script when user is anonymous.
 *
 * Chaneges in (TC Community Site - Header Footer UX Update) 1.3
 * Update to use the new header
--%>
<%@  page
  language="java"
  import="com.topcoder.shared.util.ApplicationServer,
          com.topcoder.web.common.BaseServlet,
          com.topcoder.web.common.StringUtils,
          com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.SessionInfo"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");
    
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getParameter(BaseServlet.NEXT_PAGE_KEY);
    if (nextpage == null) nextpage = request.getHeader("Referer");
    if (nextpage == null) nextpage = "http://" + request.getServerName();

    String domainName = ApplicationServer.SERVER_NAME.replace("www.", "");

//    String currentPageURL = request.getRequestURL().toString() + (request.getQueryString() == null ? "" : ("?" + request.getQueryString().toString()));
    
%>

<script>
    $(document).ready(function(){
        $("a.new-btn-login").attr('href', $("a.new-btn-login").attr('href') + "?next=" + window.location.href);
    })
</script>

<c:choose>
    <c:when test="${not empty isNewStyle && isNewStyle}">

        <!-- new theme -->

        <div class="header-wrapper">
            <!-- Main header element-->
            <header class="top-header new-topcoder-header">
                <!-- Header content visible on small screens-->
                <div class="show-small mobile-heading"><span class="tc-text-logo">[ topcoder ]</span>
                    <button type="button" class="btn-open-menu">Menu</button>
                    <button type="button" class="btn-close-menu"></button>

                    <% if ( sessionInfo.isAnonymous() ) { %>
                        <a href="https://<%=ApplicationServer.SERVER_NAME%>/register/" class="user-link">
                            <span class="btn-link join-link">JOIN</span>
                        </a>
                    <% } else { %>

                     <!-- for logged in user-->

                        <a href="javascript:;" class="user-link">
                            <img src="<%=sessionInfo.getImagePath()%>" alt="User Avatar" class="user-avatar">
                        </a>
                    <%}%>



                </div>
                <!-- main menu -->
                <ul class="main-menu">
                    <!-- search container-->
                    <li class="menu-item search-wrapper">
                        <div class="menu-item-header search-header show-large">
                            <button type="button" class="btn-expand-search search-icon"></button>
                        </div>
                        <div class="submenu">
                            <form action="https://<%=ApplicationServer.SERVER_NAME%>/search/members/" method="get">
                                <input type="text" id="searchBox" style="font-size: 12px"  placeholder="FIND MEMBERS BY USERNAME OR SKILL" name="q">
                                <input type="submit"
                                       style="position: absolute; left: -9999px; width: 1px; height: 1px;"
                                       tabindex="-1" />
                             </form>
                            <!-- Suggestion list container-->
                            <ul class="suggestion-list"></ul>
                        </div>
                    </li>



                    <% if ( sessionInfo.isAnonymous() ) { %>
                        <!-- for anonymous user-->
                        <li class="menu-item link-group user-menu anonymous-menu"><!-- links for logged in user-->

                            <div class="menu-item-header anonymous-options">
                                <a class="btn-link" href="https://<%=ApplicationServer.SERVER_NAME%>/register/">REGISTER</a>
                                <a class="btn-link secondary-link btn-login new-btn-login" href="https://<%=ApplicationServer.SERVER_NAME%>/login/">LOG IN</a>
                            </div>
                        </li>

                    <% } else { %>

                        <!-- for logged in user-->

                        <li class="menu-item link-group user-menu">
                            <div class="authenticated-options">
                                <div class="menu-item-header">
                                    <img class="user-avatar" alt="User Avatar" src="<%=sessionInfo.getImagePath()%>">
                                    <span class="username"><%=sessionInfo.getHandle()%></span>
                                </div>
                                <a class="btn-link btn-edit-profile show-small" href="https://<%=ApplicationServer.SERVER_NAME%>/settings/profile/">EDIT</a>
                                <ul class="submenu">
                                    <li class="submenu-item"><a class="menu-link menu-link-dashboard" href="https://<%=ApplicationServer.SERVER_NAME%>/my-dashboard/">DASHBOARD</a></li>
                                    <li class="submenu-item"><a class="menu-link menu-link-profile" href="https://<%=ApplicationServer.SERVER_NAME%>/members/<%=sessionInfo.getHandle()%>/">MY PROFILE</a></li>
                                    <li class="submenu-item"><a class="menu-link menu-link-payments" target="_blank" href="https://community.<%=domainName%>/PactsMemberServlet?module=PaymentHistory&full_list=false">PAYMENTS</a></li>
                                    <li class="submenu-item"><a class="menu-link menu-link-settings" href="https://<%=ApplicationServer.SERVER_NAME%>/settings/profile/" target="_blank">SETTINGS</a></li>
                                    <li class="submenu-item"><a class="menu-link menu-link-logout" href="javascript:doLogOutTC();">LOG OUT</a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                    <%}%>

                    <li class="menu-item link-group">
                        <div class="menu-item-header">COMPETE</div>
                        <ul class="submenu">
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/challenges/design/active" class="menu-link menu-link-design">DESIGN CHALLENGES</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/challenges/develop/active" class="menu-link menu-link-dev">DEVELOPMENT CHALLENGES</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/challenges/data/active" class="menu-link menu-link-data">DATA SCIENCE CHALLENGES</a>
                            </li>
                            <li class="submenu-item"><a href="https://arena.<%=domainName%>" class="menu-link menu-link-arena">COMPETITIVE PROGRAMMING</a>
                            </li>
                        </ul>
                    </li>

                    <!-- 'LEARN' link group-->
                    <li class="menu-item link-group">
                        <div class="menu-item-header">LEARN</div>
                        <ul class="submenu">
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/member-onboarding/" class="menu-link menu-link-learn-started">GET STARTED</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/design/" class="menu-link menu-link-learn-design">DESIGN</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/development/" class="menu-link menu-link-learn-dev">DEVELOPMENT</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/data-science/" class="menu-link menu-link-learn-data">DATA SCIENCE</a>
                            </li>
                            <li class="submenu-item"><a href="http://<%=ApplicationServer.SERVER_NAME%>/community/competitive%20programming/" class="menu-link menu-link-learn-competition">COMPETITIVE PROGRAMMING</a>
                            </li>

                        </ul>
                    </li>
                    <!-- 'COMMUNITY' link group-->
                    <li class="menu-item link-group">
                        <div class="menu-item-header">COMMUNITY</div>
                        <ul class="submenu">
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/members/" class="menu-link menu-link-community-members">OVERVIEW</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/tco" class="menu-link menu-link-community-tco17">TCO</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/member-programs/" class="menu-link menu-link-community-programs">PROGRAMS</a>
                            </li>
                            <li class="submenu-item"><a href="https://apps.<%=domainName%>/forums/" class="menu-link menu-link-community-forums" target="_blank">FORUMS</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/statistics/" class="menu-link menu-link-community-stats">STATISTICS</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/community/events/" class="menu-link menu-link-community-events">EVENTS</a>
                            </li>
                            <li class="submenu-item"><a href="https://<%=ApplicationServer.SERVER_NAME%>/blog/" class="menu-link menu-link-community-blog">BLOG</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </header>
        </div>
    </c:when>
    <c:otherwise>
        <script type="text/javascript" src="/js/popup.js"></script>

        <div id="shortcutBar">
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc"><img src="/i/interface/scHome.png" alt="" onmouseover="postPopUpText('globalPopupText','Home'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="javascript:arena();"><img src="/i/interface/scAlgo.png" alt="" onmouseover="postPopUpText('globalPopupText','Algorithm Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=23"><img src="/i/interface/scConceptualization.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Conceptualization Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=6"><img src="/i/interface/scSpecification.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Specification Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&amp;pt=7"><img src="/i/interface/scArchitecture.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Architecture Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&amp;ph=112"><img src="/i/interface/scDesign.png" alt="" onmouseover="postPopUpText('globalPopupText','Component Design Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewActiveContests&amp;ph=113"><img src="/i/interface/scDevelopment.png" alt="" onmouseover="postPopUpText('globalPopupText','Component Development Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <%--    <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/registration/actions/Registration.do?method=openRegistrations"><img src="/i/interface/scAssembly.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Assembly Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>--%>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=14"><img src="/i/interface/scAssembly.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Assembly Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=13"><img src="/i/interface/scTesting.png" alt="" onmouseover="postPopUpText('globalPopupText','Testing Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=9"><img src="/i/interface/scBugHunt.png" alt="" onmouseover="postPopUpText('globalPopupText','Bug Hunt Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=35"><img src="/i/interface/scContentCreation.gif" alt="" onmouseover="postPopUpText('globalPopupText','Content Creation Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=36"><img src="/i/interface/scReporting.gif" alt="" onmouseover="postPopUpText('globalPopupText','Reporting Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="javascript:arena();"><img src="/i/interface/scTCHS.png" alt="" onmouseover="postPopUpText('globalPopupText','High School Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests"><img src="/i/interface/scMarathon.png" alt="" onmouseover="postPopUpText('globalPopupText','Marathon Matches'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
            <div class="icon"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests"><img src="/i/interface/scStudio.png" alt="" onmouseover="postPopUpText('globalPopupText','TopCoder Studio Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
        </div>

        <div id="globalPopup" class="popUp"><div id="globalPopupText"></div></div>

        <% if ( sessionInfo.isAnonymous() ) { %>
        <script src="//d19p4zemcycm7a.cloudfront.net/w2/auth0-widget-2.3.6.min.js"></script>
        <script>
            var widget = new Auth0Widget({
                domain: '<%=Constants.DOMAIN_AUTH0%>',
                clientID: '<%=Constants.CLIENT_ID_AUTH0%>',
                callbackURL: 'https://<%=ApplicationServer.SERVER_NAME%><%=Constants.REDIRECT_URL_AUTH0%>'
            });

            function showAuth0Widget(){
                widget.signin({
                    state: '<%= StringUtils.htmlEncode(nextpage) %>',
                    icon: 'http://www.topcoder.com/i/24x24_brackets.png',
                    showIcon: true}).on('signin_ready', function() {
                            $('.a0-email input').each(function() {
                                $(this)
                                        .clone()
                                        .attr('type','text')
                                        .attr('placeholder', 'Username')
                                        .attr('title', 'Username')
                                        .insertAfter($(this)).prev().remove();
                            });
                        });
            }

            $(function () {
                $('.social-login').click(function () {
                    showAuth0Widget();
                });
            });

        </script>

        <% } %>

        <% if ( !sessionInfo.isAnonymous() ) { %>
        <div style="position: absolute; right:0px; top:31px;"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome"><img src="/i/interface/myTopCoder.png" alt="My TopCoder" style="display:block;"/></a></div>
        <% } else { %>
        <div style="position: absolute; right:0px; top:31px;"><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/interface/register_now.gif" alt="Register Now" style="display:block;"/></a></div>
        <%}%>

        <div align="center" style="margin: 0px 290px 0px 280px;">
            <div id="outerLogo">
                <div id="innerLogo">
                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img src="/i/interface/topcoder.gif" alt="TopCoder" style="display: block;" /></a>
                </div>
            </div>
        </div>

        <div class="memberCountBox">
            Member Count: <%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> - <jsp:include page="/date_time.jsp" />
            &nbsp;<a class="gMetal" href="Javascript:tcTime()">[Get Time]</a>
        </div>

        <div class="topBar">
            <div style="float: right; margin: 5px 0px 0px 0px;">
                <% if ( !sessionInfo.isAnonymous() ) { %>
                Hello,&nbsp;<tc-webtag:handle coderId='<%=sessionInfo.getUserId()%>' darkBG="true" />
                <% if (level1.equals("long")) { %>
                | <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Logout">Logout</a>
                <% } else if (level1.equals("forums")) { %>
                | <a class="gMetal" href="?module=Logout">Logout</a>
                <% } else { %>
                | <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout">Logout</a>
                <% } %>
                <% } else {
                    if (level1.equals("long")) {%>
                <a class="gMetal social-login" href="javascript:;">Social Login</a> | <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Login">Login</a>
                <% } else if (level1.equals("forums")) { %>
                <a class="gMetal social-login" href="javascript:;">Social Login</a> | <a class="gMetal" href="?module=Login">Login</a>
                <% } else { %>
                <a class="gMetal social-login" href="javascript:;">Social Login</a> | <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&amp;module=Login">Login</a>
                <% } %>
                <%}%>
            </div>
        </div>

    </c:otherwise>
</c:choose>


