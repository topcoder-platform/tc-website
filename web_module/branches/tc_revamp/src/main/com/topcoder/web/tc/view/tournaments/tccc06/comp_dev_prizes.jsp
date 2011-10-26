<%@  page language="java"  %>
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
<jsp:param name="tabLev3" value="prizes"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
<span class="bigTitle">Development Prize Winners</span>
<br><br>
<table class="sidebarBox" border="0" cellpadding="6" cellspacing="2" width="500">
<tr>
   <td class="sidebarTitle" align="center" width="25%">Contest</td>
   <td class="sidebarTitle" align="center" width="25%">Prize</td>
   <td class="sidebarTitle" align="center" width="50%">Winner</td>
</tr>
<tr>
   <td nowrap="nowrap" class="sidebarText">Highest debut score</td>
   <td align="center" class="sidebarText">$1000</td>
   <td align="center" class="sidebarText"><tc-webtag:handle coderId="16164706" context="development" darkBG="true"/></td>
</tr>
<tr>
   <td nowrap="nowrap" class="sidebarText">Most submissions that passed review</td>
   <td align="center" class="sidebarText">$1000</td>
   <td align="center" class="sidebarText"><tc-webtag:handle coderId="299979" context="development" darkBG="true"/></td>
</tr>
</table>
<br><br>
The following is a list of competitors who passed screening on at least one component, earning a tccc06 tshirt:
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%--
<tc-webtag:handle coderId="20188980" darkBG="true" /><br>
<tc-webtag:handle coderId="7584235" darkBG="true" /><br>
<tc-webtag:handle coderId="20410453" darkBG="true" /><br>
<tc-webtag:handle coderId="275071" darkBG="true" /><br>
<tc-webtag:handle coderId="7489235" darkBG="true" /><br>
<tc-webtag:handle coderId="20076717" darkBG="true" /><br>
<tc-webtag:handle coderId="11838998" darkBG="true" /><br>
<tc-webtag:handle coderId="14926554" darkBG="true" /><br>
<tc-webtag:handle coderId="20543575" darkBG="true" /><br>
<tc-webtag:handle coderId="8405791" darkBG="true" /><br>
<tc-webtag:handle coderId="7568791" darkBG="true" /><br>
<tc-webtag:handle coderId="7210680" darkBG="true" /><br>
<tc-webtag:handle coderId="10098406" darkBG="true" /><br>
<tc-webtag:handle coderId="303185" darkBG="true" /><br>
<tc-webtag:handle coderId="16164706" darkBG="true" /><br>
<tc-webtag:handle coderId="251184" darkBG="true" /><br>
<tc-webtag:handle coderId="20089431" darkBG="true" /><br>
<tc-webtag:handle coderId="8369955" darkBG="true" /><br>
<tc-webtag:handle coderId="20822267" darkBG="true" /><br>
<tc-webtag:handle coderId="20058309" darkBG="true" /><br>
<tc-webtag:handle coderId="11981278" darkBG="true" /><br>
<tc-webtag:handle coderId="15227025" darkBG="true" /><br>
<tc-webtag:handle coderId="10401478" darkBG="true" /><br>
<tc-webtag:handle coderId="287275" darkBG="true" /><br>
<tc-webtag:handle coderId="15832162" darkBG="true" /><br>
<tc-webtag:handle coderId="15214882" darkBG="true" /><br>
<tc-webtag:handle coderId="11889718" darkBG="true" /><br>
<tc-webtag:handle coderId="16096823" darkBG="true" /><br>
<tc-webtag:handle coderId="10651566" darkBG="true" /><br>
<tc-webtag:handle coderId="20719960" darkBG="true" /><br>
<tc-webtag:handle coderId="20693488" darkBG="true" /><br>
<tc-webtag:handle coderId="11950083" darkBG="true" /><br>
<tc-webtag:handle coderId="15688266" darkBG="true" /><br>
<tc-webtag:handle coderId="10353806" darkBG="true" /><br>
<tc-webtag:handle coderId="10425804" darkBG="true" /><br>
<tc-webtag:handle coderId="7479769" darkBG="true" /><br>
<tc-webtag:handle coderId="15655112" darkBG="true" /><br>
<tc-webtag:handle coderId="19814616" darkBG="true" /><br>
<tc-webtag:handle coderId="16067996" darkBG="true" /><br>
<tc-webtag:handle coderId="15073791" darkBG="true" /><br>
<tc-webtag:handle coderId="20427714" darkBG="true" /><br>
<tc-webtag:handle coderId="15292231" darkBG="true" /><br>
<tc-webtag:handle coderId="15566003" darkBG="true" /><br>
<tc-webtag:handle coderId="20089342" darkBG="true" /><br>
<tc-webtag:handle coderId="11789293" darkBG="true" /><br>
<tc-webtag:handle coderId="15832159" darkBG="true" /><br>
<tc-webtag:handle coderId="20344927" darkBG="true" /><br>
<tc-webtag:handle coderId="14832060" darkBG="true" /><br>
<tc-webtag:handle coderId="15769942" darkBG="true" /><br>
<tc-webtag:handle coderId="7548200" darkBG="true" /><br>
<tc-webtag:handle coderId="10119301" darkBG="true" /><br>
<tc-webtag:handle coderId="13325985" darkBG="true" /><br>
<tc-webtag:handle coderId="9971384" darkBG="true" /><br>
<tc-webtag:handle coderId="301597" darkBG="true" /><br>
<tc-webtag:handle coderId="15664457" darkBG="true" /><br>
<tc-webtag:handle coderId="11905561" darkBG="true" /><br>
<tc-webtag:handle coderId="260952" darkBG="true" /><br>
<tc-webtag:handle coderId="15002482" darkBG="true" /><br>
<tc-webtag:handle coderId="299979" darkBG="true" /><br>
<tc-webtag:handle coderId="8375801" darkBG="true" /><br>
<tc-webtag:handle coderId="10405908" darkBG="true" /><br>
<tc-webtag:handle coderId="15175785" darkBG="true" /><br>
<tc-webtag:handle coderId="7360318" darkBG="true" /><br>
<tc-webtag:handle coderId="7363079" darkBG="true" /><br>
<tc-webtag:handle coderId="20271958" darkBG="true" /><br>
<tc-webtag:handle coderId="10526732" darkBG="true" /><br>
<tc-webtag:handle coderId="14883513" darkBG="true" /><br>
<tc-webtag:handle coderId="20696742" darkBG="true" /><br> 
--%>
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
