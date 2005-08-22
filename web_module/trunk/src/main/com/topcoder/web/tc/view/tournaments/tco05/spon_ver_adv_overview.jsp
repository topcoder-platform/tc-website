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
<jsp:include page="spon_ver_links.jsp" >
<jsp:param name="tabLev2" value="advancers"/>
<jsp:param name="tabLev3" value="overview"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Advancers - Overview</span>
<br><br>
<table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
   <tr class="advHeader">
      <td width = "25%" nowrap="nowrap">Handle</td>
      <td width = "15%" align = "right" nowrap="nowrap">Rating</td>
      <td width = "15%" align = "center" nowrap="nowrap">Round 1</td>
      <td width = "15%" align = "center" nowrap="nowrap">Round 2</td>
      <td width = "15%" align = "center" nowrap="nowrap">Round 3</td>
      <td width = "15%" align = "center" nowrap="nowrap">Final</td>
   </tr>
   <tr>
      <td class="advanceLt"><tc-webtag:handle coderId="307060" context="algorithm"/></td>
      <td class="advanceLt" align="right">rating</td>
      <td class="advanceLt" align="center">Advanced</td>
      <td class="advanceLt" align="center"></td>
      <td class="advanceLt" align="center"></td>
      <td class="advanceLt" align="center"></td>
   </tr>
   <tr>
      <td class="advanceDk"><tc-webtag:handle coderId="309453" context="algorithm"/></td>
      <td class="advanceDk" align="right">rating</td>
      <td class="advanceDk" align="center">Advanced</td>
      <td class="advanceDk" align="center"></td>
      <td class="advanceDk" align="center"></td>
      <td class="advanceDk" align="center"></td>
   </tr>
</table>
        </div>
      </td>
        
         
<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<img src="/i/tournament/tco05/verisign_right.gif" alt="Verisign" border="0" /><br />
<img src="/i/clear.gif" alt="" width="10" height="10" border="0" /><br />
<jsp:include page="../../calendar.jsp" />
</td>
      
   </tr>
   
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
