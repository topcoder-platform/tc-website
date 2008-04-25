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
      <td align="center"><img src="/i/tournament/tccc06/bracket_room1.gif" alt="" border="0" /></td>
      <td colspan="2">&#160;</td>
      <td align="center"><img src="/i/tournament/tccc06/bracket_wildcard.gif" alt="" border="0" /></td>
      <td colspan="2">&#160;</td>
      <td align="center"><img src="/i/tournament/tccc06/bracket_finals.gif" alt="" border="0" /></td>
      <td colspan="3">&#160;</td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="2" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td colspan="2" align="right"><img src="/i/tournament/tccc06/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="2" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td colspan="2" align="right"><img src="/i/tournament/tccc06/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="11" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td rowspan="2" valign="middle"></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- ROOM 1 --%>
      <tc-webtag:handle coderId="144400" context="algorithm"/><br>
      <tc-webtag:handle coderId="19849563" context="algorithm"/><br>
      <tc-webtag:handle coderId="260835" context="algorithm"/><br>
      <tc-webtag:handle coderId="14970299" context="algorithm"/><br>
      <tc-webtag:handle coderId="10157606" context="algorithm"/><br>
      <tc-webtag:handle coderId="15094447" context="algorithm"/><br>
      <tc-webtag:handle coderId="307060" context="algorithm"/><br>
      <tc-webtag:handle coderId="7459080" context="algorithm"/><br>
      <tc-webtag:handle coderId="21239671" context="algorithm"/><br>
      <tc-webtag:handle coderId="8362207" context="algorithm"/><br>
      <tc-webtag:handle coderId="286375" context="algorithm"/><br>
      <tc-webtag:handle coderId="8398526" context="algorithm"/><br>
      <tc-webtag:handle coderId="9927526" context="algorithm"/><br>
      <tc-webtag:handle coderId="21758810" context="algorithm"/><br>
      <tc-webtag:handle coderId="22641345" context="algorithm"/><br>
      <tc-webtag:handle coderId="22641658" context="algorithm"/><br>
      </td>
      <td valign="middle"><img src="/i/tournament/tccc06/bracket_bar.gif" alt="" border="0" /></td>
      <td style="padding: 15px" valign="middle" align="center">
      <tc-webtag:handle coderId="260835" context="algorithm"/><br>
      <tc-webtag:handle coderId="9927526" context="algorithm"/><br>
      <tc-webtag:handle coderId="7459080" context="algorithm"/><br>
      <tc-webtag:handle coderId="15094447" context="algorithm"/><br>
      </td>
      <td valign="middle">&#160;</td>
      <td rowspan="9" style="padding: 15px" valign="middle" align="center">
      <tc-webtag:handle coderId="19849563" context="algorithm"/><br>
      <tc-webtag:handle coderId="10157606" context="algorithm"/><br>
      <tc-webtag:handle coderId="262056" context="algorithm"/><br>
      <tc-webtag:handle coderId="11829284" context="algorithm"/><br>
      <tc-webtag:handle coderId="10574855" context="algorithm"/><br>
      <tc-webtag:handle coderId="251074" context="algorithm"/><br>
      <tc-webtag:handle coderId="8355516" context="algorithm"/><br>
      <tc-webtag:handle coderId="7459080" context="algorithm"/><br>
      <%-- FINALS 
        --%>
      </td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_BL.gif" alt="" border="0" /></td>
      <td colspan="4" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td align="center"><img src="/i/tournament/tccc06/bracket_room2.gif" alt="" border="0" /></td><td colspan="3">&#160;</td>
      <td style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td>&#160;</td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_TL.gif" alt="" border="0" /></td>
      <td colspan="5" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- ROOM 2 --%>
      <tc-webtag:handle coderId="8357090" context="algorithm"/><br>
      <tc-webtag:handle coderId="11829284" context="algorithm"/><br>
      <tc-webtag:handle coderId="9906197" context="algorithm"/><br>
      <tc-webtag:handle coderId="15206296" context="algorithm"/><br>
      <tc-webtag:handle coderId="262056" context="algorithm"/><br>
      <tc-webtag:handle coderId="20286298" context="algorithm"/><br>
      <tc-webtag:handle coderId="308953" context="algorithm"/><br>
      <tc-webtag:handle coderId="7340263" context="algorithm"/><br>
      <tc-webtag:handle coderId="7452866" context="algorithm"/><br>
      <tc-webtag:handle coderId="310723" context="algorithm"/><br>
      <tc-webtag:handle coderId="269788" context="algorithm"/><br>
      <tc-webtag:handle coderId="21822659" context="algorithm"/><br>
      <tc-webtag:handle coderId="7295710" context="algorithm"/><br>
      <tc-webtag:handle coderId="11771960" context="algorithm"/><br>
      <tc-webtag:handle coderId="7227699" context="algorithm"/><br>
      <tc-webtag:handle coderId="20635649" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td valign="middle"><img src="/i/tournament/tccc06/bracket_bar.gif" alt="" border="0" /></td>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- WILDCARD ROOM --%>
      <tc-webtag:handle coderId="8357090" context="algorithm"/><br>
      <tc-webtag:handle coderId="20286298" context="algorithm"/><br>
      <tc-webtag:handle coderId="20635649" context="algorithm"/><br>
      <tc-webtag:handle coderId="310723" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td valign="middle"><img src="/i/tournament/tccc06/bracket_bar.gif" alt="" border="0" /></td>
      <td valign="middle"><img src="/i/tournament/tccc06/bracket_R.gif" alt="" border="0" /></td>
      <td valign="middle" align="center"><img src="/i/tournament/tccc06/champion.gif" alt="" border="0" /><br><span class="bigTitle"><tc-webtag:handle coderId="10574855" context="algorithm"/></span></td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_BL.gif" alt="" border="0" /></td>
      <td colspan="2"></td>
   </tr>
   <tr>
      <td align="center"><img src="/i/tournament/tccc06/bracket_room3.gif" alt="" border="0" /></td><td colspan="3">&#160;</td>
      <td style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td>&#160;</td>
      <td colspan="3"align="center"></td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_TL.gif" alt="" border="0" /></td>
      <td colspan="4" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <%-- ROOM 3 --%>
      <tc-webtag:handle coderId="10574855" context="algorithm"/><br>
      <tc-webtag:handle coderId="251074" context="algorithm"/><br>
      <tc-webtag:handle coderId="8355516" context="algorithm"/><br>
      <tc-webtag:handle coderId="8365685" context="algorithm"/><br>
      <tc-webtag:handle coderId="2058177" context="algorithm"/><br>
      <tc-webtag:handle coderId="7546048" context="algorithm"/><br>
      <tc-webtag:handle coderId="263396" context="algorithm"/><br>
      <tc-webtag:handle coderId="293874" context="algorithm"/><br>
      <tc-webtag:handle coderId="10597114" context="algorithm"/><br>
      <tc-webtag:handle coderId="15805598" context="algorithm"/><br>
      <tc-webtag:handle coderId="302501" context="algorithm"/><br>
      <tc-webtag:handle coderId="21971539" context="algorithm"/><br>
      <tc-webtag:handle coderId="10425804" context="algorithm"/><br>
      <tc-webtag:handle coderId="8518361" context="algorithm"/><br>
      <tc-webtag:handle coderId="8510917" context="algorithm"/><br>
      <tc-webtag:handle coderId="11889878" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td valign="middle"><img src="/i/tournament/tccc06/bracket_bar.gif" alt="" border="0" /></td>
      <td style="padding: 15px" valign="middle" align="center">
      <tc-webtag:handle coderId="8355516" context="algorithm"/><br>
      <tc-webtag:handle coderId="263396" context="algorithm"/><br>
      <tc-webtag:handle coderId="15805598" context="algorithm"/><br>
      <tc-webtag:handle coderId="8365685" context="algorithm"/><br>
      </td>
      <td rowspan="2" style="background-color: #FFFFFF;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tccc06/bracket_BL.gif" alt="" border="0" /></td>
      <td align="right" colspan="2"><img src="/i/tournament/tccc06/bracket_BL.gif" alt="" border="0" /></td>
      <td align="right" colspan="2"><img src="/i/tournament/tccc06/bracket_BL.gif" alt="" border="0" /></td>
   </tr>
</table>





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
