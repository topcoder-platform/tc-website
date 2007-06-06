<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="studio.tld" prefix="studio" %>

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
    <div id="contentOut" class="contentOut">

      <jsp:include page="../top.jsp" />
         <jsp:include page="../topNav.jsp">
             <jsp:param name="node" value="contests"/>
         </jsp:include>

        <div id="contentIn" class="contentIn">

            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>
            <div class="contentSpacer">

<h1>Old Contests</h1>

<div align="center">
In the past, TopCoder has held contests to design logos for our online programming competitions.<br>These are the winning submissions. Click the logos for more details.
<br><br>
<table cellpadding="0" cellspacing="0">
<tbody>
    <tr>
        <td align="center">
        <A href="/?module=Static&d1=oldcontests&d2=tccc06Finals"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0449.gif" alt="" /></A>
        </td>
    </tr>
    <tr>
        <td align="center" style="padding-bottom: 100px;">
        <A href="/?module=Static&d1=oldcontests&d2=tco06Finals"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/logo_submissions/0056.jpg" alt="" /></A>
        </td>
    </tr>
    <tr>
        <td align="center">
        <A href="/?module=Static&d1=oldcontests&d2=tco05Finals"><img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco05/logo_submissions/085.gif" alt=""  /></A>
        </td>
    </tr>
</tbody>
</table>
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