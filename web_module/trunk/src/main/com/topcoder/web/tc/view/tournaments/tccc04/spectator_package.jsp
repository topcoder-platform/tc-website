<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

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

   
                <h2>Join the excitement onsite!</h2>

                <p><img src="/i/tournament/tccc04/spectator_images.jpg" width="285" height="392" border="0" align="right"><span class="bodySubtitle">Would you like to see the 2004 Collegiate Challenge finals in-person?</span><br/>
                TopCoder is now offering a special discounted spectator package for our members.</p>
            
                <p><span class="bodySubtitle">What does the package include?</span><br/>
                <ul>
                <li><b>See the action live and in-person:</b> Attendence to all the onsite rounds of competition.</li>
                <li><b>Learn tricks of the trade from the experts:</b> attendance at all onsite events (sponsor and member presentations)</li>
                <li><b>Stay at a great hotel:</b> 2 nights hotel accomodations at the Boston Park Plaza Hotel.</li>
                <li><b>Hang-out and dine with the semifinalists:</b> All meals are included.</li>
                <li><b>Take home TopCoder collectables:</b> Program, T-shirt and other goodies from the event.</li>
                </ul>
            
            
                <p><span class="bodySubtitle">The details:</span><br/>

                <ul>
                    <li><strong>$100,000 prize purse</strong><br />
                    <li><strong>Competition Starts</strong><br />
                        January 27, 2004 - Component<br />
                        February 23, 2004 - Algorithm<br /></li>
                    <li><strong>Onsite Finals</strong><br />
                     April 15 & 16, 2004 at the Boston Park Plaza Hotel & Towers in Boston, MA, USA</li>
                 <li><strong>Free Competition</strong></li>
                 <li><strong>Open to all eligible college students</strong></li>
                </ul>
            
                <p>See the official rules and regulations for more details.</p>
            


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
