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

<div class="linkBox"><a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=archive">back to archive</a></div>
<h1>TCO06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tco06Submissions0">View Submissions</a>
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
<studio:handle coderId="14947701"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0056.jpg" alt="" />



</td>
</tr>

<tr>
<td valign="top">
2
</td>

<td align="left" valign="top">
<studio:handle coderId="20022453"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0346.jpg" alt="" />



</td>
</tr>

<tr>
<td valign="top">
3
</td>

<td align="left" valign="top">

<studio:handle coderId="14978261"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0532.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
4
</td>

<td align="left" valign="top">

<studio:handle coderId="19831854"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0246.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
5
</td>


<td align="left" valign="top">
<studio:handle coderId="8503625"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0341.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
6
</td>


<td align="left" valign="top">
<studio:handle coderId="19831854"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0247.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
7
</td>


<td align="left" valign="top">
<studio:handle coderId="15023758"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0529.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
8
</td>


<td align="left" valign="top">
<studio:handle coderId="20023387"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0607.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
9
</td>


<td align="left" valign="top">
<studio:handle coderId="20023566"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0293.jpg" alt="" />


</td>
</tr>

<tr>
<td valign="top">
10
</td>


<td align="left" valign="top">
<studio:handle coderId="19960165"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tco06/finalists/0308.jpg" alt="" />


</td>
</tr>

        </tbody>
        </table>
    </div>
    <div class="SE"><img src="/i/v2/stat_tableSE.png" alt="" /></div>
    <div class="SW"><img src="/i/v2/stat_tableSW.png" alt="" /></div>
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