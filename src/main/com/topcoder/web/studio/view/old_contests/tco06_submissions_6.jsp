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

<div class="linkBox"><a href="/?module=Static&d1=old_contests&d2=archive">back to archive</a></div>
<h1>TCO06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
View Submissions
 | <A href="/?module=Static&d1=old_contests&d2=tco06_finals">Finals</A>
</div>

<div class="pagingBox">
<A href="/?module=Static&d1=old_contests&d2=tco06_submissions_4"><< prev</A>
 | next >>
</div>

<table cellpadding="0" cellspacing="0" class="stat" style="width:740px;">
<tbody>
    <tr>
        <td class="NW">&nbsp;</td>
        <td class="title">Submissions</td>
        <td class="NE">&nbsp;</td>
    </tr>
    <% boolean even = true;%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0607<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0607.jpg" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--20023387--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0606<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0606.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--154825--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0605<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0605.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--154825--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0604<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0604.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--7371063--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0603<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0603.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--8584656--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0602<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0602.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10416197--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0601<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0601.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10416197--%>
<tr class="<%=even?"light":"dark"%>"><td class="valueW"><div>&nbsp;</div></td><td class="valueC">0600<br><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0600.gif" alt="" /></td><td class="valueE"><div>&nbsp;</div></td></tr><% even = !even;%>   <%--10465538--%>
            <tr>
                <td class="SW" colspan="2">&nbsp;</td>
                <td class="SE">&nbsp;</td>
            </tr>
</tbody>
</table>
<div class="pagingBox">
<A href="/?module=Static&d1=old_contests&d2=tco06_submissions_4"><< prev</A>
 | next >>
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