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
    <script type="text/JavaScript" src="/js/RSSProcessor.js"> </script>
    <script type='text/JavaScript' src='/js/AJAXProcessor.js'> </script>
    <!--script type='text/javascript' src='http://getfirebug.com/releases/lite/1.2/firebug-lite-compressed.js'></script-->
    <link rel="stylesheet" href="/js/thickbox-3.1/thickbox-3.1.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="/css/v2/home.css" media="all" type="text/css"/>
    
</head>

<c:set var="contests" value="<%=activeContests%>"/>
<c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
<c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
<c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

<body onLoad="loadWinners();loadNews()">

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
            <%-- default banner --%>
            <a href="/?module=ViewActiveContests"><img alt="Get Started Now!" src="/i/v3/welcome_banner.png" width="536" height="121" border="0"/></a>
            
             <%-- birthday banner
            <a href="http://tcstudioblogs.com/?p=39"><img alt="Studio Celebrates Two Years of Design Contests!" src="/i/v3/banner_birthday_536x121.png" width="536" height="121" border="0"/></a> --%>
        </div>
    </div>

    <!-- banner -->
    <%--
    <div class="banner">
       <a href="/?module=ViewContestDetails&amp;ct=2239"><img alt="Register Now!" src="/i/v3/lending_tree_banner.png" width="536" height="88" border="0"/></a>
    </div>
    --%>
    <%-- <div>
       <a href="/?module=ViewContestDetails&ct=2343"><img alt="Flex your muscles in Studio" src="/i/v3/flexbanner.png" width="535" height="60" border="0"/></a>
    </div>   --%>
    
    <!-- winners box -->
    <div class="winners">
	<div id="winners">
	</div>
   </div>
    <script>
       function loadWinners() {
			  var rss = "rss/?feed=rss2&cat=9";
              var template = "js/RecentWinnersTemplate.txt";
          try {
              var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
              document.getElementById("winners").innerHTML = (processor.transformRSSFeed(rss));
          } catch (e) {
              document.getElementById("winners").innerHTML = "Error reading recent winners feed.";
         throw e;
          }
      }
    </script>

    <!-- contest box -->
    <c:if test="${not empty contests}">
    <div class="contests">
        <div>
            <h2><span>ACTIVE CONTESTS</span></h2>
            <span class="more"><a href="/?module=ViewActiveContests">View All <%=activeContests.size()%> Active Contests
</a></span>
            <table>
                <thead>
                    <tr>
                        <th class="first">Contest</th>
                        <th class="second">Purse</th>
                        <th class="second">SC Points</th>
                        <th class="last">Deadline</th>
                    </tr>
                </thead>
                <tbody>
    <rsc:iterator list="<%=activeContests%>" id="resultRow" end="6">
                        <tr>
                            <td class="first">
                                    <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
                                    <rsc:item name="name" row="<%=resultRow%>"/></a></td>
                            <td class="second"><rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/></td>
                            <td class="second"><rsc:item name="dr_points" row="<%=resultRow%>" format="######" ifNull="&nbsp;"/></td>
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
    <div id="newsBox" class="newsBox">
    <script>
       function loadNews() {
              var rss = "rss/?feed=rss2";
              var template = "js/WhatsNewTemplate.txt";
          try {
              var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
              document.getElementById("newsBox").innerHTML = (processor.transformRSSFeed(rss));
          } catch (e) {

              document.getElementById("newsBox").innerHTML = "Error reading news";
         throw e;
          }
       }
    </script>
    </div>
    
    <%--
    <div id="newsBox" class="newsBox">
    </div>

    <div>
    <script>
       function loadNews() {
              var rss = "rss/?feed=rss2";
              var template = "js/WhatsNewTemplate.txt";
          try {
              var processor = new js.topcoder.rss.template.RSSProcessor(false, template);
              document.getElementById("newsBox").innerHTML = (processor.transformRSSFeed(rss));
          } catch (e) {

              document.getElementById("newsBox").innerHTML = "Error reading news";
         throw e;
          }
       }
    </script>
    </div>
    --%>

    <!-- designer box -->
    <div class="designerBox">
        <h2>DESIGNER OF THE MONTH</h2>

        <p>
            <img class="member" width="57" height="63" alt="Designer of the Month" src="http://<%=ApplicationServer.SERVER_NAME%>/i/m/maxsense_big4.jpg"/>
            <b>August 2008</b><br />
            <b>maxsense</b><br />
            Won First Place in<br />8 contests and $5075!
        </p>

        <div></div>
    </div>

    <!-- assignement box -->
    <div class="assignmentBox">
        <p class="simpleArrow">
            Have you signed your assignment document?<br />
            <img alt="More Info" src="/i/v3/right_arrow.png"/><a class="img_c" href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/The+Assignment+Document" target="_blank">
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
