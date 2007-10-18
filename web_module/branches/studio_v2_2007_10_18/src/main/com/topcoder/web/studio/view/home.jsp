<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="java.util.Map" %>
<% ResultSetContainer recentWinners = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("recent_winners");%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>

    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2"; urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>

    <style type="text/css">
    #message {
        float: right;
        width: 180px;
        margin: 0px 0px 20px 20px;
        color: #4b4fa1;
        font-size: 11px;
    }
    
    #message a:link, #message a:visited {
        color: #4b4fa1;
        text-decoration: underline;
        font-weight: bold;
    }
    
    #message a:hover, #message a:active {
        color: #FF0000;
        text-decoration: none;
        font-weight: bold;
    }
    </style>

</head>

<body id="page">
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="home"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                <div class="contentMiddle">



<table cellpadding="0" cellspacing="0" style="width:740px;">
    <tbody>
        <tr>
            <td style="padding: 0px 10px 0px 0px; background: transparent url(/i/v2/dotLineV.png) top right repeat-y;">

<%-- AIM --%>
                <div>
                    <a href="<tc-webtag:linkTracking link="http://studio.topcoder.com/?module=ViewContestDetails&ct=2136" refer="studio_homepage" />"><img src="/i/home/aim_iconography.png" alt="AIM Iconography Contest"/></a>
                </div>

<%--   REGISTER NOW 
                <div>
                     <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/home/register_now.gif" alt="Register now"/></a>
                </div>
--%>

<%-- POST A PROJECT --%>
                <div>
                    <a href="/?module=Static&amp;d1=contactUs"><img src="/i/home/post_project.gif" alt="Post a project"/></a>
                </div>

<%-- NEED HELP? --%>
                <div>
                    <a href="/?module=Static&amp;d1=support&amp;d2=getStarted"><img src="/i/home/need_help.gif" alt="Need help?"/></a>
                </div>



            </td>
            <td valign="top" style="padding-left: 10px;">

                <h1>Welcome to TopCoder Studio</h1>
<%-- 
                 <div style="float:right; margin: 0px 0px 10px 10px;">
                     <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/"><img src="/i/home/register_now.gif" alt="Register now"/></a>
                 </div>
--%>
                <jsp:include page="message.jsp"/>

                Welcome to TopCoder Studio - the best place on the web for showing off your creative
                skills in a competitive environment and getting paid for being the best!
                <br /><br />
                At the Studio, clients post their projects with definitive timelines, deliverables and
                payouts, and you decide which ones pique your interest. There are even advancement
                opportunities available into the Review Board, where a select group of competing members
                will evaluate all submissions before they are passed on to the client.
                <br /><br />
                So, poke around, ask questions and, above all, compete and have fun!
                <br /><br />

                <h2><a href="/?module=ViewActiveContests">Check out some Studio contests!</a></h2>
                <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register</a> as a Studio
                member so you can receive emails when new contests arrive.
                <br /><br />

                <div class="statHolder">
                    <div class="NE"><img src="/i/v2/stat_tableNE.png" /></div>
                    <div class="NW"><img src="/i/v2/stat_tableNW.png" /></div>
                    <table cellpadding="0" cellspacing="0" class="stat" style="width:100%;">
                        <tbody>
                            <tr>
                              <td class="title" colspan="6">Table Title</td>
                            </tr>
                            <tr class="header">
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
                                <tr><td class="space" colspan="6">&nbsp;</td></tr>
                                <tr class="<%=even?"light":"dark"%>">
                                    <td class="valueW"><div>&nbsp;</div></td>
                                    <td class="value">
                                        <studio:handle coderId="<%=resultRow.getLongItem("user_id")%>"/>
                                    </td>
                                    <td class="valueR">
                                        <c:choose>
                                            <c:when test="${resultRow.map['show_submissions']}">
                                                <div id="pop<%=i%>" class="popUp"><div>View submission</div></div>
                                                <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                                                    <img src="/i/layout/magnify.gif" alt="" onmouseover="popUp(this,'pop<%=i%>')" onmouseout="popHide()" />
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <img src="/i/layout/magnifyFade.png" alt="" />
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="value">
                                        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=<rsc:item name="contest_id" row="<%=resultRow%>"/>">
                                            <rsc:item name="name" row="<%=resultRow%>"/></a>
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
                                    <td class="btnRight" colspan="6"><div><a href="/?module=ViewPastContests"><img src="/i/v2/btn_more.png" alt="More..." /></a></div></td>
                                </tr>
                        </tbody>
                    </table>
                    <div class="SE"><img src="/i/v2/stat_tableSE.png" /></div>
                    <div class="SW"><img src="/i/v2/stat_tableSW.png" /></div>
                </div>

            </td>
        </tr>
    </tbody>
</table>




                </div>                
                <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>