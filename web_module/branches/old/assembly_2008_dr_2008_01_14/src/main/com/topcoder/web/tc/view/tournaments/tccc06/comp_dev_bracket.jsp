<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="bracket"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
<span class="bigTitle">Development Finalists Bracket</span>
<br><br>
The finalists are sorted alphabetically.
<br><br>
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="3" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td rowspan="3" valign="middle"><img src="/i/tournament/tccc06/bracket_R.gif" alt="" border="0" /></td>
      <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tccc06/champion.gif" alt="" border="0" /><br><span class="bigTitle"><tc-webtag:handle coderId="9998760" context="development"/></span></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <tc-webtag:handle coderId="8347577" context="development" darkBG="true"/><br><br>
      <tc-webtag:handle coderId="20256177" context="development" darkBG="true"/><br><br>
      <tc-webtag:handle coderId="302810" context="development" darkBG="true"/><br><br>
      <tc-webtag:handle coderId="14788013" context="development" darkBG="true"/><br><br>
      <tc-webtag:handle coderId="9998760" context="development" darkBG="true"/><br><br>
      <tc-webtag:handle coderId="8375801" context="development" darkBG="true"/><br><br>
      <tc-webtag:handle coderId="10526732" context="development" darkBG="true"/>
      </td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_BL.gif" alt="" border="0" /></td>
   </tr>
</table>

        </div>
      </td>


<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>

   </tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
