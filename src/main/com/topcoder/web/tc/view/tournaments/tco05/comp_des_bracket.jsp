<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
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
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="bracket"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
<span class="bigTitle">Design Finalists Bracket</span>
<br><br>
The finalists are sorted alphabetically.
<br><br>
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_TL.gif" alt="" border="0" /></td>
      <td rowspan="3" style="background-color: #000000;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
      <td rowspan="3" valign="middle"><img src="/i/tournament/tco05/bracket_R.gif" alt="" border="0" /></td>
      <td rowspan="3" valign="middle"><img src="/i/tournament/tco05/champion.gif" alt="" border="0" /></td>
   </tr>
   <tr>
      <td style="padding: 15px" valign="middle" align="center">
      <tc-webtag:handle coderId="11797255" context="design"/><br><br>
      <tc-webtag:handle coderId="7360309" context="design"/><br><br>
      <tc-webtag:handle coderId="152342" context="design"/><br><br>
      <tc-webtag:handle coderId="293874" context="design"/><br><br>
      <tc-webtag:handle coderId="119676" context="design"/><br><br>
      <tc-webtag:handle coderId="7463987" context="design"/><br><br>
      <tc-webtag:handle coderId="150498" context="design"/><br><br>
      <tc-webtag:handle coderId="13377493" context="design"/>
      </td>
   </tr>
   <tr>
      <td align="right"><img src="/i/tournament/tco05/bracket_BL.gif" alt="" border="0" /></td>
   </tr>
</table>





        </div>
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
