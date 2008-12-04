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
                        Winner(s)<br />Announced:
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
    <c:choose>
        <c:when test="${fn:length(contest.documents)>0}">
            <c:choose>
                <c:when test="${registered || currentTime>contest.endTime}">
                    <c:forEach items="${contest.documents}" var="document">
                        <p>
                            <strong><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">${document.originalFileName}</a></strong>
                            <br /><em>${document.type.description}</em>
                            <c:if test="${not empty document.description}">
                                <br />${document.description}
                            </c:if>
                        </p>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p align="center" class="bigRed">
                        You must register for the contest<br />to download any attached files.
                    </p>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <p>
                None
            </p>
        </c:otherwise>
    </c:choose>
</div>
<c:if test="${not empty contest.submissionFileFormat.value}">
    <div class="section">How to Format Your Submission:</div>
    <div class="padder">
        <studio:formatField text="${contest.submissionFileFormat.value}"/>
    </div>
</c:if>

<c:if test="${not empty contest.otherFileTypes.value}">
    <div class="section">Submission File Formats:</div>
    <div class="padder"><p><studio:formatField text="${contest.otherFileTypes.value}"/></p></div>
</c:if>

<c:if test="${fn:length(contest.fileTypes)>0}">
    <div class="section">Source Files:</div>
    <div class="padder">
        <p>
            <c:forEach items="${contest.fileTypes}" var="fileType" varStatus="status">
                <strong>${fileType.description}</strong><c:if test="${not status.last}">,</c:if>
            </c:forEach>
        </p>

        <p align="left">
            You must include all source files with your submission.
        </p>
    </div>
</c:if>

<div class="section">Submission Limit:</div>
<div class="padder">
    <p align="center">
        <c:choose>
            <c:when test="${empty contest.maxSubmissions.value}">
                <strong>Unlimited</strong>
            </c:when>
            <c:when test="${contest.maxSubmissions.value eq 1}">
                <strong>1</strong> submission per competitor
            </c:when>
            <c:otherwise>
                <strong>${contest.maxSubmissions.value}</strong> submissions per competitor
            </c:otherwise>
        </c:choose>

    </p>
</div>
</div>

<table cellspacing="0" cellpadding="0" class="conDetIntro">
    <tbody>
        <tr>
            <td class="field">Contest:</td>
            <td class="value">${contest.name}</td>
        </tr>
        <c:if test="${not empty contest.clientName.value}">
            <tr>
                <td class="field">Client:</td>
                <td class="value">${contest.clientName.value}</td>
            </tr>
        </c:if>
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
        <c:if test="${fn:length(contest.digitalRunPoints.value)>0 and contest.digitalRunPoints.value != '0'}">
            <tr>
                <td class="field">Studio Cup Pts</td>
                <td class="value">${contest.digitalRunPoints.value}</td>
            </tr>
        </c:if>
    </tbody>
</table>

<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
    <div id="conDetInstructionsBox">
        <ul>


            <c:choose>
                <c:when test="${registered}">
                    <%-- REGISTERED --%>
                    <li>
                        <div>
                            <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="icon"><img src="/i/v2/interface/1NA.png" alt="1"/></a>
                            <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="grayedOut">Register
                                for this contest.</a>
                        </div>
                    </li>

                </c:when>
                <c:otherwise>
                    <%-- UNREGISTERED --%>
                    <li>
                        <div>
                            <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="icon"><img src="/i/v2/interface/1.png" alt="1"/></a>
                            <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Register
                                for this contest.</a>
                        </div>
                    </li>
                </c:otherwise>
            </c:choose>


            <c:choose>
                <c:when test="${not empty has_global_ad}">
                    <li>
                        <div>
                            <c:choose>
                                <c:when test="${has_global_ad}">
                                    <a href="/?module=Static&amp;d1=support&amp;d2=assignmentDocFaq" class="icon"><img src="/i/v2/interface/2NA.png" alt="2"/></a>
                                    <a href="/?module=Static&amp;d1=support&amp;d2=assignmentDocFaq" class="grayedOut">Sign
                                        &amp; submit an Assignment Document</a><span class="small grayedOut">(<a href="/?module=AssignmentDocumentHistory" class="grayedOut">Check the status of your AD before continuing</a>)</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="/?module=Static&amp;d1=support&amp;d2=assignmentDocFaq" class="icon"><img src="/i/v2/interface/2.png" alt="2"/></a>
                                    <a href="/?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">Sign & submit an
                                        Assignment Document</a><br /><span class="small grayedOut">(<a href="/?module=AssignmentDocumentHistory" class="grayedOut">Check the status of your AD before continuing</a>)</span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="icon"><img src="/i/v2/interface/3.png" alt="3"/></a>
                            <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Submit
                                your entry.</a>
                        </div>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <div>
                            <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" class="icon"><img src="/i/v2/interface/2.png" alt="2"/></a>
                            <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Submit
                                your entry.</a>
                        </div>
                    </li>
                </c:otherwise>
            </c:choose>

        </ul>
    </div>
