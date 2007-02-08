<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="top.jsp"/>

<jsp:include page="primaryNav.jsp">
<jsp:param name="selectedTab" value="competitions"/>
</jsp:include>

<div id="main">
    <div class="pageHeader">
        <span class="pageName">Competition Details</span>
    </div>


    <div class="linkBox">
        <csf:forumLink forumID="${contest.forumId}"/>
    </div>

    <div class="breadcrumb">
        <A href="/?module=Static&amp;d1=competitions">Competitions</A>
        <c:choose>
            <c:when test="${currentTime>contest.endTime}">
                > <A href="${sessionInfo.servletPath}?module=ViewPastContests">Past Creative Competitions</A>
            </c:when>
            <c:otherwise>
                > <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Creative Competitions</A>
            </c:otherwise>
        </c:choose>
        > ${contest.name}
    </div>

<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
<div align="center">
<table class="bodyText" style="margin-top: 20px; margin-bottom: 20px; width: 320px;" cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td width="100%">
            <div class="bigRed" style="border-top: 1px solid rgb(153, 153, 153); border-bottom: 1px solid rgb(153, 153, 153);">
<c:choose>
    <c:when test="${fn:length(contest.prizes)==1}">
        <c:forEach items="${contest.prizes}" var="prize">
            <div style="float: right; text-align: right;">
            <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/><br>
            <tc-webtag:format object="${contest.endTime}" format="MM.dd.yyyy" timeZone="${sessionInfo.timezone}"/>
            </div>
            <strong>
            Winner:<br>
            Due date:
            </strong> 
        </c:forEach>
    </c:when>
    <c:otherwise>
        <% int i = 1;%>
        <c:forEach items="${contest.prizes}" var="prize">
            <div style="float: right; clear: right; text-align: right;">
            <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/><br>
            </div>
            <strong>Prize <%=i++%>:</strong><br>
        </c:forEach>
            <div style="float: right; clear: right; text-align: right;">
            <tc-webtag:format object="${contest.endTime}" format="MM.dd.yyyy" timeZone="${sessionInfo.timezone}"/>
            </div>
            <strong>Due date:</strong>
    </c:otherwise>
</c:choose>
            </div>
        </td>
<c:choose>
<c:when test="${registered}">
        <td style="padding: 10px 5px 10px 20px;" align="right">
        <div class="buttonIsOff" style="width: 60px;">Register</a>
        </td>
        <td style="padding: 10px 0px 10px 5px;" align="right">
            <a class="button" style="width: 60px;" href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Submit</a>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 10px;" align="center">
        You are registered for this project.<br>
        </td>
</c:when>
<c:otherwise>
        <td style="padding: 10px 5px 10px 20px;" align="right">
        <a class="button" style="width: 60px;" href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Register</a>
        </td>
        <td style="padding: 10px 0px 10px 5px;" align="right">
        <div class="buttonIsOff" style="width: 60px;">Submit</a>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="padding-top: 10px;" align="center">
        Register to get info necessary to submit a solution<br>
        </td>
</c:otherwise>
</c:choose>

    </tr>
</tbody>
</table>
</div>
</c:if>

<h2>Project Overview</h2>
${contest.overview.value}
<br><br>


<c:if test="${registered}">
    <c:if test="${fn:length(contest.documents)>0}">
        <strong>Documentation</strong><br>
        <c:forEach items="${contest.documents}" var="document">
            ${document.type.description}:
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                    ${document.originalFileName}</a> <br/>
        </c:forEach>
        <br><br>
    </c:if>
</c:if>


<h2>Payment</h2>
${contest.prizeDescription.value}
<br><br>

<c:choose>
    <c:when test="${fn:length(contest.prizes)==1}">
        <c:forEach items="${contest.prizes}" var="prize">
            <strong>Winning Designer:
                <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
            </strong>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <% int i = 1;%>
        <c:forEach items="${contest.prizes}" var="prize">
            <strong>Prize <%=i++%>:
                <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
            </strong>
            <br>
        </c:forEach>
    </c:otherwise>
</c:choose>


<h2>Eligibility</h2>

<p>You must be a Microsoft Connected Services Sandbox (<a href="http://www.networkmashups.com" target="blank">www.networkmashups.com</a>) member, at least 18 years of age, meeting all of the membership requirements.
    In addition, you must fit into one of the following categories.
</p>

<p>If you reside in the United States, you must be either:</p>
<ul>
    <li>You must be authorized to perform work in your country of residence.</li>
</ul>

<p>Employees of Microsoft Corporation ("Microsoft"), British Telecom ("BT") and TopCoder, Inc. ("TopCoder"), their affiliated
    companies, advertising and promotion agencies and immediate family members of each are not eligible. All federal,
    state and local laws and regulations apply. Void where prohibited.</p> 


<h2>Timeline</h2>
All submissions are required to be submitted by the End Date.
<br><br>


<div align="center">
    <table cellpadding="4" cellspacing="0" width="250">
        <tbody>
            <tr>
                <td valign="top" nowrap="nowrap"><strong>Start Date:</strong></td>
                <td>
                    <tc-webtag:format object="${contest.startTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
            <tr>
                <td valign="top" nowrap="nowrap"><strong>End Date:</strong></td>
                <td>
                    <tc-webtag:format object="${contest.endTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
            </tr>
        </tbody>
    </table>
</div>

</div>
    
<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>