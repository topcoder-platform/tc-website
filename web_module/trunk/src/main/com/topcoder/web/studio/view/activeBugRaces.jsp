<%--
  - Author: TCSDEVELOPER, pvmagacho, duxiaoyang
  - Version: 1.3
  - Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents active bug races
  -
  - Version 1.1 (Studio Release Assembly - Spec Review Sign up page v1.0) changes: Added "Review Opportunities" tab.
  - Version 1.2 (Re-platforming Studio Release 4 Assembly) changes: Clean up old studio model files.
  - Version 1.3 (TopCoder Studio Contest Listings Assembly) change notes: apply new look-and-feel.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.studio.controller.request.SortingHelper" %>
<%@ page import="java.util.ArrayList,java.util.Map,java.util.HashMap" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
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
    <title>TopCoder Studio : Active Bug Race Competitions</title>
    
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
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.jqtransform.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/date.js"></script>
    <script type="text/javascript" src="/js/NewStyleHeaderFooter/jquery.datePicker.js"></script>
    <script src="/js/NewStyleHeaderFooter/contestListingScripts.js" type="text/javascript"></script>
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
                    <h1>Active Bug Race Competitions</h1>
                    <p class="help">
                        Need help? Learn how to <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get started</a>.
                    </p>
                </div><!-- end of .title -->

                <div class="topLine">
                    <ul class="tabs">
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">
                                <span class="tabMask"><span class="text">Active Contests</span></span>
                            </a>
                        </li>
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewPastContests">
                                <span class="tabMask"><span class="text">Past Contests</span></span>
                            </a>
                        </li>
                        <li class="active">
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
                    <a href="https://www.topcoder.com/bugs/sr/jira.issueviews:searchrequest-rss/temp/SearchRequest.xml?&customfield_10073=Studio+Bug&type=-2&pid=10021&status=1&status=3&status=4&sorter/field=issuekey&sorter/order=DESC&tempMax=1000" rel="alternate" type="application/rss+xml" class="rssBtn"></a>
                </div><!-- end of .topLine -->

                <div class="dataTable">
                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="200px" />
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
                                <th class="first <%=((Boolean) sortDirection.get(new Integer(1))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("") || sortColumn.equals("1") ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveBugRaces&sc=1&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Bug Race Competition #</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(new Integer(2))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("2") ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveBugRaces&sc=2&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Bug Race Competitions Title</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(new Integer(3))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("3") ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewActiveBugRaces&sc=3&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Prize</span></a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${fn:length(issues)==0}">
                            <tr><td class="space" colspan="2">&nbsp;</td></tr>
                            <tr class="light">
                                <td class="valueC" colspan="2">
                                    <div align="center" style="margin: 40px 0px 40px 0px;">
                                        There are currently no bug race competitions, but check back soon.
                                    </div>
                                </td>
                            </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${issues}" var="issue" varStatus="status">
                            <tr><td colspan="2" class="space">&nbsp;</td></tr>
                            <tr class="<c:if test="${status.index mod 2 == 1}">even</c:if>">
                                <td class="first">
                                    ${fn:substringAfter(issue.key, "-")}
                                </td>
                                <td class="bugTitle">
                                    <a href="https://apps.topcoder.com/bugs/browse/${issue.key}"><strong>${issue.summary}</strong></a>
                                </td>
                                <td class="last">
                                    $${issue.prize}
                                </td>
                            </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div><!-- end of .dataTable -->
            </div>

<jsp:include page="foot.jsp"/>

</body>
</html>
