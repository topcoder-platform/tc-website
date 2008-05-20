<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ReviewStatus" %>
<%@ page import="com.topcoder.web.studio.model.SubmissionStatus" %>
<%@ page import="com.topcoder.web.studio.model.SubmissionType" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="currentTime" value="<%=new Date()%>"/>
<c:set var="passed" value="<%=ReviewStatus.PASSED%>"/>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript"><!--
    function next() {
        document.subForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()+Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getEndRow()+Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.subForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        document.subForm.<%=Constants.REVIEW_STATUS_ID%>.value = '<%=request.getParameter(Constants.REVIEW_STATUS_ID)==null?"":request.getParameter(Constants.REVIEW_STATUS_ID)%>';
        document.subForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
        document.subForm.submit();
    }
    function previous() {
        document.subForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getEndRow()-Constants.ADMIN_VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.subForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        document.subForm.<%=Constants.REVIEW_STATUS_ID%>.value = '<%=request.getParameter(Constants.REVIEW_STATUS_ID)==null?"":request.getParameter(Constants.REVIEW_STATUS_ID)%>';
        document.subForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
        document.subForm.submit();
    }
    function sendToReview(id) {
        document.subForm.<%=Constants.MODULE_KEY%>.value = "SendToReview";
        document.subForm.<%=Constants.SUBMISSION_ID%>.value = id;
        document.subForm.<%=Constants.CONTEST_ID%>.value = "";
        document.subForm.method="POST";
        document.subForm.submit();
    }
    //--></script>

</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">back to
    Contests</a></div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">Contests</a>
    &gt;
    <a href="${sessionInfo.servletPath}?module=ViewContest&amp;<%=Constants.CONTEST_ID%>=${contest.id}">${contest.name}</a>
    &gt; Submissions
</div>

<h1>Submissions</h1>

<%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
<form action="${sessionInfo.secureAbsoluteServletPath}" method="get" name="subForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewSubmissions"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
<tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
<input type="hidden" name="<%=Constants.REVIEW_STATUS_ID%>" value=""/>


Showing <strong>${count}</strong> Submissions for <strong>${contest.name}</strong>
<br /><br />
Show submissions by (Enter Handle):
<tc-webtag:textInput name="<%=Constants.HANDLE%>"/>  <button name="handleSubmit" value="handleSubmit" type="submit">Submit</button>
<br /><br />
<c:forEach items="${reviewStatuses}" var="reviewStatus">
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.REVIEW_STATUS_ID%>=${reviewStatus.id}&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Only
        show submissions that ${reviewStatus.description}</a><br />
</c:forEach>
<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.REVIEW_STATUS_ID%>=null&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Only
    show submissions that are unmarked</a><br />
<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Show
    all active submissions</a><br />
<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}&amp;<%=Constants.SUBMISSION_STATUS_ID%>=<%=SubmissionStatus.DELETED%>">Show
    deleted submissions only</a><br />
<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}&amp;<%=Constants.SUBMISSION_TYPE_ID%>=<%=SubmissionType.FINAL_SUBMISSION_TYPE%>">Show
    final submissions only</a>

<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>


<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr><td class="title" colspan="8">Submissions</td></tr><tr>
    <td class="headerW">
        <div>&nbsp;</div>
    </td>
    <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
    <%-- need to add 1 for all the sorts because the resultsetcontainer is 0 based, and sql is 1 based--%>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Placed
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("placed")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Place</a>
            </c:otherwise>
        </c:choose>
    </td>
    <td class="header">
        Submission
        <br /><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submitter_handle")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Sort by handle</a> |
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_id")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Sort by submission ID</a>
    </td>
    <td class="headerC">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submitter_rank")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submitter<br />Rank</a>
    </td>
    <td class="headerC">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submit_date")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submit<br />Date</a>
    </td>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Screening<br />Date
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("review_date")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Screening<br />Date</a>
            </c:otherwise>
        </c:choose>
    </td>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Screener
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("reviewer_handle")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Screener</a>
            </c:otherwise>
        </c:choose>
    </td>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Score
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("final_score")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Score</a>
            </c:otherwise>
        </c:choose>
    </td>
    <td class="headerE">
        <div>&nbsp;</div>
    </td>
</tr>
<% boolean even = true;%>
<rsc:iterator list="<%=submissions%>" id="resultRow">
    <tr><td class="space" colspan="8">&nbsp;</td></tr>
    <tr class="<%=even?"light":"dark"%>">
        <td class="valueW">
            <div>&nbsp;</div>
        </td>
        <td class="valueC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                &#160;
            </c:when>
            <c:otherwise>
                <rsc:item name="placed" row="<%=resultRow%>" ifNull="-"/>
            </c:otherwise>
        </c:choose>
        </td>
        <td class="value">
            <span class="coderText"><studio:handle coderId="${resultRow.map['submitter_id']}"/></span>
            <br /><strong><rsc:item name="submission_id" row="<%=resultRow%>"/></strong>
            <br /><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>&amp;<%=Constants.SUBMISSION_ALT_TYPE%>=original><rsc:item name="original_file_name" row="<%=resultRow%>"/></a>
            <%if (resultRow.getIntItem("submission_type_id") != SubmissionType.FINAL_SUBMISSION_TYPE.intValue()) { %>
            <br /><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissionDetail&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">details</a>
            <% } %>
            <c:if test="${currentTime>contest.endTime && not empty contest.project}">
                    <c:choose>
                        <c:when test="${resultRow.map['review_status_id']==passed}">
                                <button name="submit${resultRow.map['submission_id']}" value="submit" type="submit" onclick="sendToReview(${resultRow.map['submission_id']})">
                                    <c:choose>
                                        <c:when test="${empty resultRow.map['or_submission_id']}">
                                            Send To OR
                                        </c:when>
                                        <c:otherwise>
                                            Resend To OR
                                        </c:otherwise>
                                    </c:choose>
    
                                </button>
                        </c:when>
                        <c:otherwise>
                            &nbsp;
                        </c:otherwise>
                    </c:choose>
            </c:if>
        </td>
        <td class="valueC">
            <%if (resultRow.getIntItem("submission_type_id") == SubmissionType.FINAL_SUBMISSION_TYPE.intValue()) { %>
            Final
            <% } else { %>
            <rsc:item name="submitter_rank" row="<%=resultRow%>" ifNull="-" />
            <% } %>
        </td>
        <td class="valueC">
            <rsc:item name="submit_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="review_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" timeZone="${sessionInfo.timezone}" ifNull="-"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <span class="coderText"><rsc:item name="reviewer_handle" row="<%=resultRow%>" ifNull="-"/></span>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:when test="${resultRow.map['review_status_id']==passed}">
                    <div><span class="bigGreen"><rsc:item name="review_status_desc" row="<%=resultRow%>" ifNull="-"/></span></div>
                </c:when>
                <c:otherwise>
                    <div><span class="bigRed"><rsc:item name="review_status_desc" row="<%=resultRow%>" ifNull="-"/></span></div>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="final_score" row="<%=resultRow%>" format="0.00" ifNull=""/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueE">
            <div>&nbsp;</div>
        </td>
    </tr>
    <% even = !even;%>
</rsc:iterator>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>

<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>

</form>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>