<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../../script.jsp" />
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        
        
        <h2>TopCoder Distance - Collaboration at the TCO</h2>

        <p>
            TCO competitors in the Studio, Component Design, and Component Development tracks all contributed to a new website tool, named (by the Studio winner) TopCoder Distance.  TC Distance is a small Flash application that measures and displays one member's "distance" from a group of other members.  If CoderA and CoderB have similar ratings, live near each other, and have competed directly with each other many times then TC Distance will display their dots very close to each other.  If they don't have all that in common then TC Distance will draw them very far apart.  The app displays a "cloud" of dots, each representing another TopCoder member, and the distance of each from the center of the cloud determines how much they have in common with the member currently in focus, based on a set of selectable criteria.  We'll be deploying this app on member profiles some time soon, and we plan to add functionality in the future.
        </p>
        <p>
            Below is an example of TC Distance in action.  So take a look and let us know what you think.
        </p>
        <p>
            <strong>INSTRUCTIONS:</strong>  Select a Competition Type and Comparison Criteria and close both menus to display the dots.  CTRL click options from the menus to add them.
        </p>

        <div style="background: transparent" align="center">
        <script language="JavaScript">
        var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="600" height="400" id="webcast" align="middle">'
        + '<param name="allowScriptAccess" value="always" />'
        + '<param name="movie" value="/flash/demos/memberometer-prod.swf?coder_id=144400" />'
        + '<param name="quality" value="high" />'
        + '<param name="bgcolor" value="#000000" />'
        + '<param name="allowFullScreen" value="true" />'
        + '<embed src="/flash/demos/memberometer-prod.swf?coder_id=144400" quality="high" bgcolor="#000000" allowFullScreen="true" width="600" height="400" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
        + '</object>';
        doWrite(s);
        </script>
        </div>

    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
