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

<div class="linkBox"><a href="/?module=Static&d1=old_contests&d2=archive">back to archive</a></div>
<h1>TCO06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
<A href="/?module=Static&d1=old_contests&d2=tco06_submissions_0">View Submissions</A>
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
<studio:handle coderId="14947701"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0056.jpg" alt="" />



</td>
</tr>

<tr>
<td valign="top">
2
</td>

<td align="left" valign="top">
<studio:handle coderId="20022453"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0346.jpg" alt="" />



</td>
</tr>

<tr>
<td valign="top">
3
</td>

<td align="left" valign="top">

<studio:handle coderId="14978261"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0532.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
4
</td>

<td align="left" valign="top">

<studio:handle coderId="19831854"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0246.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
5
</td>


<td align="left" valign="top">
<studio:handle coderId="8503625"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0341.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
6
</td>


<td align="left" valign="top">
<studio:handle coderId="19831854"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0247.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
7
</td>


<td align="left" valign="top">
<studio:handle coderId="15023758"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0529.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
8
</td>


<td align="left" valign="top">
<studio:handle coderId="20023387"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0607.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
9
</td>


<td align="left" valign="top">
<studio:handle coderId="20023566"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0293.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
10
</td>


<td align="left" valign="top">
<studio:handle coderId="19960165"/><br>
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0308.jpg" alt="" />


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