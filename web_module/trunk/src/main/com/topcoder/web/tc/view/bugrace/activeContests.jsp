<%--
  - Author: TrePe
  - Version: 1.0
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists active bug races.
  -
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

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
    <title>TopCoder :: Active Bug Races</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="bugraces_compete"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="bugrace"/>
            <jsp:param name="title" value="Active Contests"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
    <tr>
        <td width="100%" height="23px">&nbsp;</td>
        <td align="right">
            <a href="http://apps.topcoder.com/wiki/display/tc/How+to+Compete+in+Bug+Race+Competitions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></a><br /><br />
        </td>
    </tr>
</table>

<p>Click on an issue to view its details. If you would like to work on an issue, first view the details and then click "Vote". Voting will be equivalent to registering to work on the issue. Read the <a href="/wiki/display/tc/Bug+Race+Competition+Overview" title="Bug Race Competition Overview">full instructions</a> on how to compete.</p>
<div class='panelMacro'><table class='infoMacro'><colgroup><col width='24'><col></colgroup><tr><td valign='top'><img src="http://apps.topcoder.com/wiki/images/icons/emoticons/information.gif" width="16" height="16" align="absmiddle" alt="" border="0"></td><td><b>New Opportunities</b><br />
                <p>Interested in reviewing submissions to Bug Race Competitions, performing environment setups, managing source control merges for submissions, etc?&nbsp; Click <a href="/wiki/display/tc/Bug+Race+Competition+Reviews" title="Bug Race Competition Reviews">here</a> to see the available tasks.</p></td></tr></table></div>
<p><font color="#ff0000">Your ability to participate in these competitions is conditioned upon your agreement to the TopCoder&nbsp;</font><a href="/wiki/display/tc/Bug+Race+Competitions+Terms+of+Work" title="Bug Race Competitions Terms of Work">Terms of Work</a>.</p>
<p>&#95;Note: Issues that are marked "In Progress" have already received one or more submissions which are currently being verified by TopCoder. Issues that are marked "Open" have not yet received a passing submission. If a submission does not fix the issue, or is too low in quality,<br/>
TopCoder will restore the issue to the "Open" status.&#95;</p>

<div align="right">
    Competition opportunities via RSS -
    <a href="/tc?module=BasicRSS&amp;c=rss_Active_Bug_Races&amp;dsid=34">Subscribe Now</a>
    <a href="/tc?module=BasicRSS&amp;c=rss_Active_Bug_Races&amp;dsid=34"><img src="/i/interface/emblem/rss.gif" alt="RSS" style="vertical-align:middle;"/></a>
    <br /><br />
</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td class="title" colspan="7">Active Bug Race Competitions</td>
    </tr>
    <tr>
      <td class="header" width="30%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Contest</a></td>
      <td class="header" width="10%">&#160;</td>
      <td class="header" width="10%">&#160;</td>
      <td class="headerC" width="10%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Payment</a></td>
      <td class="headerC" width="10%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">TCO Points</a></td>
      <td class="headerC" width="10%">
          <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Registrants</a><br />
      </td>
      <td class="headerC" width="20%"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Active Since</a></td>
   </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=contests %>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="value">
                <a href="https://apps.topcoder.com/bugs/browse/<%=resultRow.getStringItem("ticket_id")%>">
                    <rsc:item name="contest" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="value">
            <% if (resultRow.getIntItem("tco_points") > 0) { %>
                <div align="center">
                  <a href='http://community.topcoder.com/tco14'><img class="emblem" src="/i/tournament/tco14/software_tco14_icon.png" alt="" border="0" onMouseOver="postPopUpText('globalPopupText','Eligible for the TopCoder Open'); popUp(this,'globalPopup');" onMouseOut="popHide()" /></a>
                </div>
            <% } else { %>
                &nbsp;
            <% } %>
            </td>
            <td class="value">
                &nbsp;
            </td>
            <td class="valueC">
                <rsc:item name="payment" row="<%=resultRow%>" format="$###,##0.0"/>
            </td>
            <td class="valueC">
                <rsc:item name="tco_points" row="<%=resultRow%>" format="######"/>
            </td>
            <td class="valueC">
                <rsc:item name="registrants" row="<%=resultRow%>"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="active_since" row="<%=resultRow%>" format="MM.dd.yyyy'<br />'HH:mm z"/>
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
