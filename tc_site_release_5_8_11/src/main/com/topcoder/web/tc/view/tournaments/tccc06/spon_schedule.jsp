<%@  page language="java"  %>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp" >
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
	<tr valign="top">
		<td valign="top" align="center">
		<div class="bodySpacer">
            
<span class="bigTitle">Schedule of Online Competitions</span>
<br><br>
<table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
   <tr>
      <td class="sidebarTitle" width="20%">Round</td>
      <td class="sidebarTitle" width="40%">Date and Time* <br> (all Eastern Daylight Time)</td>
      <td class="sidebarTitle" width="20%"># of Competitors</td>
      <td class="sidebarTitle" width="20%"># of Advancers</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Qualification Round</td>
      <td class="sidebarText">
      Tuesday, September 12, 2006<br>
      Register 6:00 - 8:55 PM<br>
      START: 9:00 PM
       </td>
      <td class="sidebarText">All eligible registered competitors</td>
      <td class="sidebarText">Top 100 scorers</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Online Round #1</td>
      <td class="sidebarText">
      Wednesday, September 27, 2006<br>   
      Register 6:00 - 8:55 PM<br>
      START: 9:00 PM
      </td>
      <td class="sidebarText">100</td>
      <td class="sidebarText">50</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Online Round #2</td>
      <td class="sidebarText">
      Wednesday, October 11, 2006<br>   
      Register 6:00 - 8:55 PM<br>
      START: 9:00 PM
      </td>
      <td class="sidebarText">50</td>
      <td class="sidebarText">25</td>
   </tr>
   <tr valign="top">
      <td class="sidebarText">Final Online Round</td>
      <td class="sidebarText">
      Saturday, October 14, 2006<br>   
      Register 10:00 AM - 12:55 PM<br>
      START: 1:00 PM
      </td>
      <td class="sidebarText">25</td>
      <td class="sidebarText">1 - Champion</td>
   </tr>
   <tr><td class="sidebarText" colspan="4">*NOTE:  In the event that a round must be cancelled for any reason, the round will be held the following day at the same time.</td></tr>
</table>
<br><br>
See the official <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=spon_rules">rules and regulations</A> for more details.
        </div>
		</td>
        
         
<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
<%--
<div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>
--%>
</td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
