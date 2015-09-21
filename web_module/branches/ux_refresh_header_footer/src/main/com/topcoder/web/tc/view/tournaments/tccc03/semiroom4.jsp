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
                <tr><td class="tourney_subnav"><strong>Semifinal Room 4 Summary</strong></td></tr>
                <tr valign="top">
                    <td width="99%" class="bodyText">
                        <table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
                            <tr valign="top"><td align="left"><img src="/i/tournament/tccc03/room4_main.jpg" alt="" width="200" height="433" class="photoFrameBig" /></td></tr>
                            <tr valign="top"><td align="left" class="smallText">dgarthur contemplates a question during the Semi-final Round.</td></tr>
                        </table>
                                
                        <h2>Duke has made it to the Final Four</h2>
                        <p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
                        Friday, April 4, 2003<br />
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=brackets" class="bodyText">View current bracket</a></p>

                        <p>...and I don't mean in hoops.  <strong>dgarthur</strong> made short work of this problem set, being the only competitor 
                        to submit all three problems.  He, <strong>DjinnKahn</strong> and <strong>O_O</strong> started off with the Level 1 problem, while 
                        <strong>jburnim</strong> opened the 550 first.  <strong>DjinnKahn</strong> was the first to submit, getting 248.26 points for his 
                        275-pointer.  <strong>dgarthur</strong> wasn't far behind with his 247.11 submission for the 275-point problem.  
                        They both opened the 550-pointer next.</p>

                        <p><strong>O_O</strong> was the next to submit, sending in his 275-point solution for 205.26 points.  He then 
                        moved on to the 950-pointer.  <strong>dgarthur</strong> was awarded 362.63 points for his 550-point submission, 
                        and then moved on to the 950-pointer.  <strong>DjinnKahn,</strong> in the meantime, passed on the 550 and moved 
                        on to the 950.  Likewise, <strong>jburnim</strong> passed on both the 550 and the 950.  He, however, put in the 
                        5th submission for 244.87 points on his 275-pointer.  <strong>dgarthur</strong> finished off the problem set by 
                        securing 623.78 points on the 950.  <strong>DjinnKahn</strong> made the round interesting by submitting his 950 
                        for 520.96 points.</p>

                        <p>Totals at the end of the Coding Phase looked like this:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dgarthur</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1233.52</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">DjinnKahn</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">769.22</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Jburnim</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">244.87</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">O_O</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">205.26</td>
                             </tr>
                        </table>		

                        <p>This Challenge Phase added nothing to the competition as no moves were made by any of the 
                        competitors.  System tests took away <strong>DjinnKahn's</strong> 950-point submission, but left everyone 
                        else's submissions intact.  Therefore, at the end of the round, the points showed the following:</p>

                         <table border="0" cellspacing="10" cellpadding="0">
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">dgarthur</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">1233.52</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">DjinnKahn</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">248.26</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">Jburnim</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">244.87</td>
                             </tr>
                               			
                            <tr>
                                <td width="100" class="bodyText" nowrap="nowrap">O_O</td>
                                 <td width="30" class="bodyText" align="right" nowrap="nowrap">205.26</td>
                             </tr>
                        </table>		

                        <p>Congrats to <strong>dgarthur</strong> for rounding out the Final Four!  While I can't promise the onsite arena 
                        will be filled with Cameron Crazies like Coach K Court is for Duke home basketball games, I 
                        can promise that tomorrow's competition will pit four outstanding college competitors against 
                        each other in an effort to find the 2003 Sun Microsystems and TopCoder Collegiate College Champion.</p>

                        <p>Good luck to <strong>Yarin, </strong><strong>dmwright, </strong><strong>sjelkjd and </strong><strong>dgarthur</strong> in tomorrow's competition!</p>
                    </td>
                </tr>
            </table>
                      
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          
            
                <tr><td class="tourney_subnav"><strong>Semifinal Room 4 Photos</strong></td></tr>

                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_01.jpg');"><img src="/i/tournament/tccc03/room4_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_02.jpg');"><img src="/i/tournament/tccc03/room4_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_03.jpg');"><img src="/i/tournament/tccc03/room4_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_04.jpg');"><img src="/i/tournament/tccc03/room4_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_05.jpg');"><img src="/i/tournament/tccc03/room4_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/tournament/tccc03/room4_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="bodyText" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_06.jpg');"><img src="/i/tournament/tccc03/room4_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_07.jpg');"><img src="/i/tournament/tccc03/room4_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_08.jpg');"><img src="/i/tournament/tccc03/room4_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_09.jpg');"><img src="/i/tournament/tccc03/room4_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room4_10.jpg');"><img src="/i/tournament/tccc03/room4_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
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
