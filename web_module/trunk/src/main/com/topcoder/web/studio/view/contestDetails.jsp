<%--
  - Author: pulky
  - Version: 1.2
  - Copyright (C) 2001 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents specific contest details
  -
  - Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) changes:
  -     - If the contest is a multi-round contest, display multi-round specific "Studio Tournament Format" information.
  -       including total prize purse, round 1 and round 2 information.
  -     - If the contest is a multi-round contest display "Milestone date" between the Start Date and End Date.
  -     - If the contest is a multi-round contest display the milestone prize amount below the standard prize list.
  - Version 1.2 (BUGR-2890) changes:
  -     - If the user has cockpit permissions, show downloads section.
  - Version 1.3 (Studio Electronic Assignment Document Assembly version 1.0) changes:
  -     - Change the 3 steps to 2 steps.  
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>
<c:set var="isMultiRound" value="${not empty contest.multiRound and contest.multiRound}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
	<link href="/css/popup/modalPopup.css" type="text/css"  rel="stylesheet" />		
	<link href="/css/style.css" type="text/css"  rel="stylesheet" />		
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Contest Details</title>
        <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
	
	<script src="/js/jquery-1.4.2.min.js" type="text/javascript"></script>
	<script src="/js/jquery.tools.min.js" type="text/javascript"></script>
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
		$("#milestoneBtn").overlay({
				closeOnClick:false,
				mask: {
					color: '#FFFFFF',
					loadSpeed: 200,
					opacity: 0.7
				},
				close :".closePopup",
				fixed : false,
				target : $("#milestonePopup")
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
<br />



<h1>Contest Details</h1>

<%-- RIGHT BOX --%>

<div class="conDetRightBox">
<br />

<div style="float: right; width: 135px; height: 50px">
	<c:choose>
		<c:when test="${canViewMilestone}">
			<a href="javascript:void(0)" id="milestoneBtn"></a>
		</c:when>
		<c:otherwise>
			<img src='/i/milestone_btn_deactive.png' alt ="View Milestone"></a>
		</c:otherwise>
	</c:choose>
</div>

    <%-- Visit Contest Forum Button --%>
    <studio:forumLink forumID="${contest.forumId}" message="<img src='/i/v2/interface/btnContestForum.png' alt='Visit Contest Forum' />"/>

    <br /><br />

    <div style="float: right; width: 135px;">
            <c:choose>
                <c:when test="${not empty contest.results}">
            <a href="${sessionInfo.servletPath}?module=ViewContestResults&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src='/i/v4/btnSeeWinners.png' alt='See the Winners' /></a>
                </c:when>
              <c:otherwise>
            <img src='/i/v4/btnSeeWinnersDisabled.png' alt='See the Winners' />
                </c:otherwise>
            </c:choose>
    </div>

    <c:choose>
        <c:when test="${currentTime>contest.endTime}">
            <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}"><img src='/i/v4/btnViewSubmissions.png' alt='View Submissions' /></a>
        </c:when>
        <c:otherwise>
            <img src='/i/v4/btnViewSubmissionsDisabled.png' alt='View Submissions' />
        </c:otherwise>
    </c:choose>

    <br /><br />

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
            <c:if test="${isMultiRound and not empty contest.multiRoundInformation
                and not empty contest.multiRoundInformation.milestoneDate}">
                <tr>
                    <td class="field">
                        Milestone <br/>Date:
                    </td>
                    <td class="value">
                        <tc-webtag:format object="${contest.multiRoundInformation.milestoneDate}"
                        format="EEEE, MMMM d, yyyy '<br />at' HH:mm z" timeZone="${sessionInfo.timezone}"/>
                    </td>
                </tr>
            </c:if>
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

                <c:when test="${currentTime>contest.endTime }">
                        <p>
                            <strong>Since this contest has ended all attached files are no longer available for viewing</strong>
                        </p>
                </c:when>
                <c:when test="${registered || (not empty has_cockpit_permissions && has_cockpit_permissions)}">
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

           <%--     <c:when test="${registered || currentTime>contest.endTime}">
                    <c:forEach items="${contest.documents}" var="document">
                        <p>
                            <strong><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">${document.originalFileName}</a></strong>
                            <br /><em>${document.type.description}</em>
                            <c:if test="${not empty document.description}">
                                <br />${document.description}
                            </c:if>
                        </p>
              </c:forEach>
                </c:when>  --%>
                <c:otherwise>
                    <p align="center" class="bigRed">
                        You must register for the contest<br />to download any attached files.<br /><br />
                        <a href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}" onfocus="this.blur();"><img src="/i/v2/interface/btnRegister.png" alt="Register" style="margin: 6px 0px 6px 0px;"/></a>
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
        1. Look for instructions in this contest regarding what files to provide. Questions? Ask in the forum for this contest.<br/>
        2. Place your submission files into a "Submission.zip" file.<br/>
        3. Place all of your source files into a "Source.zip" file.<br/>
        4. Create a JPG preview file.<br/>
        5. Click "Submit" and upload your files.<br/>
        <br/>
        Trouble formatting your submission or want to learn more? <a
            href="http://topcoder.com/home/studio/the-process/how-to-submit-to-a-contest/">Read this
        FAQs</a><br/>
        <br/>
        <b>Note:</b> All non-standard Windows fonts must be listed in a text file within your submission folder. Include
        the name of the font and a link to where it can be downloaded/purchased. DO NOT include any font files in your
        submission or source files.
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

