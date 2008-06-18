<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.studio.model.ContestChannel" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
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
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/v2/main.js"></script>
    <link type="text/css" rel="stylesheet" href="/css/v2/feedback.css" />
    <script type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
</head>

<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>
<c:set var="modKey" value="<%=Constants.MODULE_KEY%>"/>

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

                <div class="linkBox"><studio:forumLink forumID="${submission.contest.forumId}"/></div>
                
                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?${modKey}=ViewPastContests">Past Contests</a> &gt;
                    ${submission.contest.name}
                </div>

                <h1>Scores</h1>

<div align="center" style="font-size: 32px; font-weight: bold;">
    <studio:handle coderId="${submission.submitter.id}"/>
</div>

<div align="center" style="margin-bottom: 10px; font-weight: bold;">
    Submission ID: ${submission.id}
</div>

<c:set var="contestType" value="${submission.contest.type}"/>

<c:set var="showSubmissions" value="${submission.contest.viewableSubmissions.value}"/>
<c:set var="submissionId" value="${submission.id}"/>
<c:set var="contestId" value="${submission.contest.id}"/>
<c:set var="galleryImageCount" value="${submission.mediumWatermarkedGalleryImagesCount}"/>

<div align="center" style="margin-bottom: 20px;">
    <div style="overflow: hidden; width: 300px;">
        <c:choose>
            <c:when test="${showSubmissions}">
                <c:choose>
                    <c:when test="${submission.contest.channel.id eq 3}">
                        <%-- Old Studio V1 contests --%>
                        <c:choose>
                            <c:when test="${submission.mimeType.fileType.imageFile}">
                                <studio_tags:submissionDisplay submissionId="${submissionId}" width="${submission.width}" height="${submission.height}"/>
                            </c:when>
                            <c:otherwise>
                                    <a href="${sessionInfo.servletPath}?${modKey}=DownloadSubmission&amp;${subId}=${submissionId}">
                                        <img src="/i/v2/interface/magnify.png" alt="" />
                                        <span>View submission</span>
                                    </a>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <%-- Since TopCoder Modifications Assembly Req# 5.9, 5.10 --%>
                        <%-- All newer contests --%>
                        <studio_tags:viewSubmissionLink submissionId="${submissionId}"
                                                        galleryImageCount="${galleryImageCount}"
                                                        targetPresentationType="medium"
                                                        previewPresentationType="small"
                                                        contestId="${contestId}"/>
                    </c:otherwise>
                </c:choose>
            </c:when>
            <c:otherwise>
                <img src="/i/v2/interface/magnifyFade.png" alt="" />
            </c:otherwise>
        </c:choose>

    </div>
    <div align="center">
        <a href="">View Full Size</a>
    </div>
</div>

<%-- begin we don't need to show this if there are no reviews --%>
<div align="center" style="margin-bottom: 40px;">
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
                <studio:handle coderId="${resultRow.map['reviewer_id']}"/>
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
<%-- end we don't need to show this if there are no reviews --%>
                
                        <br clear="all"/>

