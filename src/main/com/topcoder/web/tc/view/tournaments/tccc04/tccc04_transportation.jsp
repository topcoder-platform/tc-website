<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Transportation</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="join_us"/>
   <jsp:param name="tabLev3" value="transportation"/>
</jsp:include>

<h2>Get me to the TCCC!</h2>
            
            <p><strong>By Car</strong><br/>
            The Boston Park Plaza Hotel & Towers is conveniently located only minutes off Interstates 93, and 90 in downtown Boston, MA. View  
            <a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_directions">driving directions</a></p>
            
            <p><strong>By Plane</strong><br/>
            The Boston Park Plaza Hotel & Towers is just a short drive from Logan International Airport. Logan
            offers direct, non-stop flights from more than 35 major cities, via several national and regional airlines, including American, Continental, 
            Delta, MetroJet, Northwest, Southwest, United Airlines, US Airways and others. 
            Visit <a href="http://www.massport.com/logan/default.asp" target="_blank">www.massport.com</a> for specific information.</p>
            
            <p><strong>By Bus</strong><br/>
            Go to the <a href="http://www.greyhound.com/" target="_blank">Greyhound</a> web site (to get to Boston, MA).</p>

            <p><strong>By Rail</strong><br/>
            Go to the <a href="http://www.amtrak.com/" target="_blank">Amtrak</a> web site (to get to Boston, MA).</p>

            <p><strong>By Subway</strong> (The Boston T)<br/>
            View <a href="http://www.mbta.com/traveling_t/schedules_subway.asp" target="_blank">public transportation schedules</a> in Boston.</p>
            

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
