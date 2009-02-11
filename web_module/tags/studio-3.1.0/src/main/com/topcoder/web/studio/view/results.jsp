<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<% ResultSetContainer results = (ResultSetContainer) request.getAttribute("results");%>

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
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests">Past Contests</a> &gt;
    ${contest.name}
</div>

<h1>Winners</h1>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr><td class="title" colspan="9">Winners</td></tr><tr>
    <td class="headerW">
        <div>&nbsp;</div>
    </td>
    <td class="headerC" width="1%">
        Place
    </td>
    <td class="header">
        Handle
    </td>
    <td class="headerC">
        Registered
    </td>
    <td class="headerC">
        Submitted
    </td>
    <td class="headerR">
        Prize
    </td>
    <td class="headerR">
        Score
    </td>
    <td class="headerC">
        Submission
    </td>
    <td class="headerE">
        <div>&nbsp;</div>
    </td>
</tr>


<% boolean even = true;
    int i = 0; %>


<c:set var="bonusPrize" value="<%=PrizeType.BONUS%>"/>
<rsc:iterator list="<%=results%>" id="resultRow">
    <tr><td class="space" colspan="9">&nbsp;</td></tr>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW">
            <div>&nbsp;</div>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${bonusPrize==resultRow.map['prize_type_id']}">
                    Client <br /> Selection
                </c:when>
                <c:otherwise>
                    <rsc:item name="placed" row="<%=resultRow%>"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="value">
            <studio:handle coderId="<%=resultRow.getLongItem("submitter_id")%>"/>
        </td>
        <td class="valueC">
            <rsc:item name="reg_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueC">
            <rsc:item name="submit_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueR">
            <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
        </td>
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
        <td class="valueC">
            <c:choose>
                <c:when test="${resultRow.map['show_submissions']}">
                    <studio_tags:submissionLink row="${resultRow}"/>
                </c:when>
                <c:otherwise>
                    <img src="/i/v2/interface/magnifyFade.png" alt="" />
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueE">
            <div>&nbsp;</div>
        </td>
    </tr>
    <% even = !even;
        i++; %>
</rsc:iterator>
<tr>
    <td class="btnRight" colspan="9"><div><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="small">...view all submissions</a></div></td>
</tr>

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
