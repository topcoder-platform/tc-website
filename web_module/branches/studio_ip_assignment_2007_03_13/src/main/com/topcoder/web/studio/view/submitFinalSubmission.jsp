<%@ page import="com.topcoder.web.studio.Constants, com.topcoder.web.studio.model.SubmissionType" %>
<%@ page import="com.topcoder.web.common.model.AssignmentDocumentStatus" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />
<c:set var="ASSIGNMENT_DOCUMENT_ID" value="assignment_document_id" />

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>

    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script language="javascript" type="text/javascript">
        <!--
        function changeRank(newRank, submissionId) {
        var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=UpdateSubmissionRank&<%=Constants.SUBMISSION_RANK%>=' + newRank + '&<%=Constants.SUBMISSION_ID%>=' + submissionId);
            ajaxRequest.setPostRequest(fader);
        <%--
                    ajaxRequest.setPreRequest(yellower);
        --%>
        ajaxRequest.sendRequest();
        }
        function fader() {
            Fat.fade_element('fade0');
            Fat.fade_element('fade1');
            Fat.fade_element('fade2');
            Fat.fade_element('fade3');
            Fat.fade_element('fade4');
            Fat.fade_element('fade5');
            Fat.fade_element('fade6');
            Fat.fade_element('fade7');
            Fat.fade_element('fade8');
        }
        function batchUpdate() {
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=BatchUpdateRank&<%=Constants.CONTEST_ID%>=${contest.id}&<%=Constants.SUBMISSION_TYPE_ID%>=<%=SubmissionType.FINAL_SUBMISSION_TYPE%>');
        <c:forEach items="${submissions}" var="submission">
            ajaxRequest.addNamedFormElements("<%=Constants.SUBMISSION_ID%>${submission.id}");
        </c:forEach>
            ajaxRequest.sendRequest();
        }
        new Image().src="/i/layout/processing.gif";
        function showProcessing() {
            document.getElementById("submitButton").innerHTML='<img src="/i/layout/processing.gif" alt=""/>';
        }

        // -->
    </script>
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


<div class="linkBox">
    <studio:forumLink forumID="${contest.forumId}"/>
</div>

<div class="breadcrumb">
    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A> &gt;
    ${contest.name}
</div>

<h1>Upload Your Final Submission</h1>

<div align="center">
    <div align="left" style="width:500px; margin-top: 20px;">
        <form action="${sessionInfo.servletPath}" method="POST" name="submitForm" enctype="multipart/form-data" onsubmit="showProcessing()">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SubmitFinalSubmission"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

            <div align="center">
                <c:choose>
                    <c:when test="${!has_hard_copy}">
                        <p><strong>Remember that in order to get paid you must send a signed copy of the Assignment document</strong></p>
                    </c:when>
                    <c:when test="${has_hard_copy and assignment_document.status.id == PENDING_STATUS_ID}">
                        <p><a href="/?module=ViewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}">click here for a printer friendly version of the assignment document</a></p>
                        <p><iframe  width="100%" height="300" marginWidth="5"
                            src="/?module=Static&d1=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                        </p>
                        <p>
                        <tc-webtag:errorIterator id="err" name="<%=Constants.ACCEPT_AD_ERROR%>"><span class="bigRed">${err}</span>
                        <br></tc-webtag:errorIterator>
                        <tc-webtag:chkBox name="<%=Constants.ACCEPT_AD%>"/> I accept
                        </p>                
                    </c:when>
                    <c:otherwise>
                        <tc-webtag:hiddenInput name="<%=Constants.ACCEPT_AD%>" value="on"/>
                        You have already accepted the Assignment Document.
                    </c:otherwise>
                </c:choose>
            </div>
            <br/>
            <p>Please use the form below to upload your submission:</p>
    
            <p>The maximum file size per submission is 2MB.</p>

            <p>Only z ZIP Archive file type will be accepted:</p>

            <div align="center">
                <p>
                    <b>My design:</b><br/>
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION%>"><span class="bigRed">${err}</span>
                                        <br></tc-webtag:errorIterator>
                    <input type="file" name="<%=Constants.SUBMISSION%>">
                </p>
                <p>
                    <tc-webtag:errorIterator id="err" name="<%=Constants.SUBMISSION_RANK%>"><span class="bigRed">${err}</span>
                        <br></tc-webtag:errorIterator>
                    as rank:&nbsp;<tc-webtag:textInput name="<%=Constants.SUBMISSION_RANK%>" maxlength="3" size="2"/>
                </p>
                <p id="submitButton">
                    <input type="image" src="/i/layout/btnSubmit.png" onmouseover="this.src='/i/layout/btnSubmitOn.png'" onmouseout="this.src='/i/layout/btnSubmit.png'">
                </p>
            </div>
        </form>
    </div>
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