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
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
         
<span class="bigTitle">Component Competition Schedule</span>
<br><br>
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr valign="top">
      <td class="sidebarTitle" width="25%">Registration</td>
      <td class="sidebarTitle" width="75%">
         OPENS: Monday, July 31, 2006 at 9:00 AM EDT<br /><br/>
         CLOSES: Thursday, September 14, 2006 at 9:00 AM EDT
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
      <td class="sidebarText">Week 1 of Online Qualification Round</td>
      <td class="sidebarText">08.17.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">08.24.2006 9:00AM**</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 2 of Online Qualification Round</td>
      <td class="sidebarText">08.24.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">08.31.2006 9:00AM*</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 3 of Online Qualification Round</td>
      <td class="sidebarText">08.31.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">09.07.2006 9:00AM**</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 4 of Online Qualification Round</td>
      <td class="sidebarText">09.07.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">09.14.2006 9:00AM**</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Week 5 of Online Qualification Round</td>
      <td class="sidebarText">09.14.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">09.21.2006 9:00AM**</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Championship Round (online  portion component 1)</td>
      <td class="sidebarText">10.05.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">10.12.2006 9:00AM**</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Championship Round (online  portion component 2)</td>
      <td class="sidebarText">10.19.2006 9:00AM**</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">10.26.2006 9:00AM**</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Championship Round (online  portion component 3)</td>
      <td class="sidebarText">11.02.2006 9:00AM*</td>
      <td class="sidebarText" align="center">72 Hours</td>
      <td class="sidebarText">11.09.2006 9:00AM*</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Championship Round (onsite portion)</td>
      <td class="sidebarText">N/A</td>
      <td class="sidebarText" align="center">N/A</td>
      <td class="sidebarText">N/A</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText" colspan="4">* Eastern Standard Time (GMT -5). Click <A href="http://www.timeanddate.com/worldclock/fixedtime.html?month=11&day=9&year=2006&hour=9&min=0&sec=0&p1=179">here</A> for your time zone.
      <br>** Eastern Daylight Time (GMT -4). Click <A href="http://www.timeanddate.com/worldclock/fixedtime.html?month=8&day=17&year=2006&hour=9&min=0&sec=0&p1=179">here</A> for your time zone.</td>
   </tr>
</table>
<br><br>

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
