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
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Schedule of Onsite Events</span>
<br><br>

<%-- WITH DEV FORUMS - POST MON SEPT 11TH  --%>
<table border="0" cellpadding="5" cellspacing="0" width="400">
<tr><td colspan="2" class="sidebarTitle">Tuesday, November 14, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">7:00pm - 9:00pm</td><td class="formTextEven">Welcome Reception</td></tr>

<tr><td colspan="2" class="bodyText">&#160;</td></tr>

<tr><td colspan="2" class="sidebarTitle">Wednesday, November 15, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">9:00am - 11:00am</td><td class="formTextEven">Algorithm Semifinal Room 1</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">11:00am - 12:00pm</td><td class="formTextOdd">UBS Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">12:00pm - 1:00pm</td><td class="formTextEven">Lunch</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">1:00pm - 3:00pm</td><td class="formTextOdd">Component Design & Development 1</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">3:00pm - 4:00pm</td><td class="formTextEven">Developer Forum: <i>Applying the TopCoder Philosophy to New Frontiers</i></td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">4:00pm - 6:00pm</td><td class="formTextOdd">Algorithm Semifinal Room 2</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">4:00pm - 10:00pm</td><td class="formTextEven">Competitor Game Room</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">7:00pm - 10:00pm</td><td class="formTextOdd">Poker tournament</td></tr>

<tr><td colspan="2" class="bodyText">&#160;</td></tr>

<tr><td colspan="2" class="sidebarTitle">Thursday, November 16, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">9:00am - 11:00am</td><td class="formTextEven">Algorithm Semifinal Room 3</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">11:00am - 12:00pm</td><td class="formTextOdd">Bloomberg Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">12:00pm - 1:00pm</td><td class="formTextEven">Lunch</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">1:00pm - 2:00pm</td><td class="formTextOdd">NSA Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">1:00pm - 3:00pm</td><td class="formTextEven">Component Design & Development 2</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">3:00pm - 4:00pm</td><td class="formTextOdd">Developer Forum: <i>Estimating Project Size</i></td></tr>
<tr><td class="formTextEven" nowrap="nowrap">4:00pm - 6:00pm</td><td class="formTextEven">Algorithm Wildcard Round</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">6:30pm - 10:00pm</td><td class="formTextOdd">AOL Evening Event</td></tr>

<tr><td colspan="2" class="bodyText">&#160;</td></tr>

<tr><td colspan="2" class="sidebarTitle">Friday, November 17, 2006</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">9:00am - 11:00am</td><td class="formTextEven">Component Design & Development Appeals Final</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">11:00am - 12:00pm</td><td class="formTextOdd">AOL Presentation</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">12:00pm - 1:00pm</td><td class="formTextEven">Lunch</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">1:00pm - 2:00pm</td><td class="formTextOdd">Developer Forum: <i>Overview of Recent TopCoder Projects</i></td></tr>
<tr><td class="formTextEven" nowrap="nowrap">1:30pm - 3:30pm</td><td class="formTextEven">Algorithm Championship Round</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">3:30pm - 4:00pm</td><td class="formTextOdd">All Champion Announcements</td></tr>
<tr><td class="formTextEven" nowrap="nowrap">4:00pm - 5:00pm</td><td class="formTextEven">Media Hour / Press Conference</td></tr>
<tr><td class="formTextOdd" nowrap="nowrap">7:00pm - 10:00pm</td><td class="formTextOdd">Awards Reception</td></tr>
</table>

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