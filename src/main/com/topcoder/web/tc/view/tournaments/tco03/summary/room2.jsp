<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Room 2</title>

<jsp:include page="../../../script.jsp" />

</head>

<body>

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="..//includes/global_left.jsp">
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
   <jsp:param name="selectedTab" value="room2"/>
</jsp:include>

            <p class="terciary">
                Play-by-Play&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room2_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room2_analysis">Problem Analysis</a>
            </p>

            <div class="leadPhoto">
            <img src="/i/tournament/tco03/room2/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">tomek is all smiles after taking Room 2<br/><br/></span>
            </div>

            <h2>Landslide victory by tomek</h2>

            <p>by Matt Murphy, <em>TopCoder Staff</em><br />
            Thursday, December 4, 2003</p>

            <p>It's not too surprising that tomek is moving on to the finals.  He is the highest rated TopCoder member and has beat all of his "roommates" in every round of the TCO to date.</p>

            <p>"At the beginning, I was very scared," said tomek.  "After I checked the second problem, I saw the score and knew that I would win.  I did the last problem just in case one of the others failed."</p>

            <p>tomek was the first to submit the 250-point problem, and did so in less than 10 minutes.  The rest of the level one submissions came in five minute intervals in the order of bladerunner, madking and ambrose.</p>

            <p>ambrose was the only competitor to open the level three problem next.  After four minutes of viewing the problem statement, he opted for the 500-pointer instead.  A short 82 seconds later, tomek submitted his solution for the same problem.  At this point in the game, bladerunner and madking began to lag behind the leader.  bladerunner submitted his level two solution with half an hour left in the coding phase; madking 15 minutes after that.</p>

            <p>With 8-1/2 minutes to spare, tomek made his final submission, sealing the win.  Lastly, with one minute left to code, ambrose submitted his level two solution.</p>

            <p>Once again, the quality of the semi-finalists' submissions was evidenced by the lack of activity during the challenge phase.  All solutions passed the system tests.</p>

            <p>The final scoreboard looked like this:</p>

            <div align="center">
            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                <tr>
                    <td  class="pointsName">tomek</td>
                    <td class="pointsScore">1113.62</td>
                </tr>

                <tr>
                    <td  class="pointsName">bladerunner</td>
                    <td class="pointsScore">479.59</td>
                </tr>

                <tr>
                    <td  class="pointsName">madking</td>
                    <td class="pointsScore">415.04</td>
                </tr>

                <tr>
                    <td  class="pointsName">ambrose</td>
                    <td class="pointsScore">382.65</td>
                </tr>
            </table>
            </div>

            <p>Will tomek continue his winning streak all the way to the top?  Who will confront him in the final round?  Don't touch that dial...</p>
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
