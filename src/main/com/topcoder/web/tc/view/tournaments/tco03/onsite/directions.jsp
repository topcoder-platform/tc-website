<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Directions to Onsite Finals</title>

<jsp:include page="../../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
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

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="both"/>
   <jsp:param name="selectedTab" value="onsite"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="onsite"/>
   <jsp:param name="selectedTab" value="directions"/>
</jsp:include>

            <h2>Directions to Mohegan Sun</h2>
            
            <div align="center"><img src="/i/tournament/tco03/mohegan_sun_map.gif" alt="Mohegan Sun Map" width="270" height="256" border="0"></div>
            
            <p><strong>From Providence, R.I.</strong> (T.F. Green International Airport)<br/>
            Take I-95 South to Exit 84N (Route 32 North). Take Route 32 North to I-395 North. Take Exit 79A, (Route 2A) East. Less than 1 
            mile to Mohegan Sun Boulevard.</p>
            
            <p><strong>From Hartford, CT</strong> (Bradley International Airport)<br/>
            I-91 South to I-84 East to Route 2 East to I-395 South. Take Exit 79A (Route 2A) East. Less than 1 mile to Mohegan Sun Boulevard.</p>

            <p><strong>From New York, NY</strong> (JFK or Laguardia International Airports)<br/>
            Take I-95 North to Exit 76/I-395 North. Take Exit 79A (Route 2A) East. Less than 1 mile to Mohegan Sun Boulevard.</p>

            <p><strong>From Boston, MA</strong> (Logan International Airport)<br/>
            Take I-90 (Mass Pike) West to I-395 South. Take Exit 79A (Route 2A) East. Less than 1 mile to Mohegan Sun Boulevard.</p>

            <p><strong>Parking</strong><br/>
            With more than 13,000 on-site patron parking spaces, parking at Mohegan Sun is never a hassle, whether you are visiting the Casino 
            of the Earth or the Casino of the Sky. Entrances to the Casino of the Earth are themed by the seasons Winter, Summer and Autumn. Once 
            inside, the Casino of the Earth and the Casino of the Sky are connected by the Spring Gateway; so you never have to leave the building.</p>
            
            <ul>
                <li><strong>Winter Garage</strong><br/>
                covered parking just outside of the Winter entrance of the Casino of the Earth</li>
                <li><strong>Indian Summer Garage</strong><br/>
                covered access via the Autumn entrance to the Casino of the Earth</li>
                <li><strong>The Riverview Garage</strong><br/>
                direct access to the Summer entrance of the Casino of the Earth and connected to the Casino of the Sky. Guests entering through the 
                Casino of the Sky should park in the Riverview Garage, or take advantage of complimentary valet service at the new Sky porte-cochere.</li>
                <li><strong>Thames Garage</strong><br/>
                Available as needed to supplement our total parking availability. Guests are shuttled between the Thames Garage to the Sky porte-cochere.</li>
            </ul>
            
            <p>All uncovered, self-parking lots are clearly marked with non-stop shuttle service that brings you right to our doors!</p>

            <p><strong>Valet Parking</strong><br/>
            24-hour valet parking service is available at the Sky, Hotel and Earth Summer Valet porte-cocheres. Recommended gratuity is $5.00.</p>
            
            <p>See more <a href="http://www.mohegansun.com/plan_visit/faq_transportation.jsp" target="_blank">transportation info</a> on the Mohegan Sun web site.</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
