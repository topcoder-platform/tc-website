<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="prizes"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
<span class="bigTitle">Design Prize Winners</span>
<br><br>
<table class="sidebarBox" border="0" cellpadding="6" cellspacing="2" width="500">
<tr>
   <td class="sidebarTitle" align="center" width="25%">Contest</td>
   <td class="sidebarTitle" align="center" width="25%">Prize</td>
   <td class="sidebarTitle" align="center" width="50%">Winner</td>
</tr>
<tr>
   <td nowrap="nowrap" class="sidebarText">Highest debut score</td>
   <td align="center" class="sidebarText">$2000</td>
   <td align="center" class="sidebarText"><tc-webtag:handle coderId="7479769" context="design" darkBG="true"/></td>
</tr>
<tr>
   <td nowrap="nowrap" class="sidebarText">Most submissions that passed review</td>
   <td align="center" class="sidebarText">$1000</td>
   <td align="center" class="sidebarText"><tc-webtag:handle coderId="11797255" context="design" darkBG="true"/> and <tc-webtag:handle coderId="15891862" context="design" darkBG="true"/></td>
</tr>
</table>
<br><br>
The following is a list of competitors who passed screening on at least one component, earning a TCO06 tshirt:
<br><br>
<tc-webtag:handle coderId="20188980" darkBG="true" /><br>
<tc-webtag:handle coderId="154254" darkBG="true" /><br>
<tc-webtag:handle coderId="278342" darkBG="true" /><br>
<tc-webtag:handle coderId="252022" darkBG="true" /><br>
<tc-webtag:handle coderId="7449072" darkBG="true" /><br>
<tc-webtag:handle coderId="275071" darkBG="true" /><br>
<tc-webtag:handle coderId="287614" darkBG="true" /><br>
<tc-webtag:handle coderId="11797255" darkBG="true" /><br>
<tc-webtag:handle coderId="8369898" darkBG="true" /><br>
<tc-webtag:handle coderId="20549004" darkBG="true" /><br>
<tc-webtag:handle coderId="10627428" darkBG="true" /><br>
<tc-webtag:handle coderId="151743" darkBG="true" /><br>
<tc-webtag:handle coderId="15179224" darkBG="true" /><br>
<tc-webtag:handle coderId="16212224" darkBG="true" /><br>
<tc-webtag:handle coderId="152342" darkBG="true" /><br>
<tc-webtag:handle coderId="10474664" darkBG="true" /><br>
<tc-webtag:handle coderId="14840263" darkBG="true" /><br>
<tc-webtag:handle coderId="7479769" darkBG="true" /><br>
<tc-webtag:handle coderId="7444051" darkBG="true" /><br>
<tc-webtag:handle coderId="293874" darkBG="true" /><br>
<tc-webtag:handle coderId="10028010" darkBG="true" /><br>
<tc-webtag:handle coderId="15782168" darkBG="true" /><br>
<tc-webtag:handle coderId="119676" darkBG="true" /><br>
<tc-webtag:handle coderId="8395447" darkBG="true" /><br>
<tc-webtag:handle coderId="19914140" darkBG="true" /><br>
<tc-webtag:handle coderId="15891862" darkBG="true" /><br>
<tc-webtag:handle coderId="20105292" darkBG="true" /><br>
<tc-webtag:handle coderId="275640" darkBG="true" /><br>
<tc-webtag:handle coderId="150498" darkBG="true" /><br>
<tc-webtag:handle coderId="15608845" darkBG="true" /><br>
<tc-webtag:handle coderId="11781622" darkBG="true" /><br>
<tc-webtag:handle coderId="288617" darkBG="true" /><br>
<tc-webtag:handle coderId="19714539" darkBG="true" /><br>
<tc-webtag:handle coderId="286911" darkBG="true" /><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
