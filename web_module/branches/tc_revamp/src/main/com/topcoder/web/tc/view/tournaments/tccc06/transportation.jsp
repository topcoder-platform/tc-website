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
<jsp:param name="tabLev3" value="transportation"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">

<span class="bigTitle">How to get to the TCCC06</span>
<br><br>
San Diego Marriott Mission Valley<br>
8757 Rio San Diego Drive<br>
San Diego, California 92108
<br><br>
<b>Driving from Los Angeles:</b> Los Angeles to San Diego is approximately 118 miles. Leaving Los Angeles, take I-5 South for approximately 75 miles and merge left onto I-805.  Go right onto SR-16 and take exit 4.  Turn right off the ramp and bear right onto Friars Road.  Turn right onto Qualcomm Way.  Finally, turn left onto Rio San Diego Drive to your final destination.
<br><br>
<b>For other areas:</b> <A href="/?t=sponsor&c=link&link=http://www.mapquest.com" target="_blank">http://www.mapquest.com</A> 
<br><br>
<b>By Plane:</b> The San Diego International Airport is located 8 miles from the San Diego Marriott Mission Valley. It offers a variety of airlines and ground transportation to the hotel. See here for more details: <A href="/?t=sponsor&c=link&link=http://www.san.org/" target="_blank">http://www.san.org</A>
<br><br>
<b>By Bus:</b> Go to the <A href="/?t=sponsor&c=link&link=http://www.greyhound.com" target="_blank">Greyhound website</A> to get to San Diego, CA. 
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>



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
