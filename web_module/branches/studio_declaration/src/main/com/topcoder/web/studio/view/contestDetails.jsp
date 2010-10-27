<%--
  - Author: pulky, TCSDEVELOPER
  - Version: 1.4
  - Copyright (C) 2001 - 2010 TopCoder Inc., All Rights Reserved.
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
  - Version 1.4 (Studio Contest Detail Pages Assembly version 1.0) changes:
  -     - Applied new L&F
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.PrizeType" %>
<%@ page import="com.topcoder.web.studio.controller.request.ViewContestDetails" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<fmt:setLocale value="en_US"/>
<c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>
<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="isMultiRound" value="${not empty contest.multiRound and contest.multiRound}"/>
<c:set var="milestoneDate" value="${contest.multiRoundInformation.milestoneDate}"/>
<c:set var="currentTime" value="${requestScope.currentTime}"/>
<c:set var="registered" value="${requestScope.registered}"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>
<c:set var="prizesCount" value="${fn:length(contest.prizes)}"/>
<c:set var="drPointsAvailable" value="${fn:length(contest.digitalRunPoints.value) > 0 and contest.digitalRunPoints.value != '0'}"/>
<c:set var="hasMilestoneRoundPrize" value="${isMultiRound and not empty contest.milestonePrize and not empty contest.milestonePrize.numberOfSubmissions and not empty contest.milestonePrize.amount}"/>
<c:set var="placeSuffixes"
       value="<%=new String[] {"st", "nd", "rd", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th", "th"}%>"/>
<c:set var="isFinished" value="${currentTime >= contest.endTime}"/>
<c:set var="isStarted" value="${currentTime >= contest.startTime}"/>
<c:set var="isRunning" value="${isStarted and not isFinished}"/>
<c:set var="isMilestoneRoundPassed" value="${isRunning and isMultiRound and currentTime >= milestoneDate}"/>
<c:set var="hasCockpitPermissions" value="${requestScope.has_cockpit_permissions}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Contest Details</title>
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
</head>

