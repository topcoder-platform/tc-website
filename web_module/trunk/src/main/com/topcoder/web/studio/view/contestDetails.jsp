<%--
  - Author: pulky, isv, pvmagacho
  - Version: 1.9
  - Copyright (C) 2001 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents specific contest details
  -
  - Version 1.1 (Studio Multi-Rounds Assembly - Studio Contest Details v1.0) changes:
  -     - If the contest is a multi-round contest, display multi-round specific "Studio Tournament Format" information.
  -       including total prize purse, round 1 and round 2 information.
  -     - If the contest is a multi-round contest display "Checkpoint date" between the Start Date and End Date.
  -     - If the contest is a multi-round contest display the checkpoint prize amount below the standard prize list.
  - Version 1.2 (BUGR-2890) changes:
  -     - If the user has cockpit permissions, show downloads section.
  - Version 1.3 (Studio Electronic Assignment Document Assembly version 1.0) changes:
  -     - Change the 3 steps to 2 steps.  
  - Version 1.4 (Studio Contest Detail Pages Assembly version 1.0) changes:
  -     - Applied new L&F
  - Version 1.5 (Re-platforming Studio Release 2 Assembly) changes:
  -     - Updated the logic to use projects from tcs_catalog database.
  - Version 1.6 (Re-platforming Studio Release 4 Assembly) changes:
  -     - Clean up old studio model files
  - Version 1.7 (TopCoder Studio Improvements 1 Assembly) changes:
  -     - Fixed style for How To Submit section
  - Version 1.8 (Release Assembly - TopCoder Studio CCA Integration) change notes:
  -     - Add permission checking for the contest which is CCA enforced.
  - Version 1.9 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly) change notes:
  -     - Added styles related to Final Fix functionalities.
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<fmt:setLocale value="en_US"/>
<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="isMultiRound" value="${not empty contest.checkpointDate}"/>
<c:set var="registered" value="${requestScope.registered}"/>
<c:set var="specReviewer" value="${requestScope.isSpecReviewer}" />
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>

<c:set var="prizesCount" value="${fn:length(contest.prizes)}"/>
<c:set var="drPointsAvailable" value="${contest.digitalRunPoints ne null and contest.digitalRunPoints > 0}"/>
<c:set var="hasCheckpointRoundPrize" value="${isMultiRound and not empty contest.checkpointPrize and not empty contest.checkpointPrize.numberOfSubmissions and not empty contest.checkpointPrize.amount}"/>
<c:set var="placeSuffixes"
       value="<%=new String[] {"st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th"}%>"/>
<c:set var="isFinished" value="${contest.reviewClosed}"/>
<c:set var="isStarted" value="${contest.submissionOpen}"/>
<c:set var="isClosed" value="${contest.submissionClosed}"/>
<c:set var="hasCockpitPermissions" value="${requestScope.has_cockpit_permissions}"/>
<c:set var="spec" value="${contest.studioProjectSpecification}"/>
<c:set var="canSeeCCASection" value="${(registered or not cca) || (not empty hasCockpitPermissions && hasCockpitPermissions) || specReviewer}"/>
<c:if test="${not empty spec.contestDescriptionText}">
    <c:set var="contestDescription" value="${spec.contestDescriptionText}" />
</c:if>
<c:if test="${empty spec.contestDescriptionText}">
    <c:set var="contestDescription" value="${spec.contestDescription}" />
</c:if>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Challenge Details</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_contest_details"/>
    </jsp:include>
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript">
    </script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" type="text/javascript">
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript">
    </script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript">
    </script>
    <script type="text/javascript" src="/js/navigation.js"></script>
    <script src="/js/RSSProcessor.js" type="text/JavaScript">
    </script>
    <script src="/js/AJAXProcessor.js " type="text/JavaScript">
    </script>
    <script type="text/javascript" src="/js/studioContestDetails.js">
    </script>
    <script type="text/javascript" src="/js/studioFinalFix.js">
    </script>
</head>

<body>
<div id="page-wrap">
<div class="studioFF">
<jsp:include page="top.jsp">
    <jsp:param name="section" value="contest"/>
</jsp:include>
<br/>
<div id="wrapper_submission">
<div id="warpperNew">

<jsp:include page="stepBox.jsp"/>

<!--End stepBox-->
<jsp:include page="tabs.jsp">
    <jsp:param name="currentTab" value="d"/>
</jsp:include>

