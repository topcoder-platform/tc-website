<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer recentWinners = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("recent_winners");%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2"; urchinTracker(); </script>
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
        img.emblem {
            float: left;
            margin: 0px 0px 0px 0px;
        }

        div.container {
            display: block;
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
    <jsp:param name="node" value="home"/>
</jsp:include>
<div class="contentIn">
<img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

<div class="contentSpacer">

<table cellpadding="0" cellspacing="0" style="width:740px;">
<tbody>
<tr>
    <td style="padding: 0px 10px 0px 0px; border-right: 1px dashed #999999;">
        <div>
            <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/home/register_now.gif" alt="Register now"/></A>
        </div>

        <div>
            <A href="/?module=Static&d1=support&d2=getStarted"><img src="/i/home/need_help.gif" alt="Need help?"/></A>
        </div>

        <div>
            <A href="/?module=Static&d1=contactUs"><img src="/i/home/post_project.gif" alt="Post a project"/></A>
        </div>
    </td>
    <td valign="top" style="padding-left: 10px;">

        <h1>Welcome to TopCoder Studio</h1>
        Welcome to TopCoder Studio - the best place on the web for showing off your creative
        skills in a competitive environment and getting paid for being the best!
        <br><br>
        At the Studio, clients post their projects with definitive timelines, deliverables and
        payouts, and you decide which ones pique your interest. There are even advancement
        opportunities available into the Review Board, where a select group of competing members
        will evaluate all submissions before they are passed on to the client.
        <br><br>
        So, poke around, ask questions and, above all, compete and have fun!
        <br><br>

        <h2>Contests will be posted soon!</h2>
        <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</A> as a Studio
        member so you can receive emails when new contests arrive.
        <br><br>
        <table cellpadding="0" cellspacing="0" class="stat" style="width:485px;">
            <tbody>
                <tr>
                    <td class="NW">&nbsp;</td>
                    <td class="title" colspan="4">
                        Recent Winners
                    </td>
                    <td class="NE">&nbsp;</td>
                </tr>
                <tr>
                    <td class="headerW"><div>&nbsp;</div></td>
                    <td class="header" width="20%" colspan="2">
                        Winner
                    </td>
                    <td class="header" width="60%">
                        Contest
                    </td>
                    <td class="headerR" width="20%">
                        Prize
                    </td>
                    <td class="headerE"><div>&nbsp;</div></td>
                </tr>
                <% boolean even = true;
                    int i = 0; %>
                <rsc:iterator list="<%=recentWinners%>" id="resultRow">
                    <tr class="<%=even?"light":"dark"%>">
                        <td class="valueW"><div>&nbsp;</div></td>
                        <td class="value">
                            <studio:handle coderId="<%=resultRow.getLongItem("user_id")%>"/>
                                <%--<A href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">view
                                submission</A>--%>
                        </td>
                        <td class="valueR">
                            <div class="container">
                                <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>"><img src="/i/layout/magnify.gif" alt="Download submission" class="emblem" border="0" onmouseover="popUp('pop<%=i%>')" onmouseout="popHide()"/></a>

                                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
                            </div>
                        </td>
                        <td class="value">
                            <A href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                <rsc:item name="name" row="<%=resultRow%>"/></A>
                        </td>
                        <td class="valueR">
                            <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
                        </td>
                        <td class="valueE"><div>&nbsp;</div></td>
                    </tr>
                    <% even = !even;
                        i++; %>
                </rsc:iterator>
                <tr>
                    <td class="SW" colspan="5">&nbsp;</td>
                    <td class="SE">&nbsp;</td>
                </tr>
                <%--commented out until we actually have "more"
                <tr>
                    <td class="SW">&nbsp;</td>
                    <td class="title" colspan="3">
                        <A href="/?module=ViewPastContests" class="small">...more</A>
                    </td>
                    <td class="SE">&nbsp;</td>
                </tr>--%>
            </tbody>
        </table>


    </td>
</tr>
</tbody>
</table>

</div>
<img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
</div>

</body>
</html>