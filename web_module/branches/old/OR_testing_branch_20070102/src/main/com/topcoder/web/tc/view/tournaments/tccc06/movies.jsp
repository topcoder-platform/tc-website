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
<jsp:param name="tabLev2" value="onsite_events"/>
<jsp:param name="tabLev3" value="movies"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Onsite Movies</span>
      <table cellspacing=0 cellpadding=5 class="bodyText" width="100%">
         <tr>
            <td class="bodyText" align=center valign=top><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=clip1"><img src="/i/tournament/tccc06/webcastThumbNail.jpg" border=0/></A>
            <br><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movieStream&clip=clip1">Webcast (Part 1)</A><br></td>
         </tr>
      </table>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="../right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
