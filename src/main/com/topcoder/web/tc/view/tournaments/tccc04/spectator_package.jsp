<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Spectator Package</title>

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
   <jsp:param name="tabLev3" value="spectator"/>
</jsp:include>

   
                <h2><img src="/i/tournament/tccc04/spectator_images.jpg" width="285" height="392" border="0" align="right">Join the excitement onsite!</h2>

                <p>Would you like to see the 2004 Collegiate Challenge finals in-person? Would you like to spend two days with 32 other TopCoder members discussing algorithms, games, and everything TopCoder? 
                TopCoder is now offering a special spectator package for our members to join us at the most exciting TopCoder tournament yet!</p>
            
                <p><span class="bodySubtitle">What does the package include?</span><br/>
                <ul>
                <li><b>Action!</b> See the competition live and in-person. Includes attendence to all the onsite rounds of competition.</li>
                <li><b>Knowledge!</b> Learn tricks of the trade from the experts. Includes attendance at all onsite events (sponsor and member presentations).</li>
                <li><b>Hotel!</b> Stay at the same great hotel where the competitors are staying. 2 nights hotel accomodations at the <A href="http://www.bostonparkplaza.com/default.asp?sID=home" target="_blank">Boston Park Plaza Hotel & Towers.</A></li>
                <li><b>Food!</b> Hang-out and dine with the semifinalists. 2 meals with the competitors and free beverages throughout the competitions.</li>
                <li><b>TopCoder Gear!</b> Take home TopCoder collectables. T-shirt, program and other TCCC items.</li> 
                </ul>
            
                <div align="left"><img src="/i/tournament/tccc04/495signup.gif" width="240" height="30" border="0"></div>
            
                <p><span class="bodySubtitle">The details:</span><br/>

                <ul>
                    <li><strong>Price: $495.00</strong></li>
                    <li><strong> April 15 & 16, 2004 at the Boston Park Plaza Hotel & Towers in Boston, MA, USA</strong></li>
                    <li><strong>Offer valid until 9:00 AM March 22, 2004</strong></li>
                    <li><strong>Note: Package excludes transportation to and from the hotel.</strong></li>
               </ul>
               <p>Sign up for the spectator package. <strong>Buy Now!</strong></p>
               
              <div align="left"><img src="/i/tournament/tccc04/cc_ae.gif" width="50" height="32" border="0"><img src="/i/tournament/tccc04/cc_cb.gif" width="50" height="32" border="0"><img src="/i/tournament/tccc04/cc_ds.gif" width="50" height="32" border="0"><img src="/i/tournament/tccc04/cc_dc.gif" width="50" height="32" border="0"><img src="/i/tournament/tccc04/cc_mc.gif" width="50" height="32" border="0"><img src="/i/tournament/tccc04/cc_vs.gif" width="50" height="32" border="0"></div>
            
                
            


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
