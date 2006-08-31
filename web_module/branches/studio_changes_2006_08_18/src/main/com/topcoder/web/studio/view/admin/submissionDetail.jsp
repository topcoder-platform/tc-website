<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.model.ReviewStatus" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <c:set value="<%=Constants.REVIEW_STATUS_ID%>" var="reviewStatus"/>
    <c:set value="<%=Constants.SUBMISSION_REVIEW_TEXT%>" var="reviewText"/>
    <script language="javascript" type="text/javascript">
        <!--
        var passed = "I am happy to inform you that your TopCoder Studio submission has passed the initial review.  " +
                     "It will be presented to the client and may be chosen as the winner.\n\n" +
                     "You will be notified of the contest results via email.\n\n" +
                     "Best of luck to you at the Studio!";
        var failed = "Unfortunately, your TopCoder Studio submission has failed review for the following reason(s):\n\n" +
                     "You may fix and resubmit your work before the submission deadline: " +
                     "<tc-webtag:format object="${submission.contest.endTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${submission.submitter.timeZone.description}"/>.\n\n"+
                     "Best of luck to you at the Studio!";
            function choose() {
               var text = getValue("document.reviewForm", "${reviewText}");
               if ( text==null || text.length==0) {
                    if (getValue("document.reviewForm", "${reviewStatus}")==<%=ReviewStatus.PASSED%>) {
                        putValue("document.reviewForm", "${reviewText}", passed);
                    } else if (getValue("document.reviewForm", "${reviewStatus}")==<%=ReviewStatus.FAILED%>) {
                        putValue("document.reviewForm", "${reviewText}", failed);
                    }
                }
            }
        -->
    </script>

</head>

<body>

<div align="center">
    <div class="contentOut">
        <jsp:include page="../top.jsp"/>
        <jsp:include page="../topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminViewContests">Contests</a>
                    &gt;
                    <a href="${sessionInfo.servletPath}?module=AdminViewContest&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">${submission.contest.name}</a>
                    &gt;
                    <a href="${sessionInfo.servletPath}?module=AdminViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">Submissions</a>
                    &gt; ${submission.submitter.handle} - ${submission.originalFileName}
                </div>

                <h1>Submission Detail</h1>

                <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="reviewForm">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminSubmitReview"/>
                    <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>" value="${submission.id}"/>

                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=AdminDownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">View
                        Submission</a><br>
                    Reviewer: ${submissionReview.reviewer.handle}<br>
                    Status:
                    <tc-webtag:objectSelect name="<%=Constants.REVIEW_STATUS_ID%>" list="${reviewStatuses}" valueField="id" textField="description" onChange="choose()"/>
                    <br><br>
                    Dear ${submission.submitter.handle},<br><br>
                    This email is in regards to your submission ${submission.originalFileName} at &lt;time&gt;
                    <br><br>
                    <tc-webtag:textArea name="<%=Constants.SUBMISSION_REVIEW_TEXT%>" rows="10" cols="80"/>
                    <br><br>
                    Sincerely,<br>
                    ${currentUser.firstName} ${currentUser.lastName}<br>
                    TopCoder Studio<br>
                    <button name="submit" value="submit" type="submit">Submit</button>
                </form>

                <br/> <br/>

                <div class="header">Contest Results</div>

                <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="placedForm">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminSetPlace"/>
                    <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>" value="${submission.id}"/>

                    <p>
                        Place:
                        <tc-webtag:objectSelect name="<%=Constants.PRIZE_ID%>" list="${submission.contest.prizes}" valueField="id" textField="place"/>
                        <button name="submit" value="submit" type="submit">Save</button>
                    </p>
                </form>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="../foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>