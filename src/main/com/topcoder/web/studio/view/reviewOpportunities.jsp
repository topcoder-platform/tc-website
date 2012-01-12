<%--
  - Author: isv, isv, TCSASSEMBER, duxiaoyang
  - Version: 1.4
  - Copyright (C) 2001 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents specification review opportunities
  -
  - Version 1.1 change notes: updated the logic for displaying the opportunities to display the milestome screening
  - and screening phase dates and link Review Signup link to OR.
  -
  - Version 1.2 change notes: updated the logic for displaying the opportunities to display the specification review
  - dates and link Review Signup link to OR.
  -
  - Version 1.3 change notes: udpated the logic for display reviewer payments.
  -
  - Version 1.4 (TopCoder Studio Contest Listings) change notes: apply new look-and-feel.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.studio.controller.request.SortingHelper" %>
<%@ page import="java.util.ArrayList,java.util.Map,java.util.HashMap" %>
<%@ page import="java.net.URLEncoder" %>
<%@ taglib prefix="studio" uri="studio.tld" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Set some constants to avoid use of scriptlets in the body --%>
<c:set value="<%=Constants.MODULE_KEY%>" var="MODULE_KEY"/>
<c:set value="<%=Constants.CONTEST_ID%>" var="CONTEST_ID"/>
<c:set value="<%=Constants.SPEC_REVIEW_ID%>" var="SPEC_REVIEW_ID"/>
<c:set value="${sessionInfo.servletPath}?${MODULE_KEY}" var="BASE_URL"/>
<c:set value="http://apps.topcoder.com/wiki/display/tcstudio/Studio+Member+Opportunities" var="BECOME_STUDIO_REVIEWER_LINK"/>
<c:set value="${BASE_URL}=ViewContestDetails&amp;${CONTEST_ID}" var="VIEW_CONTEST_DETAILS_LINK"/>
<c:set value="${BASE_URL}=ReviewRegistration&amp;${CONTEST_ID}" var="SCREENING_REVIEW_REGISTRATION_LINK"/>
<c:set value="${BASE_URL}=SpecReviewRegistration&amp;${CONTEST_ID}" var="SPEC_REVIEW_REGISTRATION_LINK"/>
<%
    ResultSetContainer reviews = (ResultSetContainer) request.getAttribute("reviews");
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
    <title>TopCoder Studio : Review Opportunities</title>

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
                    <h1>Review Opportunities</h1>
                    <p class="help">
                        Need help? Learn how to <a href="${BECOME_STUDIO_REVIEWER_LINK}">become a studio reviewer</a>.
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
                        <li>
                            <a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">
                                <span class="tabMask"><span class="text">Active Bug Race Competitions</span></span>
                            </a>
                        </li>
                        <li class="active">
                            <a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">
                                <span class="tabMask"><span class="text">Review Opportunities</span></span>
                            </a>
                        </li>
                    </ul><!-- end of .tabs -->
                    <a href="http://www.topcoder.com/tc?module=BasicRSS&c=rss_studio_review_opportunities&dsid=28" rel="alternate" type="application/rss+xml" class="rssBtn"></a>
                </div><!-- end of .topLine -->

                <div class="dataTable">
                    <table cellpadding="0" cellspacing="0">
                        <colgroup>
                            <col width="80px" />
                            <col width="410px" />
                            <col width="150px" />
                            <col width="120px" />
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
                                <th class="first <%=((Boolean) sortDirection.get(Integer.valueOf(reviews.getColumnIndex("review_type")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("") || sortColumn.equals("" + reviews.getColumnIndex("review_type")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewReviewOpportunities&sc=<%=reviews.getColumnIndex("review_type")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Type</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(reviews.getColumnIndex("name")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + reviews.getColumnIndex("name")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewReviewOpportunities&sc=<%=reviews.getColumnIndex("name")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Contest Name</span></a>
                                </th>
                                <th class="<%=((Boolean) sortDirection.get(Integer.valueOf(reviews.getColumnIndex("sort_start_time")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + reviews.getColumnIndex("sort_start_time")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewReviewOpportunities&sc=<%=reviews.getColumnIndex("sort_start_time")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Scheduled Start Date</span></a>
                                </th>
                                <th>
                                    <a href="javascript:;"><span>Reviewer Payment</span></a>
                                </th>
                                <th class="last <%=((Boolean) sortDirection.get(Integer.valueOf(reviews.getColumnIndex("reviewer_handle")))).booleanValue() ? "sortDown" : "sort"%> <%=sortColumn.equals("" + reviews.getColumnIndex("reviewer_handle")) ? "hover" : ""%>">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewReviewOpportunities&sc=<%=reviews.getColumnIndex("reviewer_handle")%>&sd=<%=sortOrder%>&sortCriteria=<%=sortCriteria%>"><span>Review Status</span></a>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${fn:length(reviews)==0}">
                            <tr><td class="space" colspan="5">&nbsp;</td></tr>
                            <tr class="light">
                                <td class="valueC" colspan="5">
                                    <div align="center" style="margin: 40px 0px 40px 0px;">
                                        There are currently no review opportunities, but check back soon.
                                    </div>
                                </td>
                            </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${reviews}" var="resultRow" varStatus="status">
                                        <c:set var="isSpecReview" value="${resultRow.map['review_type'] eq 'Spec Review'}"/>
                            <tr><td colspan="5" class="space">&nbsp;</td></tr>
                            <tr class="<c:if test="${status.index mod 2 == 1}">even</c:if>">
                                <td class="first">
                                    <c:out value="${resultRow.map['review_type']}"/>
                                </td>
                                <td>
                                    <a href="${VIEW_CONTEST_DETAILS_LINK}=${resultRow.map['contest_id']}">
                                        <strong>${resultRow.map['name']}</strong>
                                    </a>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${isSpecReview}">
                                            <fmt:formatDate value="${resultRow.map['screening_start_time']}"
                                                            pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"
                                                            timeZone="${sessionInfo.timezone}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${resultRow.map['milestone_screening_start_time'] ne null}">
                                                    Round 1 -
                                                    <fmt:formatDate value="${resultRow.map['milestone_screening_start_time']}"
                                                                    pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"
                                                                    timeZone="${sessionInfo.timezone}"/>
                                                    <br/>
                                                    Round 2 -
                                                    <fmt:formatDate value="${resultRow.map['screening_start_time']}"
                                                                    pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"
                                                                    timeZone="${sessionInfo.timezone}"/>
                                                </c:when>
                                                <c:otherwise>
                                                    Round 1 -
                                                    <fmt:formatDate value="${resultRow.map['screening_start_time']}"
                                                                    pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"
                                                                    timeZone="${sessionInfo.timezone}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="purse">
                                    <fmt:formatNumber value="${payments[status.index]}" pattern="$###,###.00"/>
                                </td>  
                                <td class="last">
                                    <c:choose>
                                        <c:when test="${resultRow.map['reviewer_id'] eq 0}">
                                            <a href="${isSpecReview ? SPEC_REVIEW_REGISTRATION_LINK : SCREENING_REVIEW_REGISTRATION_LINK}=${resultRow.map['contest_id']}">
                                                Apply Now
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <tc-webtag:handle coderId="${resultRow.map['reviewer_id']}" context="component" />
                                        </c:otherwise>
                                    </c:choose>
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
