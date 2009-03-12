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
<h1>TCCC06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
View Submissions
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Finals">Finals</a>
</div>

<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions3"><< prev</a>
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions5">next >></a>
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
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0499<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0499.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20034502--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0498<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0498.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20106486--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0497<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0497.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20184848--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0496<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0496.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20184848--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0495<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0495.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20184848--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0494<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0494.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20284477--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0493<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0493.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20284477--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0492<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0492.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20330724--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0491<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0491.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20394129--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0490<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0490.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20822485--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0489<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0489.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20887655--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0488<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0488.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20029672--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0487<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0487.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19960248--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0486<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0486.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19960248--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0485<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0485.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19960248--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0484<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0484.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19973074--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0483<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0483.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19973074--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0482<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0482.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19993105--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0481<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0481.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19993105--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0480<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0480.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19993105--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0479<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0479.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19993738--%>

<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0478<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0478.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19918867--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0477<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0477.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15718815--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0476<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0476.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16059773--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0475<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0475.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16059773--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0474<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0474.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16182746--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0473<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0473.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16182746--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0472<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0472.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19721923--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0471<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0471.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19805111--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0470<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0470.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19805111--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0469<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0469.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19805111--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0468<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0468.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19831854--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0467<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0467.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19831854--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0466<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0466.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19918867--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0465<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0465.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19918867--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0464<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0464.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15718815--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0463<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0463.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15140959--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0462<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0462.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15140959--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0461<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0461.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15140959--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0460<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0460.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15215736--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0459<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0459.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15215736--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0458<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0458.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15217455--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0457<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0457.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15217455--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0456<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0456.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15247903--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0455<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0455.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15329568--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0454<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0454.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15329568--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0453<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0453.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15673275--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0452<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0452.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15673275--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0451<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0451.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15673275--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0450<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0450.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15047259--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0449<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0449.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14947661--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0448<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0448.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14957260--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0447<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0447.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14957260--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0446<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0446.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14957260--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0445<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0445.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14978261--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0444<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0444.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14978261--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0443<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0443.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15009274--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0442<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0442.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15009274--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0441<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0441.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15009274--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0440<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0440.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15014303--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0439<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0439.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15047259--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0438<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0438.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15047259--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0437<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0437.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14947661--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0436<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0436.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10484242--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0435<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0435.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10651364--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0434<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0434.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10651364--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0433<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0433.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10651364--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0432<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0432.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10687610--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0431<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0431.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11833324--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0430<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0430.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11853288--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0429<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0429.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11853288--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0428<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0428.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11941693--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0427<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0427.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11941693--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0426<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0426.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11944899--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0425<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0425.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--11946448--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0424<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0424.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14926694--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0423<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0423.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14930868--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0422<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0422.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14947661--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0421<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0421.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10484242--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0420<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0420.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--272311--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0419<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0419.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--297186--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0418<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0418.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--297186--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0417<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0417.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--310223--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0416<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0416.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--310223--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0415<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0415.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--310226--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0414<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0414.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--310226--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0413<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0413.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--310226--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0412<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0412.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10481546--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0411<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0411.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10484242--%>

<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0410<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0410.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22554608--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0409<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0409.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22554608--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0408<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0408.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22554608--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0407<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0407.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626785--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0406<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0406.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626796--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0405<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0405.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626796--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0404<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0404.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626796--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0403<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0403.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626847--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0402<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0402.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626847--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0401<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0401.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626864--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0400<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0400.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22626864--%>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>
<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions3"><< prev</a>
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions5">next >></a>
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