<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.creative.Constants" %>
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
    <title>TopCoder FX</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_creative"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../creativeTop.jsp">
    <jsp:param name="section" value="default"/>
</jsp:include>

<jsp:include page="adminLeft.jsp">
    <jsp:param name="node" value="home"/>
</jsp:include>

<div class="contentOuter">
    <div class="contentInner">

        <h1>Submission List</h1>

        <%-- without this div, the table inside stretches way outside the window, only in IE of course --%>
        <div class="tableHolder">
            <form action="${sessionInfo.secureAbsoluteServletPath}" method="GET" name="subForm">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminViewSubmissions"/>
                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

                <table class="stat" cellpadding="0" cellspacing="0" style="width:100%">
                    <tbody>
                        <tr>
                            <td class="title" colspan="7">Submissions for ${contest.name}</td>
                        </tr>
                        <tr>
                            <td colspan="7">Show submissions by (Enter Handle):
                                <tc-webtag:textInput name="<%=Constants.HANDLE%>"/></td>
                        </tr>
                        <c:forEach items="${reviewStatuses}" var="reviewStatus">
                            <tr>
                                <td colspan="7">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions&amp;<%=Constants.REVIEW_STATUS_ID%>=${reviewStatus.id}&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Only
                                        show submissions that ${reviewStatus.description}</a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="7">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions&amp;<%=Constants.REVIEW_STATUS_ID%>=null&amp;<%=Constants.CONTEST_ID%>=${contest.id}">Only
                                    show submissions that are unmarked</a>
                            </td>
                        </tr>

                        <tr>
                            <td class="headerC"></td>
                            <td class="header">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submitter_handle")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submitter</a>
                            </td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("original_file_name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submission</a>
                            </td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("submit_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submit
                                    Date</a>
                            </td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("review_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Review
                                    Date</a>
                            </td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("reviewer_handle")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Reviewer</a>
                            </td>
                            <td class="headerC">
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissions<tc-webtag:sort column="<%=submissions.getColumnIndex("review_status_desc")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Status</a>
                            </td>
                        </tr>
                        <rsc:iterator list="<%=submissions%>" id="resultRow">

                            <tr class="light">
                                <td class="valueC">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewSubmissionDetails&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">details</a>
                                </td>
                                <td class="valueC">
                                    <rsc:item name="submitter_handle" row="<%=resultRow%>"/>
                                </td>
                                <td class="valueC">
                                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminDownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                                        <rsc:item name="original_file_name" row="<%=resultRow%>"/></a>
                                </td>
                                <td class="valueC">
                                    <rsc:item name="submit_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="valueC">
                                    <rsc:item name="review_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="${sessionInfo.timezone}"/>
                                </td>
                                <td class="valueC">
                                    <rsc:item name="reviewer_handle" row="<%=resultRow%>"/>
                                </td>
                                <td class="valueC">
                                    <rsc:item name="review_status_desc" row="<%=resultRow%>"/>
                                </td>
                            </tr>
                        </rsc:iterator>

                    </tbody>
                </table>
        </div>

        <jsp:include page="../creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
