<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
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
            
<span class="bigTitle">Schedule of Onsite Events</span>
<br><br>

<table border="0" cellpadding="5" cellspacing="0" width="400">
<tr><td colspan="2" class="sidebarTitle">Tuesday, May 2, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">7:00pm - 9:00pm</td><td class="formTextEven">Welcome Reception</td></tr>

<tr><td colspan="2" class="bodyText">&#160;</td></tr>

<tr><td colspan="2" class="sidebarTitle">Wednesday, May 3, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">9:00am - 11:00am</td><td class="formTextEven">Algorithm Semifinal Room 1</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">11:00am - 12:00pm</td><td class="formTextOdd">National Security Agency (NSA) Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">12:00pm - 1:00pm</td><td class="formTextEven">Lunch</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">1:00pm - 3:00pm</td><td class="formTextOdd">Component Design & Development 1</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">4:00pm - 6:00pm</td><td class="formTextEven">Algorithm Semifinal Room 2</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">4:00pm - 10:00pm</td><td class="formTextOdd">Competitor Game Room</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">7:00pm - 10:00pm</td><td class="formTextEven">Poker tournament</td></tr>

<tr><td colspan="2" class="bodyText">&#160;</td></tr>

<tr><td colspan="2" class="sidebarTitle">Thursday, May 4, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">9:00am - 11:00pm</td><td class="formTextEven">Algorithm Semifinal Room 3</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">10:00am - 10:45am</td><td class="formTextOdd">Secondhand Shopping: Efficient Component Reuse</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">11:00am - 12:00pm</td><td class="formTextEven">VeriSign Presentation</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">12:00pm - 1:00pm</td><td class="formTextOdd">Lunch</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">1:00pm - 3:00pm</td><td class="formTextEven">Component Design & Development 2</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">3:00pm - 4:00pm</td><td class="formTextOdd">UBS Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">4:00pm - 6:00pm</td><td class="formTextEven">Customer Round Table</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">4:00pm - 6:00pm</td><td class="formTextOdd">Algorithm Wildcard Round</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">6:30pm - 10:00pm</td><td class="formTextEven">AMD Evening Event</td></tr>

<tr><td colspan="2" class="bodyText">&#160;</td></tr>

<tr><td colspan="2" class="sidebarTitle">Friday, May 5, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">9:00am - 11:00am</td><td class="formTextEven">Component Design & Development Appeals Final</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">11:00am - 11:45am</td><td class="formTextOdd">Bringing It All Together Using SOA Architectures</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">12:00pm - 1:00pm</td><td class="formTextEven">Lunch</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">1:00pm - 2:00pm</td><td class="formTextOdd">AMD Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">2:00pm - 2:45pm</td><td class="formTextEven">Next Generation Development Round Table Discussion</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">2:30pm - 4:30pm</td><td class="formTextOdd">Algorithm Championship Round</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">4:30pm - 5:00pm</td><td class="formTextEven">All Champion Announcements</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">5:00pm - 6:00pm</td><td class="formTextOdd">Media Hour / Press Conference</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">7:00pm - 9:00pm</td><td class="formTextEven">Awards Reception</td></tr>
</table>

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