<div class="contentDetails">
    <table cellspacing="0" cellpadding="0" class="conDetIntro">
    <tbody>
        <tr>
            <td class="field">Contest Title:</td>
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
                                <td class="field">${prize.place} Place:</td>
                                <td class="value"><fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        <c:if test="${isMultiRound and not empty contest.milestonePrize
            and not empty contest.milestonePrize.numberOfSubmissions and not empty contest.milestonePrize.amount}">
            <tr>
                <td class="field">Milestone:</td>
                <td class="value">
                    ${contest.milestonePrize.numberOfSubmissions} milestone bonuses worth
                    <fmt:formatNumber value="${contest.milestonePrize.amount}" pattern="$###,###.00"/> each.
                </td>
            </tr>
        </c:if>
        <c:if test="${fn:length(contest.digitalRunPoints.value)>0 and contest.digitalRunPoints.value != '0'}">
            <tr>
                <td class="field">Studio Cup Points:<br /><br /></td>
                <td class="value">${contest.digitalRunPoints.value}</td>
            </tr>
        </c:if>
    </tbody>
</table>

<c:if test="${currentTime<=contest.endTime && currentTime>=contest.startTime}">
	<div class=header><span>How to Compete</span></div>
	<c:choose>
		<c:when test="${registered}">
			<%-- REGISTERED --%>
				<a id="button-register-contest" href="javascript:;" class="disabled" title="Register for this contest"></a>
				<a id="button-submit-entries" href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" title="Submit your entries"></a>
				<a id="button-view-submissions" href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" title="View your submissions"></a>
		</c:when>
		<c:otherwise>
			<%-- UNREGISTERED --%>
				<a id="button-register-contest" href="${sessionInfo.servletPath}?module=ViewRegistration&amp;<%=Constants.CONTEST_ID%>=${contest.id}" title="Register for this contest"></a>
				<a id="button-submit-entries" class="disabled" href="javascript:;" title="Submit your entries"></a>
				<a id="button-view-submissions" class="disabled" href="javascript:;" title="View your submissions"></a>
		</c:otherwise>
	</c:choose>
</c:if>

<br/><br/>
<font color="#ff7600"><b>Have questions about how to compete? <a href="http://topcoder.com/home/studio/the-process/">Learn more here!</a></b></font>

 <%-- Contest Summary --%>
<div class="header"><span>Contest Summary</span></div>
<studio:formatField text="${contest.overview.value}"/>

