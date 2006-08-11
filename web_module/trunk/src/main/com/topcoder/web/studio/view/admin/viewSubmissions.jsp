<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
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
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script language="JavaScript"><!--
    function next() {
        document.subForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getEndRow()+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.subForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
        document.subForm.<%=Constants.REVIEW_STATUS_ID%>.value = '<%=request.getParameter(Constants.REVIEW_STATUS_ID)==null?"":request.getParameter(Constants.REVIEW_STATUS_ID)%>';
        document.subForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
        document.subForm.submit();
    }
    function previous() {
        document.subForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getEndRow()-Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
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
<div class="contentOut">
<jsp:include page="../top.jsp" />
<jsp:include page="../topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">back to
    Contests</A></div>

<div class="breadcrumb">
    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">Contests</a>
    &gt;
    <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">${submission.contest.name}</a>
    &gt; Submissions
</div>

<h1>Submissions</h1>

<%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
<form action="${sessionInfo.secureAbsoluteServletPath}" method="GET" name="subForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminViewSubmissions"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
<input type="hidden" name="<%=Constants.REVIEW_STATUS_ID%>" value=""/>
<input type="hidden" name="<%=Constants.HANDLE%>" value=""/>


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
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>

<table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
<tbody>
<tr>
    <td class="NW">&nbsp;</td>
    <td class="title" colspan="7">Submissions</td>
    <td class="NE">&nbsp;</td>
</tr>
<tr>
    <td class="headerW"><div>&nbsp;</div></td>
    <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
    <%-- need to add 1 for all the sorts because the resultsetcontainer is 0 based, and sql is 1 based--%>
    <td class="header">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submitter_handle")+1%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submitter</a>
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
    <td class="headerE"><div>&nbsp;</div></td>
</tr>
<rsc:iterator list="<%=submissions%>" id="resultRow">

    <tr class="light">
        <td class="valueW"><div>&nbsp;</div></td>
        <td class="value">
            <span class="coderText"><rsc:item name="submitter_handle" row="<%=resultRow%>"/></span>
        </td>
        <td class="value">
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminDownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                <rsc:item name="original_file_name" row="<%=resultRow%>"/></a>
        </td>
        <td class="valueC">
            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissionDetail&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">details</a>
        </td>
        <td class="valueC">
            <rsc:item name="submit_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="review_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="reviewer_handle" row="<%=resultRow%>"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${unMarkedOnly}">
                    &#160;
                </c:when>
                <c:otherwise>
                    <rsc:item name="review_status_desc" row="<%=resultRow%>"/>
                </c:otherwise>
            </c:choose>
        </td>
        <td class="valueE"><div>&nbsp;</div></td>
    </tr>
</rsc:iterator>
<tr>
    <td class="SW" colspan="8">&nbsp;</td>
    <td class="SE">&nbsp;</td>
</tr>
</tbody>
</table>

<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"statText\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"statText\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="../foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>