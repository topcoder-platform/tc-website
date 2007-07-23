<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ContestProperty" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<% ResultSetContainer submissions = (ResultSetContainer) request.getAttribute("submissions");%>

<c:set value="<%=ContestProperty.VIEWABLE_SUBMITTERS%>" var="viewSubmitters"/>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script type="text/javascript"><!--
    function next() {
    <%--we're using sublist on the back end, so we need to work with 0 based indexes rather than 1 --%>
        var myForm = document.submissionsForm;
        myForm.<%=DataAccessConstants.START_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE%>;
        myForm.<%=DataAccessConstants.END_RANK%>.value =<%=submissions.getStartRow()-1+Constants.VIEW_SUBMISSIONS_SCROLL_SIZE*2%>;
        myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
        myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
    <c:if test="${contest.configMap[viewSubmitters]}">
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
    <c:if test="${contest.configMap[viewSubmitters]}">
        myForm.<%=Constants.HANDLE%>.value = '<%=request.getParameter(Constants.HANDLE)==null?"":request.getParameter(Constants.HANDLE)%>';
    </c:if>
        myForm.submit();
    }
    //--></script>
</head>

<body>

<div align="center">
<div id="contentOut" class="contentOut">
<jsp:include page="top.jsp"/>
<jsp:include page="topNav.jsp">
    <jsp:param name="node" value="contests"/>
</jsp:include>
<div id="contentIn" class="contentIn">
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
    ${contest.name}
</div>

<h1>Submissions</h1>

<form name="submissionsForm" method="get" action="${sessionInfo.servletPath}">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ViewSubmissions"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
<input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_COLUMN%>" value=""/>
<input type="hidden" name="<%=DataAccessConstants.SORT_DIRECTION%>" value=""/>
<c:if test="${contest.configMap[viewSubmitters]}">
    You can enter a handle here to see only submissions by that competitor:
    <tc-webtag:textInput name="<%=Constants.HANDLE%>"/>
    <button name="handleSubmit" value="submit" type="submit">Submit</button>
</c:if>


<div class="pagingBox">
    <%=(submissions.croppedDataBefore() ? "<a href=\"Javascript:previous()\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(submissions.croppedDataAfter() ? "<a href=\"Javascript:next()\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
</div>
<table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
    <tbody>
        <tr>
            <td class="NW">&nbsp;</td>
            <c:choose>
                <c:when test="${contest.configMap[viewSubmitters]}">
                    <td class="title" colspan="5">Submissions</td>
                </c:when>
                <c:otherwise>
                    <td class="title" colspan="4">Submissions</td>
                </c:otherwise>
            </c:choose>
            <td class="NE">&nbsp;</td>
        </tr>
        <tr>
            <td class="headerW"><div>&nbsp;</div></td>
            <% String exclude = Constants.MODULE_KEY + " " + DataAccessConstants.START_RANK + " " + DataAccessConstants.END_RANK;%>
            <c:if test="${contest.configMap[viewSubmitters]}">
                <td class="header">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("handle_lower")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
                    Handle</a>
                </td>
            </c:if>
            <td class="headerC" nowrap="nowrap" width="50%">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submission_id")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
                    Submission ID</a>
            </td>
            <td class="headerC" nowrap="nowrap" width="50%">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("create_date")%>" includeParams="true" excludeParams="<%=exclude%>"/>">
                    Submitted</a>
            </td>
            <td class="headerR">
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("final_score")%>" includeParams="true" excludeParams="<%=exclude%>"/>">Score</a>
            </td>
            <td class="headerC">
                Submission
            </td>
            <td class="headerE"><div>&nbsp;</div></td>
        </tr>
        <% boolean even = true;
            int i = 0; %>
        <rsc:iterator list="<%=submissions%>" id="resultRow">
            <tr class="<%=even?"light":"dark"%>">
                <td class="valueW"><div>&nbsp;</div></td>
                <c:if test="${contest.configMap[viewSubmitters]}">
                    <td class="value">
                        <studio:handle coderId="<%=resultRow.getLongItem("user_id")%>"/>
                    </td>
                </c:if>
                <td class="valueC">
                    <rsc:item name="submission_id" row="<%=resultRow%>"/>
                </td>
                <td class="valueC" nowrap="nowrap">
                    <rsc:item name="create_date" row="<%=resultRow%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z" timeZone="${sessionInfo.timezone}"/>
                </td>
                <td class="valueR">
                    <c:choose>
                        <c:when test="${hasScores}">
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewSubmissionResults&amp;<%=Constants.SUBMISSION_ID%>=${resultRow.map['submission_id']}">
                                <rsc:item name="final_score" row="<%=resultRow%>" format="0.00"/>
                            </a>
                        </c:when>
                        <c:otherwise>
                            n/a
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="valueC">

                    <c:choose>
                        <c:when test="<%=resultRow.getBooleanItem("is_image")%>">
                            <div align="center" style="overflow: hidden; width: 300px;">
                                <studio_tags:submissionDisplay submissionId="${resultRow.map['submission_id']}" width="${resultRow.map['width']}" height="${resultRow.map['height']}"/>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div align="center">
                            <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
                            <A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                            <img src="/i/layout/magnify.gif" alt="" onmouseover="popUp(this,'pop<%=i%>')" onmouseout="popHide()" />
                            </A>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="valueE"><div>&nbsp;</div></td>
            </tr>
            <% even = !even;
                i++; %>
        </rsc:iterator>
        <tr>
            <c:choose>
                <c:when test="${contest.configMap[viewSubmitters]}">
                    <td class="SW" colspan="6">&nbsp;</td>
                </c:when>
                <c:otherwise>
                    <td class="SW" colspan="5">&nbsp;</td>
                </c:otherwise>
            </c:choose>


            <td class="SE">&nbsp;</td>
        </tr>

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
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>