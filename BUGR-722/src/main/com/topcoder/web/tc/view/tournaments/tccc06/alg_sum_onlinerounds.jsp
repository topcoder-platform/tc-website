<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="online"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Online Rounds</span>
<br><br>

<table width="400" class="sidebarBox" cellspacing="2" cellpadding="6" align="left">
<tr><td class="sidebarTitle" colspan="2">Problem Set Analyses</td></tr>
<tr><td class="sidebarText">&#160;02.28.06</td><td class="sidebarText" nowrap="0">&#160;tccc06 - Qualification Round - <a href="/tc?module=Static&d1=match_editorials&d2=tccc06_qual">Problem Set & Analysis</a></td></tr>
<tr><td class="sidebarText">&#160;03.04.06</td><td class="sidebarText" nowrap="0">&#160;tccc06 - Online Round 1 - <a href="/tc?module=Static&d1=match_editorials&d2=tccc06_online_rd_1">Problem Set & Analysis</a></td></tr>
<%--
<tr><td class="sidebarText">&#160;03.08.06</td><td class="sidebarText" nowrap="0">&#160;tccc06 - Online Round 2 - <a href="/tc?module=Static&d1=match_editorials&d2=tccc06_online_rd_2">Problem Set & Analysis</a></td></tr>
<tr><td class="sidebarText">&#160;03.15.06</td><td class="sidebarText" nowrap="0">&#160;tccc06 - Online Round 3 - <a href="/tc?module=Static&d1=match_editorials&d2=tccc06_online_rd_3">Problem Set & Analysis</a></td></tr>
<tr><td class="sidebarText">&#160;03.22.06</td><td class="sidebarText" nowrap="0">&#160;tccc06 - Online Round 4 - <a href="/tc?module=Static&d1=match_editorials&d2=tccc06_online_rd_4">Problem Set & Analysis</a></td></tr>
--%>
</table>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
