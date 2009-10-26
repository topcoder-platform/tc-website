<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents contests list to administrators
  -
  - Version 1.1 (BUGR-2786) changes: Added "Round 1 End" column.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TopCoder Studio</title>
	
	<jsp:include page="../style.jsp">
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
	<%-- Turn off in Admin  
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
	--%>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="../top.jsp"/>
        <br />
        <!-- container -->
        <div id="container">
        	<div id="wrapper">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>Contests</h1>

                <div align="right" style="margin-bottom: 10px;"><a href="${sessionInfo.servletPath}?module=ViewContest"><img src="/i/v2/interface/btnAddContest.png" alt="Add contest" /></a></div>

				<div class="statHolder">
					<div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
					<div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
					<div class="container">
						<table class="stat" cellpadding="0" cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td class="title" colspan="7">Admin Contests</td>
								</tr>
								<tr>
									<td class="header" width="100%">
										<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Name</a>
									</td>
									<td class="header"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("contest_status_desc")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Status</a></td>
                                    <td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("start_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Start</a></td>
                                    <td class="headerC" nowrap="nowrap"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("milestone_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Round 1 End</a></td>
									<td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("end_time")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">End</a></td>
									<td class="headerC"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests<tc-webtag:sort column="<%=contests.getColumnIndex("submission_count")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submissions</a></td>
									<td class="headerC">&nbsp;</td>
								</tr>
								
								<% boolean even = true;%>
								<rsc:iterator list="<%=contests%>" id="resultRow">
								
									<tr><td class="space" colspan="7">&nbsp;</td></tr>
									
									<tr class="<%=even?"light":"dark"%>">
										<td class="valueE"><a href="/?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">${resultRow.map['name']}</a></td>
										<td class="value" nowrap="nowrap">${resultRow.map['contest_status_desc']}</td>
										<td class="valueC" nowrap="nowrap">
											<tc-webtag:format object="${resultRow.map['start_time']}" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
										</td>
                                        <td class="valueC" nowrap="nowrap">
                                            <tc-webtag:format object="${resultRow.map['milestone_date']}" ifNull="-" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                        </td>
                                        <td class="valueC" nowrap="nowrap">
                                            <tc-webtag:format object="${resultRow.map['end_time']}" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                                        </td>
										<td class="valueC">
											<a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">${resultRow.map['submission_count']}</a>
										</td>
										<td class="valueW">
											<a href="${sessionInfo.servletPath}?module=ViewContest&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">edit</a>
										</td>
									</tr>
									<% even = !even;%>
								</rsc:iterator>
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

        <jsp:include page="../foot.jsp"/>


</body>
</html>
