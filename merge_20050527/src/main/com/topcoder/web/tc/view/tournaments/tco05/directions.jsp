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
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="directions"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
<span class="bigTitle">Directions to the Santa Clara Marriott</span>
<br><br>
Driving directions from anywhere in California are easy to find using the Santa Clara Marriott's website.  Find out how to <A href="http://marriott.com/property/drivingDirections.mi?marshaCode=SJCGA">drive to the hotel</A>.
<br><br>
<strong>From San Jose Airport (SJC) (3 MI North):</strong>
Take Airport exit and turn left on Guadalupe Parkway North (Hwy 87). Follow signs to Highway 101 North, 3 miles to Great America Parkway. Turn right onto Great America Pkwy and right again onto Mission College Blvd. Hotel is on right.
<br><br>
<strong>From Oakland Airport (OAK) (30 MI Southwest):</strong>
Take Highway 880 South for 30 miles to Highway 237. Go west 4 miles to Great America Parkway. Take left onto Great America Pkwy. Turn left on Mission College Boulevard to hotel entrance.
<br><br>
<strong>From San Francisco Airport (SFO) (30 MI North):</strong>
Take Highway 101 South for 30 miles to Great America Parkway Exit. Turn left onto Great America Pkwy and right onto Mission College Blvd. Hotel is on right.
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
