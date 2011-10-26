<%--
  - Author: pulky, isv, pvmagacho
  - Version: 1.4
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
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

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
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
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
        <%-- container --%>
        <div id="container">    
            <div id="wrapper">
            <%-- content --%>
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                    <h1>Active Contests</h1>
                    
                    <div align="right"><strong>Need help? Learn how to
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get started</a></strong>.<br />
                    </div>
                    
                    <div class="tableTabOn" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
                              <%-- BUGR-1211 Added Active Bug Race Tab --%>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">Active Bug Race Competitions</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">Review Opportunities</a></div>

                    <a href="http://feeds.feedburner.com/ActiveContests" rel="alternate" type="application/rss+xml"><img align="right" src="/i/v2/interface/btnRSS.png" alt="RSS" style="vertical-align:midium; margin-right: 5px; margin-top:5px "/></a>
                    <br  clear="all"/>

                    <div class="statHolder">
                        <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                        <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                        <div class="container">
                            <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td class="header">&nbsp;
                                    
                                    </td>
                                    <td class="header" width="100%">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Project</a>
                                    </td>
                                    <td class="headerC">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start Date</a></td>
                                    <td class="headerC" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("milestone_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Round 1 End</a></td>
                                    <td class="headerC">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End Date</a></td>
                                    <td class="headerC" nowrap="nowrap">
                                        Time Left</td>
                                    <td class="headerR" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("prize_total")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Purse</a>
                                  </td>
                                    <td class="headerR" nowrap="nowrap">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("dr_points")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Points</a>
                                    </td>
                                    <td class="headerC">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("registrants")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Registrants</a>
                                    </td>
                                    <td class="headerC">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a>
                                    </td>
                                    <td class="header">&nbsp;</td>
                                </tr>
                                <c:choose>
                                    <c:when test="${fn:length(contests)==0}">
                                        <tr><td class="space" colspan="10">&nbsp;</td></tr>
                                        <tr class="light">
                                            <td class="valueC" colspan="10">
                                                <div align="center" style="margin: 40px 0px 40px 0px;">
                                                    There are currently no active contests, but check back soon.
                                                </div>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>

                                    <% boolean even = true;%>
                                    <rsc:iterator list="${contests}" id="resultRow">
                                        <c:set var="contestId" value="<%=new Long(resultRow.getLongItem("contest_id"))%>"/>
                                       
                                        
                                        <tr><td class="space" colspan="11">&nbsp;</td></tr>
                                        <tr class="<%=even?"light":"dark"%>">
                                            <td class="valueE">
                                                <%-- if tco show icon --%>
                                                <% if ("3434".equals(resultRow.getStringItem("event_id"))) { %>
                                                <a href="http://community.topcoder.com/tco12"><img src="/i/tournament/tco12/tco12_icon_design.png" alt="Eligible for the TCO12" /><span>Eligible for the TCO12</span></a>
                                                <% } else { %>
                                                &nbsp;
                                                <% } %>
                                            </td>
                                            <td class="value">
                                                <%-- Since TopCoder Studio Modifications assembly Req# 5.2 --%>
                                                <div class="contestTitle">
                                                    <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                                        <rsc:item name="name" row="<%=resultRow%>"/>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="start_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="milestone_date" row="<%=resultRow%>" ifNull="-" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="end_time" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                            </td>
                                            <td class="valueC">
                                                <%
                                                    Timestamp endDate;
                                                    Object milestoneDate = resultRow.getItem("milestone_date").getResultData(); 
                                                    if (milestoneDate != null && (new Date()).before((Date) milestoneDate)) {
                                                        endDate = (Timestamp) milestoneDate;
                                                    } else {
                                                        endDate = (Timestamp)(resultRow.getItem("end_time").getResultData());
                                                    }
                                                %>
                                                 <div class="countdown"><studio_tags:countdownClock mode="short" end="<%=endDate%>"/></div>
                                            </td>
                                            <td class="valueR">
                                                <rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                                            </td>
                                            <td class="valueR">
                                                <rsc:item name="dr_points" row="<%=resultRow%>" format="######" ifNull="&nbsp;"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="registrants" row="<%=resultRow%>"/>
                                            </td>
                                            <td class="valueC">
                                                <rsc:item name="submission_count" row="<%=resultRow%>"/>
                                            </td>
                                            <td class="valueW" nowrap="nowrap">
                                                <% if (resultRow.getIntItem("is_user_registered") == 1) { %>
                                                <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" onfocus="this.blur();"><img src="/i/v2/interface/btnSubmitOrganize.png" alt="Submit &amp; Organize" style="margin: 6px 0px 6px 0px;"/></a>
                                                <% } else { %>
                                                <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>" onfocus="this.blur();"><img src="/i/v2/interface/btnRegister.png" alt="Register" style="margin: 6px 0px 6px 0px;"/></a>
                                                <% } %>
                                            </td>
                                        </tr>
                                        <% even = !even;%>
                                      
                                    </rsc:iterator>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                        </table>
                    </div>
                    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
                    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
                </div>

                <br clear="all"/>
            </div>
            <div class="contentBottom"></div>
        </div>
    </div>
</div>

<jsp:include page="foot.jsp"/>
            
</body>
</html>