<div class="content">
    <div class="mainColumn">
        <p class="paragraphBox">Entries must be your original work, and must not infringe on the copyright or licenses
            of others. Stock art, clip art, templates and other design elements from other sources are prohibited unless
            specifically permitted here in the Challenge Details.
        </p>

        <%-- CONTEST SUMMARY --%>
        <h5 class="contentTitle">Challenge Summary</h5>

        <p class="paragraph">${spec.contestIntroduction}</p>

        <p class="paragraph1">Please read the challenge specification carefully and watch the forums for any
                    questions or feedback concerning this contest. It is important that you monitor any updates
                    provided by the client or Studio Admins in the forums. Please post any questions you might have for
                    the client in the forums.</p>

        <c:if test="${isMultiRound and not empty contest.checkpointPrize
                          and not empty spec.round1Introduction and not empty spec.round2Introduction}">

                <h5 class="contentTitle">Studio Tournament Format</h5>

                <p class="paragraph">This Studio competition will be run as a two-round tournament with a total prize purse of
                <fmt:formatNumber value="${contest.totalPrizePurse}" pattern="$###,###.00"/>.</p>

                <c:if test="${canSeeCCASection}">
	                <span class="subTitle">Round One (1)</span>
	                <p class="paragraph">${spec.round1Introduction}</p>
	
	                <span class="subTitle">Round Two (2)</span>
	                <p class="paragraph">${spec.round2Introduction}</p>
                </c:if>

                <h6 class="smallTitle red">Regarding the Rounds:</h6>

                <ul class="red">
                    <li>To be eligible for Round 1 prizes and design feedback, you must submit before the Checkpoint
                        deadline.</li>
                    <li>A day or two after the Checkpoint deadline, the challenge holder will announce Round 1 winners and
                        provide design feedback to those winners in the "Checkpoints" tab above.</li>
                    <li>You must submit to Round 1 to be eligible to compete in Round 2. If your submission fails
                        screening for a small mistake in Round 1, you may still be eligible to submit to Round 2.</li>
                    <li>Every competitor with a passing Round 1 submission can submit to Round 2, even if they didn't
                        win a Checkpoint prize. </li>
                    <li><a href="http://help.topcoder.com/design/submitting-to-a-design-challenge/multi-round-checkpoint-design-challenges/">Learn more here</a>.</li>
                </ul>
        </c:if>
        <c:if test="${not empty contestDescription}">
            <h5 class="contentTitle">Full Description &amp; Project Guide</h5>
            <c:if test="${canSeeCCASection}">
                ${contestDescription}
            </c:if>
            <c:if test="${not canSeeCCASection}">
                <p class="paragraph">Only registered members with a CCA on file can view the full details of this challenge. <a href="http://community.topcoder.com/studio/types-of-competitions/private-competitions/">Click here to learn how to become eligible to compete in this private challenge.</a></p>
            </c:if>
        </c:if>

        <%-- SPECIFIC CONTEST DETAILS --%>
        <c:if test="${not empty spec.layoutAndSize or not empty spec.fonts or not empty spec.colors 
                      or not empty spec.contentRequirements or not empty spec.otherInstructions}">

            <h5 class="contentTitle">Details</h5>

            <c:if test="${not empty spec.layoutAndSize}">
                <span class="subTitle">Size:</span>
                ${spec.layoutAndSize}
            </c:if>

            <c:if test="${not empty spec.fonts}">
                <span class="subTitle">Font:</span>
                ${spec.fonts}
            </c:if>

            <c:if test="${not empty spec.colors}">
                <span class="subTitle">Color:</span>
                ${spec.colors}
            </c:if>

            <c:if test="${not empty spec.contentRequirements}">
                <span class="subTitle">Challenge:</span>
                ${spec.contentRequirements}
            </c:if>

            <c:if test="${not empty spec.otherInstructions}">
                <span class="subTitle">Other:</span>
                ${spec.otherInstructions}
            </c:if>
        </c:if>

     <h5 class="contentTitle">Stock Photography</h5>
     <c:if test="${contest.allowStockArt}">
         <p class="paragraph">
            Watermarked comp photography from istockphoto.com is allowed in this challenge. You must follow these instructions or your submission will fail screening:
        <br><br>
            1) You must declare your stock photos when submitting. <a href="http://help.topcoder.com/design/submitting-to-a-design-challenge/formatting-your-submission-for-design-challenges/" target="_blank">See how here.</a><br>
            2) Only use photos, and only use them from iStockPhoto.com. Other iStockPhoto artwork (illustrations, icons, etc.) are not allowed.<br>
            3) Be sure to keep the watermark intact. If the photo is cropped in such a way that the watermark is not visible, please be sure to include the entire watermarked image in your source files so screeners can see that it is a comp image from iStockphoto.com.
         </p>
        </c:if>

     <c:if test="${!contest.allowStockArt}">
         <p class="paragraph">
            Stock photography is not allowed in this challenge. All submitted elements must be designed solely by you.<br>
            <a href="http://help.topcoder.com/design/design-copyright-and-font-policies/policy-for-stock-photos-in-design-submissions/">See this page for more details.</a>
         </p>
        </c:if>

        <%-- How to Submit --%>
        <h5 class="contentTitle">How to Submit</h5>
        <p class="paragraph">
            <ul class="howToSubmit">
                <li>New to Studio? <a href="http://help.topcoder.com/design/submitting-to-a-design-challenge/getting-started-in-design-challenges/" target="_blank">Learn how to compete
                    here</a>.
                </li>
                <li>Upload your submission in three parts (<a
                        href="http://help.topcoder.com/design/submitting-to-a-design-challenge/formatting-your-submission-for-design-challenges/" target="_blank">see this FAQs for
                    more information</a>). Your design should be finalized and should contain only a single design
                    concept (do not include multiple designs in a single submission).
                </li>
                <li>If your submission wins, your source files must be correct and
                    "<a href="http://help.topcoder.com/design/submitting-to-a-design-challenge/design-final-fixes-policies/" target="_blank">Final Fixes</a>" (if
                    applicable) must be completed before payment can be released.
                </li>
                <li>You may submit as many times as you'd like during the submission phase, but only the number of files
                    listed above in the Submission Limit that you rank the highest will be considered. You can change
                    the order of your submissions at any time during the submission phase. If you make revisions to your
                    design, please delete submissions you are replacing.
                </li>
            </ul>
        </p>

        <%-- Winner Selection --%>
        <h5 class="contentTitle">Winner Selection</h5>
        <p class="paragraph">
            Submissions are viewable to the client as they are entered into the challenge. Winners are selected by the
            client and are chosen solely at the Client's discretion.
        </p>

        <%-- Winner Prize  --%>
        <h5 class="contentTitle">Payment</h5>
        <p class="paragraph">
            The payment will be distributed in one full installment once the final version of the winning submission has
            been downloaded by the client. Any and all applicable taxes on prizes are the sole responsibility of the
            prizewinner(s).
        </p>

        <%-- Eligibility --%>
        <h5 class="contentTitle">Eligibility</h5>
        <p class="paragraph">
            You must be a TopCoder Studio member, at least 18 years of age, meeting all of the membership requirements.
            In addition, you must fit into one of the following categories. If you reside in the United States, you must
            be either:
        </p>

        <ul>
            <li>A US Citizen</li>
            <li>A Lawful Permanent Resident of the US</li>
            <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
                permitting unrestricted employment in the U.S.
            </li>
        </ul>

        <br/>

        <p class="paragraph">
            If you do not reside in the United States:
        </p>

        <ul>
            <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you
                will not need to do anything to become authorized)
            </li>
        </ul>
    </div>
    <!--End mainColumn-->

    <%-- DOWNLOADS --%>
    <div class="subColumn rightSide">
        <h5 class="contentTitleNoB">Downloads:</h5>

        <div class="grayBox2 downloadBox2">
            <span class="grayRCLT"></span>
            <span class="grayRCRT"></span>
            <span class="grayRCLB"></span>
            <span class="grayRCRB"></span>

            <c:choose>
                <c:when test="${not empty contest.documents}">
                    <c:choose>
                        <c:when test="${isClosed}">
                                <p>
                                    <strong>Since this challenge has ended all attached files are no longer available
                                        for viewing</strong>
                                </p>
                        </c:when>
                        <c:when test="${registered || (not empty hasCockpitPermissions && hasCockpitPermissions) || specReviewer}">
                          <c:forEach items="${contest.documents}" var="document">
                              <p>
                                  <a href="${servletPath}?module=DownloadCatalogDocument&amp;ct=${contest.id}&amp;docid=${document.id}"
                                     class="downFile" target="_blank"><c:out value="${document.shortName}"/></a><br/>
                                  <em class="placeHolder"><c:out value="${document.type.description}"/></em>
                                  <c:out value="${document.name}"/>
                              </p>
                             </c:forEach>
                       </c:when>
                       <c:when test="${(not contest.specSubmissionStarted) || (not isStarted)}">
                                <p>
                                    <strong>Files are not available until the challenge launches</strong>
                                </p>
                        </c:when>
                       <c:otherwise>
                           <p align="center" class="bigRed">
                               You must register for the challenge<br/>to download any attached files.<br/><br/>
                               <a href="${servletPath}?module=ViewRegistration&amp;${CONTEST_ID}=${contest.id}"
                                  onfocus="this.blur();">
                                   <img src="/i/v2/interface/btnRegister.png" alt="Register"
                                        style="margin: 6px 0px 6px 0px;"/></a>
                            </p>
                       </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <p>None</p>
                </c:otherwise>
            </c:choose>
        </div>
        <!--End grayBox2-->

            <h5 class="contentTitleNoB">How to Format Your Submission:</h5>

            <div class="grayBox2 howFYS">
                <span class="grayRCLT"></span>
                <span class="grayRCRT"></span>
                <span class="grayRCLB"></span>
                <span class="grayRCRB"></span>
                <ul>
		    <b>Your Design Files:</b><br>
                    <li>1. Look for instructions in this challenge regarding what files to provide.
                    </li>
                    <li>2. Place your submission files into a "Submission.zip" file.</li>
                    <li>3. Place all of your source files into a "Source.zip" file.</li>
                    <li>4. Create a JPG preview file.</li>
                </ul>

                <p>Trouble formatting your submission or want to learn more?
                    <a href="http://help.topcoder.com/design/submitting-to-a-design-challenge/formatting-your-submission-for-design-challenges/">Read this FAQs</a>.</p>
		
		<p><strong>Fonts:</strong><br> All fonts within your design must be declared when you submit. DO NOT <a style="white-space:nowrap;">include any font files in your submission</a><a style="white-space:nowrap;"> <br>or source files. </a><a href="http://help.topcoder.com/design/design-copyright-and-font-policies/font-policy-for-design-challenges/" style="white-space:nowrap;">Read the font policy here</a>.
                </p>

		<p><strong>Screening:</strong><br>All submissions are screened for eligibility before the challenge holder picks winners. Don't let your hard work go to waste.<br> <a href="http://help.topcoder.com/design/the-screening-process-for-design-challenges/">Learn more about how to pass screening here</a>.
		</p>

		<p>Questions? <a href="http://studio.topcoder.com/forums?module=ThreadList&forumID=6">Ask in the Forums</a>.
		</p>
            </div>
            <!--End grayBox2-->

        <%-- SOURCE FILES --%>
        <c:if test="${fn:length(contest.fileTypes)>0}">
            <h5 class="contentTitleNoB">Source Files:</h5>

            <div class="grayBox2 sourceF">
                <span class="grayRCLT"></span>
                <span class="grayRCRT"></span>
                <span class="grayRCLB"></span>
                <span class="grayRCRB"></span>

                <ul>
                    <c:forEach items="${contest.fileTypes}" var="fileType" varStatus="status">
                        <li><strong>${fileType.description}</strong></li>
                    </c:forEach>
                </ul>

                <p>You must include all source files with your submission. </p>
            </div>
            <!--End grayBox2-->
        </c:if>

        <%-- SUBMISSION LIMIT --%>
        <h5 class="contentTitleNoB">Submission Limit:</h5>

        <div class="grayBox2 submissionL">
            <span class="grayRCLT"></span>
            <span class="grayRCRT"></span>
            <span class="grayRCLB"></span>
            <span class="grayRCRB"></span>

            <p>
                <c:choose>
                    <c:when test="${empty contest.maxSubmissions}">
                        <strong>Unlimited</strong>
                    </c:when>
                    <c:when test="${contest.maxSubmissions eq 1}">
                        <strong>1</strong> submission per competitor
                    </c:when>
                    <c:otherwise>
                        <strong>${contest.maxSubmissions}</strong> submissions per competitor
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
        <!--End grayBox2-->
    </div>
    <!--End subColumn-->
    <div class="clear"></div>
</div>
<!--End content-->
</div>
<!--End warpperNew-->
<br class="clear"/></div>

</div>
</div>
<%-- #page-wrap ends --%>

<jsp:include page="foot.jsp"/>

</body>
</html>

