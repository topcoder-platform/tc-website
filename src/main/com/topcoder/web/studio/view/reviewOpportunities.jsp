<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<c:set var="MODULE_KEY" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="SPEC_REVIEW_ID" value="<%=Constants.SPEC_REVIEW_ID%>"/>
<c:set var="reviewOpportunities" value="${requestScope.reviewOpportunities}"/>

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
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript"></script>
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

					<div class="tableTabOff" style="margin-left: 20px;">
                        <a href="/?module=ViewActiveContests">Active Contests</a></div>
					<div class="tableTabOff">
                        <a href="/?module=ViewPastContests">Past Contests</a></div>
					<div class="tableTabOff">
                        <a href="/?module=ViewActiveBugRaces">Active Bug Races</a></div>
					<div class="tableTabOn">
                        <a href="/?module=ViewSpecReviewOpportunities">Review Opportunities</a></div>

					<a href="http://feeds.feedburner.com/ReviewOpportunities" rel="alternate" type="application/rss+xml">
                        <img align="right" src="/i/v2/interface/btnRSS.png" alt="RSS"
                             style="vertical-align:medium; margin-right: 5px; margin-top:5px "/></a>
					<br clear="all"/>

					<div class="statHolder">
						<div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
						<div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
						<div class="container">
							<table class="stat" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td class="header">Type</td>
                                    <td class="headerC">Contest Name</td>
                                    <td class="headerC">Scheduled Start Date</td>
                                    <td class="headerR" nowrap="nowrap">Reviewer Payment</td>
                                    <td class="headerC">Review Status</td>
								</tr>
								<c:choose>
									<c:when test="${fn:length(reviewOpportunities) == 0}">
										<tr><td class="space" colspan="5">&nbsp;</td></tr>
										<tr class="light">
											<td class="valueC" colspan="5">
												<div align="center" style="margin: 40px 0 40px 0;">
													There are currently no review opportunities, but check back soon.
												</div>
											</td>
										</tr>
									</c:when>
									<c:otherwise>

                                    <c:set var="even" value="true"/>
									<rsc:iterator list="${reviewOpportunities}" id="resultRow">
                                        <c:set var="reviewerId" value="<%=new Long(resultRow.getLongItem("review_user_id"))%>"/>
                                        <c:set var="specReviewId" value="<%=new Long(resultRow.getLongItem("spec_review_id"))%>"/>
										<tr><td class="space" colspan="10">&nbsp;</td></tr>
										<tr class="${even ? 'light' : 'dark'}">
											<td class="valueE">
                                                <rsc:item name="contest_type_name" row="<%=resultRow%>"/>
											</td>
                                            <td class="valueC">
                                                <div class="contestTitle">
                                                    <a href="/?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                                        <rsc:item name="contest_name" row="<%=resultRow%>"/>
                                                    </a>
                                                </div>
                                            </td>
											<td class="valueC">
												<rsc:item name="scheduled_start_date" row="<%=resultRow%>"
                                                          format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"
                                                          timeZone="${sessionInfo.timezone}"/>
											</td>
											<td class="valueR">
                                                <fmt:formatNumber value="<%=new Double(Constants.SPEC_REVIEW_PAYMENT)%>"
                                                                  pattern="$###,###.00"/>
											</td>
											<td class="valueW">
                                                <c:choose>
                                                    <c:when test="${reviewerId ne -11111}">
                                                        <studio:handle coderId="${reviewerId}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="/?${MODULE_KEY}=ViewSpecReviewRegistration&amp;${SPEC_REVIEW_ID}=${specReviewId}">
                                                            ${sessionInfo.anonymous ? 'Open' : 'Apply Now'}</a>
                                                    </c:otherwise>
                                                </c:choose>
											</td>
										</tr>
                                        <c:set var="even" value="${not even}"/>
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
