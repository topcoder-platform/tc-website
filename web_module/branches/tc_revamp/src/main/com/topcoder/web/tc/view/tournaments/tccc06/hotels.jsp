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
<jsp:param name="tabLev3" value="hotels"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Hotels near the TCCC06</span>
<br><br>
<A href="/?t=sponsor&c=link&link=http://marriott.com/property/propertypage/sanmv?WT_Ref=mi_left" target="_blank">San Diego Marriott Mission Valley</A><br>
8757 Rio San Diego Drive<br>
San Diego, California 92108<br>
800-842-5329
<br><br>
Several other hotels are located only a short walk from the <A href="/?t=sponsor&c=link&link=http://marriott.com/property/propertypage/sanmv?WT_Ref=mi_left" target="_blank">San Diego Marriott Mission Valley</A>. We have included a representative sample for your convenience: 
<br><br>
<A href="/?t=sponsor&c=link&link=http://www.doubletree.com/en/dt/hotels/index.jhtml?ctyhocn=SDGO-DT" target="_blank">Doubletree Hotel San Diego Mission Valley</A><br>
7450 Hazard Center Drive<br>
San Diego, CA 92108<br>
(619)-297-5466
<br><br>
<A href="/?t=sponsor&c=link&link=http://www.starwoodhotels.com/sheraton/search/hotel_detail.html?propertyID=127" target="_blank">Sheraton San Diego Hotel and Marina</A><br>
1380 Harbor Island Drive<br>
San Diego, CA 92101<br>
(619) 291-2900
<br><br>
<A href="/?t=sponsor&c=link&link=http://www.hanaleihotel.com/" target="_blank">Red Lion Hanalei Hotel San Diego</A><br>
2270 Hotel Circle N<br>
San Diego, CA  92108<br>
(619) 297-1101
<br><br><br><br><br><br><br><br><br><br>
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
