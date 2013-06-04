<%--
  - Author: isv
  - Version: 1.1 (Replatforming Studio Release 5)
  - Copyright (C) 2011-2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents scorecard details.
  - Version 1.1 (TopCoder Studio Member Profiles Assembly) change notes: linked to Studio's member profile.
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<fmt:setLocale value="en_US"/>
<c:set var="scorecard" value="${requestScope.review.scorecard}"/>
<c:set var="questionReviewItemMap" value="${requestScope.questionReviewItemMap}"/>
<c:set var="contest" value="${requestScope.review.submission.upload.contest}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Scorecard Details</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_contest_details"/>
    </jsp:include>
    <script src="/js/scorecardDetails.js" type="text/javascript"></script>
</head>

<body>
<div id="page-wrap">
    <div>
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="contest"/>
        </jsp:include>
        <br/>
        <div id="wrapper_submission" style="margin-top:0px;">
            <div id="warpperNew">
                <h2 class="scorecardTitle">Scorecard</h2>
                <div class="scorecardInfo">
                    <strong>Contest:</strong><span><a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}">${contest.projectName}</a></span><br/>
                    <strong>Phase:</strong><span>${review.author.role.phaseType.name}</span><br/>
                    <strong>Submission Number:</strong><span>${review.submission.id}</span><br/>
                    <strong>Submitter:</strong><span><studio:handle coderId="${submitter}" /></span><br/>
                    <strong>${review.author.role.name}:</strong><span><studio:handle coderId="${reviewer}" /></span>
                </div>
                <div id="scorecardTable">
                    <a href="javascript:showAll();">Expand all questions</a>&nbsp;|&nbsp;<a href="javascript:hideAll();">Contract all questions</a>
                    
                    <table class="statTableHolder" width="100%" cellspacing="0" cellpadding="0" border="0">
                    <tbody><tr><td style="padding:0;">
                         <table class="statTable" width="100%" cellspacing="0" cellpadding="0" border="0">
                         <tbody>
                            <c:forEach var="group" items="${scorecard.groups}" varStatus="groupStatus">
                            <c:forEach var="section" items="${group.sections}" varStatus="sectionStatus">
                            <tr>
                                <td class="tableHeader"> (${section.weight})</td>
                                <td class="tableHeader" colspan="2">${section.name}</td>
                            </tr>
                            <c:forEach var="question" items="${section.questions}" varStatus="questionStatus">
                            <c:set var="reviewItem" value="${questionReviewItemMap[question.id]}"/>
                            <tr>
                                <td class="statDk"><b>(${question.weight})</b></td>
                                <td class="statDk" width="100%">
                                    <div id="shortQ_${groupStatus.count}_${sectionStatus.count}_${questionStatus.count}" class="showText">
                                        <a class="statLink" href="javascript:toggleDisplay('shortQ_${groupStatus.count}_${sectionStatus.count}_${questionStatus.count}');toggleDisplay('longQ_${groupStatus.count}_${sectionStatus.count}_${questionStatus.count}');"><img border="0" alt="open" src="/i/open.gif"></a>
                                        <b>${groupStatus.count}.${sectionStatus.count}.${questionStatus.count}</b>
                                        ${question.description}
                                    </div>
                                   <div id="longQ_${groupStatus.count}_${sectionStatus.count}_${questionStatus.count}" class="hideText">
                                        <a class="statLink" href="javascript:toggleDisplay('shortQ_${groupStatus.count}_${sectionStatus.count}_${questionStatus.count}');toggleDisplay('longQ_${groupStatus.count}_${sectionStatus.count}_${questionStatus.count}');"><img border="0" alt="close" src="/i/close.gif"></a>
                                        <b>${groupStatus.count}.${sectionStatus.count}.${questionStatus.count}</b>
                                        ${question.description}<br/><studio:formatField text="${question.guideline}" />
                                   </div>
                                </td>
                                <td valign="top" nowrap="nowrap" class="statDk"><b><studio:reviewItemAnswer questionType="${question.type}" answer="${reviewItem.answer}" /></b></td>
                            </tr>
                            <c:forEach var="comment" items="${reviewItem.comments}">
                            <c:if test="${comment.type.name eq 'Comment' || comment.type.name eq 'Recommended' || comment.type.name eq 'Required' || comment.type.name eq 'Manager Comment'}">
                            <tr>
                                <td class="statLt">&nbsp;</td>
                                <td class="statLt"><studio:formatField text="${comment.content}" /></td>
                                <td class="statLt">${comment.type.name}</td>
                            </tr>
                            </c:if>
                            </c:forEach>
                            </c:forEach>
                            </c:forEach>
                            </c:forEach>
                         </tbody>
                         </table>
                    </td></tr></tbody>
                    </table>
                </div>
            </div>
            <!--End warpperNew-->
            <br class="clear"/>
        </div>
    </div>
</div>
<%-- #page-wrap ends --%>

<jsp:include page="foot.jsp"/>

</body>
</html>
