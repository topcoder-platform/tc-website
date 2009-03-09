<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

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

<h1>Old Contests</h1>

<div align="center">
In the past, TopCoder has held contests to design logos for our online programming competitions.<br />These are the winning submissions. Click the logos for more details.
<br /><br />
<table cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td align="center">
        <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Finals"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0449.gif" alt="" /></a>
        </td>
    </tr>
    <tr>
        <td align="center" style="padding-bottom: 100px;">
        <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco06Finals"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0056.jpg" alt="" /></a>
        </td>
    </tr>
    <tr>
        <td align="center">
        <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco05Finals"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/085.gif" alt=""  /></a>
        </td>
    </tr>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>
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