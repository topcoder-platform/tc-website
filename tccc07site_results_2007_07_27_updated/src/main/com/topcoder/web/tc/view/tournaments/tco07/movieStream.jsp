<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
    <script src="/js/tcscript.js" type="text/javascript"></script>
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="onsiteevents"/>
                    <jsp:param name="tabLev3" value="movies"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Movies - <c:out value="${param['title']}" default="Trailer" escapeXml="true"/></span></h1>

                        <div style="padding: 10px; background: transparent url(/i/interface/videoBackdrop320x240.png) center center no-repeat;" align="center">
                            <script language="JavaScript">
                            var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="280" id="webcast" align="middle">'
                            + '<param name="allowScriptAccess" value="always" />'
                            + '<param name="movie" value="/flash/media/tco07.swf?&clip=<c:out value="${param['clip']}" default="trailer" escapeXml="true"/>" />'
                            + '<param name="quality" value="high" />'
                            + '<param name="bgcolor" value="#000000" />'
                            + '<param name="allowFullScreen" value="true" />'
                            + '<embed src="/flash/media/tco07.swf?&clip=<c:out value="${param['clip']}" default="trailer" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="280" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
                            + '</object>';
                            doWrite(s);
                            </script>
                        </div>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
