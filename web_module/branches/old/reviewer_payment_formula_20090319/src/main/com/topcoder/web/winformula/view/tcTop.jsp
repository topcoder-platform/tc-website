<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.controller.request.Login" %>
<%@ page import="com.topcoder.web.winformula.model.ContestProperty" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>
<%@ page import="com.topcoder.web.winformula.model.ReviewStatus" %>
<%@ page import="com.topcoder.web.winformula.model.SubmissionStatus" %>
<%@ page import="com.topcoder.web.winformula.model.SubmissionType" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.topcoder.web.common.SessionInfo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="winformula.tld" prefix="winformula" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    SessionInfo sessionInfo = (SessionInfo)request.getAttribute(BaseServlet.SESSION_INFO_KEY);
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<script type="text/javascript" src="/js/popup.js"></script>

<div id="shortcutBar">
    <div class="icon"><a href="/tc"><img src="/i/interface/scOthers.png" alt="" /></a></div>
</div>

<div id="globalPopup" class="popUp"><div id="globalPopupText"></div></div>


<% if ( !sessionInfo.isAnonymous() ) { %>
<div style="position: absolute; right:0px; top:31px;"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome"><img src="/i/interface/myTopCoder.png" alt="My TopCoder" style="display:block;"/></a></div>
<% } else { %>
<div style="position: absolute; right:0px; top:31px;"><a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/?module=Main&amp;rt=9"><img src="/i/interface/register_now.gif" alt="Register Now" style="display:block;"/></a></div>
<%}%>

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
                    <a class="gMetal" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Login">Login</a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="topBar">
                <div style="float: right; margin: 5px 0px 0px 0px;">
                    Hello, <tc-webtag:handle coderId="${sessionInfo.userId}" darkBG="true"/>
                        | <a class="gMetal" href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Logout</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
<% } %>