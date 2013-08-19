<%--
  - Author: isv
  - Version: 1.0 (TC Cockpit - Studio - Final Fixes Integration Part Two Assembly)
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page presents specific final fix details
--%>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<fmt:setLocale value="en_US"/>
<c:set var="contest" value="${requestScope.contest}"/>
<c:set var="servletPath" value="${sessionInfo.servletPath}"/>

<c:set var="COMPLETED" value="${finalFixUploaded and reviewCommitted and allItemsFixed}"/>
<c:set var="IN_REVIEW" value="${not COMPLETED and finalFixUploaded}"/>
<c:set var="IN_PROGRESS" value="${not COMPLETED and not finalFixUploaded}"/>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>
<c:set var="isCurrentFinalFixRound" value="${FinalFixRoundNo eq contest.noOfFinalFixRounds}"/>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio : Contest Details</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_final_fix"/>
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

<body class="studioPage">
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
                    <jsp:param name="currentTab" value="ff"/>
                </jsp:include>

                <div class="content">
                    <div class="mainColumn">
                        <h5 class="contentTitle">
                            <c:choose>
                                <c:when test="${COMPLETED}">Final Fixes Completed</c:when>
                                <c:otherwise>Final Fixes R${FinalFixRoundNo}</c:otherwise>
                            </c:choose>
                        </h5>

                        <div class="para ${COMPLETED ? 'lesspadding' : ''}">
                            <c:choose>
                                <c:when test="${IN_REVIEW}">
                                    <p>Your Final Fixes have been submitted and are being reviewed by the contest
                                        holder. You will receive an email once your fixes are rejected or accepted.</p>
                                </c:when>
                                <c:when test="${COMPLETED}">
                                    <p>Final Fixes have been accepted.</p>
                                </c:when>
                                <c:when test="${IN_PROGRESS}">
                                    <c:choose>
                                        <c:when test="${FinalFixRoundNo eq 1}">
                                            <p>Here are the Final Fixes from from the contest holder.
                                                <a href="http://community.topcoder.com/studio/the-process/final-fixes/">
                                                    Learn more about the Final Fixes here</a>.
                                            </p>
                                        </c:when>
                                        <c:when test="${FinalFixRoundNo eq 2}">
                                            <p>This is the second round of Final Fixes. Please be sure to complete the
                                                unfixed items and clarifying items.</p>
                                        </c:when>
                                        <c:when test="${FinalFixRoundNo > 2}">
                                            <p>This is an additional round of Final Fixes. Please be sure to complete
                                                the unfixed items and clarifying items.</p>
                                        </c:when>
                                    </c:choose>
                                </c:when>
                            </c:choose>

                            <c:choose>
                                <c:when test="${IN_PROGRESS}">
                                    <p>You must complete these fixes by the deadline shown on the right. Please keep all
                                        communications (questions, clarifications, etc.) with the contest forum. If you
                                        need technical help, please email
                                        <a href="mailto:support@topcoder.com">support@topcoder.com</a>.</p>
                                </c:when>
                                <c:when test="${IN_REVIEW}">
                                    <p>Please keep all communications (question, clarifications, etc.) with the contest
                                        forum. If you need technical help, please email 
                                        <a href="mailto:support@topcoder.com">support@topcoder.com</a>.</p>
                                </c:when>
                            </c:choose>
                        </div>

                        <div class="finalFixesList">
                            <div class="inner">
                                <c:if test="${not empty finalFixDetail.additionalComment}">
                                    <dl>
                                        <dt>Comments</dt>
                                        <dd><c:out value="${finalFixDetail.additionalComment}"/></dd>
                                    </dl>
                                </c:if>
                                <table cellpadding="0" cellspacing="0" id="ffTable">
                                    <colgroup>
                                        <col width="54">
                                        <col>
                                        <col width="75">
                                        <c:if test="${reviewCommitted}">
                                            <col width="15">
                                        </c:if>
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th class="commentColumn">Item</th>
                                        <c:if test="${reviewCommitted}">
                                            <th>Fixed?</th>
                                        </c:if>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="myIndex" value="0"/>
                                    <c:forEach items="${finalFixDetail.comments}" var="item" varStatus="loop">
                                        <c:if test="${not isCurrentFinalFixRound or isCurrentFinalFixRound and (reviewCommitted or not item.fixed)}">
                                            <c:set var="myIndex" value="${myIndex + 1}"/>
                                            <tr>
                                            <td><strong>${myIndex}</strong></td>
                                            <td class="commentColumn"><c:out value="${item.comment}"/></td>
                                            <c:if test="${reviewCommitted}">
                                                <td class="statusCell">
                                                    <em class="${not item.fixed ? 'in' : ''}correct"></em>
                                                </td>
                                            </c:if>
                                        </tr>
                                        </c:if>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <span class="corner tl"></span>
                            <span class="corner tr"></span>
                            <span class="corner bl"></span>
                            <span class="corner br"></span>
                        </div>                        

                    </div>
                    <!--End mainColumn-->

                    <c:if test="${not COMPLETED}">
                        <div class="subColumn rightSide">
                            <c:choose>
                                <c:when test="${finalFixUploaded}">
                                    <a href="#" class="btnStudioUploadFinalFixes off">
                                        <span class="btnR"><span class="btnC"><span
                                                class="btnIcon">Upload Final Fixes</span></span></span></a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${servletPath}?module=ViewUploadFinalFix&amp;${CONTEST_ID}=${contest.id}" 
                                       class="btnStudioUploadFinalFixes">
                                        <span class="btnR"><span class="btnC"><span
                                                class="btnIcon">Upload Final Fixes</span></span></span></a>
                                </c:otherwise>
                            </c:choose>

                            <c:if test="${not finalFixUploaded}">
                                <div class="deadlineForFinalFixed">
                                    <div class="inner">
                                        <h4><c:out value="${hoursLeftText}"/></h4>
                                        <span>
                                            <fmt:formatDate value="${finalFixPhase.scheduledEndTime}" 
                                                            pattern="EEEEE dd MMMMM, yyyy HH:mm zzz"/>
                                        </span>
                                    </div>
                                    <span class="corner tl"></span>
                                    <span class="corner tr"></span>
                                    <span class="corner bl"></span>
                                    <span class="corner br"></span>
                                </div>
                                <p>Failure to submit Final Fixes before the deadline may result in reduced payment.</p>
                            </c:if>

                        </div>
                        <!--End subColumn-->
                    </c:if>

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

