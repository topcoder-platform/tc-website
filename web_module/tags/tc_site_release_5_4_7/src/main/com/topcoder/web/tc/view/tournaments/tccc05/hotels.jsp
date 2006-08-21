<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="hotels"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Hotels near the TCCC05</p>

        <p><span class="bodySubtitle"><a href="http://marriott.com/property/propertyPage/SJCGA" target="_blank">Santa Clara Marriott</a></span><br/>
		Just like its high-tech neighbors in California's Silicon Valley, the Santa Clara Marriott embraces innovation. 
		From state-of-the-art meeting facilities to a restaurant that's at the forefront of new cuisine, the Santa Clara 
		Marriott is the perfect choice in northern California.</p>

		<p>2700 Mission College Boulevard<br/>
		Santa Clara, CA 95054<br/>
		408.988.1500</p>

		<p>Several other hotels are located only a short drive from the Santa Clara Marriott. We have 
		included a representative sample for your convenience:</p>

		<p><a href="http://www.westin.com/santaclara" target="_blank">The Westin</a><br/>
		5101 Great America Parkway<br/>
		Santa Clara, CA 95054<br/>
		408.986.0700</p>

		<p><a href="http://www.fremontmarriott.com" target="_blank">Fremont Marriott</a><br/>
		46100 Landing Parkway<br/>
		Fremont, CA 94538<br/>
		510.413.3700</p>

		<p><a href="http://www.fourpointssunnyvale.com" target="_blank">Four Points by Sheraton Sunnyvale</a><br/>
		1250 Lakeside Drive<br/>
		Sunnyvale, CA 94085<br/>
		408.738.4888</p>

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
