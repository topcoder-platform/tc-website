<%@ page import="com.topcoder.web.truveo.Constants, com.topcoder.web.truveo.model.SubmissionType" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="truveo.tld" prefix="truveo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>

    <title>Truveo Developer Challenge :: Powered by TopCoder</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_truveo"/>
    </jsp:include>
    
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
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=BatchUpdateRank&<%=Constants.CONTEST_ID%>=${contest.id}&<%=Constants.SUBMISSION_TYPE_ID%>=<%=SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE%>');
        <c:forEach items="${submissions}" var="submission">
            ajaxRequest.addNamedFormElements("<%=Constants.SUBMISSION_ID%>${submission.id}");
        </c:forEach>
            ajaxRequest.sendRequest();
        }
        new Image().src = "/i/events/truveo/interface/processing.gif";
        function showProcessing() {
            document.getElementById("submitButton").innerHTML = '<img src="/i/events/truveo/interface/processing.gif" alt=""/>';
        }

        // -->
    </script>

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/truveo/tabs/registerOn.png';
            img.src = '/i/events/truveo/tabs/submitOn.png';
            img.src = '/i/events/truveo/tabs/apisOn.png';
            img.src = '/i/events/truveo/tabs/discussOn.png';
        }
    </script>

</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="truveoTop.jsp"/>
                <div class="contentWithLeft" align="right">
                    <div class="contentTexture">
                        <jsp:include page="leftBox.jsp"/>
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxHalf">

<%--
<div class="linkBox">
    <truveo:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a> &gt;
    ${contest.name}
</div>
--%>

<h1>Submit Your Design</h1>

<div align="center">
    <div align="left" style="width:500px; margin-top: 20px;">
        <p>Thank you for accepting the terms of the contest. Please use the form below to upload your
            submission:</p>

<%--
        <p>The maximum file size per submission is 2MB.</p>

        <p>Only the following file types will be accepted:</p>
        <ul>
            <c:forEach items="${contest.fileTypes}" var="fileType">
                <li>
                        ${fileType.description}
                </li>
            </c:forEach>
        </ul>
--%>
        <p>
            You will need to submit a zip file to TopCoder which includes 2 items:
        </p>
        
        <ol>
            <li>A text document containing: 
                <ul>
                    <li>Your TopCoder handle name</li>
                    <li>Your unique Truveo API key</li>
                    <li>Your AIM Screenname you used to acquire your API Key</li>
                    <li>A title and brief overview of the application to be used as an online description</li>
                    <li>Most importantly, a link to the URL where the application can be viewed/downloaded</li>
                </ul>
            </li>
            <li>An image file (jpg, or png) containing a screengrab or graphic representation of your application (no larger than 300x300 pixels).</li>
        </ol>

        <div align="center">
            <form action="${sessionInfo.servletPath}" method="POST" name="submitForm" enctype="multipart/form-data" onsubmit="showProcessing()">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>
                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
                <p>
                    <b>My submission:</b><br/>
                    <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION%>"><span class="bigRed">${err}</span>
                        <br /></tc-webtag:errorIterator>
                    <input type="file" name="<%=Constants.SUBMISSION%>">
                </p>

                <p>
                    <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION_RANK%>"><span class="bigRed">${err}</span>
                        <br /></tc-webtag:errorIterator>
                    as rank:&nbsp;<tc-webtag:textInput name="<%=Constants.SUBMISSION_RANK%>" maxlength="3" size="2"/>
                </p>

                <p id="submitButton">
                    <input type="image" src="/i/events/truveo/interface/btnSubmit.png" />
                </p>
            </form>
        </div>

    </div>
</div>


<%
    GregorianCalendar gc = new GregorianCalendar(2007, Calendar.JULY, 23);
%>
<c:set value="<%=gc.getTime()%>" var="bigStart"/>


<div style="margin: 40px 0px 20px 0px;">
    <form name="submissionForm" action="#">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="BatchUpdateRank"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>" value="${contest.id}"/>
        <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_TYPE_ID%>" value="<%=SubmissionType.INITIAL_CONTEST_SUBMISSION_TYPE.toString()%>"/>


        <c:choose>
            <c:when test="${contest.startTime > bigStart}">
                <div align="center">
                    <%--
                    <strong>In the table below</strong> you can rank your submissions. <br />
                    --%>

                            <%--
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
                            --%>
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
                <tr><td class="title" colspan="4">My Submissions<td></tr>
                <tr>
                    <td class="headerW">
                        <div>&nbsp;</div>
                    </td>
<%--
                    <td class="headerC">
                        Ranking
                        <div>
                            <a href="#" onclick="batchUpdate();return false;"><img src="/i/events/truveo/interface/btnUpdateRanking.png" alt="Update ranking" /></a>
                        </div>
                    </td>
--%>
                    <td class="header" colspan="2" width="50%">
                        Submission
                    </td>
                    <td class="headerC" width="50%">
                        Date Submitted
                    </td>
<%--
                    <td class="headerC">
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
--%>
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
</div>


                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>