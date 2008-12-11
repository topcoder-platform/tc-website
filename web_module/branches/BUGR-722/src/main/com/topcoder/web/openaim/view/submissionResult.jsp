<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="openaim_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<% ResultSetContainer reviews = (ResultSetContainer) ((Map) request.getAttribute("submission_results")).get("reviews");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>
    
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="tcTop.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div class="linkBox"><openaim:forumLink forumID="${submission.contest.forumId}"/></div>
                
                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewPastContests">Past Contests</a> &gt;
                    ${submission.contest.name}
                </div>

                <h1>Scores</h1>

<div align="center" style="font-size: 32px; font-weight: bold;">
    <tc-webtag:handle coderId="${submission.submitter.id}"/>
</div>

<div align="center" style="margin-bottom: 10px; font-weight: bold;">
    Submission ID: ${submission.id}
</div>

<div align="center" style="margin-bottom: 20px;">
    <div style="overflow: hidden; width: 300px;">
        <c:choose>
            <c:when test="${submission.contest.viewableSubmissions.value}">
                <c:choose>
                    <c:when test="${submission.mimeType.fileType.imageFile}">
                        <openaim_tags:submissionDisplay submissionId="${submission.id}" width="${submission.width}" height="${submission.height}"/>
                    </c:when>
                    <c:otherwise>
                        <div id="popIt" class="popUp"><div>View submission</div></div>
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">
                            <img src="/i/events/openaim/interface/magnify.png" alt="" onmouseover="popUp(this,'popIt')" onmouseout="popHide()"/>
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <img src="/i/events/openaim/interface/magnifyFade.png" alt="" />
            </c:otherwise>
        </c:choose>

    </div>
</div>
   
<div align="center" style="margin-bottom: 100px;">
<table style="width: 700px;" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td colspan="4" align="center" style="border-bottom: 1px solid #999999; font-weight: bold;">
            Reviewers & Scores
        </td>
    </tr>
    <tr>
        <rsc:iterator list="<%=reviews%>" id="resultRow">
            <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
                <tc-webtag:handle coderId="${resultRow.map['reviewer_id']}"/>
            </td>
        </rsc:iterator>
        <td width="25%" align="center" style="font-size: 18px; font-weight: bold;">
            Final score
        </td>
    </tr>
    <tr>
        <rsc:iterator list="<%=reviews%>" id="resultRow">
            <td align="center" style="font-size: 36px; font-weight: bold;">
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewReview.do?method=viewReview&amp;rid=${resultRow.map['review_id']}">
                <fmt:formatNumber value="${resultRow.map['score']}" pattern="0.00"/>
                </a>
            </td>
        </rsc:iterator>
        <td align="center" style="font-size: 36px; font-weight: bold;">
            <fmt:formatNumber value="${submission.result.finalScore}" pattern="0.00"/>
        </td>
    </tr>
</tbody>
</table>
</div>

<div align="center">
    Click scores to view the corresponding scorecards via
    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review"><img src="/i/tcorLogo.png" alt="TopCoder Online Review" style="display: block; margin: 3px;" /></a>
</div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="tcFoot.jsp"/>

    </div>
</body>
</html>