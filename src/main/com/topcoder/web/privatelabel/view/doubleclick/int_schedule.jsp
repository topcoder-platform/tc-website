<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


<title>DoubleClick</title>

<jsp:include page="../script.jsp" />

<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick.css"/>

</head>
<body align="center">

<jsp:include page="links.jsp" >
   <jsp:param name="tabLev1" value="internal"/>
   <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick/headers/guyNcode.jpg" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="pageTitle">Schedule</p>
         
         <table class="sidebarBox" width="500" cellpadding="6" cellspacing="2">
            <tr>
               <td class="sidebarTitle" size="33%">Event</td>
               <td class="sidebarTitle" size="33%">Date</td>
               <td class="sidebarTitle" size="33%">Time - ET</td>
            </tr>
            <tr>
               <td class="sidebarText">Registration Opens</td>
               <td class="sidebarText">Monday, February 9</td>
               <td class="sidebarText">9:00AM</td>
            </tr>
            <tr>
               <td class="sidebarText">Registration Closes</td>
               <td class="sidebarText">Sunday, February 15</td>
               <td class="sidebarText">12:00PM(noon)</td>
            </tr>
            <tr>
               <td class="sidebarText">Main Competition Round - all registered participants</td>
               <td class="sidebarText">Friday, February 19</td>
               <td class="sidebarText">1:00PM</td>
            </tr>
            <tr>
               <td class="sidebarText">Final Round - 10 finalists</td>
               <td class="sidebarText">Friday, February 27</td>
               <td class="sidebarText">1:00PM</td>
            </tr>
            <tr>
            	<td class="sidebarText" colspan="3">*NOTE:  In the event a Round must be cancelled for any reason, all reasonable attempts will be made to run the Round the following business day at the same time.</td>
            </tr>
         </table>

		</td>
	</tr>
</table>

<p><br/></p>
   
<jsp:include page="foot.jsp" />

</body>
</html>