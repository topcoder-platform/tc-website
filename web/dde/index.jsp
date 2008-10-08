<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
		
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<jsp:include page="/includes/header-files.jsp" />
<title>TopCoder Direct</title>
<script src="/scripts/RSSProcessor.js" type="text/javascript"></script>
<script src="/scripts/AJAXProcessor.js" type="text/javascript"></script>
<script src="/scripts/direct.js" type="text/javascript"></script>


</head>
<body>
<jsp:include page="/includes/top.jsp">
<jsp:param name="TCDlevel" value="home" />
</jsp:include>

<%-- CONTENT BLOCKS --%>
	<div id="content">
		<div class="wrapper">
		
<%-- TOPCODER DIRECT BANNER --%>
    <div id="direct_banner">
            <p><img src="images/plug_into_the_world_largest.png" width="556" height="68"
                    alt="Plug into the world largest community of competitive software developers and designers" /></p>
        </div>

        <div id="content_main">
            <div class="left_content">
                <ul>
                    <li><a class="button1" href="http://www.topcoder.com/direct">WEB SITES</a></li>
                    <li><a class="button1" href="http://www.topcoder.com/direct">LOGO DESIGN</a></li>
                    <li><a class="button2" href="http://www.topcoder.com/direct">PRINT DESIGN</a></li>
                    <li><a class="button2" href="http://www.topcoder.com/direct">APPLICATIONS</a></li>
                </ul>
                <a href="http://www.topcoder.com/direct/cockpit/cockpit.jsp"><img class="startNow" src="images/start_your_project_now.png" alt="start your project now" /></a>
                <a class="button" href="http://www.topcoder.com/direct/cockpit/cockpit.jsp">LAUNCH DIRECT</a>
            </div>
            <div class="right_content">
                <ul>
                    <li><a class="button1" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/platform-tools.jsp">TOOLS</a></li>
                    <li><a class="button1" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/training.jsp">TRAINING</a></li>
                    <li><a class="button2" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/index.jsp">COMPONENTS</a></li>
                    <li><a class="button2" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/support.jsp">SUPPORT</a></li>
                </ul>
                <ul class="icons">
                    <li class="discovery"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/about.jsp">Discovery</a></li>
                    <li class="design"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/about.jsp">Design</a></li>
                    <li class="build"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/about.jsp">Build</a></li>
                    <li class="test"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/about.jsp">Test</a></li>
                </ul>
                <img class="findOut" src="images/find_out_more.png" alt="find out more" />
                <a class="button" href="#">CONTACT US</a>
            </div>
            <div class="clear"></div>
        </div>

    </div>
    <%-- .wrapper ends --%>
</div>
<%-- #content ends --%>

<%--BANNER AD--%>
<div id="bannerAd">
    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/TCD/about.jsp"><img src="images/bannerAd.png" alt="banner Ad" /></a>
</div>
<%-- NEWS --%>
<div id="news">
    <div class="wrapper">
        <h2 id="whats_new"><span>What's New</span></h2>

        <div class="post">
            <h3><a href="#">1st iPhone App UI Designed Through TC Cockpit</a>
                <small>| Aug 26, 2008</small>
            </h3>
            <p>Radio station tagging service RadioTAGr used the TopCoder Direct Cockpit to design the front end for its
                new Apple iPhone App...</p>

            <p class="learn_more"><a href="#">Learn More</a></p>
        </div>

        <div class="post">
            <h3><a href="#">Your Cockpit is Waiting</a>
                <small>| Jul 3, 2008</small>
            </h3>
            <p>The TopCoder Cockpit version 1.0 Release is the tool you'll use to access our community with TopCoder
                Direct...</p>

            <p class="learn_more"><a href="#">Learn More</a></p>
        </div>
    </div>
    <%-- .wrapper ends --%>
</div>
<%-- #news ends --%>


<%-- Footer begins --%>
<jsp:include page="/includes/foot.jsp" flush="true" />
<%-- Footer ends --%>
	
       

</body>
</html>