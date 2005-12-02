<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="join_us"/>
<jsp:param name="tabLev3" value="transportation"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
<span class="bigTitle">How to get to the TCO05</span>
<br><br>
<strong>By Car:</strong>
The Santa Clara Marriott is conveniently located only minutes off Highway 101 in Santa Clara, CA.  View driving directions. (link to directions page)
<br><br>
<strong>By Plane:</strong>
The Mineta San Jose International Airport (SJC) is located just 2 miles north of downtown San Jose and 3 miles north of the Santa Clara Marriott. SJC is serviced by several national and regional airlines, including American, Continental, Delta, jetBlue, Northwest, Southwest, United Airlines, US Airways and others. Visit <A href="http://www.sjc.org">www.sjc.org</A> for specific information.
<br><br>
<strong>By Bus:</strong>
Go to the <A href="http://www.greyhound.com">Greyhound</A> web site (to get to San Jose, CA).
        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
