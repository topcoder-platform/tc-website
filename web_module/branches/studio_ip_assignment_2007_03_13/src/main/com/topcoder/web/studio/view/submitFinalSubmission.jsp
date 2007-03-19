<%@ page import="com.topcoder.web.studio.Constants, com.topcoder.web.studio.model.SubmissionType" %>
<%@ page import="com.topcoder.web.common.model.AssignmentDocumentStatus" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="PENDING_STATUS_ID" value="<%= AssignmentDocumentStatus.PENDING_STATUS_ID + "" %>" />

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

<h1>Submit Your Final Submission</h1>

<div align="center">
    <div align="left" style="width:500px; margin-top: 20px;">
        <form action="${sessionInfo.servletPath}" method="POST" name="submitForm" enctype="multipart/form-data" onsubmit="showProcessing()">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>
            <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

            <c:choose>
                <c:when test="${!has_hard_copy}">
                    <p>Remember that in order to get paid you must send a signed copy of the Assignment document</p>
                </c:when>
                <c:when test="${has_hard_copy and assignment_document.status.id == PENDING_STATUS_ID}">
                    <p><iframe  width="100%" height="300" marginWidth="5"
                        src="/?module=Static&d1=viewAssignmentDocumentText&${ASSIGNMENT_DOCUMENT_ID}=${assignment_document.id}"></iframe>
                    </p>
                    <tc-webtag:errorIterator id="err" name="<%=Constants.ACCEPT_AD%>"><span class="bigRed">${err}</span>
                    <br></tc-webtag:errorIterator>
                    <tc-webtag:chkBox name="<%=Constants.ACCEPT_AD%>"/> I accept
                    </p>                
                </c:when>
                <c:otherwise>
                    You have already accepted the Assignment Document.
                </c:otherwise>
            </c:choose>
    
            <p>Please use the form below to upload your submission:</p>
    
            <p>The maximum file size per submission is 2MB.</p>

            <p>Only the following file types will be accepted:</p>
            <ul>
                <c:forEach items="${contest.fileTypes}" var="fileType">
                    <li>
                            ${fileType.description}
                    </li>
                </c:forEach>
            </ul>

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


<div style="margin: 40px 0px 20px 0px;">
<form name="submissionForm" action="#">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="BatchUpdateRank"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>" value="${contest.id}"/>
<tc-webtag:hiddenInput name="<%=Constants.SUBMISSION_TYPE_ID%>" value="<%=SubmissionType.FINAL_SUBMISSION_TYPE.toString()%>"/>

<div align="center">
   <strong>In the table below</strong> you can rank your submissions.
</div>

<br><br>
<table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
<thead>
    <tr>
        <td class="NW">&nbsp;</td>
        <td class="title" colspan="7">My Favorites</td>
        <td class="NE">&nbsp;</td>
    </tr>
    <tr>
        <td class="headerW">
            <div>&nbsp;</div>
        </td>
        <td class="headerC">
            Ranking
            <div>
                <A href="#" onclick="batchUpdate();return false;"><img src="/i/layout/btnUpdateDk.png" alt="Update ranking" onmouseover="this.src = '/i/layout/btnUpdateDkOn.png';" onmouseout="this.src = '/i/layout/btnUpdateDk.png';"/></A>
            </div>
        </td>
        <td class="header" colspan="2" width="33%">
            Submission
        </td>
        <td class="headerC" width="33%">
            Date Submitted
        </td>
        <td class="headerC" width="33%">
            Passed / Failed
        </td>
        <td class="headerC" nowrap>
            Move Up /<br>Move Down
        </td>
        <td class="headerC" nowrap>
            Move to<br>Top
        </td>
        <td class="headerE">
            <div>&nbsp;</div>
        </td>
    </tr>
</thead>
<tbody id="submissions">
    <jsp:include page="submitTableBody.jsp"/>
</tbody>
<tfoot>
    <tr>
        <td class="SW" colspan="8">&nbsp;</td>
        <td class="SE">&nbsp;</td>
    </tr>
</tfoot>
</table>
</form>
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