<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ page import="com.topcoder.web.openaim.controller.request.Login" %>
<%@ page import="com.topcoder.web.openaim.model.ContestProperty" %>
<%@ page import="com.topcoder.web.openaim.model.PrizeType" %>
<%@ page import="com.topcoder.web.openaim.model.ReviewStatus" %>
<%@ page import="com.topcoder.web.openaim.model.SubmissionStatus" %>
<%@ page import="com.topcoder.web.openaim.model.SubmissionType" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<script type="text/javascript" src="/js/popup.js"></script>

<div id="shortcutBar">
    <div class="icon"><a href="/tc"><img src="/i/interface/scHome.png" alt="" onmouseover="postPopUpText('globalPopupText','Home'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="javascript:arena();"><img src="/i/interface/scAlgo.png" alt="" onmouseover="postPopUpText('globalPopupText','Algorithm Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="/tc?module=ViewArchitectureActiveContests"><img src="/i/interface/scArchitecture.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Architecture Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="/tc?module=ViewActiveContests&amp;ph=112"><img src="/i/interface/scDesign.png" alt="" onmouseover="postPopUpText('globalPopupText','Component Design Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="/tc?module=ViewActiveContests&amp;ph=113"><img src="/i/interface/scDevelopment.png" alt="" onmouseover="postPopUpText('globalPopupText','Component Development Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="/registration/actions/Registration.do?method=openRegistrations"><img src="/i/interface/scAssembly.png" alt="" onmouseover="postPopUpText('globalPopupText','Software Assembly Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="javascript:arena();"><img src="/i/interface/scTCHS.png" alt="" onmouseover="postPopUpText('globalPopupText','High School Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="/longcontest/?module=ViewActiveContests"><img src="/i/interface/scMarathon.png" alt="" onmouseover="postPopUpText('globalPopupText','Marathon Matches'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
    <div class="icon"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests"><img src="/i/interface/scStudio.png" alt="" onmouseover="postPopUpText('globalPopupText','TopCoder Studio Competitions'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a></div>
</div>

<div id="globalPopup" class="popUp"><div id="globalPopupText"></div></div>


<div style="position: absolute; right:0px; top:31px;"><a href="/tc?module=MyHome"><img src="/i/interface/myTopCoder.png" alt="My TopCoder" style="display:block;"/></a></div>

<div align="center" style="margin: 0px 290px 0px 280px;">
   <div id="outerLogo">
      <div id="innerLogo">
      <a href="/"><img src="/i/interface/topcoder.gif" alt="TopCoder" style="display: block;" /></a>
      </div>
   </div>
</div>

<div class="memberCountBox">
Member Count: <%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> - <jsp:include page="/date_time.jsp" />
</div>


<% if (section.equals("home")) {%>
<% } else { %>
    <c:choose>
        <c:when test="${sessionInfo.anonymous}">
            <div class="topBar">
                <div style="float: right; margin: 5px 0px 0px 0px;">
                    <a class="gMetal" href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/?module=Login">Login</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="topBar">
                <div style="float: right; margin: 5px 0px 0px 0px;">
                    Hello, <tc-webtag:handle coderId="${sessionInfo.userId}"/>
                        | <a class="gMetal" href="http://<%=ApplicationServer.OPENAIM_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Logout</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
<% } %>