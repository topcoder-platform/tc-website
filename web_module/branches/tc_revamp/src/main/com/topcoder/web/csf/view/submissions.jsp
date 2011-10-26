<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <script type="text/javascript"><!--
    function next() {
    <%--we're using sublist on the back end, so we need to work with 0 based indexes rather than 1 --%>
        var myForm = document.submissionsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        myForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE*2%>;
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${isOver}">
        myForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        myForm.submit();
    }
    function previous() {
        var myForm = document.submissionsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1-Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        myForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-1%>;
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${isOver}">
        myForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        myForm.submit();
    }
    //--></script>
</head>

<body>

<div align="center">
<div id="content">

<jsp:include page="top.jsp"/>

<jsp:include page="primaryNav.jsp">
    <jsp:param name="selectedTab" value="competitions"/>
</jsp:include>

<div id="main">
<div class="pageHeader">
    <span class="pageName">Submissions</span>
</div>

<div class="linkBox">
    <csf:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <div style="float:left;"><A href="/?module=Static&amp;d1=competitions">Competitions</A> >&nbsp;</div>
    <div style="float:left; margin-bottom: 10px;">
    <c:choose>
        <c:when test="${isOver}">
            <A href="${sessionInfo.servletPath}?module=ViewPastContests">Past Creative Competitions</A> &gt;
        </c:when>
        <c:otherwise>
            <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Creative Competitions</A> &gt;
        </c:otherwise>
    </c:choose>
    ${contest.name}
    </div>
</div>

<br style="clear: both;" />

<form name="submissionsForm" method="get" action="${sessionInfo.servletPath}">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewSubmissions"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
<c:if test="${isOver}">
    You can enter a handle here to see only submissions by that competitor:
    <tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
    <button name="handleSubmit" value="submit" type="submit">Submit</button>
</c:if>


<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>
<table class="stat" cellpadding="0" cellspacing="0" style="width:100%;">
    <tbody>
        <tr>
            <c:choose>
                <c:when test="${isOver}">
                    <td class="title" colspan="3"><span class="title">Submissions</span></td>
                </c:when>
                <c:otherwise>
                    <td class="title" colspan="3"><span class="title">Submissions</span></td>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
            <c:if test="${isOver}">
                <td class="header">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submitter</a>
                </td>
            </c:if>
            <td class="headerC" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_id")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
                    Submission ID</a>
            </td>
            <td class="headerC" nowrap="nowrap">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("create_date")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submit
                    Date</a>
            </td>
<%--
            <td class="headerC" width="100%">
                Submission
            </td>
--%>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=submissions%>" id="resultRow">
            <tr class="<%=even?"light":"dark"%>">
                <c:if test="${isOver}">
                    <td class="value">
                        <csf:handle coderId="<%=resultRow.getLongItem("user_id")%>"/>
                    </td>
                </c:if>
                <td class="valueC">
                    <rsc:item name="submission_id" row="<%=resultRow%>"/>
                </td>
                <td class="valueC" nowrap="nowrap">
                    <rsc:item name="create_date" row="<%=resultRow%>" format="MM.dd.yyyy HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
<%--
                <td class="valueC">

                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                            <img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>" alt=""/>
                        </c:when>
                        <c:otherwise>
                            <div align="center">
                                <div id="pop<%=i%>" class="popUp">
                                    <div>Download submission</div>
                                </div>
                                <A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                                    <img src="/i/layout/disk.gif" alt="" onMouseOver="popUp(this,'pop<%=i%>')" onMouseOut="popHide()"/>
                                </A>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
--%>
            </tr>
            <% even = !even;
                i++; %>
        </rsc:iterator>
    </tbody>
</table>
<br>
            <span class="small">
            <strong>NOTE:</strong> only passing submissions are included
            </span><br>

<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>


</form>

</div>

<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>