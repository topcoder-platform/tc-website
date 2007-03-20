<%@ page import="com.topcoder.web.studio.Constants, com.topcoder.web.studio.model.SubmissionType" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>
    <script type="text/javascript" src="/js/popup.js"></script>

    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
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
                    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A>
                    &gt; ${contest.name}
                </div>

                <h1>Final Submission Successfully Uploaded</h1>

                <div align="center">
                    <div align="left" style="width:500px; margin-top: 20px;">
                        Your Submission Has Been Uploaded
                        <br><br>
                        <div align="center">
                        <A href="${sessionInfo.servletPath}?module=ViewFinalSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" onfocus="this.blur();"><img src="/i/layout/btnSubmitAnother.png" alt="submit another" onmouseover="this.src = '/i/layout/btnSubmitAnotherOn.png';" onmouseout="this.src = '/i/layout/btnSubmitAnother.png';"/></A>
                        </div>
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