</c:if>

<div style="display: block; position: absolute; right: 47px; top: 205px;">
	<!-- ADDTHIS BUTTON BEGIN -->
	<script type="text/javascript">
	addthis_pub             = 'topcoderstudio'; 
	addthis_brand           = 'TopCoder Studio';
	addthis_options         = 'facebook, twitter, google, del.icio.us, stumbleupon, reddit, myspace, favorites, email';
	</script>
	<a href="http://www.addthis.com/bookmark.php" onMouseOver="return addthis_open(this, '', '[URL]', '[TITLE]')" onMouseOut="addthis_close()" onClick="return addthis_sendto()">
	<img src="/i/v2/interface/btnShare.png" width="122" height="35" border="0" alt="Share" /></a>
	<script type="text/javascript" src="http://s7.addthis.com/js/152/addthis_widget.js"></script>
	<!-- ADDTHIS BUTTON END -->
</div>

<div style="display: block; position: absolute; right: 169px; top: 205px;">
	<!-- Visit Contest Forum Button -->
    <studio:forumLink forumID="${contest.forumId}" message="<img src='/i/v2/interface/btnContestForum.png' alt='Visit Contest Forum' />"/>
</div>

<div class="header">Contest Summary</div>
<studio:formatField text="${contest.overview.value}"/>
<br /><br />

<c:if test="${not empty contest.fullDescription.value}">
    <div class="header">Full Description &amp; Project Guide</div>
    <studio:formatField text="${contest.fullDescription.value}"/>
    <br /><br />
</c:if>

<c:if test="${not empty contest.sizeRequirements.value or not empty contest.fontRequirements.value 
             or not empty contest.colorRequirements.value or not empty contest.contentRequirements.value
             or not empty contest.otherRequirements.value}">
    <div class="header">Specific Contest Details</div>
    <table cellpadding="3" cellspacing="0" border="0">
    <tbody>
        <c:if test="${not empty contest.sizeRequirements.value}">
        <tr>
            <td nowrap="nowrap" valign="top">
                <strong>Size:</strong>            </td>
            <td>
                <studio:formatField text="${contest.sizeRequirements.value}"/>
            </td>
        </tr>
        </c:if>
        <c:if test="${not empty contest.fontRequirements.value}">
        <tr>
            <td nowrap="nowrap" valign="top">
                <strong>Font:</strong>            </td>
            <td>
                <studio:formatField text="${contest.fontRequirements.value}"/>
            </td>
        </tr>
        </c:if>
        <c:if test="${not empty contest.colorRequirements.value}">
        <tr>
            <td nowrap="nowrap" valign="top">
                <strong>Color:</strong>            </td>
            <td>
                <studio:formatField text="${contest.colorRequirements.value}"/>
            </td>
        </tr>
        </c:if>
        <c:if test="${not empty contest.contentRequirements.value}">
        <tr>
            <td nowrap="nowrap" valign="top">
                <strong>Content:</strong>            </td>
            <td>
                <studio:formatField text="${contest.contentRequirements.value}"/>
            </td>
        </tr>
        </c:if>
        <c:if test="${not empty contest.otherRequirements.value}">
        <tr>
            <td nowrap="nowrap" valign="top">
                <strong>Other:</strong>            </td>
            <td>
                <studio:formatField text="${contest.otherRequirements.value}"/>
            </td>
        </tr>
        </c:if>
    </tbody>
    </table>
</c:if>

<div class="header">How to Submit</div>
<ul>
    <li>You must upload your submission as a single file (see the file requirements) and it should be finalized, not a
        work in progress.
    </li>
    <li>If your submission wins, your original files must meet the Final Deliverables requirements listed above before
        payment can be released.
    </li>
    <li>You may submit as many times as you'd like during the submission phase, but only the number of files listed
        above in the Required Elements that you rank the highest will be considered. On the submission page, you will
        see a table of all the designs you have submitted, ranked by YOUR preference. You can change the order of
        submissions on that table at any time during the submission phase. If you make revisions to your design, please
        delete submissions you are replacing.
    </li>
</ul>

<c:if test="${not empty contest.winnerSelection.value}">
    <div class="header">Winner Selection</div>
    <studio:formatField text="${contest.winnerSelection.value}"/>
    <br /><br />
</c:if>

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