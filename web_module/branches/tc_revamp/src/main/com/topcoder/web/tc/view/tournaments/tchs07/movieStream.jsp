<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <script src="/js/tcscript.js" type="text/javascript"></script>
    <title>TopCoder High School 2007</title> 
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value=""/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Video montage from the onsite event</h2>

            <div align="center" style="padding: 20px; background: transparent url(/i/interface/videoBackdrop320x240.png) center center no-repeat;">
    
                <script language="JavaScript">
                var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="280" id="webcast" align="middle">'
                + '<param name="allowScriptAccess" value="always" />'
                + '<param name="movie" value="/flash/media/video_4x3.swf?app=misc&clip=<c:out value="${param['clip']}" default="tchs07montage" escapeXml="true"/>" />'
                + '<param name="quality" value="high" />'
                + '<param name="bgcolor" value="#000000" />'
                + '<param name="allowFullScreen" value="true" />'
                + '<embed src="/flash/media/video_4x3.swf?app=misc&clip=<c:out value="${param['clip']}" default="tchs07montage" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="280" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
                + '</object>';
                doWrite(s);
                </script>
            </div>


        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

