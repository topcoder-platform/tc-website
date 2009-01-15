<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<div class="linkBox"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=archive">back to archive</a></div>
<h1>TCO06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
View Submissions
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco06Finals">Finals</a>
</div>

<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco06Submissions4"><< prev</a>
 | next >>
</div>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
<tbody>
    <tr><td class="title" colspan="3">Submissions</td></tr>
    <% boolean even = true;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0607<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0607.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20023387--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0606<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0606.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--154825--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0605<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0605.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--154825--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0604<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0604.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--7371063--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0603<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0603.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--8584656--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0602<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0602.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10416197--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0601<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0601.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10416197--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0600<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0600.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10465538--%>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>
<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco06Submissions4"><< prev</a>
 | next >>
</div>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>