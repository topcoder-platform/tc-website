<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


            <jsp:include page="links.jsp" />
            <jsp:include page="links_summary.jsp" />

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav"><strong>Semifinal Room 2 Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/room2_main.jpg" alt="" width="200" height="350" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">dmwright at his workstation during Round 2.</td></tr>
                        </table>
                                
                        <h2>dm... right!</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Friday, April 4, 2003<br />
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=brackets" class="bodyText">View current bracket</a></p>

                        <p>Consistently calm, <strong>dmwright</strong> showed why this is his 5th straight appearance at the onsite finals by outpacing 
                        his competitors in Round 2. Everyone started the round by opening the 200 pointer first. <strong>niteneb</strong> inched out 
                        <strong>dmwright</strong> with the first submission for 183.76 points&#151;<strong>dmwright</strong> came in right behind with 183.56 points.  
                        <strong>axch</strong> followed closely behind with 179.47 points, with <strong>mathewsb</strong> rounding off the 200 pointers with 174.94 points.</p>

                        <p>Everyone stayed with the ascending order and opened the 500 next.  <strong>dmwright</strong> was the first to submit this 
                        time, getting 364.04 points.  He immediately moved on to the 1050 pointer.  <strong>mathewsb</strong> picked up the pace and 
                        submitted next on the 500 for 336.93 points.  <strong>axch</strong> had the 7th submission of the round for 255.86 points.  
                        Before <strong>niteneb</strong> could turn in an answer for his 500, <strong>dmwright</strong> submitted his solution to the 1050 for 657.00.  
                        <strong>niteneb</strong> sent in the last 2 submissions of the round with 225.73 points on his 500 and 792.41 points on his 
                        1050.  With just a few seconds left in the coding phase, <strong>niteneb</strong> resubmitted his 1050 pointer, losing an 
                        additional 158.77 points.  The end of the coding phase saw the following scores:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1204.60</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">niteneb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1042.13</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">mathewsb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">511.87</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">axch</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">435.33</td>
                             </tr>
                        </table>		

                        <p>The Challenge Phase brought a bit more excitement this round, but no score increases.  <strong>mathewsb</strong> 
                        unsuccessfully challenged <strong>axch's</strong> 500 pointer, while <strong>dmwright</strong> unsuccessfully challenged <strong>niteneb's</strong> 1050 
                        pointer.  Both coders lost 50 points.</p>

                        <p>System tests broke the 1050 submissions of both <strong>dmwright</strong> and <strong>niteneb,</strong> and left all other submissions 
                        standing.  The final scores for Round 2 were as follows:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dmwright</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">497.60</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">mathewsb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">461.87</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">axch</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">435.33</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">niteneb</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">409.49</td>
                             </tr>
                        </table>		

                        <p>Great job, <strong>dmwright!</strong>  May next round's competitors learn from your experience.</p>

                        <p>Up next:<br />
                        <strong>ante</strong><br />
                        <strong>bstanescu</strong><br />
                        <strong>sjelkjd</strong><br />
                        <strong>WhiteShadow</strong></p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Semifinal Room 2 Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_01.jpg');"><img src="/i/tournament/tccc03/room2_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_02.jpg');"><img src="/i/tournament/tccc03/room2_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_03.jpg');"><img src="/i/tournament/tccc03/room2_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_04.jpg');"><img src="/i/tournament/tccc03/room2_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_05.jpg');"><img src="/i/tournament/tccc03/room2_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/room2_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_06.jpg');"><img src="/i/tournament/tccc03/room2_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_07.jpg');"><img src="/i/tournament/tccc03/room2_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_08.jpg');"><img src="/i/tournament/tccc03/room2_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_09.jpg');"><img src="/i/tournament/tccc03/room2_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room2_10.jpg');"><img src="/i/tournament/tccc03/room2_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>            
            </table>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