<p><b>Entries must be your original work, and must not infringe on the copyright or licenses of others. Stock art, clip art, templates and other design elements from other sources are prohibited unless specifically permitted here in the Contest Details.</b></p>

 <%-- Full Description and Project Guide --%>
<c:if test="${not empty contest.fullDescription.value or isMultiRound}">
    <div class="header"><span>Full Description &amp; Project Guide</span></div>
    <c:if test="${isMultiRound and not empty contest.multiRoundInformation
        and not empty contest.milestonePrize and not empty contest.multiRoundInformation.roundOneIntroduction
        and not empty contest.multiRoundInformation.roundTwoIntroduction}">
        <span class="subSection">Studio Tournament Format</span><br/>
        This Studio competition will be run as a two-round tournament with a total prize purse of
        <fmt:formatNumber value="${contest.totalPrizePurse}" pattern="$###,###.00"/>.
        <br/><br/>
        <span class="subSectionTitle">Round One (1)</span><br/>
        <studio:formatField text="${contest.multiRoundInformation.roundOneIntroduction}"/>
        <br/><br/>
        <span class="subSectionTitle">Round Two (2)</span><br/>
        <studio:formatField text="${contest.multiRoundInformation.roundTwoIntroduction}"/>
        <br/>
        <br>

        <font color="#ff7600">Please read the contest specification carefully and watch the forums for any questions or feedback concerning this contest. It is important that you monitor any updates provided by the client or Studio Admins in the forums. Please post any questions you might have for the client in the forums.<br><br>
        <b>Regarding the Rounds:</b><br><br>
        <ul>
            <li>To be eligible for Round 1 prizes and design feedback, you must submit before the Milestone deadline.</li>
            <li>The contest holder will announce Round 1 winners and provide design feedback to those winners in the forum after the milestone deadline. </li>
            <li>You must submit to Round 1 to be eligible to compete in Round 2. If your submission fails screening for a small mistake in Round 1, you may still submit to Round 2.</li></font>
        </ul>

    </c:if>
    <c:if test="${not empty contest.fullDescription.value}">
        <p>
        <studio:formatField text="${contest.fullDescription.value}"/>
        </p>
    </c:if>
</c:if>

<c:if test="${not empty contest.sizeRequirements.value or not empty contest.fontRequirements.value
             or not empty contest.colorRequirements.value or not empty contest.contentRequirements.value
             or not empty contest.otherRequirements.value}">

 <%-- Specific Contest Details --%>
<div class="header"><span>Specific Contest Details</span></div>
<div id="specific-details">
    <table cellpadding="0" cellspacing="10" border="0">
        <tbody>
            <c:if test="${not empty contest.sizeRequirements.value}">
            <tr>
                <td nowrap="nowrap" valign="top"><strong>Size:</strong></td>
                <td><studio:formatField text="${contest.sizeRequirements.value}"/></td>
            </tr>
            </c:if>
            <c:if test="${not empty contest.fontRequirements.value}">
            <tr>
                <td nowrap="nowrap" valign="top"><strong>Font:</strong></td>
                <td><studio:formatField text="${contest.fontRequirements.value}"/></td>
            </tr>
            </c:if>
            <c:if test="${not empty contest.colorRequirements.value}">
            <tr>
                <td nowrap="nowrap" valign="top"> <strong>Color:</strong></td>
                <td><studio:formatField text="${contest.colorRequirements.value}"/></td>
            </tr>
            </c:if>
            <c:if test="${not empty contest.contentRequirements.value}">
            <tr>
                <td nowrap="nowrap" valign="top"><strong>Content:</strong></td>
                <td><studio:formatField text="${contest.contentRequirements.value}"/></td>
            </tr>
            </c:if>
            <c:if test="${not empty contest.otherRequirements.value}">
            <tr>
                <td nowrap="nowrap" valign="top"><strong>Other:</strong></td>
                <td><studio:formatField text="${contest.otherRequirements.value}"/></td>
            </tr>
            </c:if>
        </tbody>
    </table>
