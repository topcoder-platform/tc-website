<%--
  - Author: pulky, isv, pvmagacho, duxiaoyang
  - Version: 1.5
  - Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents active contests
  -
  - Version 1.1 (Studio Release Assembly - Spec Review Sign up page v1.0) changes: Added "Review Opportunities" tab.
  - Version 1.2 (BUGR-2786) changes: Added "Round 1 End" column. Fixed "time left" column to count towards milestone
  - date if it has not been reached yet. (Only for multi round contests)
  - Version 1.3 (Replatforming Studio Release 1 Assembly) change notes: active contests are filtered based on 
  - eligibility constraints.
  - Version 1.4 (Replatforming Studio Release 4 Assembly) change notes: clean up old model classes.
  - Version 1.5 (TopCoder Studio Contest Listings Assembly) change notes: apply new look-and-feel.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.studio.controller.request.SortingHelper" %>
<%@ page import="java.util.ArrayList,java.util.Map,java.util.HashMap" %>
<%@ page import="java.util.Date,java.sql.Timestamp" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");
    String sortCriteria = URLEncoder.encode((String) request.getAttribute(SortingHelper.SORTING_CRITERIA_KEY));
    Map sortDirection = new HashMap();
    SortingHelper.parseSortingParameter((String) request.getAttribute(SortingHelper.SORTING_CRITERIA_KEY), new ArrayList(), sortDirection);
 %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Active Contests</title>
    
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.tools.tooltip.min.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.jqtransform.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/date.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.datePicker.js"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="contest" />
        </jsp:include>
        <br />
        <div id="content-new">
            <div class="contentMask">
                <div class="title">
                    <h1>Active Contests</h1>
                    <p class="help">
                        Need help? Learn how to
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get started</a>.
                    </p>
                </div><!-- end of .title -->

                <div class="topLine">
                    <ul class="tabs">
                        <li class="active">
                            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">
                                <span class="tabMask"><span class="text">Active Contests</span></span>
                            </a>
                        </li>
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewPastContests">
                                <span class="tabMask"><span class="text">Past Contests</span></span>
                            </a>
                        </li>
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">
                                <span class="tabMask"><span class="text">Active Bug Race Competitions</span></span>
                            </a>
                        </li>
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">
                                <span class="tabMask"><span class="text">Review Opportunities</span></span>
                            </a>
                        </li>
                    </ul><!-- end of .tabs -->
                    <a href="http://feeds.feedburner.com/ActiveContests" rel="alternate" type="application/rss+xml" class="rssBtn"></a>
                </div> <!-- end of .topLine -->

                <div class="dataTable">
                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="30px" />
                            <col width="208px" />
                            <col width="37px" />
                            <col width="64px" />
                            <col width="74px" />
                            <col width="62px" />
                            <col width="60px" />
                            <col width="48px" />
                            <col width="45px" />
                            <col width="70px" />
                            <col width="78px" />
                            <col width="" />
                        </colgroup>
                        <thead>
                            <tr>
                                <% 
                                    String sortColumn = (String) request.getAttribute("sortColumn");
                                    if (sortColumn == null) {
                                        sortColumn = "";
                                    }
                                    String sortOrder = (String) request.getAttribute("sortDirection");
                                    if (sortOrder == null) {
                                        sortOrder = "asc";
                                    }
                                %>
                                <th class="first <%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("name")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("") || sortColumn.equals("" + contests.getColumnIndex("name")) ? "hover" : ""%>" colspan="2">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("name")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"/><span>Project</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("type_name")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("type_name")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("type_name")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"/><span>Type</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("start_time")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("start_time")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("start_time")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"/><span>Start Date</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("milestone_date")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("milestone_date")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("milestone_date")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"/><span>Round 1 End</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("end_time")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("end_time")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("end_time")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>End Date</span></a>
                                </th>
                                <th>
                                    <a href="javascript:;"><span>Time Left</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("prize_total")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("prize_total")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("prize_total")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Purse</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("dr_points")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("dr_points")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("dr_points")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Points</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("registrants")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("registrants")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("registrants")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Registrants</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("submission_count")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("submission_count")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("submission_count")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Submissions</span></a>
                                </th>
                                <th class="last <%=((Boolean) sortDirection.get(Integer.valueOf(contests.getColumnIndex("is_user_registered")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + contests.getColumnIndex("is_user_registered")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests&sc=<%=contests.getColumnIndex("is_user_registered")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Action</span></a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${fn:length(contests)==0}">
                            <tr><td class="space" colspan="12">&nbsp;</td></tr>
                            <tr class="light">
                                <td class="valueC" colspan="12">
                                    <div align="center" style="margin: 40px 0px 40px 0px;">
                                        There are currently no active contests, but check back soon.
                                    </div>
                                </td>
                            </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="even" value="false" />
                                    <rsc:iterator list="${contests}" id="resultRow">
                                        <c:set var="contestId" value="<%=new Long(resultRow.getLongItem("contest_id"))%>"/>
                            <tr>
                                <td colspan="12" class="space">&nbsp;</td>
                            </tr>
                            <tr <c:if test="${even}">class="even"</c:if>>
                                <td class="first">
                                    <%-- if tco show icon --%>
                                    <% if ("3434".equals(resultRow.getStringItem("event_id"))) { %>
                                    <a href="http://community.topcoder.com/tco12"><img src="/i/tournament/tco12/tco12_icon_design.png" alt="Eligible for the TCO12" /><span>Eligible for the TCO12</span></a>
                                    <% } else if ("18".equals(resultRow.getStringItem("contest_type_id")) && "true".equals(resultRow.getStringItem("in_tco")) ) { %>
                                    <a href="http://community.topcoder.com/tco12/win-tco-trips"><img src="/i/tournament/tco12/tco12_icon_wireframe.png" alt="Eligible for the TCO12" /><span>Eligible for the TCO12</span></a>
                                    <% } else { %>
                                    &nbsp;
                                    <% } %>
                                </td>
                                <td class="project">
                                    <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                        <strong><rsc:item name="name" row="<%=resultRow%>"/></strong>
                                    </a>
                                </td>
                                <td>
                                    <a class="typeIcon tooltip type<rsc:item name="type_id" row="<%=resultRow%>"/>" href="javascript:;">
                                        <span class="tipT">Contest Type</span>
                                        <span class="tipC"><rsc:item name="type_name" row="<%=resultRow%>"/></span>
                                    </a>
                                </td>
                                <td>
                                    <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td>
                                    <rsc:item name="milestone_date" row="<%=resultRow%>" ifNull="-" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td>
                                    <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="timeLeft">
                                    <%
                                        Timestamp endDate;
                                        Object milestoneDate = resultRow.getItem("milestone_date").getResultData();
                                        if (milestoneDate != null && (new Date()).before((Date) milestoneDate)) {
                                            endDate = (Timestamp) milestoneDate;
                                        } else {
                                            endDate = (Timestamp)(resultRow.getItem("end_time").getResultData());
                                        }
                                    %>
                                    <studio_tags:countdownClock mode="short" end="<%=endDate%>"/>
                                </td>
                                <td class="purse">
                                    <rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                                </td>
                                <td>
                                    <rsc:item name="dr_points" row="<%=resultRow%>" format="######" ifNull="&nbsp;"/>
                                </td>
                                <td>
                                    <rsc:item name="registrants" row="<%=resultRow%>"/>
                                </td>
                                <td>
                                    <rsc:item name="submission_count" row="<%=resultRow%>"/>
                                </td>
                                <td class="last">
                                    <% if (resultRow.getIntItem("is_user_registered") == 1) { %>
                                        <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" onfocus="this.blur();"><img src="/i/v2/interface/btnSubmitOrganize.png" alt="Submit &amp; Organize" style="margin: 6px 0px 6px 0px;"/></a>
                                    <% } else { %>
                                        <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" onfocus="this.blur();"><img src="/i/v2/interface/btnRegister.png" alt="Register" style="margin: 6px 0px 6px 0px;"/></a>
                                    <% } %>
                                </td>
                            </tr>
                                        <c:set var="even" value="${not even}" />
                                    </rsc:iterator>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div><!-- end of .dataTable -->
            </div>
        

<jsp:include page="foot.jsp"/>

<div class="tooltipsBox" id="tooltipsBox1">
    <div class="tooltipsH"><h6></h6></div>
    <div class="tooltipsC"><p></p></div>
    <div class="tooltipsF"></div>
</div>
</body>
</html>
