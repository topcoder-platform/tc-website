<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ page import="java.util.Map" %>
<%--
<% ResultSetContainer recentWinners = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("recent_winners");%>
--%>
<% ResultSetContainer activeContests = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("active_contests");%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>

<?xml version="1.0" encok/ant
ding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Welcome to TopCoder Studio</title>

    <script type="text/javascript" src="/js/v2/popup.js"></script>
    <script type="text/javascript" src="/js/jquery-1.2.3.pack.js"></script>
    <script type="text/javascript" src="/js/thickbox-3.1/thickbox-compressed-3.1.js"></script>
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/css/v2/home.css" media="all" type="text/css"/>
</head>

<c:set var="contests" value="<%=activeContests%>"/>
<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

<body>

<div align="center">
<div id="wrapper">

    <div id="header">
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="home"/>
        </jsp:include>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="home"/>
        </jsp:include>
    </div>

<!-- main content -->
<div id="content">

<!-- begin left container -->
<div class="content_l">

    <!-- welcome box -->
    <div class="welcome">
        <div id="welcome_head">
            <h1>Welcome to TopCoder Studio!</h1>

            <p>Show off your creative skills in a competitive environment and get paid for being the best!</p>
        </div>
        <div id="welcome_banner">
            <%-- default banner 
            <a href="/?module=ViewActiveContests"><img alt="Get Started Now!" src="/i/v3/welcome_banner.png" width="536" height="121" border="0"/></a>
            --%>
            <a href="/?module=ViewContestDetails&amp;ct=2230"><img alt="Get Started Now!" src="/i/v3/lending_tree.png" width="536" height="121" border="0"/></a>
        </div>
    </div>

    <!-- banner -->
    <div class="banner">
        <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=bracket"><img src="/i/v3/tco_finalists.png" alt="TCO08" /></a>
    </div>

    <!-- contest box -->
    <c:if test="${not empty contests}">
    <div class="contests">
        <div>
            <h2><span>ACTIVE CONTESTS</span></h2>
            <span class="more"><a href="/?module=ViewActiveContests">View All</a></span>
            <table>
                <thead>
                    <tr>
                        <th class="first">Contest</th>
                        <th class="second">Purse</th>
                        <th class="last">Deadline</th>
                    </tr>
                </thead>
                <tbody>
                    <rsc:iterator list="<%=activeContests%>" id="resultRow" end="2">
                        <tr>
                            <td class="first">
                                    <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
                                    <rsc:item name="name" row="<%=resultRow%>"/></a></td>
                            <td class="second"><rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/></td>
                            <td class="last"><rsc:item name="end_time" row="<%=resultRow%>" format="MM.dd.yyyy'<br />'HH:mm z" timeZone="${sessionInfo.timezone}"/></td>
                        </tr>
                    </rsc:iterator>
                </tbody>
            </table>
            <div>
                <div></div>
            </div>
        </div>
    </div>
    </c:if>

    <!-- winners box -->
    <div class="winners">
        <div>
            <h2><span>RECENT WINNERS</span></h2>
            <span class="more"><a href="/?module=ViewPastContests">View All</a></span>
            <table>
                <tbody>
                    <tr>
                        <td class="img"><a href="/?module=ViewContestResults&ct=2213 "><img alt="winner 1" src="/i/v3/winners/winner_2.png"/></a></td>
                        <td>
                            <span class="coderText">rutam</span><br />
                            <a href="/?module=ViewContestDetails&ct=2213">AIM Expressions Storyboard</a><br />
                            $1500.00
                        </td>
                    </tr>
                    <tr class="last_row">
                        <td class="img">
                            <a href="/?module=ViewContestResults&ct=2210"><img alt="winner 2" src="/i/v3/winners/winner_3.png"/></a>
                        </td>
                        <td>
                            <span class="coderText">bohuss</span><br />
                            <a href="/?module=ViewContestDetails&ct=2210">Argus VP Chart Interaction/Animation Phase 2</a><br />
                            $800.00
                        </td>
                    </tr>
                    <tr>
                        <td class="img">
                            <a href="/?module=ViewContestResults&ct=2212"><img alt="winner 3" src="/i/v3/winners/winner_1.png"/></a>
                        </td>
                        <td>
                            <span class="coderText">dafei</span><br />
                            <a href="/?module=ViewContestDetails&ct=2212">TC Pipeline Yahoo Widget Storyboard</a><br />
                            $450.00
                        </td>
                    </tr>

