<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Schedule of Onsite Events</p>

		<p class="smallText">Note: Times and scheduled events are subject to change.</p>

		<table border="0" cellpadding="5" cellspacing="0" width=400>
			<tr><td colspan="2" class="sidebarTitle">Wedneday, March 9, 2005</td></tr>
			<tr><td class="formTextEven">9:00am - 5:00pm</td><td class="formTextEven">Competitor Game Room</td></tr>
			<tr><td class="formTextOdd">6:00pm - 8:00pm</td><td class="formTextOdd">Welcome Reception</td></tr>

			<tr><td colspan="2" class="bodyText">&#160;</td></tr>

			<tr><td colspan="2" class="sidebarTitle">Thursday, March 10, 2005</td></tr>
			<tr><td class="formTextEven">9:00am - 4:00pm</td><td class="formTextEven">Component Design & Development Championship Round</td></tr>
			<tr><td class="formTextOdd">9:30am - 10:00am</td><td class="formTextOdd">NVIDIA presentation</td></tr>
			<tr><td class="formTextEven">10:00am - 12:00pm</td><td class="formTextEven">Algorithm Semifinal Room 1</td></tr>
			<tr><td class="formTextOdd">12:00pm - 1:00pm</td><td class="formTextOdd">Lunch</td></tr>
			<tr><td class="formTextEven">1:00pm - 3:00pm</td><td class="formTextEven">Algorithm Semifinal Room 2</td></tr>
			<tr><td class="formTextOdd">3:00pm - 3:30pm</td><td class="formTextOdd">Motorola Presentation</td></tr>
			<tr><td class="formTextEven">4:00pm - 6:00pm</td><td class="formTextEven">Algorithm Semifinal Room 3</td></tr>
			<tr><td class="formTextOdd">5:00pm - 8:00pm</td><td class="formTextOdd">Spectator Showdown</td></tr>
			<tr><td class="formTextEven">6:30pm - 10:00pm</td><td class="formTextEven">Yahoo! Evening Event</td></tr>

			<tr><td colspan="2" class="bodyText">&#160;</td></tr>

			<tr><td colspan="2" class="sidebarTitle">Friday, March 11, 2005</td></tr>
			<tr><td class="formTextEven">10:00am - 12:00pm</td><td class="formTextEven">Algorithm Wildcard Round</td></tr>
			<tr><td class="formTextOdd">12:00pm - 1:00pm</td><td class="formTextOdd">Lunch</td></tr>
			<tr><td class="formTextEven">12:00pm - 3:00pm</td><td class="formTextEven">Spectator Showdown</td></tr>
			<tr><td class="formTextOdd">1:00pm - 2:00pm</td><td class="formTextOdd">Presentation by Steven Skiena, PhD</td></tr>
			<tr><td class="formTextEven">2:30pm - 4:30pm</td><td class="formTextEven">Algorithm Championship Round</td></tr>
			<tr><td class="formTextOdd">4:30pm - 5:00pm</td><td class="formTextOdd">All Champion Announcements</td></tr>
			<tr><td class="formTextEven">5:00pm - 6:00pm</td><td class="formTextEven">Media Hour / Press Conference</td></tr>
			<tr><td class="formTextOdd">7:00pm - 9:00pm</td><td class="formTextOdd">Awards Reception</td></tr>
		</table>

		</p>

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
