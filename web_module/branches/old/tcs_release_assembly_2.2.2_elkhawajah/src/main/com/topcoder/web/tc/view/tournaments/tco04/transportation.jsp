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
<jsp:param name="tabLev3" value="transportation"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=pageTitle>I need to get to the TCO!</p>
        

        <p><span class="bodySubtitle">By Car:</span><br/>
		The Santa Clara Marriott is conveniently located only minutes off Highway 101 in Santa 
		Clara, CA.  <br/>View <a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=directions">driving directions.</a></p>

		<p><span class="bodySubtitle">By Plane:</span><br/>
		The Mineta San Jose International Airport (SJC) is located just 2 miles north of downtown 
		San Jose and 3 miles north of the Santa Clara Marriott. SJC is serviced by several national 
		and regional airlines, including American, Continental, Delta, jetBlue, Northwest, Southwest, 
		United Airlines, US Airways and others. Visit <a href="http://www.sjc.org/" target="_blank">www.sjc.org</a> for specific information.</p>

		<p><span class="bodySubtitle">By Bus:</span><br/>
		Go to the <a href="http://www.greyhound.com/" target="_blank">Greyhound</a> web site (to get to San Jose, CA).</p>
            
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
