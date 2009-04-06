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
                <jsp:param name="node" value="tc_channel"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div align="right" style="padding: 10px; background: transparent url(/i/interface/videoBackdrop320x240.png) right center no-repeat;">

                    <div style="float: left; margin-top: 50px;">
                        <img src="/i/tcchannel/tcchannelLogo.png" alt="TC Channel" />
                    </div>

                    <script language="JavaScript">
                    var s='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="320" height="280" id="webcast" align="middle">'
                    + '<param name="allowScriptAccess" value="always" />'
                    + '<param name="movie" value="/flash/media/video_4x3.swf?app=tcchannel&clip=<c:out value="${param['clip']}" default="tco08_25" escapeXml="true"/>" />'
                    + '<param name="quality" value="high" />'
                    + '<param name="bgcolor" value="#000000" />'
                    + '<param name="allowFullScreen" value="true" />'
                    + '<embed src="/flash/media/video_4x3.swf?app=tcchannel&clip=<c:out value="${param['clip']}" default="tco08_25" escapeXml="true"/>" quality="high" bgcolor="#000000" allowFullScreen="true" width="320" height="280" name="webcast" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />'
                    + '</object>';
                    doWrite(s);
                    </script>
                </div>

                <div style="margin-top: 10px;">
                    <jsp:include page="tcchannelNav.jsp" />
                </div>

                <p style="margin-top: 30px;">
                    Comments? Ideas? Have a video clip you'd like to share? We want your feedback so drop us an email at <A href="mailto:tcchannel@topcoder.com">tcchannel@topcoder.com</A>.
                    If we use your suggestion or material we'll send you a limited edition TC Channel T-shirt.
                </p>

                <p class="small" align="center" style="margin-top: 40px; padding-top: 10px; border-top: 1px solid #999999;">
                    [TOPCODER]&#174;, [TOPCODER] SOFTWARE&#174;, POWERED BY [TOPCODER]&#174;, TOPCODER STUDIO&#153;, THE BALL&#153;, DIGITAL RUN&#153;, & TC CHANNEL&#153; are either trademarks or registered trademarks of TopCoder, Inc. under the laws of the United States and/or other countries and may not be reproduced, republished, distributed, or otherwise used without the prior written consent of TopCoder, Inc.  The names of other companies and products mentioned herein may be the trademarks of their respective owners. 
                    <br><br>
                    All contents copyright &#169; 2007 TopCoder, Inc.  All rights reserved.
                </p>

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