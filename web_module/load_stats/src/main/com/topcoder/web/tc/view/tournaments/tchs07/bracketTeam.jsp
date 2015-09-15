<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
<head> 
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/coders.css"/>
    <link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/tchs07.css"/>
    <title>TopCoder High School 2007</title> 
</head>
<body>

<div align="center" style="background: transparent;">
    <div class="content">
        <img src="/i/tournament/tchs07/contentN.png" alt="contentN" style="display: block;" />

        <jsp:include page="links.jsp" >
        <jsp:param name="tabLev1" value="resultsTeam"/>
        <jsp:param name="tabLev2" value=""/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

        <div class="contentSpacer">
          <h2>Team Results</h2>

<p>
    <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=resultsTeam">Online Rounds</A>
    | Finals
</p>

<p align="center">
    The teams are sorted by score.
</p>

<div align="center" style="margin:20px;">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
   <tr>
      <td align="right"><img src="/i/tournament/tchs07/bracket_NW.png" alt="" border="0" /></td>
      <td rowspan="3" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td rowspan="3" valign="middle"><img src="/i/tournament/tchs07/bracket_R.png" alt="" border="0" /></td>
      <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tchs07/champion.png" alt="" border="0" /><br /><span style="font-size: 15px;"><strong>V. Gimnazija</strong></span></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
<strong>V. Gimnazija</strong><br />
22<br />
<strong>VI LO Bydgoszcz</strong><br />
37<br />
<strong>XV. Gimnazija Zagreb</strong><br />
45<br />
<strong>TJHSST</strong><br />
50<br />
<strong>SPb PTHS</strong><br />
57<br />
<strong>Liviu Rebreanu National College Bistrita</strong><br />
66<br />
<strong>Woburn Collegiate Institute</strong><br />
69<br />
<strong>High School of Natural Science and Mathematics</strong><br />
75
      </td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tchs07/bracket_SW.png" alt="" border="0" /></td>
   </tr>
</table>
</div>

        </div>
        <div class="footer">
            Copyright &#169; 2000-2006, TopCoder, Inc. All rights reserved.
        </div>
        <img src="/i/tournament/tchs07/contentS.png" alt="contentS" style="display: block;"/>
    </div>
</div>

</body> 
</html>

