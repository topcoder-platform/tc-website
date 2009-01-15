<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.sql.Timestamp" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>TopCoder Studio</title>
     <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
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
	
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>
    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />

	<script language="javascript" type="text/javascript">
        <!--
        function changeRank(newRank, submissionId) {
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=UpdateSubmissionRank&<%=Constants.SUBMISSION_RANK%>=' + newRank + '&<%=Constants.SUBMISSION_ID%>=' + submissionId);
            ajaxRequest.setPostRequest(fader);
            ajaxRequest.sendRequest();
        }
        function remove(submissionId) {
            var confirmed = confirm("Are you sure you want to delete this submission?");
            if (confirmed) {
                var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=DeleteSubmission&<%=Constants.SUBMISSION_ID%>=' + submissionId);
                ajaxRequest.sendRequest();
            }
        }
        function fader() {
            Fat.fade_element('fade0');
            Fat.fade_element('fade1');
            Fat.fade_element('fade2');
            Fat.fade_element('fade3');
            Fat.fade_element('fade4');
            Fat.fade_element('fade5');
            Fat.fade_element('fade6');
            Fat.fade_element('fade7');
            Fat.fade_element('fade8');
            Fat.fade_element('fade9');
        }
        function batchUpdate() {
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=BatchUpdateRank&<%=Constants.CONTEST_ID%>=${contest.id}');
        <c:forEach items="${submissions}" var="submission">
            ajaxRequest.addNamedFormElements("<%=Constants.SUBMISSION_ID%>${submission.id}");
        </c:forEach>
            ajaxRequest.sendRequest();
        }

        // -->
    </script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp"/>
        <br/>
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
            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
            &gt; ${contest.name}
        </div>

        <h1>Submission Successfully Uploaded</h1>
<%
    GregorianCalendar gc = new GregorianCalendar(2007, Calendar.JULY, 23);
%>
<c:set value="<%=new Timestamp(gc.getTime().getTime())%>" var="bigStart"/>
<c:set value="<%=ContestChannel.TOPCODER_DIRECT%>" var="TOPCODER_DIRECT_ID"/>

        <div align="center">
            <div align="left" style="width:500px; margin-top: 20px;">
                Your Submission Has Been Uploaded
                <br /><br />
                        <c:choose>
            <c:when test="${contest.startTime > bigStart}">
				<c:choose>
					<c:when test="${contest.channel.id eq TOPCODER_DIRECT_ID}">
					Your submission has been accepted and shown to the client. It still needs to be screened and you will receive another email alerting you to whether your submission has passed or failed screening.	
	                </c:when>
	                <c:otherwise>
					Your submission will be screened after the Submission Phase has ended. If your submission does not pass
	                screening, you will receive an email with a list of any requirements that it failed to meet. 
	                </c:otherwise>
                </c:choose>
	            </c:when>
                <c:otherwise>
                    Please allow at least 24 hours for processing. If your submission does not pass screening, you
                    will receive an
                    email with a list of any requirements that it failed to meet.

                </c:otherwise>
                </c:choose>
                <br /><br />
                Thank you.
                <br /><br />

                <div align="center">
                    <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" onFocus="this.blur();"><img src="/i/v2/interface/btnSubmitAnother.png" alt="submit another" /></a>
                </div>
            </div>
        </div>

        <div style="margin: 40px 0px 20px 0px;">
            <form name="submissionForm" action="#">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="BatchUpdateRank"/>
                <c:choose>
                     <c:when test="${contest.startTime > bigStart}">
                         <div align="center">
                             <strong>In the table below</strong> you can rank your submissions. <br />

                             <c:choose>
                                 <c:when test="${not empty contest.maxSubmissions.value}">
                                     Up to ${contest.maxSubmissions.value} submission<c:if test="${contest.maxSubmissions.value>1}">s</c:if>
                                     will count for this contest.  They will be indicated by
                                     <nobr>this icon <img src="/i/v2/selection.png" alt="Selection" /></nobr>.  Those submissions that do not have the icon will <b>NOT</b> count and
                                     they will neither be screened nor reviewed.
                                     If you make more than ${contest.maxSubmissions.value} submission<c:if test="${contest.maxSubmissions.value>1}">s</c:if>
                                     for this contest, you can rearrange the order of your submissions until the end of the Submission Phase.
                                 </c:when>
                             <c:otherwise>
                                 <nobr>This icon <img src="/i/v2/selection.png" alt="Selection" /></nobr> indicates preferred submissions that will count for
                             this contest.
                             </c:otherwise>
                             </c:choose>

                             </div>
                     </c:when>
                     <c:otherwise>
                         <div align="center">
                             <strong>In the table below</strong> you can rank your submissions.
                             <br /><nobr>This icon <img src="/i/v2/selection.png" alt="Selection" /></nobr> indicates preferred submissions that will count for
                             this contest.
                             <br />Submissions that have <span class="bigRed">Failed</span> can not be ranked, and are automatically moved
                             to the bottom of the page.
                             <br />If one of your preferred submissions fails after the submission phase, the next passing submission will
                             take its place.
                         </div>
                     </c:otherwise>
                 </c:choose>

                <br /><br />
                <div class="statHolder">
                    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
                    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
                    <div class="container">
                        <table class="stat" cellpadding="0" cellspacing="0">
                            <thead>
                                <tr><td class="title" colspan="10">My Favorites</td></tr>
                                <tr>
                                    <td class="headerW">
                                        <div>&nbsp;</div>
                                    </td>
                                    <td class="headerC">
                                        Ranking
                                        <div>
                                            <a href="#" onClick="batchUpdate();return false;"><img src="/i/v2/interface/btnUpdateRanking.png" alt="Update ranking" /></a>
                                        </div>
                                    </td>
                                    <td class="header" colspan="2" width="33%">
                                        Submission
                                    </td>
                                    <td class="headerC" width="33%">
                                        Date Submitted
                                    </td>
                                    <td class="headerC" width="33%">
                                        Passed / Failed
                                    </td>
                                    <td class="headerC" nowrap>
                                        Move Up /<br />Move Down
                                    </td>
                                    <td class="headerC" nowrap>
                                        Move to<br />Top
                                    </td>
                                    <td class="headerC">
                                        Remove
                                    </td>
                                    <td class="headerE">
                                        <div>&nbsp;</div>
                                    </td>
                                </tr>
                            </thead>
                            <tbody id="submissions">
                                <jsp:include page="submitTableBody.jsp"/>
                            </tbody>
                        </table>
                    </div>
                    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
                    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
                </div>
            </form>
            <br /><br />
            <strong>NOTE:</strong> <nobr>this icon <img src="/i/v2/selection.png" alt="Selection" /></nobr> indicates submissions that you have selected to be considered for this contest
        </div>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>
