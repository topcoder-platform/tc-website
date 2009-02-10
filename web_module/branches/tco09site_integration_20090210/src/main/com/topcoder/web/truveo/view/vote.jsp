<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Truveo Developer Challenge :: Powered by TopCoder</title>
    <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_truveo"/>
    </jsp:include>
</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="truveoTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

                    	<c:choose>
                            <c:when test="${sessionInfo.anonymous}">
                            	You must login in order to continue
                            </c:when>
                            <c:otherwise>
                                <div align="center">
                                    <script language="JavaScript">
                                        var s = '<object ' +
                                                'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ' +
                                                'codebase="http://fpdownload.macromedia.com" ' +
                                                '/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" ' +
                                                'width="725" ' +
                                                'height="800" ' +
                                                'id="ratingHistory" ' +
                                                'align="middle"> ' +
                                                '<param name="allowScriptAccess" value="sameDomain" /> ' +
                                                '<param name="movie" value="/i/events/truveo/Voting_Widget.swf" />' +
                                                '<param name="menu" value="true" /> ' +
                                                '<param name="quality" value="high" /> ' +
                                                '<param name="bgcolor" value="#EEEEEE" /> ' +
                                                '<embed ' +
                                                'src="/i/events/truveo/Voting_Widget.swf" ' +
                                                'menu="true" ' +
                                                'quality="high" ' +
                                                'bgcolor="#EEEEEE" ' +
                                                'width="725" ' +
                                                'height="800" ' +
                                                'name="ratingHistory" ' +
                                                'align="middle" ' +
                                                'allowScriptAccess="sameDomain" ' +
                                                'type="application/x-shockwave-flash" ' +
                                                'pluginspage="http://www.macromedia.com/go/getflashplayer" /> ' +
                                                '</object> ';
                                        doWrite(s);
                                    </script>
                                </div>                        
                            </c:otherwise>
                    	</c:choose>

                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>
