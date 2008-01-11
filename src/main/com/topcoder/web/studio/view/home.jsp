<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
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

    <script type="text/javascript" src="/js/v2/popup.js"></script>

    <style type="text/css">
    #message {
        float: right;
        width: 200px;
        height:220px;
        margin: 0px 0px 20px 20px;
        color: #ed1c24;
        font-size: 11px;
        background-image: url(/i/v2/messageBox.png);
    }
    
    #message a:link, #message a:visited {
        color: #806666;
        text-decoration: underline;
        font-weight: bold;
    }
    
    #message a:hover, #message a:active {
        color: #ac1414;
        text-decoration: none;
        font-weight: bold;
    }
    </style>

</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div style=" width: 800px; height: 161px; background: #4DC6FD url(/i/v2/bg_header_home.png) no-repeat left top;">
            <jsp:include page="top.jsp">
                <jsp:param name="section" value="home"/>
            </jsp:include>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value="home"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="home_container">
            <!-- content -->
            <div style="background: transparent url(/i/v2/home_bg_content_bottom.png) left bottom no-repeat; padding: 0px;">

            <div id="homeRightCol">
                <div class="spacer">

                    <!-- login title -->
                    <div style="width: 200px; height: 25px; margin-bottom: 10px; background: transparent url(/i/v2/home_bg_right_title.png) center center no-repeat;">
                        <div style="font-weight: bold; padding: 2px 0px 0px 10px; ">
                            Log in
                        </div>
                    </div>
                    
                    <!-- login box -->
                    <div id="homeLoginBox">
                        <div class="spacer">
                        <c:choose>
                            <c:when test="${sessionInfo.anonymous}">
                            <%--have to use the constant because this page can be used with multiple servlets --%>
                            <form method="post" name="frmLogin" action="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>">
                                <input type="hidden" name="module" value="Login" />
                                    <table cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td width="50%" align="right">Handle:</td>
                                        <td><input name="<%=Login.USER_NAME%>" size="8" maxlength="15" type="text" value=""/></td>
                                    </tr>
                                    <tr>
                                        <td align="right">Password:</td>
                                        <td><input name="<%=Login.PASSWORD%>" size="8" maxlength="30" type="password" value=""/></td>
                                    </tr>
                                    </tbody>
                                    </table>
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                    <tbody>
                                    <tr>
                                        <td align="center"><input type="checkbox" id="remember" name="<%=Login.REMEMBER_USER%>"/> Remember me</td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <div style="float: left; padding-left: 45px;"><input type="image" src="/i/v2/interface/btnGo.png"/></div>
                                            <div style="float: right; padding-right: 45px;"><a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/" title="Register"><img src="/i/v2/interface/btnRegister.png" alt="Register" /></a></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center"><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" title="Forgot your password?">Forgot your password?</a></td>
                                    </tr>
                                    </tbody>
                                    </table>
                            </form>
                            </c:when>
                            <c:otherwise>
                                <div style="margin-top: 20px;">Hello</div>
                                <div style="font-size: 18px;"><studio:handle coderId="${sessionInfo.userId}"/></div>
                                <div>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Log out</a>
                                | <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">Update my profile</a>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        </div>
                    </div>

                    <!-- message title -->
                    <div style="width: 200px; height: 25px; margin-bottom: 10px; background: transparent url(/i/v2/home_bg_right_title.png) center center no-repeat;">
                        <div style="font-weight: bold; padding: 2px 0px 0px 10px; ">
                            Message
                        </div>
                    </div>
                    <jsp:include page="message.jsp"/>
                    

                    <!-- promo -->
                    <div style="margin-bottom: 20px;">
                        <a href="http://forums.topcoder.com/?module=Thread&threadID=593270"><img src="/i/v2/home/tcevolution.png" alt="" /></a>
                    </div>

                    <!-- DOTM title -->
                    <div style="width: 200px; height: 25px; margin-bottom: 10px; background: transparent url(/i/v2/home_bg_right_title.png) center center no-repeat;">
                        <div style="font-weight: bold; padding: 2px 0px 0px 10px; ">
                            Designer of the Month
                        </div>
                    </div>
                    
                    <!-- DOTM box -->
                    <div id="homeDOTMBox">
                        <img src="/i/m/djackmania_big.jpg" alt="" style="position: absolute; top: 20px; left: 5px; width: 55px; height: 61px; border: 1px solid #bebebe;" />
                        <div style="text-align: center; padding: 15px 10px 0 71px; margin: 0;">
                            <strong>December 2007</strong>
                            <br /><studio:handle coderId="22690288"/>: Won $3,400 in three contests
                        </div>
                    </div>


                </div>
            </div>

            <div style="width: 525px; margin: 0px 15px; padding: 20px 0px;">

                <!-- news title -->
                <div style="width: 525px; height: 25px; margin-bottom: 10px; background: transparent url(/i/v2/home_bg_title.png) center center no-repeat;">
                    <div style="font-weight: bold; padding: 2px 0px 0px 10px; ">
                        News
                    </div>
                </div>

                <!-- news box -->
                <div style="width: 525px; height: 150px; margin-bottom: 20px; background: transparent;">
                    <a href="/?module=ViewActiveContests"><img src="/i/v2/home/studiov3.png" alt="Welcome to TopCoder Studio" /></a>
                    <%--
                    <a href="/?module=ViewActiveContests"><img src="/i/v2/home/widgetWednesday.png" alt="Widget Wednesday" /></a>
                    --%>
                </div>

                <div style="margin-bottom: 20px;">
                    <table cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                        <tr>
                            <td width="50%" align="left"><a href="/?module=ViewActiveContests"><img src="/i/v2/home_icon_contests.png" alt="Active Contests" /></a></td>
                            <td width="50%" align="left"><a href="/?module=Static&amp;d1=contactUs"><img src="/i/v2/home_icon_projects.png" alt="Help" /></a></td>
                            <td><a href="/?module=Static&amp;d1=support&amp;d2=getStarted"><img src="/i/v2/home_icon_help.png" alt="Help" /></a></td>
                        </tr>
                    </tbody>
                    </table>                            
                </div>

                <!-- recent winners title -->
                <div style="width: 525px; height: 25px; margin-bottom: 10px; background: transparent url(/i/v2/home_bg_title.png) center center no-repeat;">
                    <div style="font-weight: bold; padding: 2px 0px 0px 10px; ">
                        Recent Winners
                    </div>
                </div>

                <!-- recent winners table -->
                <div class="statHolder">
                    <div class="NE"><img src="/i/v2/statDk_tableNE.png" alt="" /></div>
                    <div class="NW"><img src="/i/v2/statDk_tableNW.png" alt="" /></div>
                    <div class="container">
                        <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                            <tbody>
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
                                                    <a href="${sessionInfo.servletPath}?module=DownloadSubmission&amp;<%=Constants.SUBMISSION_ID%>=<rsc:item name="submission_id" row="<%=resultRow%>"/>">
                                                        <img src="/i/v2/interface/magnify.png" alt="" onmouseover="popUp(this,'myPopup')" onmouseout="popHide()" />
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/i/v2/interface/magnifyFade.png" alt="" />
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
                    </div>
                    <div class="SE"><img src="/i/v2/statDk_tableSE.png" alt="" /></div>
                    <div class="SW"><img src="/i/v2/statDk_tableSW.png" alt="" /></div>
                </div>
            </div>

            <div id="myPopup" class="popUp"><div>View submission</div></div>

            </div>
        </div>

        <jsp:include page="foot.jsp">
            <jsp:param name="section" value="home"/>
        </jsp:include>

    </div>

</body>
</html>