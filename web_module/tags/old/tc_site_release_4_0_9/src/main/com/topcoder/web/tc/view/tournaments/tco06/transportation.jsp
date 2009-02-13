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
<span class="bigTitle">How to get to the TCO06</span>
<br><br>
Aladdin Resort and Casino*<br>
3667 Las Vegas Blvd. S.<br>
Las Vegas, NV 89109
<br><br>
<span class="bodySubtitle">Driving to Vegas:</span><br>
Aladdin Resort and Casino* is located on the fabulous Las Vegas Strip.
<br><br>
<b>From Los Angeles:</b> Los Angeles to Las Vegas is approximately 270 miles (430 km). Leaving Los Angeles, take I-15 North into Nevada. Once in Las Vegas, exit on East Flamingo Road if your destination is the Strip.  
<br><br>
<b>From Phoenix:</b> Phoenix to Las Vegas is about 290 miles (300 km). Take U.S. 93 North out of Phoenix, and follow it right into Las Vegas.
<br><br>
<b>From San Francisco:</b> San Francisco to Las Vegas is about 580 miles (930 km). Take I-80 East to Reno, and then follow U.S. 95 South to Las Vegas.
<br><br>
<b>For other areas:</b>  <A href="http://www.mapquest.com" target="_blank">http://www.mapquest.com</A>
<br><br>
<b>Flying to Vegas:</b> The McCarran International Airport is located 8 minutes from the Aladdin Resort and Casino*.  It offers a variety of airlines and ground transportation to the strip.  See here for more details:  <A href="http://www.mccarran.com/" target="_blank">http://www.mccarran.com/</A>
<br><br>
<b>Bussing to Vegas:</b> Go to the <A href="http://www.greyhound.com" target="_blank">Greyhound website</A> (to get to Las Vegas, NV).
<br><br>
*Soon to be Planet Hollywood Resort and Casino
<br><br>
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
