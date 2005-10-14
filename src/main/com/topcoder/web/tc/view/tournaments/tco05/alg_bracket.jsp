<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="bracket"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center" style="padding-top: 10px; padding-bottom: 40px; padding-left: 15px; padding-right: 15px;">

<br>
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
   <tr><td colspan="10"><span class="bigTitle">Algorithm Bracket</span></td></tr>
   <tr>
      <td align="center"><img src="/i/tournament/tco05/bracket_room1.gif" alt="" border="0" /></td>
      <td colspan="2">&#160;</td>
      <td align="center"><img src="/i/tournament/tco05/bracket_wildcard.gif" alt="" border="0" /></td>
      <td colspan="2">&#160;</td>
      <td align="center"><img src="/i/tournament/tco05/bracket_finals.gif" alt="" border="0" /></td>
      <td colspan="3">&#160;</td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="2" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td colspan="2" align="right"><img src="/i/tournament/tco05/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="2" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td colspan="2" align="right"><img src="/i/tournament/tco05/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="11" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td rowspan="2" valign="middle"></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- ROOM 1 --%>
      <tc-webtag:handle coderId="10574855" context="algorithm"/><br>
      <tc-webtag:handle coderId="9906197" context="algorithm"/><br>
      <tc-webtag:handle coderId="287105" context="algorithm"/><br>
      <tc-webtag:handle coderId="7452866" context="algorithm"/><br>
      <tc-webtag:handle coderId="279471" context="algorithm"/><br>
      <tc-webtag:handle coderId="7462740" context="algorithm"/><br>
      <tc-webtag:handle coderId="9958600" context="algorithm"/><br>
      <tc-webtag:handle coderId="7442498" context="algorithm"/><br>
      <tc-webtag:handle coderId="287266" context="algorithm"/><br>
      <tc-webtag:handle coderId="287568" context="algorithm"/><br>
      <tc-webtag:handle coderId="8601171" context="algorithm"/><br>
      <tc-webtag:handle coderId="10428762" context="algorithm"/><br>
      <tc-webtag:handle coderId="107835" context="algorithm"/><br>
      <tc-webtag:handle coderId="7338095" context="algorithm"/><br>
      <tc-webtag:handle coderId="10157606" context="algorithm"/><br>
      <tc-webtag:handle coderId="289307" context="algorithm"/><br>
      </td>
      <td valign="middle"><img src="/i/tournament/tco05/bracket_bar.gif" alt="" border="0" /></td>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- WILDCARD ROOM --%>
      &#160;
      </td>
      <td valign="middle">&#160;</td>
      <td rowspan="9" style="padding: 15px" valign="middle" align="center">
      <%-- FINALS --%>
      <tc-webtag:handle coderId="8355516" context="algorithm"/><br>
      <tc-webtag:handle coderId="156216" context="algorithm"/><br>
      <tc-webtag:handle coderId="8357090" context="algorithm"/><br>
      <tc-webtag:handle coderId="293874" context="algorithm"/><br>
      <tc-webtag:handle coderId="10574855" context="algorithm"/><br>
      <tc-webtag:handle coderId="7462740" context="algorithm"/><br>
      <tc-webtag:handle coderId="270505" context="algorithm"/><br>
      <tc-webtag:handle coderId="7390224" context="algorithm"/><br>
      </td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_BL.gif" alt="" border="0" /></td>
      <td colspan="4" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td align="center"><img src="/i/tournament/tco05/bracket_room2.gif" alt="" border="0" /></td><td colspan="3">&#160;</td>
      <td style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td>&#160;</td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_TL.gif" alt="" border="0" /></td>
      <td colspan="5" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- ROOM 2 --%>
      <tc-webtag:handle coderId="270505" context="algorithm"/><br>
      <tc-webtag:handle coderId="8355516" context="algorithm"/><br>
      <tc-webtag:handle coderId="274023" context="algorithm"/><br>
      <tc-webtag:handle coderId="277659" context="algorithm"/><br>
      <tc-webtag:handle coderId="10599449" context="algorithm"/><br>
      <tc-webtag:handle coderId="7393427" context="algorithm"/><br>
      <tc-webtag:handle coderId="7485898" context="algorithm"/><br>
      <tc-webtag:handle coderId="262936" context="algorithm"/><br>
      <tc-webtag:handle coderId="7390224" context="algorithm"/><br>
      <tc-webtag:handle coderId="7459080" context="algorithm"/><br>
      <tc-webtag:handle coderId="297823" context="algorithm"/><br>
      <tc-webtag:handle coderId="2059354" context="algorithm"/><br>
      <tc-webtag:handle coderId="8349097" context="algorithm"/><br>
      <tc-webtag:handle coderId="156216" context="algorithm"/><br>
      <tc-webtag:handle coderId="289706" context="algorithm"/><br>
      <tc-webtag:handle coderId="13261056" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td valign="middle"><img src="/i/tournament/tco05/bracket_bar.gif" alt="" border="0" /></td>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- WILDCARD ROOM --%>
      <tc-webtag:handle coderId="270505" context="algorithm"/><br>
      <tc-webtag:handle coderId="277659" context="algorithm"/><br>
      <tc-webtag:handle coderId="7390224" context="algorithm"/><br>
      <tc-webtag:handle coderId="297823" context="algorithm"/><br>
      <tc-webtag:handle coderId="7479769" context="algorithm"/><br>
      <tc-webtag:handle coderId="10481120" context="algorithm"/><br>
      <tc-webtag:handle coderId="275071" context="algorithm"/><br>
      <tc-webtag:handle coderId="346607" context="algorithm"/><br>
      <tc-webtag:handle coderId="287105" context="algorithm"/><br>
      <tc-webtag:handle coderId="7442498" context="algorithm"/><br>
      <tc-webtag:handle coderId="8601171" context="algorithm"/><br>
      <tc-webtag:handle coderId="10428762" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td valign="middle"><img src="/i/tournament/tco05/bracket_bar.gif" alt="" border="0" /></td>
      <td valign="middle"><img src="/i/tournament/tco05/bracket_R.gif" alt="" border="0" /></td>
      <td valign="middle"><img src="/i/tournament/tco05/champion.gif" alt="" border="0" /></td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_BL.gif" alt="" border="0" /></td>
      <td colspan="2"></td>
   </tr>
   <tr>
      <td align="center"><img src="/i/tournament/tco05/bracket_room3.gif" alt="" border="0" /></td><td colspan="3">&#160;</td>
      <td style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td>&#160;</td>
      <td colspan="3"align="center"></td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_TL.gif" alt="" border="0" /></td>
      <td colspan="4" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- ROOM 3 --%>
      <tc-webtag:handle coderId="8357090" context="algorithm"/><br>
      <tc-webtag:handle coderId="10481120" context="algorithm"/><br>
      <tc-webtag:handle coderId="309982" context="algorithm"/><br>
      <tc-webtag:handle coderId="293874" context="algorithm"/><br>
      <tc-webtag:handle coderId="301937" context="algorithm"/><br>
      <tc-webtag:handle coderId="7479769" context="algorithm"/><br>
      <tc-webtag:handle coderId="275071" context="algorithm"/><br>
      <tc-webtag:handle coderId="7390467" context="algorithm"/><br>
      <tc-webtag:handle coderId="284007" context="algorithm"/><br>
      <tc-webtag:handle coderId="308453" context="algorithm"/><br>
      <tc-webtag:handle coderId="288584" context="algorithm"/><br>
      <tc-webtag:handle coderId="153656" context="algorithm"/><br>
      <tc-webtag:handle coderId="346607" context="algorithm"/><br>
      <tc-webtag:handle coderId="155880" context="algorithm"/><br>
      <tc-webtag:handle coderId="269025" context="algorithm"/><br>
      <tc-webtag:handle coderId="11797255" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td valign="middle"><img src="/i/tournament/tco05/bracket_bar.gif" alt="" border="0" /></td>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- WILDCARD ROOM --%>
      &#160;
      </td>
      <td rowspan="2" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_BL.gif" alt="" border="0" /></td>
      <td align="right" colspan="2"><img src="/i/tournament/tco05/bracket_BL.gif" alt="" border="0" /></td>
      <td align="right" colspan="2"><img src="/i/tournament/tco05/bracket_BL.gif" alt="" border="0" /></td>
   </tr>
</table>





      </td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>

   </tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
