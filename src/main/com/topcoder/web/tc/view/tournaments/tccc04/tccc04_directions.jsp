<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Schedule</title>

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
   <jsp:param name="tabLev3" value="directions"/>
</jsp:include>

<!-- Onsite Semifinal and Championship Rounds begins -->
            <h2>Directions to The Boston Park Plaza Hotel & Towers</h2>
            
            <div align="center"><img src="/i/tournament/tccc04/top_locat.jpg" alt="Boston Park Plaza Hotel & Towers" width="322" height="232" border="0"></div>
            
            <p><strong>From the West</strong><br/>
            Take Massachusetts Turnpike (Rte. 90 East) into the city. Exit at Copley Square (22) and follow straight onto Stuart St. 
            Follow to the 5th set of light and turn left for the hotel.</p>
            
            <p><strong>From the North</strong><br/>
            Take Rte. I-93 South into city. Exit at Storrow Drive (26). Follow Storrow Drive towards Back Bay. Take Back Bay/Copley 
            exit on left. Take left turn onto Beacon St., then immediate right onto Arlington St. The hotel is the 2nd building on the left 
            after the park.</p>

            <p><strong>From the South</strong><br/>
            Take Rte. I-93 North into the city. Take exit 26 and follow signs to Storrow Drivetowards Back Bay. Take left turn onto 
            Beacon St., then immediate right onto Arlington St. The hotel is the 2nd building on the left after the park.I you prefer to 
            use Kneeland Street exit, take exit 20 (Logan Airport), bear left. Follow signs to South Station (not downtown Boston). 
            At the lights, take left onto Kneeland St. Kneeland Street will become Stuart Street. Follow Stuart Street, then take a right 
            onto South Charles Street. Take 1st left onto Park Plaza. Hotel will be in front of you.</p>

            <p><strong>From Logan International Airport</strong><br/>
            Follow signs to Summer Tunnel/Boston. After exiting the tunnel, follow Rte. I-93 North. Exit at Storrow Drive (26) and 
            follow Storrow Drive towards the Back Bay/Copley Exit. At lights, take left onto Beacon St. Take first right onto Arlington 
            St. The hotel is the 2nd building on the left after the park.</p>
            
            <p>See more <A href="http://www.bostonparkplaza.com/default.asp?sID=locat" target="_blank">transportation info</a> on the Boston Park Plaza Hotel & Towers web site.</p>

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