<%--
                    <rsc:iterator list="<%=recentWinners%>" id="resultRow">
                        <c:set var="showSubmissions" value="${resultRow.map['show_submissions']}"/>
                        <c:set var="hasPreviewImage" value="${resultRow.map['has_preview_image']}"/>
                        <c:set var="submissionId" value="${resultRow.map['submission_id']}"/>
                        <c:set var="contestId" value="${resultRow.map['contest_id']}"/>
                        <c:set var="galleryImageCount" value="${resultRow.map['gallery_image_count']}"/>


                        <tr>
                            <td class="img">
                                <c:choose>
                                    <c:when test="${showSubmissions}">
                                        <studio_tags:viewSubmissionLink hasPreviewImage="${hasPreviewImage}"
                                                                        submissionId="${submissionId}"
                                                                        galleryImageCount="${galleryImageCount}"
                                                                        targetPresentationType="medium"
                                                                        previewPresentationType="tiny"
                                                                        contestId="${contestId}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="/i/v2/interface/magnifyFade.png" alt=""/>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <studio:handle coderId="${resultRow.map['user_id']}"/><br/>
                                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
                                        ${resultRow.map['name']}</a><br/>
                                <rsc:item name="amount" row="<%=resultRow%>" format="$###,###.00"/>
                            </td>
                        </tr>
                    </rsc:iterator>
--%>
                </tbody>
            </table>
            <div>
                <div></div>
            </div>
        </div>
    </div>
</div>
<!-- end left container -->

<!-- begin right container -->
<div class="content_r">

    <!-- login box -->
    <div id="loginBox">
        <h2>LOGIN</h2>
        <!-- JSP START --><c:choose>
        <c:when test="${sessionInfo.anonymous}">
            <%--have to use the constant because this page can be used with multiple servlets --%>
            <form method="post" name="frmLogin" action="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>">
                <input type="hidden" name="module" value="Login"/>
                        <span>
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                                <tr class="pd">
                                    <td width="50%" align="right" valign="bottom">Handle:</td>
                                    <td valign="bottom">
                                        <input class="txt" name="<%=Login.USER_NAME%>" size="8" maxlength="15" type="text" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">Password:</td>
                                    <td>
                                        <input class="txt" name="<%=Login.PASSWORD%>" size="8" maxlength="30" type="password" value=""/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <input class="checkbox" type="checkbox" id="remember" name="<%=Login.REMEMBER_USER%>"/>
                                    </td>
                                    <td>Remember me</td>
                                </tr>
                                <tr class="pd">
                                    <td align="right">
                                        <input type="image" src="/i/v2/interface/btnGo.png"/>
                                    </td>
                                    <td>
                                        <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/" title="Register"><img src="/i/v2/interface/btnRegister.png" alt="Register" /></a>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        </span>
            </form>
        </c:when>
        <c:otherwise>
            <p id="login_data">
                Hello <studio:handle coderId="${sessionInfo.userId}"/>
                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Log out</a> |
                <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">Update my profile</a>
            </p>
        </c:otherwise>
        </c:choose>
        <!-- JSP END -->
        <div></div>
    </div>

    <!-- news box -->
    <div class="newsBox">
        <h2>WHAT'S NEW</h2>
        <ul>
            <li>The New Studio enhancements are live! Be sure to check the <a href="/forums">forums</a> for more
                information on the new submission procedures, and many other cool new features.
            </li>
            <li>TCO08 Studio finalists are preparing for the finals in Las Vegas. Be sure to watch the
                <a href="/forums">forums</a> for updates, reports and general info as the championship round approaches!
                Good luck, everyone!
            </li>
        </ul>
        <div></div>
    </div>

    <!-- designer box -->
    <div class="designerBox">
        <h2>DESIGNER OF THE MONTH</h2>

        <p>
            <img class="member" width="57" height="63" alt="Designer of the month" src="http://<%=ApplicationServer.SERVER_NAME%>/i/m/oton_big.jpg"/>
            <b>March 2008 </b><br />
            <i>oton</i><br />
            Won $2,100 in
            three contests
        </p>

        <div></div>
    </div>

    <!-- assignement box -->
    <div class="assignmentBox">
        <p class="simpleArrow">
            Have you signed your assignment document?<br />
            <img alt="More Info" src="/i/v3/right_arrow.png"/><a class="img_c" href="http://www.topcoder.com/wiki/display/tc/The+Assignment+Document" target="_blank">
            Click here for more info!</a>
        </p>
    </div>
</div>
<br class="clear"/>

<!-- footer -->
<div id="footer">
    <a href="http://<%=ApplicationServer.SERVER_NAME%>/"><img alt="TopCoder" class="TClogo" src="/i/v3/tc_logo.jpg"/></a>

    <p><a href="/">Home</a> &nbsp;|&nbsp; <a href="/?module=Static&amp;d1=contactUs">Contact Us</a> &nbsp;|&nbsp;
        <a href="/?module=Static&amp;d1=about&amp;d2=privacy">Privacy</a> &nbsp;|&nbsp;
        <a href="/?module=Static&amp;d1=about&amp;d2=terms">Terms</a></p>
</div>

</div>
<!-- end content -->
</div>
<!-- end wrapper -->
</div>
</body>
</html>