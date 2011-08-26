<%--
  - Author: isv, isv, TCSASSEMBER
  - Version: 1.3 (Replatforming Studio Release 2 Assembly)
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
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
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

                    <h1>Review Opportunities</h1>

                    <div align="right"><strong>Need help? Learn how to
                        <a href="${BECOME_STUDIO_REVIEWER_LINK}">become a studio reviewer</a></strong>.<br />
                    </div>

                    <div class="tableTabOff" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">Active Bug Race Competitions</a></div>
                    <div class="tableTabOn"><a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">Review Opportunities</a></div>

                    <a href="http://www.topcoder.com/tc?module=BasicRSS&c=rss_studio_review_opportunities&dsid=28" rel="alternate" type="application/rss+xml"><img align="right" src="/i/v2/interface/btnRSS.png" alt="RSS" style="vertical-align:midium; margin-right: 5px; margin-top:5px "/></a>
                    
                    <br  clear="all"/>

                    <div class="statHolder">
                        <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                        <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                        <div class="container">
                            <table class="stat" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                                <tr>
                                    <td class="header">Type</td>
                                    <td class="header">Contest Name</td>
                                    <td class="headerC">Scheduled Start Date</td>
                                    <td class="headerC">Reviewer Payment</td>
                                    <td class="headerC">Review Status</td>
                                </tr>
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
                                          <c:set var="isSpecReview" 
                                                 value="${resultRow.map['review_type'] eq 'Spec Review'}"/>
                                        <tr><td class="space" colspan="5">&nbsp;</td></tr>
                                        <tr class="${status.index % 2 == 1? 'dark' : 'light' }">
                                            <td class="valueE"><c:out value="${resultRow.map['review_type']}"/></td>
                                            <td class="value">
                                                <a href="${VIEW_CONTEST_DETAILS_LINK}=${resultRow.map['contest_id']}">
                                                    ${resultRow.map['name']}
                                                </a>
                                            </td>
                                            <td class="valueC">
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
                                            <td class="valueC"><fmt:formatNumber value="${payments[status.index]}" pattern="$###,###.00"/></td>
                                            <td class="valueW">
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
