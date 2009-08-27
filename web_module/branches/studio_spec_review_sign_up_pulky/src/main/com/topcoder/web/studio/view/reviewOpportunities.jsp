<%--
  - Author: TCSDEVELOPER
  - Version: 1.0 (Studio Release Assembly - Spec Review Sign up page v1.0)
  - Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents review opportunities
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer reviewsRSC = (ResultSetContainer) request.getAttribute("reviews");%>
<c:set value="<%=reviewsRSC.getColumnIndex("contest_type_desc")%>" var="TYPE_COLUMN_INDEX"/>
<c:set value="<%=reviewsRSC.getColumnIndex("name")%>" var="CONTEST_NAME_COLUMN_INDEX"/>
<c:set value="<%=reviewsRSC.getColumnIndex("start_time")%>" var="START_TIME_COLUMN_INDEX"/>
<c:set value="<%=Constants.SPEC_REVIEW_PAYMENT_AMOUNT%>" var="SPEC_REVIEW_PAYMENT_AMOUNT"/>

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
						<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=Static&amp;d1=support&amp;d2=getStarted">get started</a></strong>.<br />
					</div>
					
                    <div class="tableTabOff" style="margin-left: 20px;"><a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a></div>
					<div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a></div>
                    <div class="tableTabOff"><a href="${sessionInfo.servletPath}?module=ViewActiveBugRaces">Active Bug Races</a></div>
                    <div class="tableTabOn"><a href="${sessionInfo.servletPath}?module=ViewReviewOpportunities">Review Opportunities</a></div>
							
					<br  clear="all"/>
					
					<div class="statHolder">
						<div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
						<div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
						<div class="container">
							<table class="stat" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td class="header">
										<a href="${sessionInfo.servletPath}<tc-webtag:sort column="${TYPE_COLUMN_INDEX}" includeParams="true"/>">Type</a>
									</td>
									<td class="header">
                                        <a href="${sessionInfo.servletPath}<tc-webtag:sort column="${CONTEST_NAME_COLUMN_INDEX}" includeParams="true"/>">Contest Name</a>
                                    </td>
									<td class="headerC">
                                        <a href="${sessionInfo.servletPath}<tc-webtag:sort column="${START_TIME_COLUMN_INDEX}" includeParams="true"/>">Scheduled Start Date</a>
                                    </td>
									<td class="headerC">Reviewer Payment</td>
									<td class="header">Review Status</td>
									<td class="header">&nbsp;</td>
								</tr>
								<c:choose>
									<c:when test="${fn:length(reviews)==0}">
										<tr><td class="space" colspan="10">&nbsp;</td></tr>
										<tr class="light">
											<td class="valueC" colspan="10">
												<div align="center" style="margin: 40px 0px 40px 0px;">
													There are currently no review opportunities, but check back soon.
												</div>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
                                      <c:forEach items="${projectList}" var="resultRow" varStatus="status">
										<tr><td class="space" colspan="10">&nbsp;</td></tr>
										<tr class="${status.index % 2 == 1? "dark" : "light" }">
                                            <td class="value">
                                                ${resultRow.map['contest_type_desc']}
                                            </td>
											<td class="value">
												<a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
													${resultRow.map['name']}
												</a>
											</td>
											<td class="valueC">
                                                <fmt:formatDate value="${resultRow.map['start_time']}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
    										</td>
											<td class="valueC">
                                                <fmt:formatNumber value="${SPEC_REVIEW_PAYMENT_AMOUNT}" pattern="$###,###.00"/>
											</td>
											<td class="value">
                                                <studio:handle coderId="${resultRow.map['review_user_id ']}"/>
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
