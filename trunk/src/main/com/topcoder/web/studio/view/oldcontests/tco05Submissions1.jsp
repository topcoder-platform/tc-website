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
<h1>TCO05 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
View Submissions
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco05Finals">Finals</a>
</div>

<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco05Submissions0"><< prev</a>
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco05Submissions2">next >></a>
</div>

<div class="statHolder">
    <div class="NE"><img src="/i/v2/stat_tableNE.png" alt="" /></div>
    <div class="NW"><img src="/i/v2/stat_tableNW.png" alt="" /></div>
    <div class="container">
        <table class="stat" cellpadding="0" cellspacing="0" width="100%">
<tbody>
    <tr><td class="title" colspan="3">Submissions</td></tr>
    <% boolean even = true;%>
<script language=javascript type="text/javascript">
for(i = 199; i >= 183; i--)
document.writeln( '<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">'+i+'<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/'+i+'.gif" alt="'+i+'" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>' )
</script>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">182<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/182.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">181<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/181.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>

<script language=javascript type="text/javascript">
for(i = 180; i >= 174; i--)
document.writeln( '<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">'+i+'<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/'+i+'.gif" alt="'+i+'" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>' )
</script>

<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">173<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/173.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">172<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/172.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">171<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/171.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">170<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/170.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>

<script language=javascript type="text/javascript">
for(i = 169; i >= 162; i--)
document.writeln( '<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">'+i+'<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/'+i+'.gif" alt="'+i+'" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>' )
</script>

<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">162<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/162.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">161<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/161.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">160<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/160.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">159<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/159.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">158<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/158.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">157<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/157.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">156<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/156.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>

<script language=javascript type="text/javascript">
for(i = 155; i >= 140; i--)
document.writeln( '<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">'+i+'<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/'+i+'.gif" alt="'+i+'" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>' )
</script>

<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">139<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/139.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">138<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/138.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">137<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/137.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">136<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/136.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">135<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/135.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">134<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/134.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">133<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/133.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">132<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/132.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">131<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/131.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">130<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/130.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">129<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/129.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">128<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/128.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">127<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/127.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">126<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/126.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">125<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/125.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">124<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/124.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">123<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/123.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">122<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/122.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">121<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/121.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">120<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/120.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">119<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/119.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">118<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/118.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">117<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/117.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">116<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/116.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">115<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/115.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">114<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/114.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">113<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/113.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">112<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/112.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">111<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/111.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">110<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/110.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">109<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/109.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">108<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/108.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">107<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/107.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">106<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/106.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">105<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/105.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">104<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/104.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">103<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/103.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">102<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/102.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">101<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/101.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
<tr><td class="space" colspan="3">&nbsp;</td></tr>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">100<br /><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/100.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>
        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
</div>
<div class="pagingBox">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco05Submissions0"><< prev</a>
 | <a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco05Submissions2">next >></a>
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