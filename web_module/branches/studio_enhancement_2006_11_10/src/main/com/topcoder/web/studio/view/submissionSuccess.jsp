<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="studio.tld" prefix="studio" %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                    </div>
                </div>

                <div style="margin: 40px 0px 20px 0px;">
                    <table class="stat" cellpadding="0" cellspacing="0" style="width:740px;">
                        <thead>
                            <tr>
                                <td class="NW">&nbsp;</td>
                                <td class="title" colspan="7">My Ranked Submissions for this contest</td>
                                <td class="NE">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="headerW">
                                    <div>&nbsp;</div>
                                </td>
                                <td class="headerC">
                                    Ranking
                                    <div>
                                        <A href="#"><img src="/i/layout/btnUpdateDk.png" alt="Update ranking" onmouseover="this.src = '/i/layout/btnUpdateDkOn.png';" onmouseout="this.src = '/i/layout/btnUpdateDk.png';"/></A>
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