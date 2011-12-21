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
<h1>TCCC06 Logo Contest</h1>

<div align="left" style="padding-bottom: 10px;">
<a href="${sessionInfo.servletPath}?module=Static&amp;d1=oldcontests&amp;d2=tccc06Submissions0">View Submissions</a>
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
<studio:handle coderId="14947661"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0449.gif" alt="" />



</td>
</tr>

<tr>
<td valign="top">
2
</td>

<td align="left" valign="top">
<studio:handle coderId="22503298"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0227.gif" alt="" />



</td>
</tr>

<tr>
<td valign="top">
3
</td>

<td align="left" valign="top">

<studio:handle coderId="22540263"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0571.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
4
</td>

<td align="left" valign="top">

<studio:handle coderId="22432924"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0377.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
5
</td>


<td align="left" valign="top">
<studio:handle coderId="22383231"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0379.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
6
</td>


<td align="left" valign="top">
<studio:handle coderId="22626796"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0404.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
7
</td>


<td align="left" valign="top">
<studio:handle coderId="15140959"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0462.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
8
</td>


<td align="left" valign="top">
<studio:handle coderId="8361901"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0224.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
9
</td>


<td align="left" valign="top">
<studio:handle coderId="14925029"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0045.gif" alt="" />


</td>
</tr>

<tr>
<td valign="top">
10
</td>


<td align="left" valign="top">
<studio:handle coderId="10651364"/><br />
<img src="http://<%=ApplicationServer.SERVER_NAME%>/i/tournament/tccc06/finalists/0433.gif" alt="" />


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