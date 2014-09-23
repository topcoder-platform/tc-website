<%--
 * Copyright (C) 2004 - 2013 TopCoder Inc., All Rights Reserved.
 *
 * Author: TCSASSEMBLER
 * Version: 1.2
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
    
%>

<c:choose>
    <c:when test="${not empty isNewStyle && isNewStyle}">
        <header id="navigation" class="newUser">
            <div class="container">
                <div class="headerTopRightMenu">
                    <% if ( !sessionInfo.isAnonymous() ) { %>
                        <div class="headerTopRightMenuLink logIn">
                            <div class="text"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Logout" class="actionLogin">Log Out</a></div>
                            <div class="clear"></div>
                        </div>
                    <% } else { %>
                        <div class="headerTopRightMenuLink logIn">
                            <div class="text"><a href="http://www.topcoder.com/?action=showlogin" class="actionLogin">Log In</a></div>
                            <div class="clear"></div>
                        </div>
                    <%}%>

                    <div class="separator"></div>
                    <div class="headerTopRightMenuLink contact">
                        <div class="text"><a href="http://www.topcoder.com/contact-us/">Contact</a></div>
                        <div class="clear"></div>
                    </div>
                    <div class="separator"></div>
                    <div class="headerTopRightMenuLink help">
                        <div class="text"><a href="http://help.topcoder.com">Help Center</a></div>
                        <div class="clear"></div>
                    </div>
                    <div class="separator beforeSearch"></div>
                    <div class="headerTopRightMenuLink search last">
                        <div class="icon"></div>
                        <div class="text"><a href="http://www.topcoder.com/search">Search</a></div>
                        <div class="clear"></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <h1 class="logo">
                    <a href="http://www.topcoder.com" title="topcoder"></a>
                </h1>
                <nav id="mainNav" class="mainNav">
                    <ul class="root">
                        <li id="nav-menu-item-13018"><a href="http://www.topcoder.com/challenges/" class="13018"><i></i>Challenges</a>
                            <ul class="child">
                                <li id="nav-menu-item-13510"><a href="http://www.topcoder.com/challenges/"
                                                                class="all"><i></i>All</a></li>
                                <li id="nav-menu-item-13511"><a href="http://www.topcoder.com/active-challenges/design/"
                                                                class="design"><i></i>Design</a></li>
                                <li id="nav-menu-item-13512"><a
                                        href="http://www.topcoder.com/active-challenges/develop/"
                                        class="develop"><i></i>Development</a></li>
                                <li id="nav-menu-item-13513"><a href="http://www.topcoder.com/active-challenges/data/"
                                                                class="data"><i></i>Data Science</a></li>
                                <li id="nav-menu-item-13529"><a
                                        href="http://community.topcoder.com/contest/arena/ContestAppletProd.jnlp"
                                        class="topcoder-arena"><i></i>topcoder Arena</a></li>
                            </ul>
                        </li>
                        <li id="nav-menu-item-13129"><a href="http://www.topcoder.com/community/" class="13129"><i></i>Community</a>
                            <ul class="child">
                                <li id="nav-menu-item-13509"><a href="http://www.topcoder.com/community/"
                                                                class="welcome"><i></i>Home</a></li>
                                <li id="nav-menu-item-13034"><a
                                        href="http://www.topcoder.com/community/getting-started/" class="13034"><i></i>Getting
                                    Started</a></li>
                                <li id="nav-menu-item-12983"><a href="http://www.topcoder.com/community/how-it-works/"
                                                                class="customer-solutions"><i></i>How It Works</a></li>
                                <li id="nav-menu-item-13105"><a href="http://apps.topcoder.com/forums/"
                                                                class="forums"><i></i>Forums</a></li>
                                <li id="nav-menu-item-13036"><a href="http://www.topcoder.com/community/events/"
                                                                class="13036"><i></i>Events</a></li>
                                <li id="nav-menu-item-15095"><a href="http://community.topcoder.com/tco14"  
                                    class="topcoder-open-2"><i></i>Topcoder Open 2014</a></li>
                                <li id="nav-menu-item-15218"><a href="http://tco15.topcoder.com/"  
                                    class="topcoder-open-2015"><i></i>Topcoder Open 2015</a></li>
                                <li><a href="http://www.topcoder.com/community/member-programs/">
                                                                <i></i>Member Programs</a></li>
                                <li id="nav-menu-item-13038"><a href="http://www.topcoder.com/community/stories/"
                                                                class="13038"><i></i>Stories</a></li>
                            </ul>
                        </li>
                        <li id="nav-menu-item-13469"><a href="/mission" class="about-us"><i></i>About topcoder</a>
                            <ul class="child">
                                <li id="nav-menu-item-13516"><a href="http://www.topcoder.com/mission/"
                                                                class="13516"><i></i>Mission</a></li>
                                <li id="nav-menu-item-13032"><a href="http://www.topcoder.com/research/"
                                                                class="13032"><i></i>Research</a></li>
                                <li id="nav-menu-item-13450"><a href="http://www.topcoder.com/case-studies/"
                                                                class="case-studies"><i></i>Case Studies</a></li>
                                <li id="nav-menu-item-13045"><a href="http://www.topcoder.com/press/"
                                                                class="13045"><i></i>Press</a></li>
                            </ul>
                        </li>
                        <li id="nav-menu-item-13379"><a href="http://www.topcoder.com/blog/"
                                                        class="13379"><i></i>Blog</a></li>
                        <!--
                        <li class="noReg logoutLink 	hide"><a href="http://www.topcoder.com?auth=logout" class="actionLogout">Log Out</a></li>
                        <li class="noReg loginLink"><a href="javascript:;" class="actionLogin">Log In</a></li>
                        -->
                    </ul>
                </nav>
                <!--
                <a href="http://www.topcoder.com?auth=logout" class="onMobi noReg linkLogout actionLogout hide">Log Out</a>
                  <a href="javascript:;" class="onMobi noReg linkLogin actionLogin">Log In</a>
                -->
                <% if ( !sessionInfo.isAnonymous() ) { %>
                    <span class="btnRegWrap noReg"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome" class="btn btnMyHome">My Home</a></span>
                <% } else { %>
                    <span class="btnRegWrap noReg"><a href="http://www.topcoder.com/?action=callback" class="btn btnRegister">Register</a></span>
                <%}%>

                <!-- /.userWidget -->
            </div>
        </header>
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


