<%--
  - Author: TCSASSEMBLER
  - Version: 1.0
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all the copilot postings. This page is modified based on active contests page for
  - the other project types and is customized specically for copilot posting. It will not display DR, reliability
  - bonus and rated and unrated number.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<c:set value="<%=Constants.COPILOT_POSTING_PROJECT_TYPE%>" var="COPILOT_POSTING_TYPE_ID"/>


<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
    <title>TopCoder :: Copilot Postings</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
           <c:choose>
            <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
                <jsp:include page="/includes/global_left.jsp">
                    <jsp:param name="node" value="copilots_compete"/>
                </jsp:include>
            </c:when>
          </c:choose>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

      <c:choose>
        <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="copilot_posting"/>
                <jsp:param name="title" value="Active Copilot Postings"/>
            </jsp:include>
        </c:when>
      </c:choose>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
    <tr>
            <td width="100%" height="23px">&nbsp;</td>


        <td align="right">
          <c:choose>
            <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
                <a href="/wiki/display/tc/How+to+Compete+in+Copilot+Opportunities"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></a><br /><br />
            </c:when>
          </c:choose>
        </td>
    </tr>
</table>

<div align="right" style="padding-top: 10px">
      <c:choose>
        <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
            Copilot opportunities via RSS -
            <a href="/tc?module=BasicRSS&c=rss_Registration_Open&dsid=28&pt=29">Subscribe Now</a>
            <a href="/tc?module=BasicRSS&c=rss_Registration_Open&dsid=28&pt=29"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
        </c:when>
      </c:choose>
    <br /><br />
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
                <td class="title" colspan="9">

          <c:choose>
            <c:when test="${pt == COPILOT_POSTING_TYPE_ID}">
                Active Copilot Postings</td>
            </c:when>

          </c:choose>
    </tr>
    <tr>
      <td class="header" width="30%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Copilot Posting</a></td>
      <td class="header" width="10%">&#160;</td>
      <td class="header" width="10%">&#160;</td>
      <td class="headerC" width="15%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Register by</a></td>
      <td class="headerC" width="15%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Submit by</a></td>
      <!-- hide payent column for now -->  
      <td class="headerC" width="10%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true"/>">Payment</a></td>
      <td class="headerC" width="15%">
      <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Registered Copilots</a><br />
          <%-- hide ratings for now
      <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Rated</a>/
      <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Unrated</a>
          --%>
      </td>
      <td class="headerC" width="15%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Submissions</a></td>
   </tr>


    <%
        boolean even = false;
        Map<Long, Boolean> permissions =  (Map<Long, Boolean>) request.getAttribute("permissions");
    %>
    <rsc:iterator list="<%=contests %>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                   <%
                       long projectId = resultRow.getLongItem("project_id");
                       if (permissions.get(projectId).booleanValue()) {
                   %>
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <% } %>
                    <rsc:item name="contest_name" row="<%=resultRow%>"/>
                    <%
                       if (permissions.get(projectId).booleanValue()) {
                   %>
                </a>
                <% } %>
            </td>
            <td class="value">
          <% if (resultRow.getIntItem("tourny_project") > 0) { %>
                <div align="center">
                  <a href='http://community.topcoder.com/tco12'><img class="emblem" src="/i/tournament/tco12/software_tco12_icon.png" alt="" border="0" onMouseOver="postPopUpText('globalPopupText','Eligible for the TopCoder Open'); popUp(this,'globalPopup');" onMouseOut="popHide()" /></a>
                </div>
           <% } else if (resultRow.isValidColumn("paypal_brand") && resultRow.getItem("paypal_brand").getResultData() != null && resultRow.getIntItem("paypal_brand") > 0) { %>
                <div align="center">
                  <img class="emblem" src="/i/development/smPayPalX.gif" alt="PayPal X" border="0" /></a>
                </div>
              <% } else { %>
                &nbsp;
              <% } %>
            </td>
            <td class="value">
              <% if (resultRow.getIntItem("sensations_project") > 0) { %>
                <div align="center">
                    <a href='http://sensations.aol.com'><img class="emblem" src="/i/tournament/tco09/tc-sdc-icon.png" alt="" border="0" onMouseOver="postPopUpText('globalPopupText','Part of the AOL/TopCoder Sensations Challenge'); popUp(this,'globalPopup');" onMouseOut="popHide()" /></a>
                </div>
              <% } else { %>
                &nbsp;
              <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <% if (resultRow.getBooleanItem("is_reg_closed")) { %>
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy'<br />'HH:mm z"/>
                <% } else { %>
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
            
            <td class="valueC">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/>
            </td>
            <%--
            <td class="valueC">
                <rsc:item name="reliability_bonus" row="<%=resultRow%>" format="$###,###.00"/></td>
            <c:if test="${hasDR}">
                <td class="valueC">
                    <rsc:item name="dr_points" row="<%=resultRow%>" format="######"/>
                </td>
            </c:if>
            --%>
            <td class="valueC">
         <% if (resultRow.getIntItem("total_inquiries") > 0 && permissions.get(projectId).booleanValue()) { %>
         <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
         <% } %>
           <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
         <% if (resultRow.getIntItem("total_inquiries") > 0 && permissions.get(projectId).booleanValue()) { %>
         </a>
         <% } %>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<div align="right" style="padding-top: 10px">
    Stay informed with our <a href="/wiki/display/tc/Upcoming+Contests">Upcoming Contests page</a> or subscribe to the RSS feed
    <a href="/tc?module=BasicRSS&amp;c=rss_Pipeline&amp;dsid=28"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
</div>

        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
        </td>
<%-- Right Column Ends --%>

    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
