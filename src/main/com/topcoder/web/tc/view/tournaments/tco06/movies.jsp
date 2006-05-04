<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="movies"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">Onsite Movies</span>
      <table cellspacing=0 cellpadding=5 class="bodyText" width="100%">
         <tr>
            <td class="bodyText" align=center valign=top><A href="/movies/tournament/tco06/05_01_hi.mov"><img src="/i/tournament/tco06/onsite_movies/05_01_hi.jpg" border=0/></A>
            <br><A href="/movies/tournament/tco06/05_01_hi.mov">May 1 (compilation)<br>(12.3 MB)</A><br></td>
            <td class="bodyText" align=center valign=top><A href="/movies/tournament/tco06/05_02_hi.mov"><img src="/i/tournament/tco06/onsite_movies/05_02_hi.jpg" border=0/></A>
            <br><A href="/movies/tournament/tco06/05_02_hi.mov">May 2 (compilation)<br>(12.1 MB)</A><br></td>
            <td class="bodyText" align=center valign=top><A href="/movies/tournament/tco06/room1.mov"><img src="/i/tournament/tco06/onsite_movies/room1.jpg" border=0/></A>
            <br><A href="/movies/tournament/tco06/room1.mov">cyfra wins Room 1<br>(5.0 MB)</A><br></td>
         </tr>
      </table>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
