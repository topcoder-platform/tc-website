<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">


<title>DoubleClick</title>

<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/doubleclick05.css"/>

</head>
<body align="center">

<jsp:include page="links.jsp" >
   <jsp:param name="tabLev1" value="internal"/>
   <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

<table width="750" align="center" valign="top" cellpadding="0" cellspacing="0">
	<tr>
		<td class="dc_headerPic">
	      <img src="/i/events/doubleclick05/image3.gif" border="0" width="163" height="180"/>
	  	</td>
		<td class="dc_bodyText">
         <p class="bigTitle">Schedule</p>
         
                     <table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                        <tr valign="top">
                           <td class="sidebarTitle">Round</td>
                           <td class="sidebarTitle">Date and Time (all Eastern Time)</td>
                        </tr>
                        <tr valign="top">
                           <td class="sidebarText">Registration and practice</td>
                           <td class="sidebarText">Starts: Monday, February 21, 2005 at 9:00 AM<br>Ends:  Tuesday, March 1, 2005 at 6:00 PM</td>
                        </tr>
                        <tr valign="top">
                           <td class="sidebarText">Competition Round</td>
                           <td class="sidebarText">Wednesday, March 2, 2005<br>Sign in:  10:00 AM - 10:50 AM<br>START: 11:00 AM</td>
                        </tr>
                        <tr><td class="sidebarText" colspan="2">NOTE:  In the event the competition round must be cancelled for any reason, all reasonable attempts will be made to run the round the following business day at the same time.</td></tr>
                     </table>

		</td>
	</tr>
</table>

<p><br/></p>
   
<jsp:include page="foot.jsp" />

</body>
</html>