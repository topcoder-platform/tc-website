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
    <div class="contentOut">

      <jsp:include page="../top.jsp" />
         <jsp:include page="../topNav.jsp">
             <jsp:param name="node" value="contests"/>
         </jsp:include>

        <div class="contentIn">

            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>
            <div class="contentSpacer">

<h1>TCCC06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
<A href="/?module=Static&d1=old_contests&d2=tccc06_submissions_0">View Submissions</A>
 | Finals
</div>

<table class="bodyText" align="center" border="0" cellpadding="0" cellspacing="0">
<tbody><tr>
<td style="padding-right: 10px;"><b>Rank</b></td>
<td><b>Candidate</b></td>

</tr>

<tr>
<td valign="top">
1
</td>

<td align="left" valign="top">
<studio:handle coderId="14947661"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0449.gif" alt="" />



</td>
</tr>

<tr>
<td valign="top">
2
</td>

<td align="left" valign="top">
<studio:handle coderId="22503298"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0227.gif" alt="" />



</td>
</tr>

<tr>
<td valign="top">
3
</td>

<td align="left" valign="top">

<studio:handle coderId="22540263"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0571.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
4
</td>

<td align="left" valign="top">

<studio:handle coderId="22432924"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0377.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
5
</td>


<td align="left" valign="top">
<studio:handle coderId="22383231"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0379.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
6
</td>


<td align="left" valign="top">
<studio:handle coderId="22626796"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0404.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
7
</td>


<td align="left" valign="top">
<studio:handle coderId="15140959"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0462.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
8
</td>


<td align="left" valign="top">
<studio:handle coderId="8361901"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0224.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
9
</td>


<td align="left" valign="top">
<studio:handle coderId="14925029"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0045.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
10
</td>


<td align="left" valign="top">
<studio:handle coderId="10651364"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0433.gif" alt="" />


</td>
</tr>

</tbody>
</table>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <jsp:include page="../foot.jsp"/>

        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>