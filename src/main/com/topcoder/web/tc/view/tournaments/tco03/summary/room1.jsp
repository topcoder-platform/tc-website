<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Room 1</title>

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
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="room1"/>
</jsp:include>

            <p class="terciary">
                Play-by-Play&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room1_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room1_analysis">Problem Analysis</a>
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tco03/room1/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">bstanescu enjoying the moment<br/><br/></span>
            </div>
            
            <h2>bstansescu outcodes number one seed to take Room 1</h2>

            <p>by Matt Murphy, <em>TopCoder Staff</em><br />
            Thursday, December 4, 2003</p>

            <p>Opting for strategy over speed, bstanescu is the first coder to qualify for the TCO final round.  When approached after his victory was announced, he played it cool saying, "The guy who solves the first and the third problems usually beats the guy who solves the first and the second.  But it doesn't always work."  Well, it worked today.</p>

            <p>This morning's contest started out identical to most others.  All four competitors opened the 250-point problem and began coding.  As more and more spectators began to trickle in, however, things quickly became more exciting.  venco submitted his solution for the first problem just 15 minutes after opening it, earning him a strong 199.08 points.  bstanescu answered with his submission only two minutes later, giving him a score of 191.79.  SnapDragon and dpecora followed closely, earning 184.28 and 169.50 points, respectively.</p>

             <p>With three coders working on the 500-point problem and bstanescu pegging away at the 1000, it still looked like anyone could win.  Suddenly, SnapDragon submitted the level two problem in less than 13 minutes for 421.68 points and moved quickly to the 1000 pointer.  venco submitted next for 361.45 points.</p>

            <p>Time was running out and bstanescu was writing feverishly on his scratch paper.  With 15 minutes left in the coding phase, dpecora submitted the level two problem and earned himself 169.50 points.  All eyes were on SnapDragon, venco and bstanescu as they fought to solve the final problem.  Finally, with only 10 points left to give, bstanescu submitted his 1000-point solution and claimed first place with an additional 424.23 points.  The remaining 6 minutes of the coding phase passed without any further submissions.</p>

            <p>The challenge phase was considerably less exciting than the coding phase.  All of the coders flocked to view bstanescu's solution for the hardest problem but no challenges were made during the entire phase.  System tests proved that this was a wise choice made by all competitors as every single submitted solution for each problem passed the system tests with flying colors.  It was official - bstanescu was the winner!</p>

            <p>The round's outcome was quite an upset.  SnapDragon, the second highest rated member and number one seed for the tournament, was the favorite pick-to-win for the match.  Additionally, many spectators were rooting for dpecora as he was the underdog of all 16 semi-finalists.</p>

            <p>Stay tuned for the next round, as we wait to see if there are more upsets to come. </p> 

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
