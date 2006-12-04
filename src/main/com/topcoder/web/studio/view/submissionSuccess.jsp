<%@ page import="com.topcoder.web.studio.Constants" %>
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

    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script language="javascript" type="text/javascript">
        <!--
        var objPopUp = null;
        function popUp(objectID) {
            objPopUp = document.getElementById(objectID);
            objPopUp.style.visibility = 'visible';
        }
        function popHide() {
            objPopUp.style.visibility = 'hidden';
            objPopUp = null;
        }
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
    <STYLE TYPE="text/css">
        div.container {
            display: block;
            width: 20px;
            text-align: center;
            position: relative;
            margin: 0px;
            padding: 0px;
        }

        div.popUp {
            visibility: hidden;
            position: absolute;
            top: 20px;
            left: 20px;
            z-index: 1;
        }

        div.popUp div {
            float: left;
            font-size: 11px;
            line-height: normal;
            background: #FFFFCC;
            border: 1px solid #999999;
            padding: 6px;
            text-align: left;
            white-space: nowrap;
        }
    </STYLE>
</head>

<body>
<div align="center">
    <div class="contentOut">
        <jsp:include page="top.jsp"/>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="contests"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <div class="linkBox">
                    <studio:forumLink forumID="${contest.forumId}"/>
                </div>

                <div class="breadcrumb">
                    <A href="${sessionInfo.servletPath}?module=ViewActiveContests">Active Contests</A>
                    &gt; ${contest.name}
                </div>

                <h1>Submission Successfully Uploaded</h1>

                <div align="center">
                    <div align="left" style="width:500px; margin-top: 20px;">
                        Your Submission Has Been Uploaded
                        <br><br>
                        Please allow at least 24 hours for processing. If your submission does not pass screening, you
                        will receive an
                        email with a list of any requirements that it failed to meet.
                        <br><br>
                        Thank you.
                        <br><br>
                        <div align="center">
                        <A href="${sessionInfo.servletPath}?module=ViewSubmission&amp;<%=Constants.CONTEST_ID%>=${contest.id}" onfocus="this.blur();"><img src="/i/layout/btnSubmitAnother.png" alt="submit another" onmouseover="this.src = '/i/layout/btnSubmitAnotherOn.png';" onmouseout="this.src = '/i/layout/btnSubmitAnother.png';"/></A>
                        </div>
                    </div>
                </div>

                <div style="margin: 40px 0px 20px 0px;">
                    <form name="submissionForm" action="#">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="BatchUpdateRank"/>
<div align="center">
   <strong>In the table below</strong> you can rank your submissions.
   <br><span style="background: #a2d0a2;">Green rows</span> indicate preferred submissions that will count for this contest.
   <br>Submissions that have <span class="bigRed">failed</span> can not be ranked, and are automatically moved to the bottom of the page.
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
                    <br><br>
                    <strong>NOTE:</strong> green rows indicate submissions that you have selected to be considered for
                    this contest
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