<body>
<div id="page-wrap">
<div>
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
            specifically permitted here in the Contest Details.
        </p>

        <%-- CONTEST SUMMARY --%>
        <h5 class="contentTitle">Contest Summary</h5>

        <p class="paragraph"><studio:formatField text="${contest.overview.value}"/></p>


        <c:if test="${not empty contest.fullDescription.value or isMultiRound}">
            <h5 class="contentTitle">Full Description &amp; Project Guide</h5>
            <c:if test="${isMultiRound and not empty contest.multiRoundInformation
                and not empty contest.milestonePrize and not empty contest.multiRoundInformation.roundOneIntroduction
                and not empty contest.multiRoundInformation.roundTwoIntroduction}">

                <h6 class="smallTitle">Studio Tournament Format</h6><br/>

                <p class="paragraph">This Studio competition will be run as a two-round tournament with a total prize purse of
                <fmt:formatNumber value="${contest.totalPrizePurse}" pattern="$###,###.00"/>.</p>

                <span class="subTitle">Round One (1)</span><br/>
                <p class="paragraph">
                    <studio:formatField text="${contest.multiRoundInformation.roundOneIntroduction}"/>
                </p>
                <span class="subTitle">Round Two (2)</span><br/>
                <p class="paragraph">
                    <studio:formatField text="${contest.multiRoundInformation.roundTwoIntroduction}"/>
                </p>

                <p class="paragraph">Please read the contest specification carefully and watch the forums for any
                    questions or feedback concerning this contest. It is important that you monitor any updates
                    provided by the client or Studio Admins in the forums. Please post any questions you might have for
                    the client in the forums.</p>

                <h6 class="smallTitle">Regarding the Rounds:</h6>

                <p class="paragraph2">To be eligible for Round 1 prizes and design feedback, you must submit before the
                    Milestone deadline.</p>

                <p class="paragraph2">The contest holder will announce Round 1 winners and provide design feedback to
                    those winners in the forum after the milestone deadline. </p>

                <p class="paragraph2">You must submit to Round 1 to be eligible to compete in Round 2. If your
                    submission fails screening for a small mistake in Round 1, you may still submit to Round 2.</p>
            </c:if>
            <c:if test="${not empty contest.fullDescription.value}">
                <p class="paragraph">
                    <studio:formatField text="${contest.fullDescription.value}"/>
                </p>
            </c:if>
        </c:if>

        <%-- SPECIFIC CONTEST DETAILS --%>
        <c:if test="${not empty contest.sizeRequirements.value or not empty contest.fontRequirements.value
                     or not empty contest.colorRequirements.value or not empty contest.contentRequirements.value
                     or not empty contest.otherRequirements.value}">

            <h5 class="contentTitle">Details</h5>

            <c:if test="${not empty contest.sizeRequirements.value}">
                <span class="subTitle">Size:</span>

                <p class="paragraph"><studio:formatField text="${contest.sizeRequirements.value}"/></p>
            </c:if>
            <c:if test="${not empty contest.fontRequirements.value}">
                <span class="subTitle">Font:</span>

                <p class="paragraph"><studio:formatField text="${contest.fontRequirements.value}"/></p>
            </c:if>
            <c:if test="${not empty contest.colorRequirements.value}">
                <span class="subTitle">Color:</span>

                <p class="paragraph"><studio:formatField text="${contest.colorRequirements.value}"/></p>
            </c:if>
            <c:if test="${not empty contest.contentRequirements.value}">
                <span class="subTitle">Content:</span>

                <p class="paragraph"><studio:formatField text="${contest.contentRequirements.value}"/></p>
            </c:if>
            <c:if test="${not empty contest.otherRequirements.value}">
                <span class="subTitle">Other:</span>

                <p class="paragraph"><studio:formatField text="${contest.otherRequirements.value}"/></p>
            </c:if>
        </c:if>

        <%-- How to Submit --%>
        <h5 class="contentTitle">How to Submit</h5>
        <p class="paragraph">
            <ul>
                <li>New to Studio? <a href="http://topcoder.com/home/studio/new-member-guide/">Learn how to compete
                    here</a>.
                </li>
                <li>Upload your submission in three parts (<a
                        href="http://topcoder.com/home/studio/the-process/how-to-submit-to-a-contest/">see this FAQs for
                    more information</a>). Your design should be finalized and should contain only a single design
                    concept (do not include multiple designs in a single submission).
                </li>
                <li>If your submission wins, your source files must be correct and
                    "<a href="http://topcoder.com/home/studio/the-process/final-fixes/ ">Final Fixes</a>" (if
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
            Submissions are viewable to the client as they are entered into the contest. Winners are selected by the
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
                <c:when test="${fn:length(contest.documents) > 0}">
                    <c:choose>
                        <c:when test="${currentTime > contest.endTime }">
                                <p>
                                    <strong>Since this contest has ended all attached files are no longer available
                                        for viewing</strong>
                                </p>
                        </c:when>
                        <c:when test="${registered || (not empty hasCockpitPermissions && hasCockpitPermissions)}">
                          <c:forEach items="${contest.documents}" var="document">
                              <p>
                                  <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}"
                                     class="downFile" target="_blank"><c:out value="${document.originalFileName}"/></a><br/>
                                  <em class="placeHolder"><c:out value="${document.type.description}"/></em>
                                  <c:out value="${document.description}"/>
                              </p>
                             </c:forEach>
                       </c:when>
                        <c:otherwise>
                            <p align="center" class="bigRed">
                                You must register for the contest<br/>to download any attached files.<br/><br/>
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

        <c:if test="${not empty contest.submissionFileFormat.value}">
            <h5 class="contentTitleNoB">How to Format Your Submission:</h5>

            <div class="grayBox2 howFYS">
                <span class="grayRCLT"></span>
                <span class="grayRCRT"></span>
                <span class="grayRCLB"></span>
                <span class="grayRCRB"></span>
                <ul>
                    <li>1. Look for instructions in this contest regarding what files to provide. Questions? Ask in the
                        forum for this contest.
                    </li>
                    <li>2. Place your submission files into a "Submission.zip" file.</li>
                    <li>3. Place all of your source files into a "Source.zip" file.</li>
                    <li>4. Create a JPG preview file.</li>
                    <li>5. Click "Submit" and upload your files.</li>
                </ul>

                <p>Trouble formatting your submission or want to learn more?
                    <a href="http://topcoder.com/home/studio/the-process/how-to-submit-to-a-contest/">Read this FAQs</a>.</p>

                <p><strong>Note:</strong> All non-standard Windows fonts must be listed in a text file within your
                    submission folder. Include the name of the font and a link to where it can be downloaded/purchased.
                    DO
                    NOT include any font files in your submission or source files.
                </p>
            </div>
            <!--End grayBox2-->
        </c:if>

        <%-- SOURCE FILES --%>
        <c:if test="${fn:length(contest.fileTypes)>0}">
            <h5 class="contentTitleNoB">Source Files:</h5>

            <div class="grayBox2 sourceF">
                <span class="grayRCLT"></span>
                <span class="grayRCRT"></span>
                <span class="grayRCLB"></span>
                <span class="grayRCRB"></span>

                <p>
                    <c:forEach items="${contest.fileTypes}" var="fileType" varStatus="status">
                        <strong>${fileType.description}</strong><c:if test="${not status.last}">,</c:if>
                    </c:forEach>
                </p>

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
