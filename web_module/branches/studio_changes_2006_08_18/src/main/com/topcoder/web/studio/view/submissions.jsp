<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript"><!--
    function next() {
    <%--we're using sublist on the back end, so we need to work with 0 based indexes rather than 1 --%>
        document.subForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-2+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE*2%>;
        document.subForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.subForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${isOver}">
        document.subForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        document.subForm.submit();
    }
    function previous() {
        document.subForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1-Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        document.subForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-2%>;
        document.subForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        document.subForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${isOver}">
        document.subForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        document.subForm.submit();
    }
    //--></script>
</head>

<body>

<div align="center">
<div class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">
    <div class="linkBox"><studio:forumLink forumID="${contest.forumId}"/></div>

    <div class="breadcrumb">
        <c:choose>
            <c:when test="${isOver}">
                <A href="${sessionInfo.servletPath}?module=ViewPastContests">Past Contests</A> &gt;
            </c:when>
            <c:otherwise>
                <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A> &gt;
            </c:otherwise>
        </c:choose>
        <c:if test="${isOver}">
            ${contest.name}
    </div>

    <h1>Submissions</h1>


    <form action="${sessionInfo.servletPath}" method="GET" name="subForm">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewSubmissions"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
        <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
        <input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
        <input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
        <c:if test="${isOver}">
        You can enter a handle here to see only submissions by that competitor:
            <tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
        <button name="submit" value="submit" type="submit">Submit</button>
        </c:if>


        <table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
            <tbody>
                <tr>
                    <td class="NW">&nbsp;</td>
                    <td class="title" colspan="5">Submissions</td>
                    <td class="NE">&nbsp;</td>
                </tr>
                <tr>
                    <td class="headerW"><div>&nbsp;</div></td>
                    <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
                    <c:if test="${isOver}">
                        <td class="header">
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submitter</a>
                        </td>
                    </c:if>
                    <td class="headerC">
                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("create_date")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Submit
                            Date</a>
                    </td>
                    <td class="header">
                        Submission
                    </td>
                    <td class="headerC">&nbsp;</td>
                </tr>
                <rsc:iterator list="<%=submissions%>" id="resultRow">

                    <tr class="light">
                        <td class="valueW"><div>&nbsp;</div></td>
                        <c:if test="${isOver}">
                            <td class="value">
                                <studio:handle coderId="<%=resultRow.getLongItem("user_id")%>"/>
                            </td>
                        </c:if>
                        <td class="valueC">
                            <rsc:item name="create_date" row="<%=resultRow%>" format="MM.dd.yyyy HH:mm z" timeZone="${sessionInfo.timezone}"/>
                        </td>
                        <td class="value">

                            <c:choose>
                                <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                                    <img src="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>" alt=""/>
                                </c:when>
                                <c:otherwise>
                                    <A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">view
                                        submission</A>
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
            <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
            | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
        </div>


</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>