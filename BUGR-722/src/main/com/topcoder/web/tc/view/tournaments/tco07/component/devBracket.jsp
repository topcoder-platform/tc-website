<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="component"/>
                    <jsp:param name="tabLev2" value="development"/>
                    <jsp:param name="tabLev3" value="bracket"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Component Development Finalist Bracket</span></h1>

                        <p align="center">
                            The finalists are sorted alphabetically.
                        </p>

<div align="center" style="margin:20px;">
<table cellpadding="0" cellspacing="0" border="0" style="margin-bottom: 40px;">
   <tr>
      <td align="right"><img src="/i/tournament/tco07/bracket_NW.png" alt="" border="0" /></td>
      <td rowspan="3" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td rowspan="3" valign="middle"><img src="/i/tournament/tco07/bracket_R.png" alt="" border="0" /></td>
      <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tco07/champion.png" alt="" border="0" /><br><span class="bigTitle"><tc-webtag:handle coderId="15214882" context="development"/></span></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <tc-webtag:handle coderId="7210680" context="development" /><br><br>
      <tc-webtag:handle coderId="20092786" context="development" /><br><br>
      <tc-webtag:handle coderId="15214882" context="development" /><br><br>
      <tc-webtag:handle coderId="9998760" context="development" /><br><br>
      <tc-webtag:handle coderId="15763373" context="development" /><br><br>
      <tc-webtag:handle coderId="7359397" context="development" />
      </td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco07/bracket_SW.png" alt="" border="0" /></td>
   </tr>
</table>

<p align="center">
    The Review Board for the<br>TCO07 Component Development Finals:<br><br>
    <tc-webtag:handle coderId="7584235" context="development" /><br>
    <tc-webtag:handle coderId="297731" context="development" /><br>
    <tc-webtag:handle coderId="347569" context="development" />
</p>

</div>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
