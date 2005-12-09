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
<jsp:param name="tabLev3" value="hotels"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class=bodySpacer>
            
<span class="bigTitle">Hotels near the TCO06</span>
<br><br>
<A href="http://www.aladdincasino.com" target="_blank">Aladdin Resort and Casino*</A>
<br>3667 Las Vegas Blvd. S.
<br>Las Vegas, NV 89109
<br>877-333-9474
<br><br>
Themed for Aladdin's legendary tale, this resort includes more restaurants, more shops, more entertainment and more casino options than any other destination in Las Vegas.
<br><br>
From its location in the heart of the Las Vegas Strip, the Aladdin offers easy access from the airport and highway as well as easy pedestrian access directly from the Strip.
<br><br>
Several other hotels are located only a short walk from the Aladdin Resort and Casino. We have included a representative sample for your convenience:
<br><br>
<A href="http://www.ballyslv.com" target="_blank">Bally's Las Vegas</A>
<br>3645 Las Vegas Blvd South
<br>Las Vegas, NV 89109-4307
<br>888-742-9248
<br><br>
<A href="http://www.paris-lv.com" target="_blank">Paris Las Vegas</A>
<br>3655 Las Vegas Blvd South
<br>Las Vegas, NV 89109
<br>877-796-2096
<br><br>
<A href="http://www.travelodge.com" target="_blank">Travelodge</A>
<br>3735 Las Vegas Blvd. South
<br>Las Vegas, NV 89109
<br>702-736-3443
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
