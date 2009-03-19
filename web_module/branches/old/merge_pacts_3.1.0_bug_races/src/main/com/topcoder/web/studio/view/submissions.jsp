<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestProperty" %>
<%@ page import="com.topcoder.web.studio.model.ReviewStatus" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>

<c:set value="<%=ContestProperty.VIEWABLE_SUBMITTERS%>" var="viewSubmitters"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>
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

    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
    <script type="text/javascript"><!--
    function next() {
    <%--we're using sublist on the back end, so we need to work with 0 based indexes rather than 1 --%>
        var myForm = document.submissionsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        myForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE*2%>;
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${contest.configMap[viewSubmitters]}">
        myForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        myForm.submit();
    }
    function previous() {
        var myForm = document.submissionsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1-Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        myForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-1%>;
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${contest.configMap[viewSubmitters]}">
        myForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        myForm.submit();
    }
    //--></script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp"/>
        <br />
            
        <!-- container -->
        <div id="container">
        	<div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

					<div class="linkBox">
						<studio:forumLink forumID="${contest.forumId}"/>
					</div>
					
					<div class="breadcrumb">
						<c:choose>
							<c:when test="${isOver}">
								<a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a> &gt;
							</c:when>
							<c:otherwise>
								<a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a> &gt;
							</c:otherwise>
						</c:choose>
						${contest.name}
					</div>
					<br />
					
					<h1>Submissions</h1>
					
					<form name="submissionsForm" method="get" action="${sessionInfo.servletPath}">
					<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewSubmissions"/>
					<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
					<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
					<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
					<input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
					<input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
					<c:if test="${contest.configMap[viewSubmitters]}">
						You can enter a handle here to see only submissions by that competitor:
						<tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
						<button name="handleSubmit" value="submit" type="submit">Submit</button>
					</c:if>
					
					
					<div class="pagingBox">
						<%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
						| <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
					</div>
					
					<div class="statHolder">
						<div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
						<div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
						<div class="container">
							<table class="stat" cellpadding="0" cellspacing="0" width="100%">
								<tbody>
								<!---    <c:choose>
										<c:when test="${contest.configMap[viewSubmitters]}">
											<tr><td class="title" colspan="7">Submissions</td></tr>
										</c:when>
										<c:otherwise>
											<tr><td class="title" colspan="6">Submissions</td></tr>
										</c:otherwise>
									</c:choose>  -->
								<tr>
						
						<% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
						<c:if test="${contest.configMap[viewSubmitters]}">
							<td class="header">
								<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
									Handle</a>
							</td>
						</c:if>
						<td class="headerC" nowrap="nowrap" width="50%">
							<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_id")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
								Submission ID</a>
						</td>
						<td class="headerC" nowrap="nowrap" width="50%">
							<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("create_date")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
								Submitted</a>
						</td>
						<td class="headerR">
							<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("final_score")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Score</a>
						</td>
						<td class="headerC">
							Submission
						</td>
						
					</tr>
					<c:set value="<%=ReviewStatus.PASSED%>" var="passed"/>
					
					<%int colspan=5; %>
					<c:choose>
						  <c:when test="${contest.configMap[viewSubmitters]}">
							<% colspan=5; %>
						  </c:when>
						  <c:otherwise>
							<% colspan=4; %>
						  </c:otherwise>
					</c:choose>
								
					<c:choose>
						<c:when test="${contest.status.id==11}">
					   <!--         <tr><td class="space" colspan="<%=colspan%>">&nbsp;</td></tr>  -->
								 <tr class="light" colspan="<%=colspan%>">
									
									<td colspan="<%=colspan-2%>">
										<p class="note_title">
										This contest has been abandoned
										</p><p class="note_text">
										When a contest is abandoned, the client has made no effort to complete their responsibility 
										toward the competition. This includes choosing winners, communication with TopCoder Studio and 
										other obligations. This inaction reflects very poorly on the client with any future contests 
										and their standing within the community and our company.</p>
									</td>
									
								</tr>
						</c:when>
						<c:when test="${contest.status.id==10}">
					  <!--          <tr><td class="space" colspan="<%=colspan%>">&nbsp;</td></tr> -->
								 <tr class="light" colspan="<%=colspan%>">
									
									<td colspan="<%=colspan-2%>">
										<p class="note_title">
										No winners have been chosen
										</p><p class="note_text">
										The client has decided not to choose any winners for this competition. Please refer to the forums
										for further details. 
										Thank you for participating in this and all Studio contests.</p>
									</td>
									
								</tr>
						</c:when>
						<c:otherwise>
					<% boolean even = true;
						int i = 0; %>
					<rsc:iterator list="<%=submissions%>" id="resultRow">
						<c:choose>
							<c:when test="${contest.configMap[viewSubmitters]}">
					 <!--           <tr><td class="space" colspan="7">&nbsp;</td></tr>  -->
							</c:when>
							<c:otherwise>
					<!--            <tr><td class="space" colspan="6">&nbsp;</td></tr>  -->
							</c:otherwise>
						</c:choose>
						<tr><td class="space" colspan="4">&nbsp;</td></tr>
						<tr class="<%=even?"light":"dark"%>">
							
							<c:if test="${contest.configMap[viewSubmitters]}">
								<td class="valueE">
									<studio:handle coderId="<%=resultRow.getLongItem("user_id")%>"/>
								</td>
							</c:if>
							<td class="valueE valueC">
								<rsc:item name="submission_id" row="<%=resultRow%>"/>
							</td>
							<td class="valueC" nowrap="nowrap">
								<rsc:item name="create_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
							</td>


							<c:choose>
								<c:when test="${resultRow.map['review_status_id']==passed}">
									<td class="valueR">
										<c:choose>
											<c:when test="${hasScores}">
												<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissionResults&amp;<%=Constants.SUBMISSION_ID%>=${resultRow.map['submission_id']}">
													<rsc:item name="final_score" row="<%=resultRow%>" format="0.00"/>
												</a>
											</c:when>
											<c:otherwise>
												n/a
											</c:otherwise>
										</c:choose>
									</td>
									<td class="valueC valueW">
										<studio_tags:submissionLink row="${resultRow}"/>
									</td>
								</c:when>
								<c:otherwise>
									<td class="valueR">
										&nbsp;
									</td>
									<td class="valueC valueW">
										<a href="#" class="noLink">
											<img src="/i/layout/fail.png" alt="" />
											<span>Failed screening</span>
										</a>
									</td>
					
								</c:otherwise>
							</c:choose>
						</tr>
						<% even = !even;
							i++; %>
					</rsc:iterator>
					
						</c:otherwise>
					</c:choose>
					
					</tbody>
					</table>
						</div>
						<div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
						<div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
					</div>

					<div class="pagingBox">
						<%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
						| <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
					</div>


					</form>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
