<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>

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
    <script type="text/javascript" src="/js/arena.js"></script>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
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

<div class="breadcrumb">
    <c:choose>
        <c:when test="${currentTime>contest.endTime}">
            <a href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</a> &gt;
        </c:when>
        <c:otherwise>
            <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a> &gt;
        </c:otherwise>
    </c:choose>
    ${contest.name}
</div>

<div style="float:right;">
    <studio:forumLink forumID="${contest.forumId}" message="<img src='/i/v2/interface/btnContestForum.png' alt='Visit Contest Forum' />"/>
</div>

<h1>Contest Details</h1>

<!-- RIGHT BOX -->

<div class="conDetRightBox">
    <div class="section">Dates:</div>
    <div class="padder">
<table cellpadding="0" cellspacing="0" class="conDetDates">
<tbody>
    <tr>
        <td class="field">
            Start Date:
        </td>
        <td class="value">
            <tc-webtag:format object="${contest.startTime}" format="EEEE, MMMM d, yyyy '<br />at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
    </tr>
    <tr>
        <td class="field">
            End Date:
        </td>
        <td class="value">
            <tc-webtag:format object="${contest.endTime}" format="EEEE, MMMM d, yyyy '<br />at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
    </tr>
    <c:if test="${contest.winnerAnnouncementTime ne null}"> 
    <tr>
        <td class="field">
            Winner(s) Announced:
        </td>
        <td class="value">
            <tc-webtag:format object="${contest.winnerAnnouncementTime}"
                              format="EEEE, MMMM d, yyyy '<br />at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
    </tr>
    </c:if>
</tbody>
</table>
    </div>
    <div class="section">Downloads:</div>
    <div class="padder">
        <%-- CASE 1: DOWNLOADS, USER REGISTERED --%>
<c:if test="${registered || currentTime>contest.endTime}">
    <c:if test="${fn:length(contest.documents)>0}">
        <c:forEach items="${contest.documents}" var="document">
        <p>
            <strong>${document.type.description}:</strong>
            <br /><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">${document.originalFileName}</a>
        </p>
        </c:forEach>
    </c:if>
</c:if>
        <%-- CASE 2: DOWNLOADS, BUT USER NOT REGISTERED 
        <p align="center" class="bigRed">
            You must register for the contest<br />to download any attached files.
        </p>
        --%>
        <%-- CASE 3: NO DOWNLOADS
        <p>
            None
        </p>
        --%>
        
    </div>
    <div class="section">Submission File Format(s):</div>
    <div class="padder">
        <studio:formatField text="${contest.submissionFileFormat.value}"/>
    </div>

    <c:if test="${not empty contest.otherFileTypes.value}">
        <div class="section">Other File Types:</div>
        <div class="padder"><p align="center"><studio:formatField text="${contest.otherFileTypes.value}"/></p></div>
    </c:if>

    <div class="section">Submission Limit:</div>
    <div class="padder">
        <p align="center"><strong>1</strong> submission</p>
    </div>
</div>

<table cellspacing="0" cellpadding="0" class="conDetIntro">
<tbody>
    <tr>
        <td class="field">Contest Name:</td>
        <td class="value">${contest.name}</td>
    </tr>
    <c:if test="${not empty contest.type}">
        <tr>
            <td class="field">Contest Type:</td>
            <td class="value">${contest.type.description}</td>
        </tr>
    </c:if>
    <c:if test="${fn:length(contest.mediums)>0}">
        <tr>
            <td class="field">Design Medium:</td>
            <td class="value">
                <c:forEach items="${contest.mediums}" var="medium">
                    ${medium.description} <br />
                </c:forEach>
            </td>
        </tr>
    </c:if>
