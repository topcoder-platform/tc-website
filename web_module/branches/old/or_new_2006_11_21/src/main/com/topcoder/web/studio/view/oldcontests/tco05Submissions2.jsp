<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">

      <jsp:include page="../top.jsp" />
         <jsp:include page="../topNav.jsp">
             <jsp:param name="node" value="contests"/>
         </jsp:include>

        <div class="contentIn">

            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>
            <div class="contentSpacer">

<div class="linkBox"><a href="/?module=Static&d1=oldcontests&d2=archive">back to archive</a></div>
<h1>TCO05 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
View Submissions
 | <A href="/?module=Static&d1=oldcontests&d2=tco05Finals">Finals</A>
</div>

<div class="pagingBox">
<A href="/?module=Static&d1=oldcontests&d2=tco05Submissions1"><< prev</A>
 | <A href="/?module=Static&d1=oldcontests&d2=tco05Submissions3">next >></A>
</div>

<table cellpadding="0" cellspacing="0" class="stat" style="width:740px;">
<tbody>
    <tr>
        <td class="NW">&nbsp;</td>
        <td class="title">Submissions</td>
        <td class="NE">&nbsp;</td>
    </tr>
    <% boolean even = true;%>
<script language=javascript type="text/javascript">
for(i = 299; i >= 234; i--)
document.writeln( '<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">'+i+'<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/'+i+'.gif" alt="'+i+'" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>' )
</script>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">233<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/233.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>

<script language=javascript type="text/javascript">
for(i = 232; i >= 200; i--)
document.writeln( '<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">'+i+'<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/'+i+'.gif" alt="'+i+'" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>' )
</script>
            <tr>
                <td class="SW" colspan="2">&nbsp;</td>
                <td class="SE">&nbsp;</td>
            </tr>
</tbody>
</table>
<div class="pagingBox">
<A href="/?module=Static&d1=oldcontests&d2=tco05Submissions1"><< prev</A>
 | <A href="/?module=Static&d1=oldcontests&d2=tco05Submissions3">next >></A>
</div>


            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="../foot.jsp"/>

        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>