<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>
<%@ page import="com.topcoder.web.winformula.model.ReviewStatus" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="winformula_tags" tagdir="/WEB-INF/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Winformula Developer Challenge :: Powered by TopCoder</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <c:set value="<%=Constants.REVIEW_STATUS_ID%>" var="reviewStatus"/>
    <c:set value="<%=Constants.SUBMISSION_REVIEW_TEXT%>" var="reviewText"/>
    <script language="javascript" type="text/javascript">
        <!--
<%--        var passed = "I am happy to inform you that your TopCoder Winformula submission has passed screening and will enter " +
                     "into Online Review to be scored. Your submission will then be presented to the client.\n\n" +
                    "If your submission wins a placement designated by Online Review and/or is chosen by the client as " +
                    "a winning submission, you will be notified via email.\n\n" +
                    "Best of luck to you at the Winformula!";
--%>
            var passed="I am happy to inform you that your TopCoder Winformula submission has passed screening and will be presented to the client.\n\n" +
                       "If your submission wins a placement and/or is chosen by the client as a winning submission, you will be notified via email.\n\n" +
                       "Best of luck to you at the Winformula!";
                    
        var failed = "Unfortunately, your TopCoder Winformula submission has failed screening for the following reason(s):\n\n" +
<%--
                     "You may fix and resubmit your work before the submission deadline: " +
                     "<tc-webtag:format object="${submission.contest.endTime}" format="EEEE, MMMM d, yyyy 'at' HH:mm z" timeZone="${submission.submitter.timeZone.description}"/>.\n\n"+
--%>
                     "Best of luck to you at the Winformula!";
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
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../tcTop.jsp"/>
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

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">Contests</a>
                    &gt;
                    <a href="${sessionInfo.servletPath}?module=ViewContest&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">${submission.contest.name}</a>
                    &gt;
                    <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${submission.contest.id}">Submissions</a>
                    &gt; ${submission.submitter.handle} - ${submission.originalFileName}
                </div>

                <h1>Submission Detail</h1>

                <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="reviewForm">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitReview"/>
                    <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>" value="${submission.id}"/>


                    <c:choose>
                        <c:when test="${submission.mimeType.fileType.imageFile}">
                            <winformula_tags:submissionDisplay submissionId="${submission.id}" width="${submission.width}" height="${submission.height}" isAdminSite="true" includeLink="false"/>
                        </c:when>
                        <c:otherwise>
                            <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=${submission.id}">View
                                Submission</a>
                        </c:otherwise>
                    </c:choose>
                    <br/>


                    <c:if test="${submissionReview.reviewer!=null}">
                        Reviewer: ${submissionReview.reviewer.handle}<br />
                    </c:if>
                    <c:if test="${submission.rank!=null}">
                        Submitter Rank: ${submission.rank}<br />
                    </c:if>
                    Status:
                    <tc-webtag:objectSelect name="<%=Constants.REVIEW_STATUS_ID%>" list="${reviewStatuses}" valueField="id" textField="description" onChange="choose()"/>
                    <br /><br />
                    Dear ${submission.submitter.handle},<br /><br />
                    This email is in regards to your submission ${submission.originalFileName} at &lt;time&gt;
                    <br /><br />
                    <tc-webtag:textArea name="<%=Constants.SUBMISSION_REVIEW_TEXT%>" rows="10" cols="80"/>
                    <br /><br />
                    Sincerely,<br />
                    ${currentUser.firstName} ${currentUser.lastName}<br />
                    TopCoder Winformula<br />
                    <button name="submit" value="submit" type="submit">Submit</button>
                </form>

                <br/> <br/>

                <c:set value="<%=ReviewStatus.PASSED%>" var="passedStatus"/>
                <c:set var="clientPrize" value="<%=PrizeType.BONUS%>"/>

                <c:if test="${submissionReview.status.id==passedStatus}">
                    <div class="header">Contest Results</div>

                    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="prizeRemoveForm">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RemoveSubmissionPrize"/>
                        <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>" value="${submission.id}"/>
                        <tc-webtag:hiddenInput name="<%=Constants.PRIZE_ID%>"/>


                        <c:forEach items="${submission.prizes}" var="prize">
                            <c:choose>
                                <c:when test="${clientPrize==prize.type.id}">
                                    <div style="float: right; clear: right; text-align: right;">
                                        <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                        <button onClick="document.prizeRemoveForm.<%=Constants.PRIZE_ID%>.value ='${prize.id}'">
                                        Remove
                                        </button>
                                        <br />
                                    </div>
                                    <strong>${prize.type.description}:</strong><br />
                                </c:when>
                                <c:otherwise>
                                    <div style="float: right; clear: right; text-align: right;">
                                        <fmt:formatNumber value="${prize.amount}" pattern="$###,###.00"/>
                                        <button onClick="document.prizeRemoveForm.<%=Constants.PRIZE_ID%>.value ='${prize.id}'">
                                        Remove
                                        </button>
                                        <br />
                                    </div>
                                    <strong>Prize ${prize.place}:</strong><br />
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                    </form>



                    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="placedForm">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AddSubmissionPrize"/>
                        <tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_ID%>" value="${submission.id}"/>

                        <p>
                            Place:
                            <tc-webtag:listSelect name="<%=Constants.PRIZE_ID%>" list="${prizes}"/>
                            <button name="submit" value="submit" type="submit">Add</button>
                        </p>
                    </form>

                </c:if>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../tcFoot.jsp"/>

    </div>
</body>
</html>