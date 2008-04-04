<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Map"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
<title>Active Contests</title>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
   <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="assembly_compete"/>
   </jsp:include>
</td>

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
<jsp:param name="image" value="assembly"/>
    <jsp:param name="title" value="Active Contests"/>
</jsp:include>

<table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:10px;">
    <tr>
        <td>
            <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=description"><img src="/i/development/digitalRun.gif" alt="The Digital Run" border="0"/></A>
        </td>
        <td align="right">
            <a href="http://<%=ApplicationServer.WIKI_SERVER_NAME%>/display/tc/How+to+Compete+in+Assembly+Competitions"><img src="/i/development/get_started.gif" alt="Getting Started" border="0"/></a>
        </td>
    </tr>
</table>

<div align="right" style="padding-top: 10px">
    Competition opportunities via RSS - <a href="/tc?module=BasicRSS&amp;c=rss_Assembly_Registration_Open&amp;dsid=28">Subscribe Now</a>
    <a href="/tc?module=BasicRSS&amp;c=rss_Assembly_Registration_Open&amp;dsid=28"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
    <br /><br />
</div>

<%--
<div align="right" style="margin: 6px 0px;">
    <a href="http://<%=ApplicationServer.WIKI_SERVER_NAME%>/display/tc/How+to+Compete+in+Assembly+Competitions"><img src="/i/interface/getStarted.png" alt="Need help? Learn how to get started" /></a>
</div>
--%>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="8">Active Software Assembly Contests</td>
    </tr>
    <tr>
      <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Contest</a></td>
      <td class="header">&#160;</td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Register By</a></td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Submit by</a></td>
      <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="10" includeParams="true"/>">Payment</a></td>
      <td class="headerC" width="10%">
          <div align="center">
              <a href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/interface/emblem/digitalrun.png" alt="" onmouseover="postPopUpText('globalPopupText','The Digital Run'); popUp(this,'globalPopup');" onmouseout="popHide()" /></a>
          </div>
          <div align="center">
              <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="11" includeParams="true"/>">Points</a>
          </div>
      </td>
      <td class="headerC">
      <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Registrants</a><br />
      <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Rated</a>/
      <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Unrated</a>
      </td>
      <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">Submissions</a></td>
   </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=contests %>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>"> 
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="contest_name" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="value">
            </td>
            
            <td class="valueC" nowrap="nowrap">
                <% if (resultRow.getBooleanItem("is_reg_closed")) { %>
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
                <% } else { %>
                <strong><rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/></strong>
                <% } %>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/></td>
            <td class="valueR">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="valueC">
                <rsc:item name="dr_points" row="<%=resultRow%>" format="######"/>
            </td>
            <td class="valueC">
         <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
         <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
         <% } %>
         <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/<rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
         <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
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
    <a href="/tc?module=BasicRSS&amp;c=rss_Upcoming_Contests&amp;dsid=29"><img src="/wiki/images/icons/rss.gif" alt="RSS" align="absmiddle" /></a>
</div>
<br />

<p><br /></p>


</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="branded"/>
    </jsp:include>
</td>

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
