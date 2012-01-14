<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script src="/js/tcscript.js" type="text/javascript"></script>
</head>
<body>

<jsp:include page="../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="media"/>
                    <jsp:param name="title" value="&nbsp;"/>
                </jsp:include>

                <h2><c:out value="${param['title']}" default="" escapeXml="true"/></h2>

                <div style="padding: 10px; margin: 40px 10px; background: transparent url(/i/interface/videoBackdrop320x214.png) center center no-repeat;" align="center">
                <script language="JavaScript">
                var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="254" id="webcast" align="middle">'
                + '<param name="allowScriptAccess" value="always" />'
                + '<param name="movie" value="/flash/media/video_3x2.swf?app=misc&clip=<c:out value="${param['clip']}" default="" escapeXml="true"/>" />'
                + '<param name="quality" value="high" />'
                + '<param name="bgcolor" value="#000000" />'
                + '<param name="allowFullScreen" value="true" />'
                + '<embed src="/flash/media/video_3x2.swf?app=misc&clip=<c:out value="${param['clip']}" default="" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="254" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
                + '</object>';
                doWrite(s);
                </script>
                </div>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp" />
</body>
</html>