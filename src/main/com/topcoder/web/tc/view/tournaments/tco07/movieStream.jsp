<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

<c:choose>
    <c:when test="${param['clip']=='webcast1' || param['clip']=='webcast2' || param['clip']=='webcast3' || param['clip']==null}">
        <div style="padding: 10px; background: transparent url(/i/interface/videoBackdrop320x214.png) center center no-repeat;" align="center">
        <script language="JavaScript">
        var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="254" id="webcast" align="middle">'
        + '<param name="allowScriptAccess" value="always" />'
        + '<param name="movie" value="/flash/media/video_3x2.swf?app=tco07&clip=<c:out value="${param['clip']}" default="webcast1" escapeXml="true"/>" />'
        + '<param name="quality" value="high" />'
        + '<param name="bgcolor" value="#000000" />'
        + '<param name="allowFullScreen" value="true" />'
        + '<embed src="/flash/media/video_3x2.swf?app=tco07&clip=<c:out value="${param['clip']}" default="webcast1" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="254" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
        + '</object>';
        doWrite(s);
        </script>
        </div>
    </c:when>
    <c:otherwise>
        <div style="padding: 10px; background: transparent url(/i/interface/videoBackdrop320x240.png) center center no-repeat;" align="center">
        <script language="JavaScript">
        var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="280" id="webcast" align="middle">'
        + '<param name="allowScriptAccess" value="always" />'
        + '<param name="movie" value="/flash/media/video_4x3.swf?app=tco07&clip=<c:out value="${param['clip']}" default="trailer" escapeXml="true"/>" />'
        + '<param name="quality" value="high" />'
        + '<param name="bgcolor" value="#000000" />'
        + '<param name="allowFullScreen" value="true" />'
        + '<embed src="/flash/media/video_4x3.swf?app=tco07&clip=<c:out value="${param['clip']}" default="trailer" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="280" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
        + '</object>';
        doWrite(s);
        </script>
        </div>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${param['clip']=='webcast1'}">
        <p align="center">
            &lt;&lt; prev
            | <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast2&title=Webcast%20Part%202">next &gt;&gt;</a>
            <br /><tc-webtag:forumLink forumID="516866" message="Discuss" />
        </p>
    </c:when>
    <c:when test="${param['clip']=='webcast2'}">
        <p align="center">
            <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast1&title=Webcast%20Part%201">&lt;&lt; prev</a>
            | <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast3&title=Webcast%20Part%203">next &gt;&gt;</a>
            <br /><tc-webtag:forumLink forumID="516866" message="Discuss" />
        </p>
    </c:when>
    <c:when test="${param['clip']=='webcast3'}">
        <p align="center">
            <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast2&title=Webcast%20Part%202">&lt;&lt; prev</a>
            | next &gt;&gt;
            <br /><tc-webtag:forumLink forumID="516866" message="Discuss" />
        </p>
    </c:when>
</c:choose>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
