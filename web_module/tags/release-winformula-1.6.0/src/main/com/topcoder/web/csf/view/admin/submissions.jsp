<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>


<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
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
    //--></script>

</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="../top.jsp"/>

<jsp:include page="../primaryNav.jsp">
    <jsp:param name="selectedTab" value="competitions"/>
</jsp:include>

<div id="main">
<div class="pageHeader">
    <span class="pageName">Submissions</span>
</div>

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">back to
    Contests</A></div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">Contests</a>
    &gt;
    <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${contest.id}">${contest.name}</a>
    &gt; Submissions
</div>

<%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
<form action="${sessionInfo.secureAbsoluteServletPath}" method="GET" name="subForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminViewSubmissions"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
<input type="hidden" name="<%=Constants.REVIEW_STATUS_ID%>" value=""/>


Showing <strong>${count}</strong> Submissions for <strong>${contest.name}</strong>
<br><br>
Show submissions by (Enter Handle):
<tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
<br><br>
<c:forEach items="${reviewStatuses}" var="reviewStatus">
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions&amp;<%=Constants.REVIEW_STATUS_ID%>=${reviewStatus.id}&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Only
        show submissions that ${reviewStatus.description}</a><br>
</c:forEach>
<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions&amp;<%=Constants.REVIEW_STATUS_ID%>=null&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Only
    show submissions that are unmarked</a><br>
<a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Show
    all submissions</a>

<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>

<table class="stat" cellpadding="0" cellspacing="0" style="width:100%;">
<tbody>
<tr>
    <td class="title" colspan="8"><span class="title">Submissions</span></td>
</tr>
<tr>
    <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
    <%-- need to add 1 for all the sorts because the resultsetcontainer is 0 based, and sql is 1 based--%>
    <td class="header">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submitter_handle")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submitter</a>
    </td>
    <td class="headerC">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submitter_rank")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submitter
            Rank</a>
    </td>
    <td class="header">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("original_file_name")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submission</a>
    </td>
    <td class="headerC">&nbsp;</td>
    <td class="headerC">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submit_date")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submit
            Date</a>
    </td>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Review Date
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("review_date")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Review
                    Date</a>
            </c:otherwise>
        </c:choose>
    </td>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Reviewer
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("reviewer_handle")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Reviewer</a>
            </c:otherwise>
        </c:choose>
    </td>
    <td class="headerC">
        <c:choose>
            <c:when test="${unMarkedOnly}">
                Status
            </c:when>
            <c:otherwise>
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("review_status_desc")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Status</a>
            </c:otherwise>
        </c:choose>
    </td>
</tr>
<% boolean even = true;%>
<rsc:iterator list="<%=submissions%>" id="resultRow">

    <tr class="<%=even?"light":"dark"%>">
        <td class="value">
            <span class="coderText"><rsc:item name="submitter_handle" row="<%=resultRow%>"/></span>
        </td>
        <td class="valueC">
            <rsc:item name="submitter_rank" row="<%=resultRow%>"/>
        </td>
        <td class="value">
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminDownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                <rsc:item name="original_file_name" row="<%=resultRow%>"/>
            </a>
        </td>
        <td class="valueC">
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissionDetail&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">details</a>
        </td>
        <td class="valueC">
            <rsc:item name="submit_date" row="<%=resultRow%>" format="MM.dd.yyyy'<br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="review_date" row="<%=resultRow%>" format="MM.dd.yyyy'<br>'HH:mm z" timeZone="${sessionInfo.timezone}" ifNull="&#160;"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="reviewer_handle" row="<%=resultRow%>" ifNull="&#160;"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="review_status_desc" row="<%=resultRow%>" ifNull="&#160;"/>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>
    <% even = !even;%>
</rsc:iterator>
</tbody>
</table>

<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>

</form>

</div>

<jsp:include page="../foot.jsp"/>
</div>
</div>

</body>
</html>