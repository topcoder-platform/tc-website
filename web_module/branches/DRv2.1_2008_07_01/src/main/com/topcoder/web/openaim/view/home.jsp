<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.openaim.Constants" %>
<%@ page import="com.topcoder.web.openaim.controller.request.Login" %>
<%@ page import="java.util.Map" %>
<% ResultSetContainer recentWinners = (ResultSetContainer) ((Map) request.getAttribute("openaim_home_data")).get("recent_winners");%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>

    <script src="http://<%=ApplicationServer.SERVER_NAME%>/js/tcscript.js" type="text/javascript"></script>

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/openaim/tabs/registerOn.png';
            img.src = '/i/events/openaim/tabs/submitOn.png';
            img.src = '/i/events/openaim/tabs/apisOn.png';
            img.src = '/i/events/openaim/tabs/discussOn.png';
        }
    </script>

</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">
                <jsp:include page="openaimTop.jsp"/>
                <div class="contentWithLeft" align="right">
                    <div class="contentTexture">
                        <jsp:include page="leftBox.jsp"/>
                        <jsp:include page="topNav.jsp"/>
                        <div class="newsBox">
                            <iframe src="http://openaimblog.aol.com/<c:out value="${param['myframe']}" default="" escapeXml="true"/>" marginheight="0" marginwidth="0"></iframe>
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