</div>
</c:if>

<%-- How to Submit --%>
<div class="header"><span>How to Submit</span></div>
<div id="how-to">
    <ul>
        <li>New to Studio? <A href="http://topcoder.com/home/studio/new-member-guide/">Learn how to compete here</a>.
        </li>
        <li>Upload your submission in three parts (<A href="http://topcoder.com/home/studio/the-process/how-to-submit-to-a-contest/">see this FAQs for more information</a>). Your design should be finalized and should contain only a single design concept (do not include multiple designs in a single submission).
        </li>
        <li>If your submission wins, your source files must be correct and "<a href="http://topcoder.com/home/studio/the-process/final-fixes/ ">Final Fixes</a>" (if applicable) must be completed before payment can be released.
        </li>
        <li>You may submit as many times as you'd like during the submission phase, but only the number of files listed above in the Submission Limit that you rank the highest will be considered. You can change the order of your submissions at any time during the submission phase. If you make revisions to your design, please delete submissions you are replacing.</li>

    </ul>
</div>

<%-- Winner Selection (BUGR-3818) --%>
<div class="header"><span>Winner Selection</span></div>
<div id="winner-selection">
Submissions are viewable to the client as they are entered into the contest. Winners are selected by the client and are chosen solely at the Client's discretion.
</div>

<%-- Winner Prize (BUGR-3818) --%>
<div class="header"><span>Payment</span></div>
<div id="payment">
The payment will be distributed in one full installment once the final version of the winning submission has been downloaded by the client. Any and all applicable taxes on prizes are the sole responsibility of the prizewinner(s).
</div>

<%-- Eligibility (BUGR-3818) --%>
<div class="header"><span>Eligibility</span></div>
<div id="eligibility">
You must be a TopCoder Studio member, at least 18 years of age, meeting all of the membership requirements. In addition, you must fit into one of the following categories. If you reside in the United States, you must be either:
	<ul>
		<li>A US Citizen</li>
		<li>A Lawful Permanent Resident of the US</li>
		<li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card permitting unrestricted employment in the U.S.</li>
	</ul>
<br>
If you do not reside in the United States:
	<ul>
		<li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)</li>
	</ul>
</div>

<%--
<c:choose>
<c:when test="${contest.id==2048}"></c:when>
<c:otherwise>
<p>If you do not reside in the United States:</p>
<ul>
    <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you will not need to do anything to become authorized)
    </li>
    </c:otherwise>
    </c:choose>
</ul>
--%>

<br clear="all"/>
</div>

</div>

<div class="contentBottom"></div>
</div>
</div>
</div>

<jsp:include page="foot.jsp"/>

<div id="milestonePopup">
    <div class="popupMask">
        <div class="popupContent">
             <h1>Milestone Feedback</h1>
             <div class="toForum">Have a question about your individual feedback? Post in the contest <studio:forumLink forumID="${contest.forumId}" message="forum" />! You may also find general feedback from the contest holder for all competitors in the <studio:forumLink forumID="${contest.forumId}" message="forum" />, so be sure to follow it closely.</div>
             <dl class="winners">
                 <dt>Milestone Winners</dt>
                 <dd>
					<c:forEach items="${milestoneSubmissionId}" var="prize">
						<div>${prize}</div>
					</c:forEach>
                 </dd>
             </dl>
             <dl class="overall">
                 <dt>Overall Milestone Round Feedback</dt>
                 <dd>
                    Please see general feeback in the <studio:forumLink forumID="${contest.forumId}" message="forum" />.         
                 </dd>
              </dl>
              <dl class="review">
			    <c:forEach var="item" items="${milestoneSubmissionFeedback}">
					<dt>Design Review - Submission ${item.key}</dt>
					<dd>
					${item.value}
					</dd>
				</c:forEach>

              </dl>
            <a class="closePopup" href="javascript:void(0)">Close</a> 
        </div>
    </div>
</div>


</body>
</html>
