<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Room 3</title>

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
   <jsp:param name="selectedTab" value="room3"/>
</jsp:include>

            <p class="terciary">
                Play-by-Play&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room3_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=room3_analysis">Problem Analysis</a>
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tco03/room3/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">Yarin breathes a sigh of relief.<br/><br/></span>
            </div>
            
            <p>by Matt Murphy, (veredox)<em>TopCoder Staff</em><br />
            
            Thursday, December 4, 2003</p>

            <h2>Photo finish: Yarin! </h2>

<p>The third match of the day was the closest yet.  reid and Yarin have a recent history of 
competition.  reid, rated higher than Yarin, lost to him in two of the four previous TCO rounds.</p>

<p>Today's action started when reid and Yarin submitted the 275-point problem two seconds 
apart for 220.27 and 220.06 points, respectively.  reid continued to pull on Yarin, submitting 
his level two solution exactly seven minutes later.  Two minutes after that, Yarin answered with 
his submission.  At this point the score was 695.84 to 676.16 - advantage reid - with no submissions 
from either of the other competitors.</p>

<p>Finally, 28 minutes into the coding phase, DjinnKahn submitted the level one problem for 
163.58 points.  Before long, mathijs had all three problems open without a single submission.  
"I got lost in the level one.  I wanted to do it more elegantly than was needed," he later commented.</p>

<p>It was neck and neck but reid was the first to submit a 950-point solution.  Yarin finished 
his submission 8 minutes later, but reid was still leading by 118.95 points.  To everyone's surprise, 
reid resubmitted the level three shortly thereafter, putting Yarin 100.11 points in the lead!</p>

<p>The coding phase ended and the challenge phase began.  This time: action (albeit minimal).  
Yarin took a shot at DjinnKahn's level one solution and was unsuccessful, bringing reid 50 points 
closer to the #1 spot.  Luckily for Yarin, there were no more challenges and, as is becoming customary, 
all solutions passed their system tests.</p>

<p>The final scores were as follows: </p>

            <div align="center">
            <table border="0" cellspacing="2" cellpadding="0" class="pointsTable">
                <tr>
                    <td  class="pointsName">Yarin</td>
                    <td class="pointsScore">1184.28</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">reid</td>
                    <td class="pointsScore">1134.17</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">DjinnKahn</td>
                    <td class="pointsScore">163.58</td>
                </tr>
                               			
                <tr>
                    <td  class="pointsName">mathijs</td>
                    <td class="pointsScore">0.00</td>
                </tr>
            </table>
            </div>	

<p>When asked about the exciting finish of the coding phase, Yarin was very gracious.  "I didn't really 
think [my submission] would pass.  reid's solution was much cleaner."</p>


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
