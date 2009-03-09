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
    <jsp:param name="tabLev2" value="onsiteevents"/>
    <jsp:param name="tabLev3" value="movies"/>
    </jsp:include>


        
        
        <h2>Movies - <c:out value="${param['title']}" default="" escapeXml="true"/></h2>

                <div style="padding: 10px; background: transparent" align="center">
                <script language="JavaScript">
                var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="280" id="webcast" align="middle">'
                + '<param name="allowScriptAccess" value="always" />'
                + '<param name="movie" value="/flash/media/video_4x3.swf?app=tcchannel&clip=<c:out value="${param['clip']}" default="ep01" escapeXml="true"/>" />'
                + '<param name="quality" value="high" />'
                + '<param name="bgcolor" value="#000000" />'
                + '<param name="allowFullScreen" value="true" />'
                + '<embed src="/flash/media/video_4x3.swf?app=tcchannel&clip=<c:out value="${param['clip']}" default="ep01" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="280" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
                + '</object>';
                doWrite(s);
                </script>
                </div>
                
<%--
--%>

    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
