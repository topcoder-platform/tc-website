<%--
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 *
 * This JSP renders TopCoder web site's shortcut bar.
 *
 * Changes in Content Creation Contest Online Review and TC Site Integration Assembly 1.0:
 * Add content creation shortcut icon.
 * 
 * Add Reporting shortcut icon.
--%>
<%@  page
  language="java"
  import="com.topcoder.shared.util.ApplicationServer,
          com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.SessionInfo"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String level1 = request.getParameter("level1")==null?"competition":request.getParameter("level1");

%>

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
    <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewAssemblyActiveContests"><img src="/i/interface/scAssembly.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Assembly Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=13"><img src="/i/interface/scTesting.png" alt="" onmouseover="postPopUpText('globalPopupText','Testing Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=35"><img src="/i/interface/scContentCreation.gif" alt="" onmouseover="postPopUpText('globalPopupText','Content Creation Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ActiveContests&pt=36"><img src="/i/interface/scReporting.gif" alt="" onmouseover="postPopUpText('globalPopupText','Reporting Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="javascript:arena();"><img src="/i/interface/scTCHS.png" alt="" onmouseover="postPopUpText('globalPopupText','High School Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=ViewActiveContests"><img src="/i/interface/scMarathon.png" alt="" onmouseover="postPopUpText('globalPopupText','Marathon Matches'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests"><img src="/i/interface/scStudio.png" alt="" onmouseover="postPopUpText('globalPopupText','TopCoder Studio Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
</div>

<div id="globalPopup" class="popUp"><div id="globalPopupText"></div></div>

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
                <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/longcontest/?module=Login">Login</a>
            <% } else if (level1.equals("forums")) { %>
                <a class="gMetal" href="?module=Login">Login</a>
            <% } else { %>
                <a class="gMetal" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?&amp;module=Login">Login</a>
            <% } %>
        <%}%>
    </div>
</div>