<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
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
            
        <p class=pageTitle>Directions to the Santa Clara Marriott</p>

        <p>Driving directions from anywhere in California are easy to find using the Santa Clara Marriott's website.  
        Find out how to <a href="http://marriott.com/property/mapandnearbyairports/drivingdirections.mi?marshaCode=sjcga&WT_Ref=mi_left" target="_blank">drive to the hotel</a>:</p>


		<p><span class="bodySubtitle">From San Jose Airport (SJC) (Hotel Direction: 4 N):</span></p>
		
		<ul><li>1-408-277-4759</li>
			<li>Driving Directions: From Mineta San Jose International Airport. Take Highway 101 North 4 miles to Great America 
			Parkway. Exit right to Mission College Boulevard. Hotel is on the Right.</li>
			<li>$15 USD Shuttle Service from Airport </li>
			<li>$1.4 USD Bus from Airport to Hotel Fee (one-way) </li>
			<li>$15 USD Estimated Taxi Fee (one-way) </li>
		</ul>


		<p><span class="bodySubtitle">From Oakland Airport (OAK) (Hotel Direction: 30 SW):</span></p>
		
		<ul><li>1-510-563-3300</li>
			<li>Driving Directions: Take Highway 880 South 30 miles to Highway 237. West 4 miles to 
			Great America Parkway. Left onto Great America Pkwy. Turn left on Mission College Boulevard to hotel entrance. </li>
			<li>$40 USD Shuttle Service from Airport </li>
			<li>$90 USD Estimated Taxi Fee (one-way) </li>
		</ul>


		<p><span class="bodySubtitle">From San Francisco Airport (SFO) (Hotel Direction: 30 S):</span></p>
		
		<ul><li>1-650-821-8211</li> 
			<li>Driving Directions: Take Highway 202 South 26 miles to Great America Parkway Exit left to Mission 
			College Boulevard. Hotel is on the Right / Oakland OAK Hotel Direction - Highway 880 South - 
			Right onto 237 West Exit Great America Parkway Left Left onto Mission College Boulevard. Hotel is on the Right.</li>
			<li>$40 USD Shuttle Service from Airport </li>
			<li>$90 USD Estimated Taxi Fee (one-way) </li>
		</ul>

            
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
