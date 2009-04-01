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
<tr><td class="tourney_subnav"><strong>Semifinal Room 3 Summary</strong></td></tr>
<tr valign="top">
<td width="99%" class="bodyText">
<table border="0" cellspacing="5" cellpadding="0" align="right" width="200">
<tr valign="top"><td align="left"><img src="/i/tournament/tccc03/room3_main.jpg" alt="" width="200" height="433" class="photoFrameBig" /></td></tr>
<tr valign="top"><td align="left" class="smallText">sjelkjd flashes a smile for the camera.</td></tr>
</table>

<h2>That's suh-jel-kuh-jid to you!</h2>
<p>by MaryBeth Biondi, <em>TopCoder Staff</em><br />
Friday, April 4, 2003<br />
<a href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=brackets" class="bodyText">View current bracket</a></p>

<p>Round 3 saw the most submissions during the Coding Phase so far today.  Like Round 2, everyone started out by 
opening the Level 1 problem.  <strong>sjelkjd</strong> chimed in first with a 281.30 submission, followed shortly after by 
<strong>bstanescu's</strong> 277.89-point submission.  <strong>ante</strong> scored third with 261.17 points for his 300-pointer.  While 
<strong>ante</strong> and <strong>sjelkjd</strong> moved on to the 550-point problem, <strong>bstanescu</strong> chose to attack the 1000.  
<strong>WhiteShadow</strong> opted to pass on the 300 and try his luck with the 550.</p>

<p><strong>ante</strong> made relatively short work of the 550, submitting next for 413.93 points. <strong>sjelkjd</strong> was in next with 
342.66 points for his 550.  While <strong>WhiteShadow</strong> continued to work on his 550, <strong>bstanescu</strong> logged the 6th 
submission with 630.24 points on his 1000-pointer.  He then moved to the 550, while <strong>ante</strong> and <strong>sjelkjd</strong> 
started work on the 1000.  ante blew through the 1000, getting 870.88 points, only to be bested by <strong>sjelkjd's</strong> 
874.63-point submission for his 1000.  Seeing the quick submissions on the 1000, and the waning time, 
<strong>WhiteShadow</strong> opted to pass on the 550 also and open the 1000-point problem.  The 9th submission of the 
round came from <strong>bstanescu</strong> with 423.90 points on his 550.  The Coding Phase ended with <strong>WhiteShadow</strong> 
finally submitting a solution to his 300-pointer for 123.44 points.</p>

<p>The total points for the Coding Phase looked like this:</p>

<table border="0" cellspacing="10" cellpadding="0">
<tr>
<td width="100" class="bodyText" nowrap="nowrap">ante</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">1545.98</td>
</tr>

<tr>
<td width="100" class="bodyText" nowrap="nowrap">sjelkjd</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">1498.59</td>
</tr>

<tr>
<td width="100" class="bodyText" nowrap="nowrap">bstanescu</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">1332.03</td>
</tr>

<tr>
<td width="100" class="bodyText" nowrap="nowrap">WhiteShadow</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">123.44</td>
</tr>
</table>		

<p>The Challenge Phase brought the only successful challenge thus far today with <strong>sjelkjd</strong> taking out 
<strong>WhiteShadow's</strong> 300-point submission, leaving him with 0 points.  Late in the Challenge Phase, <strong>ante</strong> 
unsuccessfully challenged <strong>bstanescu's</strong> 550 and 1000-point problems, resulting in 100 fewer points.</p>

<p>Scores didn't change as a result of the System Tests, and <strong>sjelkjd</strong> became the 3rd advancer to 
tomorrow's finals.  Final scores:</p>

<table border="0" cellspacing="10" cellpadding="0">
<tr>
<td width="100" class="bodyText" nowrap="nowrap">sjelkjd</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">1548.59</td>
</tr>

<tr>
<td width="100" class="bodyText" nowrap="nowrap">ante</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">1445.98</td>
</tr>

<tr>
<td width="100" class="bodyText" nowrap="nowrap">bstanescu</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">1332.03</td>
</tr>

<tr>
<td width="100" class="bodyText" nowrap="nowrap">WhiteShadow</td>
<td width="30" class="bodyText" align="right" nowrap="nowrap">0</td>
</tr>
</table>		

<p>Congratulations, sjelkjd!  Let's see who the next finalist will be.</p>

<p>Up next:<br />
<strong>dgarthur</strong><br />
<strong>DjinnKahn</strong><br />
<strong>jburnim</strong><br />
<strong>O_O</strong></p>
</td>
</tr>
</table>

<table border="0" cellspacing="0" cellpadding="3" width="100%">            
<tr><td valign="middle"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/><a name="photo"></a></td></tr>          

<tr><td class="tourney_subnav"><strong>Semifinal Room 3 Photos</strong></td></tr>

<tr>
<td class="bodyText" align="center">
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_01.jpg');"><img src="/i/tournament/tccc03/room3_01_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_02.jpg');"><img src="/i/tournament/tccc03/room3_02_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_03.jpg');"><img src="/i/tournament/tccc03/room3_03_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_04.jpg');"><img src="/i/tournament/tccc03/room3_04_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_05.jpg');"><img src="/i/tournament/tccc03/room3_05_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
</td>
</tr>

<tr>
<td class="bodyText" align="center"><img src="/i/tournament/tccc03/room3_01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
</tr>            

<tr>
<td class="bodyText" align="center">
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_06.jpg');"><img src="/i/tournament/tccc03/room3_06_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_07.jpg');"><img src="/i/tournament/tccc03/room3_07_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_08.jpg');"><img src="/i/tournament/tccc03/room3_08_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_09.jpg');"><img src="/i/tournament/tccc03/room3_09_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
<a href="Javascript:void changeImage('bigVersion', '/i/tournament/tccc03/room3_10.jpg');"><img src="/i/tournament/tccc03/room3_10_tn.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
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
