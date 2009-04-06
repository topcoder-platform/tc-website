<%@ page import="com.topcoder.web.truveo.Constants, com.topcoder.web.truveo.model.SubmissionType" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="truveo.tld" prefix="truveo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/taconite-client.js"></script>
    <script type="text/javascript" src="/js/taconite-parser.js"></script>
    <script type="text/javascript" src="/js/fat.js"></script>
    

    <title>Truveo Developer Challenge :: Powered by TopCoder</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_truveo"/>
    </jsp:include>
    <script language="javascript" type="text/javascript">
        <!--
        function changeRank(newRank, submissionId) {
        var ajaxRequest = new AjaxRequest('${sessionInfo.servletPath}?module=UpdateSubmissionRank&<%=Constants.SUBMISSION_RANK%>=' + newRank + '&<%=Constants.SUBMISSION_ID%>=' + submissionId);
            ajaxRequest.setPostRequest(fader);
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
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="tcTop.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <div class="linkBox">
                    <truveo:forumLink forumID="${contest.forumId}"/>
                </div>

                <div class="breadcrumb">
                    <a href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</a>
                    &gt; ${contest.name}
                </div>

                <h1>Final Submission Successfully Uploaded</h1>

                <div align="center">
                    <p align="center" style="width:500px; margin-top: 20px;">
                        Your Submission Has Been Uploaded
                        <br /><br />
                        <div align="center">
                        <a href="${sessionInfo.servletPath}?module=ViewFinalSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" onFocus="this.blur();"><img src="/i/events/truveo/interface/btnSubmitAnother.png" alt="submit another" /></a>
                        </div>
                    </p>
                </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="tcFoot.jsp"/>

    </div>
</body>
</html>