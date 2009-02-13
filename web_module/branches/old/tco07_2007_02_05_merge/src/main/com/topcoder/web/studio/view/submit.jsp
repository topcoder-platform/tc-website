<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=BatchUpdateRank&<%=Constants.CONTEST_ID%>=${contest.id}');
        <c:forEach items="${submissions}" var="submission">
            ajaxRequest.addNamedFormElements("<%=Constants.SUBMISSION_ID%>${submission.id}");
        </c:forEach>
            ajaxRequest.sendRequest();
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

<h1>Submit Your Design</h1>

<div align="center">
    <div align="left" style="width:500px; margin-top: 20px;">
        <p>Thank you for accepting the terms of the contest. Please use the form below to upload your
            submission:</p>

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
            <form action="${sessionInfo.servletPath}" method="POST" name="submission" enctype="multipart/form-data">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="Submit"/>
                <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
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
                <p>
                    <input type="image" src="/i/layout/btnSubmit.png" onmouseover="this.src='/i/layout/btnSubmitOn.png'" onmouseout="this.src='/i/layout/btnSubmit.png'">
                </p>
            </form>
        </div>

    </div>
</div>


<div style="margin: 40px 0px 20px 0px;">
<form name="submissionForm" action="#">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="BatchUpdateRank"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>" value="${contest.id}"/>

<div align="center">
   <strong>In the table below</strong> you can rank your submissions.
   <br><span style="background: #a2d0a2;">Green rows</span> indicate preferred submissions that will count for this contest.
   <br>Submissions that have <span class="bigRed">Failed</span> can not be ranked, and are automatically moved to the bottom of the page.
   <br>If one of your preferred submissions fails after the submission phase, the next passing submission will take its place.
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