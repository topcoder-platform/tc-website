<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
         
<span class="bigTitle">Component Competition Schedule</span>
<br><br>
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr valign="top">
      <td class="sidebarText" width="25%">Registration</td>
      <td class="sidebarText" width="75%">
         OPENS: Monday, June 13, 2005 at 9:00 AM EST<br /><br/>
         CLOSES: Wednesday, June 29, 2005 at 9:00 AM EST
      </td>
   </tr>
</table>
<br><br>
<a name="sched"></a>
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle" width="25%">Round</td>
      <td class="sidebarTitle" width="25%">All Projects Posted</td>
      <td class="sidebarTitle" width="25%" align="center">Registration Period</td>
      <td class="sidebarTitle" width="25%">Submission Deadline</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 1</td>
      <td class="sidebarText">06.29.2005 9:00AM</td>
      <td class="sidebarText" align="center">24 Hours</td>
      <td class="sidebarText">07.06.2005 9:00AM</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 2</td>
      <td class="sidebarText">07.06.2005 9:00AM</td>
      <td class="sidebarText" align="center">24 Hours</td>
      <td class="sidebarText">07.13.2005 9:00AM</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 3</td>
      <td class="sidebarText">07.13.2005 9:00AM</td>
      <td class="sidebarText" align="center">24 Hours</td>
      <td class="sidebarText">07.20.2005 9:00AM</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 4</td>
      <td class="sidebarText">07.20.2005 9:00AM</td>
      <td class="sidebarText" align="center">24 Hours</td>
      <td class="sidebarText">07.27.2005 9:00AM</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 5</td>
      <td class="sidebarText">07.27.2005 9:00AM</td>
      <td class="sidebarText" align="center">24 Hours</td>
      <td class="sidebarText">08.01.2005 9:00AM</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Championship Round (online portion)</td>
      <td class="sidebarText">08.24.2005 9:00AM</td>
      <td class="sidebarText" align="center">24 Hours</td>
      <td class="sidebarText">08.31.2005 9:00AM</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Championship Round (onsite portion)</td>
      <td class="sidebarText">N/A</td>
      <td class="sidebarText" align="center">N/A</td>
      <td class="sidebarText">10.12.2005 4:00PM</td>
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