<c:choose>
    <c:when test="${fn:length(contest.prizes)==1}">
        <c:forEach items="${contest.prizes}" var="prize">
            <tr>
                <td class="field">Winning Designer:</td>
                <td class="value"><fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/></td>
            </tr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <c:forEach items="${contest.prizes}" var="prize">
            <c:choose>
                <c:when test="${clientPrize==prize.type.id}">
                    <tr>
                        <td class="field">${prize.type.description}:</td>
                        <td class="value"><fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/></td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td class="field">Prize ${prize.place}:</td>
                        <td class="value"><fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/></td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:otherwise>
</c:choose>
</tbody>
</table>

<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
    <c:choose>
    <c:when test="${registered}">
    <div align="center">
        <table cellpadding="10" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <img src="/i/v2/interface/btnRegisterNA.png" alt="Register" />
                </td>
                <td>
                    <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src="/i/v2/interface/btnSubmit.png" alt="Submit" /></a>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    <p align="center">
        You are registered for this project.
    </p>
    </c:when>
    <c:otherwise>
    <div align="center">
        <table cellpadding="10" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src="/i/v2/interface/btnRegister.png" alt="Register" /></a>
                </td>
                <td>
                    <img src="/i/v2/interface/btnSubmitNA.png" alt="Submit" />
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    <p align="center">
        You must register before you can submit.
    </p>
    </c:otherwise>
    </c:choose>
</c:if>

<div class="header">Contest Summary</div>
    <studio:formatField text="${contest.overview.value}"/>
<br /><br />

<div class="header">Full Description & Project Guide</div>
<studio:formatField text="${contest.fullDescription.value}"/>
<br /><br />

<c:if test="${not empty contest.sizeRequirements.value or not empty contest.fontRequirements.value 
             or not empty contest.colorRequirements.value or not empty contest.contentRequirements.value
             or not empty contest.otherRequirements.value}">
<div class="header">Requirements & Restrictions</div>
<ul>
    <c:if test="${not empty contest.sizeRequirements.value}">
    <li>
        <strong>Size Requirements:</strong> <studio:formatField text="${contest.sizeRequirements.value}"/>
    </li>
    </c:if>
    <c:if test="${not empty contest.fontRequirements.value}">
    <li>
        <strong>Font Requirements:</strong> <studio:formatField text="${contest.fontRequirements.value}"/>
    </li>
    </c:if>
    <c:if test="${not empty contest.colorRequirements.value}">
    <li>
        <strong>Color Requirements:</strong> <studio:formatField text="${contest.colorRequirements.value}"/>
    </li>
    </c:if>
    <c:if test="${not empty contest.contentRequirements.value}">
    <li>
        <strong>Content Requirements:</strong> <studio:formatField text="${contest.contentRequirements.value}"/>
    </li>
    </c:if>
    <c:if test="${not empty contest.otherRequirements.value}">
    <li>
        <strong>Other Requirements:</strong> <studio:formatField text="${contest.otherRequirements.value}"/>
    </li>
    </c:if>
</ul>
</c:if>

<div class="header">How to Submit</div>
<ul>
<li>You must upload your submission as a single file (see the file requirements) and it should be finalized, not a work in progress.</li>
<li>If your submission wins, your original files must meet the Final Deliverables requirements listed above before payment can be released.</li>
<li>You may submit as many times as you'd like during the submission phase, but only the number of files listed above in the Required Elements that you rank the highest will be considered.  On the submission page, you will see a table of all the designs you have submitted, ranked by YOUR preference.  You can change the order of submissions on that table at any time during the submission phase. If you make revisions to your design, please delete submissions you are replacing.</li>
</ul>

<div class="header">Winner Selection</div>
    <studio:formatField text="${contest.winnerSelection.value}"/>
<br /><br />

<div class="header">Prize Payment</div>
    ${contest.prizeDescription.value}
<br /><br />

<div class="header">Eligibility</div>
    <studio:formatField text="${contest.eligibility.value}"/>

<%--
<c:choose>
<c:when test="${contest.id==2048}"></c:when>
<c:otherwise>
<p>If you do not reside in the United States:</p>
<ul>
    <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will
        not need to do anything to become authorized)
    </li>
    </c:otherwise>
    </c:choose>
</ul>
--%>

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