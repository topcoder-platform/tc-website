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
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions0"><< prev</a>
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions2">next >></a>
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
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0199<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0199.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21258240--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0198<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0198.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21258240--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0197<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0197.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21263810--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0196<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0196.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21457858--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0195<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0195.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21595958--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0194<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0194.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21731777--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0193<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0193.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22382012--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0192<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0192.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22382012--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0191<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0191.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22418135--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0190<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0190.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22418135--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0189<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0189.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22418135--%>

<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0188<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0188.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20961927--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0187<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0187.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16116947--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0186<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0186.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16116947--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0185<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0185.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16116947--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0184<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0184.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19786437--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0183<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0183.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19841837--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0182<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0182.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19907956--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0181<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0181.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19907956--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0180<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0180.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19907956--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0179<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0179.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19938561--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0178<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0178.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19989263--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0177<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0177.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20262386--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0176<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0176.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--13360837--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0175<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0175.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14930868--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0174<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0174.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14978261--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0173<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0173.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15052902--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0172<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0172.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15052902--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0171<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0171.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15607604--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0170<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0170.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15672458--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0169<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0169.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15672458--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0168<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0168.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15672458--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0167<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0167.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15709678--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0166<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0166.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15709678--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0165<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0165.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15790085--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0164<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0164.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15790085--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0163<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0163.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15790085--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0162<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0162.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10628325--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0161<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0161.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--159131--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0160<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0160.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--159131--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0159<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0159.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--159131--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0158<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0158.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--7502813--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0157<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0157.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--8361901--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0156<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0156.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10022398--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0155<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0155.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10550532--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0154<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0154.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22497796--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0153<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0153.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22497796--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0152<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0152.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10153590--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0151<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0151.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10153590--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0150<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0150.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10628325--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0149<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0149.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16212307--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0148<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0148.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20215936--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0147<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0147.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20215936--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0146<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0146.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21394140--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0145<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0145.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21890309--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0144<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0144.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22028757--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0143<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0143.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22397503--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0142<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0142.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22497796--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0141<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0141.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22465919--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0140<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0140.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10283866--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0139<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0139.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10283866--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0138<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0138.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10283866--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0137<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0137.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15135181--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0136<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0136.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--16206651--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0135<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0135.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20854265--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0134<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0134.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21578334--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0133<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0133.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22396878--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0132<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0132.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22435388--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0131<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0131.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22435388--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0130<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0130.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10022398--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0129<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0129.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10022398--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0128<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0128.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14966002--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0127<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0127.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14966002--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0126<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0126.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15179349--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0125<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0125.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15179349--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0124<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0124.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15832159--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0123<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0123.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19720600--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0122<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0122.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--19720600--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0121<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0121.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20215936--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0120<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0120.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20660812--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0119<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0119.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20848364--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0118<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0118.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20848364--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0117<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0117.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20848364--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0116<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0116.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20893980--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0115<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0115.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21405960--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0114<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0114.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21405960--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0113<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0113.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--21677555--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0112<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0112.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22428329--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0111<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0111.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22454151--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0110<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0110.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22443989--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0109<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0109.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--303346--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0108<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0108.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--303346--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0107<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0107.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--303346--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0106<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0106.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14822038--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0105<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0105.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--14822038--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0104<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0104.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--15444655--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0103<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0103.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20394129--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0102<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0102.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22058156--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0101<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0101.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22224559--%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0100<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/logo_submissions/0100.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--22224559--%>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>
<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions0"><< prev</a>
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions2">next >></a>
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