<%@ page import="com.topcoder.web.creative.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

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

        <h1>Submission Detail</h1>

        <div class="tableHolder">
            <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="reviewForm">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminSubmitReview"/>
                <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>" value="${submission.id}"/>

                <p>

                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">Contests</a> &gt;
                    <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">${submission.contest.name}</a>
                    &gt;
                    <a href="${sessionInfo.servletPath}?module=AdminViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">submissions</a>
                    &gt;
                    ${submission.submitter.handle} - ${submission.originalFileName}
                </p>

                <p>
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminDownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">View
                        Submission</a>
                </p>

                <p>Reviewer: ${submissionReview.reviewer.handle}</p>


                <p>Status:
                    <tc-webtag:objectSelect name="<%=Constants.REVIEW_STATUS_ID%>" list="${reviewStatuses}" valueField="id" textField="description"/></p>

                <p><tc-webtag:textArea name="<%=Constants.SUBMISSION_REVIEW_TEXT%>" rows="5" cols="40"/></p>
                <button name="submit" value="submit" type="submit">Submit</button>
            </form>
        </div>

        <jsp:include page="../creativeFoot.jsp"/>
    </div>
</div>
</body>
</html>