<a name="feedback"></a>
<%-- feedback comment start --%>
<div class="commentSpacer">
    <div class="commentBG">
        <div class="commentN"></div>
        <div class="commentFG">
            <div>
                <div class="commentPoster">
                    <img src="/i/m/nophoto.jpg" alt="handle goes here" />
                    <div>
                        <span class="coderText">handle</span>
                    </div>
                </div>
                <div class="commentContent">
                    <%-- START: if this user hasn't posted a comment --%>
                    <%--
                    <div class="commentTitle">
                        Give feedback:
                    </div>
                    <p>
                        (<strong>NOTE:</strong> You are only allowed to post <strong>one comment</strong> per submission. You can not edit a comment once you have posted it.)
                    </p>
                    <textarea rows="10" cols="60"></textarea>
                    <div>
                        <a href=""><img src="/i/v2/interface/btnPost.png" alt="Post" /></a>
                    </div>
                    --%>
                    <%-- END: if this user hasn't posted a comment --%>

                    <%-- START: or if this is an existing comment show this --%>
                    <div class="commentDate">
                        Wed, Dec 19, 2007 at 12:49 PM EST
                    </div>
                    <div class="commentTitle">
                        Feedback:
                        <%-- START: if the user is an admin, show this --%>
                        <span class="adminCons">(<a href="#">edit</a> | <a href="#TB_inline?height=100&amp;width=300&amp;inlineId=modalContent&amp;modal=true" class="thickbox">remove</a>  )</span>
                        <%-- END: if the user is an admin, show this --%>
                    </div>
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Integer a velit id arcu interdum malesuada. Pellentesque at urna. Nunc ullamcorper, neque eu facilisis auctor, felis neque lacinia nibh, vel lacinia lorem eros ac mauris. Cras laoreet arcu et nibh. Sed metus arcu, tempus et, dignissim eget, tempus sit amet, velit. Cras eleifend purus ultricies velit. Morbi sit amet enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse lacinia venenatis dui. Maecenas justo odio, bibendum eget, mattis iaculis, posuere ac, tellus. Ut non nisi vel ante placerat sagittis. Morbi gravida ligula a neque. Mauris posuere. Etiam tempus diam at leo. Etiam aliquam blandit turpis.
                    <%-- END: or if this is an existing comment show this --%>

                </div>
                <div style="clear: both;">&nbsp;</div>
            </div>
        </div>
        <div class="commentS"></div>
    </div>

    <!--
    <%-- START: show this if the submitter has already responded --%>
    <div align="center">
        <div class="responseBG">
            <div class="responseN">
                <div class="responsePoster">
                    <img src="/i/m/nophoto.jpg" alt="handle goes here" />
                    <div>
                        <span class="coderText">handle</span>
                    </div>
                </div>
                <div class="responseContent">
                    <div class="responseDate">
                        Wed, Dec 19, 2007 at 12:49 PM EST
                    </div>
                    <div class="responseTitle">
                        Designer's response:
                        <%-- START: if the user is an admin, show this --%>
                        <span class="adminCons">(<a href="#">edit</a> | <a href="#TB_inline?height=100&amp;width=300&amp;inlineId=modalContent&amp;modal=true" class="thickbox">remove</a>  )</span>
                        <%-- END: if the user is an admin, show this --%>
                    </div>
                    <%-- END: if the submitter has already responded --%>
                    <span>Thanks!</span>
                </div>
                <div style="clear: both;">&nbsp;</div>
            </div>
            <div><img src="i/v2/responseS.png" alt="" /></div>
        </div>
    </div>
    <%-- END: show this if the submitter has already responded --%>
    -->

    <%-- START: if this is an existing comment, and the user is the submitter, or if the submitter has already responded, show this --%>

    <div class="showBlock" id="myButtons">
        <div align="center" class="commentButtonBox">
            <a href="javascript:swapShow('myButtons','myForm');"><img src="i/v2/interface/btnRespond.png" alt="Respond" /></a>
        </div>
    </div>
    
    <div align="center" class="hide" id="myForm">
        <div class="responseBG">
            <div class="responseN">
                <div class="responsePoster">
                    <img src="/i/m/nophoto.jpg" alt="handle goes here" />
                    <div>
                        <span class="coderText">handle</span>
                    </div>
                </div>
                <div class="responseContent">
                    <%-- START: if the user is the submitter and has not already responded, show this --%>
                    <div class="commentTitle">
                        Respond:
                    </div>
                    <textarea rows="10" cols="50"></textarea>
                    <div>
                        <a href=""><img src="/i/v2/interface/btnPost.png" alt="Post" /></a>
                        <a href="javascript:swapShow('myForm','myButtons');"><img src="/i/v2/interface/btnCancel.png" alt="Cancel" /></a>
                    </div>
                    <%-- END: if the user is the submitter and has not already responded, show this --%>
                    <%-- START: if the submitter has already responded --%> 
                    <!--
                    <div style="float: right; font-weight: bold;">
                        Wed, Dec 19, 2007 at 12:49 PM EST
                    </div>
                    <div class="commentTitle">
                        Designer's response:
                        <%-- START: if the user is an admin, show this --%>
                        <span class="adminCons">(<a href="#">edit</a> | <a href="#TB_inline?height=100&amp;width=300&amp;inlineId=modalContent&amp;modal=true" class="thickbox">remove</a>  )</span>
                        <%-- END: if the user is an admin, show this --%>
                    </div>
                    <span style="color: #0869a4">Thanks!</span>
                    -->
                    <%-- END: if the submitter has already responded --%>
                </div>
                <div style="clear: both;">&nbsp;</div>
            </div>
            <div><img src="i/v2/responseS.png" alt="" /></div>
        </div>
    </div>
    <%-- END: if this is an existing comment, and the user is the submitter, show this --%>

</div>
<%-- feedback comment end --%>


                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>